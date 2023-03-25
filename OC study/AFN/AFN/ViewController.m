//
//  ViewController.m
//  AFN
//
//  Created by 孙旭东 on 2022/12/5.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getData];
}

- (void) getData {
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    // 字典传递问号以后的参数
    NSDictionary* dict = @{@"location":@"北京",@"key":@"b92646e0f4194731b50870798cfad1d0"};
    // 发送get请求
    /*
        第一个参数：请求路径（nsstring）
        第二个参数：字典（发送给服务器的参数 ，dict）
        第三个参数：headers 进度回调 一般填nil
        第四个参数：progess 进度回调 一般填nil
        第五个参数： success 成功回调
        task:请求任务
        responseObject:响应体信息(JSON--->OC对象)
        第六个参数:failure 失败回调
        error:错误信息
        响应头:task.response
       */
    [manager GET:@"https://geoapi.heweather.net/v2/city/lookup" parameters:dict headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功
        NSLog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error");
    }];
}


@end
