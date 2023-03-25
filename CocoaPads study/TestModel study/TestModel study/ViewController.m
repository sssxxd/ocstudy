//
//  ViewController.m
//  TestModel study
//
//  Created by 孙旭东 on 2022/10/9.
//

#import "ViewController.h"
#import "Manage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    NSString* string = [NSString stringWithFormat:@"https://news-at.zhihu.com/api/4/news/latest"];
//    string = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//
//    NSURL* url = [NSURL URLWithString:string];
//    NSURLRequest* request = [NSURLRequest requestWithURL:url];
//    NSURLSession* session = [NSURLSession sharedSession];
//    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        TestModel* country = [[TestModel alloc] initWithData:data error:nil];
//        NSLog(@"%@", country.stories[0]);
//    }];
//    [dataTask resume];
    
    [self test];
}

- (void) test {
    Manage* manage = [Manage sharedManage];
    [manage NetWorkTestWithData:^(TestModel * _Nonnull mainViewNowModel) {
        NSLog(@"%@", mainViewNowModel);
    } error:^(NSError * _Nonnull error) {
        NSLog(@"error");
    }];
}

@end
