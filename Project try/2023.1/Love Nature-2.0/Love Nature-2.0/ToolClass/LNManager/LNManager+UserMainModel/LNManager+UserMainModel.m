//
//  LNManager+UserMainModel.m
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/1.
//

#import "LNManager+UserMainModel.h"

// 引入Model
#import "UserMainModel.h"



@implementation LNManager (UserMainModel)

// 通过昵称和token获得信息
- (void) getUserInfoWithNickName:(NSString *)nickName AndToken:(NSString *)token UserInfoModelBlock:(nonnull UserInfoModelBlock)succeedBlock ErrorBlack:(nonnull ErrorBlock)errorBlock {
    
    NSString* urlString = [NSString stringWithFormat:@"http://101.42.38.110:9999/api/v1/userInfo/me/%@", nickName];
    
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    AFHTTPSessionManager* AFManager = [AFHTTPSessionManager manager];
    
    [AFManager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    
    [AFManager GET:urlString parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        UserInfoModel* userInfoModel = [[UserInfoModel alloc] initWithDictionary:responseObject error:nil];
        
        succeedBlock(userInfoModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

@end
