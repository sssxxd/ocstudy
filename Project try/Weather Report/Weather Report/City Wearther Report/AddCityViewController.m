//
//  AddCityViewController.m
//  Weather Report
//
//  Created by 孙旭东 on 2022/8/12.
//

#import "AddCityViewController.h"
#import "TableViewCells/TitleTableViewCell.h"
#import "HoursTableViewCell.h"
#import "WeekTableViewCell.h"
#import "IndexTableViewCell.h"

@interface AddCityViewController ()

@end

@implementation AddCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置背景图
    UIImage* image = [UIImage imageNamed:@"cityWeatherReportBack.jpeg"];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = self.view.bounds;
    [self.view addSubview:imageView];
    
    [self createItem];
    
    [self createUrl];
    
    [self createTableView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma - 设置按钮
- (void) createItem {
    UIBarButtonItem* leftItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(pressCancel)];
    
    [leftItem setTintColor:[UIColor whiteColor]];
    
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(pressAdd)];
    
    [rightItem setTintColor:[UIColor whiteColor]];
    
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void) pressCancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) pressAdd {
    [self.delegate getCityID:_mainDictionary[@"cityid"]];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma - 创建URL和协议方法
// 创建URL
- (void) createUrl {
    NSString* urlString = [NSString stringWithFormat:@"https://v0.yiketianqi.com/api?appid=17628316&appsecret=QrgKcZ8B&version=v9&cityid=%@&unescape=1", _cityID];
    
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL* url = [NSURL URLWithString:urlString];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    NSURLSession* seesion = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionTask* dataTask = [seesion dataTaskWithRequest:request];
    
    [dataTask resume];
}

// URL协议方法
- (void) URLSession:(NSURLSession*)session dataTask:(nonnull NSURLSessionDataTask *)dataTask didReceiveResponse:(nonnull NSURLResponse *)response completionHandler:(nonnull void (^)(NSURLSessionResponseDisposition))completionHandler {
    
    if (self.data == nil) {
        self.data = [[NSMutableData alloc] init];
    } else {
        self.data.length = 0;
    }
    
    completionHandler(NSURLSessionResponseAllow);
}

- (void) URLSession:(NSURLSession*)session dataTask:(nonnull NSURLSessionDataTask *)dataTask didReceiveData:(nonnull NSData *)data {
    
    [self.data appendData:data];
}

- (void) URLSession:(NSURLSession*)session task:(nonnull NSURLSessionTask *)task didCompleteWithError:(nullable NSError *)error {
    
    if (error == nil) {
        _mainDictionary = [[NSMutableDictionary alloc] init];
        _mainDictionary = [NSJSONSerialization JSONObjectWithData:_data options:kNilOptions error:nil];
    } else {
        NSLog(@"%@", error);
    }
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self createArrayIndex];
        [self->_tableView reloadData];
    }];
}

#pragma  - 设置tableView
- (void) createTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    [_tableView reloadData];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 320;
    } else if (indexPath.row == 1) {
        return 150;
    } else if (indexPath.row == 2) {
        return 300;
    } else {
        return 120;
    }
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        NSString* cellName = @"TitleCell";
        
        TitleTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[TitleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        cell.dictionary = [[NSDictionary alloc] init];
        cell.dictionary = _mainDictionary;
        cell.backgroundColor = [UIColor clearColor];
        cell.userInteractionEnabled = NO;
        
        return cell;
    } else if (indexPath.row == 1) {
        NSString* cellName = @"HoursCell";
        
        HoursTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[HoursTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        cell.hoursArray = _mainDictionary[@"data"][0][@"hours"];
        cell.backgroundColor = [UIColor clearColor];
        cell.userInteractionEnabled = YES;
        
        return cell;
    } else if (indexPath.row == 2) {
        NSString* cellName = @"WeekCell";
        
        WeekTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[WeekTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        cell.dataArry = _mainDictionary[@"data"];
        cell.backgroundColor = [UIColor clearColor];
        cell.userInteractionEnabled = YES;
        
        return cell;
    } else if (indexPath.row == 3){
        NSString* cellName = @"TableCell";
        
        UITableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        cell.textLabel.text = _mainDictionary[@"data"][0][@"index"][4][@"desc"];
        cell.textLabel.font = [UIFont systemFontOfSize:23];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.backgroundColor = [UIColor clearColor];
        cell.userInteractionEnabled = NO;
        
        return cell;
    } else {
        NSString* cellName = @"IndexCell";
        
        IndexTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[IndexTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        cell.titleFirst.text = _arrayIndex[indexPath.row - 4][0];
        cell.titleSecond.text = _arrayIndex[indexPath.row - 4][1];
        cell.dataFirst.text = _arrayIndex[indexPath.row - 4][2];
        cell.dataSecond.text = _arrayIndex[indexPath.row - 4][3];
        
        cell.backgroundColor = [UIColor clearColor];
        cell.userInteractionEnabled = NO;
        
        return cell;
    }
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void) createArrayIndex {
    _arrayIndex = [[NSMutableArray alloc] init];
    for (int index = 0; index < 3; index++) {
        NSMutableArray* array = [[NSMutableArray alloc] init];
        if (index == 0) {
            [array addObject:@"日出"];
            [array addObject:@"日落"];
            [array addObject:_mainDictionary[@"data"][0][@"sunrise"]];
            [array addObject:_mainDictionary[@"data"][0][@"sunset"]];
        } else if (index == 1) {
            [array addObject:@"湿度"];
            [array addObject:@"空气质量"];
            [array addObject:_mainDictionary[@"data"][0][@"humidity"]];
            [array addObject:_mainDictionary[@"data"][0][@"air_level"]];
        } else {
            [array addObject:@"能见度"];
            [array addObject:@"气压"];
            [array addObject:_mainDictionary[@"data"][0][@"visibility"]];
            [array addObject:_mainDictionary[@"data"][0][@"pressure"]];
        }
        [_arrayIndex addObject:array];
    }
}

@end
