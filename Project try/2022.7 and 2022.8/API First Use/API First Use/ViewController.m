//
//  ViewController.m
//  API First Use
//
//  Created by 孙旭东 on 2022/8/9.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _cityArray = [[NSMutableArray alloc] init];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, [UIScreen mainScreen].bounds.size.width - 100, 50)];
    _textField.delegate = self;
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.keyboardType = UIKeyboardTypeDefault;
    [self.view addSubview:_textField];

    [self createTableView];
}

- (void) createTableView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(50, 150, [UIScreen mainScreen].bounds.size.width - 100, 500)];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"111"];
    UIView* view = [[UIView alloc] init];
    _tableView.tableFooterView = view;
}

- (void) createUrl {
    NSString* str = [NSString stringWithFormat:@"https://geoapi.heweather.net/v2/city/lookup?location=%@&key=b92646e0f4194731b50870798cfad1d0",_textField.text];
    
    str = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSLog(@"%@", str);
    
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
        for (int i = 0; i < array.count; i++) {
            NSMutableString* str = [NSMutableString stringWithFormat:@"%@-%@", array[i][@"adm1"], array[i][@"name"]];
            [_cityArray addObject:str];
        }
        for (int i = 0; i < array.count; i++) {
            NSLog(@"%@", _cityArray[i]);
        }
        NSLog(@"---------over");
    }
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self.tableView reloadData];
    }];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
    while ([cell.contentView.subviews lastObject] != nil) {
        [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];
    }
    cell.textLabel.text = _cityArray[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:20];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  _cityArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_textField endEditing:YES];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    [self createUrl];
    return YES;
}

@end
