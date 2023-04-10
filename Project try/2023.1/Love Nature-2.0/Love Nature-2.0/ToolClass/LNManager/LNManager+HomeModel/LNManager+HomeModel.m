//
//  LNManager+HomeModel.m
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/6.
//

#import "LNManager+HomeModel.h"

// 引入模型类
#import "HomeModel.h"
#import "SearchModel.h"

@implementation LNManager (HomeModel)

- (void) searchKeywork:(NSString *)keyword succeedBlock:(KeywordListModelBlock)succeedBlock errorBlock:(ErrorBlock)errorBlock {
    
    AFHTTPSessionManager* AFManager = [AFHTTPSessionManager manager];
    
    NSString* urlString = [NSString stringWithFormat:@"http://101.42.38.110:9999/api/v1/pet/keywordList/%@", keyword];
    
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    [AFManager GET:urlString parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        KeywordListModel* keywordListModel = [[KeywordListModel alloc] initWithDictionary:responseObject error:nil];
        
        succeedBlock(keywordListModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

//// 获取详细信息
//- (void) postPetName:(NSString *)name getPetInfoSucceedBlock:(SearchResultModelBlock)succeedBlock erorBlock:(ErrorBlock)errorBlock {
//
//    AFHTTPSessionManager* AFManager = [AFHTTPSessionManager manager];
//
//    NSString* urlString = [NSString stringWithFormat:@"http://101.42.38.110:9999/api/v1/pet/petInfo/%@", name];
//
//    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//    
//    [AFManager GET:urlString parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        SearchResultModel* searchResultModel = [[SearchResultModel alloc] initWithDictionary:responseObject error:nil];
//        succeedBlock(searchResultModel);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        errorBlock(error);
//    }];
//}

- (void) searchKeyword:(NSString *)keyword withPage:(NSInteger)page SearchShareModelBlock:(SearchShareModelBlock)succeedBlock errorBlock:(ErrorBlock)errorBlock {
    AFHTTPSessionManager* AFManager = [AFHTTPSessionManager manager];
    
    NSString* urlString = [NSString stringWithFormat:@"http://101.42.38.110:9999/api/v1/blog/content/%@/%ld", keyword, page];
    
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    [AFManager GET:urlString parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        SearchShareModel* searchShareModel = [[SearchShareModel alloc] initWithDictionary:responseObject error:nil];

        succeedBlock(searchShareModel);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

- (void) getBlogWithPage:(NSInteger)page Succeed:(HomeShareModelBlock)succeedBlock errorBlock:(ErrorBlock)errorBlock {
    AFHTTPSessionManager* AFManager = [AFHTTPSessionManager manager];
    
    NSString* urlString = [NSString stringWithFormat:@"http://101.42.38.110:9999/api/v1/blog/content/list/createdAt/%ld", page];
    
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    [AFManager GET:urlString parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        HomeShareModel* homeShareModel = [[HomeShareModel alloc] initWithDictionary:responseObject error:nil];
        
        succeedBlock(homeShareModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

@end
