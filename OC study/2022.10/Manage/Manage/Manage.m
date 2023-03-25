//
//  Manage.m
//  Manage
//
//  Created by 孙旭东 on 2022/10/16.
//

#import "Manage.h"

static Manage* manage = nil;

@implementation Manage

+ (instancetype) sharedManage {
    if (!manage) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manage = [[Manage alloc] init];
        });
    }
    return manage;
}

- (void) NetWorkTestWithData:(TestSucceedBlock)succeedBlock error:(ErrorBlock)erroBlock {
    NSString* string = [NSString stringWithFormat:@"https://news-at.zhihu.com/api/4/version/ios/2.3.0"];
    string = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL* url = [NSURL URLWithString:string];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            TestModel* country = [[TestModel alloc] initWithData:data error:nil];
            succeedBlock(country);
        } else {
            erroBlock(error);
        }
    }];
    [dataTask resume];
}

@end
