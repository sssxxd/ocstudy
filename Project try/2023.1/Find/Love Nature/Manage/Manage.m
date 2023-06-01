//
//  Manage.m
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/6.
//

#import "Manage.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"

#import "UserModel.h"

static id manage;

@implementation Manage

+ (instancetype) shareManage {
    if (manage == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manage = [[Manage alloc] init];
        });
    }
    return manage;
}

// 请求验证码
- (void) postEmail:(NSString *)email getVerificationCodeWithEnrollModelBlock:(EnrollModelBlock)enrollModelBlock andErrorBlock:(ErrorBlock)errorBLock {
    
    AFHTTPSessionManager* AFManager = [AFHTTPSessionManager manager];
    
    NSDictionary* dict = @{@"email":email};
    
    [AFManager POST:@"http://101.42.38.110:9999/api/v1/user/code" parameters:dict headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        EnrollModel* enrollModel = [[EnrollModel alloc] initWithDictionary:responseObject error:nil];

        enrollModelBlock(enrollModel);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        errorBLock(error);
    }];
}

//  注册
- (void) postEmail:(NSString *)email Password:(NSString *)Password VerificationCode:(NSString *)code getEnrollModelBlock:(EnrollModelBlock)enrollModelBlock andErrorBlock:(ErrorBlock)errorBlock {
    
    AFHTTPSessionManager* AFManager = [AFHTTPSessionManager manager];
    
    NSDictionary* dict = @{@"email":email, @"code":code, @"password":Password};
    
    [AFManager POST:@"http://101.42.38.110:9999/api/v1/user/register" parameters:dict headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        EnrollModel* enrollModel = [[EnrollModel alloc] initWithDictionary:responseObject error:nil];
        
        enrollModelBlock(enrollModel);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        errorBlock(error);
    }];
}

// 密码登陆
- (void) postEmail:(NSString *)email Password:(NSString *)Password getLoginModelBlock:(LoginModelBlock)loginModelBlock andErrorBlock:(ErrorBlock)errorBlock {
    
    AFHTTPSessionManager* AFManager = [AFHTTPSessionManager manager];
    
    NSDictionary* dict = @{@"email":email, @"password":Password};
    
    [AFManager POST:@"http://101.42.38.110:9999/api/v1/user/login/password" parameters:dict headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        LoginModel* loginModel = [[LoginModel alloc] initWithDictionary:responseObject error:nil];
        
        loginModelBlock(loginModel);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

// 验证码登陆
- (void) postEmail:(NSString *)email VerCode:(NSString *)VerCode getLoginModeBlock:(LoginModelBlock)loginModelBlock andErrorBlock:(ErrorBlock)errorBlock {
    
    AFHTTPSessionManager* AFManager = [AFHTTPSessionManager manager];
    
    NSDictionary* dict = @{@"email":email, @"code":VerCode};
    
    [AFManager POST:@"http://101.42.38.110:9999/api/v1/user/login/code" parameters:dict headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        LoginModel* loginModel = [[LoginModel alloc] initWithDictionary:responseObject error:nil];
        
        loginModelBlock(loginModel);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

// 加载网络图片
- (void) setUIImageView:(id)imageView withURL:(NSString *)string {
    string = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL* url = [NSURL URLWithString:string];

    [imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeholderImage.jpg"]];
}

// 获取用户信息
- (void) getUserInfoWithNickName:(NSString *)nickName Token:(NSString *)token UserInfoData:(UserInfoModelBlock)succeedBlock andErrorBlock:(nonnull ErrorBlock)errorBlock {
    
    AFHTTPSessionManager* AFManager = [AFHTTPSessionManager manager];
    
    [AFManager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    
    NSString* urlString = [NSString stringWithFormat:@"http://101.42.38.110:9999/api/v1/userInfo/me/%@", nickName];
    
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    [AFManager GET:urlString parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@", responseObject);
        UserInfoModel* userInfoModel = [[UserInfoModel alloc] initWithDictionary:responseObject error:nil];
        
        succeedBlock(userInfoModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
    
    
}

@end
