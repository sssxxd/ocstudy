//
//  LNManager+UserLoginModel.m
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/3.
//

#import "LNManager+UserLoginModel.h"

// 引入模型
#import "UserLoginModel.h"

@implementation LNManager (UserLoginModel)

- (void) postEmail:(NSString *)emailString getVerCodeSucceedBlock:(UserEnrollModelBlock)succeedBlock errorBlock:(ErrorBlock)errorBlock {
    
    AFHTTPSessionManager* AFManager = [AFHTTPSessionManager manager];
    
    NSDictionary* parameters = @{@"email":emailString};

    [AFManager POST:@"http://101.42.38.110:9999/api/v1/user/code" parameters:parameters headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        UserEnrollModel* userEnrollModel = [[UserEnrollModel alloc] initWithDictionary:responseObject error:nil];
        
        succeedBlock(userEnrollModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

- (void) postEmail:(NSString *)email password:(NSString *)password code:(NSString*)code enrollUserSucceedBlock:(UserEnrollModelBlock)succeedBlock errorBlock:(ErrorBlock)errorBlock {

    AFHTTPSessionManager* AFManager = [AFHTTPSessionManager manager];

    NSDictionary* parameters = @{@"email":email, @"password":password, @"code":code};

    [AFManager POST:@"http://101.42.38.110:9999/api/v1/user/register" parameters:parameters headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        UserEnrollModel* userEnrollModel = [[UserEnrollModel alloc] initWithDictionary:responseObject error:nil];
        
        succeedBlock(userEnrollModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

// 密码登陆
- (void) postEmail:(NSString *)email password:(NSString *)password loginUserSucceedBlock:(UserLoginModelBlock)succeedBlock errorBlock:(ErrorBlock)errorBlock {
    
    AFHTTPSessionManager* AFManager = [AFHTTPSessionManager manager];
    
    NSDictionary* parameters = @{@"email":email, @"password":password};
    
    [AFManager POST:@"http://101.42.38.110:9999/api/v1/user/login/password" parameters:parameters headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        UserLoginModel* userLoginModel = [[UserLoginModel alloc] initWithDictionary:responseObject error:nil];
        
        succeedBlock(userLoginModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

// 验证码登陆
- (void) postEmail:(NSString *)email code:(NSString *)code loginUserSucceedBlock:(UserLoginModelBlock)succeedBlock errorBlock:(ErrorBlock)errorBlock {
    
    AFHTTPSessionManager* AFManager = [AFHTTPSessionManager manager];
    
    NSDictionary* parameters = @{@"email":email, @"code":code};
    
    [AFManager POST:@"http://101.42.38.110:9999/api/v1/user/login/code" parameters:parameters headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        UserLoginModel* userLoginModel = [[UserLoginModel alloc] initWithDictionary:responseObject error:nil];
        
        succeedBlock(userLoginModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

// 退出登陆
- (void) postNickName:(NSString *)nickName token:(NSString *)token exitUserSucceedBlock:(UserEnrollModelBlock)succeedBlock errorBlock:(ErrorBlock)errorBlock {
    
    NSString* urlString = [NSString stringWithFormat:@"http://101.42.38.110:9999/api/v1/user/logout/%@", nickName];
    
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    AFHTTPSessionManager* AFManager = [AFHTTPSessionManager manager];
    
    [AFManager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    
    [AFManager POST:urlString parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        UserEnrollModel* userEnrollModel = [[UserEnrollModel alloc] initWithDictionary:responseObject error:nil];
        
        succeedBlock(userEnrollModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

@end
