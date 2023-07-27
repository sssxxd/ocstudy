//
//  SearchViewController.m
//  Weather Report
//
//  Created by 孙旭东 on 2022/8/12.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    self.view.alpha = 0.9;
    
    if (_cityArray == nil) {
        _cityArray = [[NSMutableArray alloc] init];
    }
    
    if (_cityIDArray == nil) {
        _cityIDArray = [[NSMutableArray alloc] init];
    }
    
    [self createTableView];
    
    [self createTextFieldAndCencalButton];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma - 创建搜索栏和取消按钮
- (void) createTextFieldAndCencalButton {
    _searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(45, 30, 270, 40)];
    _searchTextField.backgroundColor = [UIColor grayColor];
    _searchTextField.delegate = self;
    _searchTextField.borderStyle = UITextBorderStyleRoundedRect;
    _searchTextField.keyboardType = UIKeyboardTypeDefault;
    _searchTextField.placeholder = @"请输入想要搜索的城市";
    _searchTextField.delegate = self;
    
    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sousuo-2.png"]];
    _searchTextField.leftView = imageView;
    _searchTextField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_searchTextField];
    
    _cencalButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _cencalButton.frame = CGRectMake(300, 25, 100, 50);
    [_cencalButton setTitle:@"取消" forState:UIControlStateNormal];
    [_cencalButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_cencalButton.titleLabel setFont:[UIFont systemFontOfSize:25]];
    [_cencalButton addTarget:self action:@selector(pressCencal) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_cencalButton];
}

// 选择城市
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    AddCityViewController* viewController = [[AddCityViewController alloc] init];
    viewController.cityID = _cityIDArray[indexPath.row];
    viewController.delegate = self.delegate;
    
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:nav animated:YES completion:nil];
}

// 按钮事件
- (void) pressCencal {
    [_tableView resignFirstResponder];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma  - 创建tableView
- (void) createTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(45, 80, 300, 500) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"SearchCell"];
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    
    UIView* view = [[UIView alloc] init];
    _tableView.tableFooterView = view;
    
    [_tableView reloadData];
}

// 设置cell
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cityArray.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"SearchCell"];
    while ([cell.contentView.subviews lastObject] != nil) {
        [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];
    }
    
    cell.textLabel.text = _cityArray[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:20];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

#pragma - 使用api搜索城市
- (void) createUrl {
    NSString* str = [NSString stringWithFormat:@"https://geoapi.heweather.net/v2/city/lookup?location=%@&key=b92646e0f4194731b50870798cfad1d0", _searchTextField.text];
    
    str = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL* url = [NSURL URLWithString:str];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    NSURLSession* session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request];
        
    [dataTask resume];
}

- (void) URLSession:(NSURLSession*)session dataTask:(nonnull NSURLSessionDataTask *)dataTask didReceiveResponse:(nonnull NSURLResponse *)response completionHandler:(nonnull void (^)(NSURLSessionResponseDisposition))completionHandler {
    if (self.data == nil) {
        self.data = [[NSMutableData alloc] init];
    } else {
        self.data.length = 0;
    }
    
    completionHandler(NSURLSessionResponseAllow);
}

- (void)URLSession:(NSURLSession*)session dataTask:(nonnull NSURLSessionDataTask *)dataTask didReceiveData:(nonnull NSData *)data {
    [self.data appendData:data];
}

- (void)URLSession:(NSURLSession*)session task:(nonnull NSURLSessionTask *)task didCompleteWithError:(nullable NSError *)error {
    if (error == nil) {
        NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:_data options:kNilOptions error:nil];
        NSMutableArray* array = [[NSMutableArray alloc] init];
        array = dict[@"location"];
        _cityArray = [[NSMutableArray alloc] init];
        _cityIDArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < array.count; i++) {
            NSMutableString* str = [NSMutableString stringWithFormat:@"%@-%@-%@", array[i][@"adm1"], array[i][@"adm2"], array[i][@"name"]];
            [_cityArray addObject:str];
            [_cityIDArray addObject:array[i][@"id"]];
        }
    }
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self.tableView reloadData];
    }];
}

- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_searchTextField resignFirstResponder];
    
    // 开始搜索
    [self createUrl];
}

@end
