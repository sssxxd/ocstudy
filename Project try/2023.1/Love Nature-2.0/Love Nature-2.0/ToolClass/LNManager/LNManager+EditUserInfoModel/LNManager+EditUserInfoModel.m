//
//  LNManager+EditUserInfoModel.m
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/10.
//

#import "LNManager+EditUserInfoModel.h"

// 引入模型类
#import "UserEditUserInfoModel.h"

@implementation LNManager (EditUserInfoModel)

- (void) postUserIconImage:(UIImage *)image withNickName:(NSString *)nickName token:(NSString*)token SucceedBlock:(EditUserInfoModelBlock)succeedBlock errorBlock:(ErrorBlock)errorBlock {
    
    AFHTTPSessionManager* AFManager = [AFHTTPSessionManager manager];
    AFManager.requestSerializer = [AFJSONRequestSerializer serializer];
    AFManager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [AFManager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    
    NSString* urlString = [NSString stringWithFormat:@"http://101.42.38.110:9999/api/v1/user/icon/%@", nickName];
    
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSData* imageData = UIImageJPEGRepresentation(image, 0.1);
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSString* string = [formatter stringFromDate:[NSDate date]];
    NSString* fileName = [NSString stringWithFormat:@"%@.jpeg", string];
    
    [AFManager POST:urlString parameters:nil headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:imageData name:@"iconFile" fileName:fileName mimeType:@"image/jpeg"];
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        EditUserInfoModel* editUserInfoModel = [[EditUserInfoModel alloc] initWithDictionary:responseObject error:nil];
        
        succeedBlock(editUserInfoModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

@end
