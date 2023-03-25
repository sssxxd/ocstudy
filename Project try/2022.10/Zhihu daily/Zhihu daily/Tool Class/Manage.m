//
//  Manage.m
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/10/17.
//

#import "Manage.h"
#import "UIImageView+WebCache.h"

@implementation Manage

+ (instancetype) allocWithZone:(struct _NSZone *)zone {
    if (!manage) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manage = [super allocWithZone:zone];
        });
    };
    return manage;
}

+ (id) sharedManage {
    return [[Manage alloc] init];
}

- (void) getNowStoriesData:(NowStoriesBlock)succeedBlock error:(ErrorBlock)errorBlock {
    NSString* urlString = @"https://news-at.zhihu.com/api/4/news/latest";
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL* url = [NSURL URLWithString:urlString];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    NSURLSession* session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NowStoriesModel* nowStoriesModel = [[NowStoriesModel alloc] initWithData:data error:nil];
        
        if (error == nil) {
            succeedBlock(nowStoriesModel);
        } else {
            errorBlock(error);
        }
    }];
    
    [dataTask resume];
}

+ (void) setImage:(UIImageView *)imageView WithString:(NSString *)string {
    string = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL* url = [NSURL URLWithString:string];

    [imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeholderImage.jpeg"]];
    
}

- (void) getLastTime:(NSString *)timeString StoriesData:(LastStoriesBlock)succeedBlock error:(ErrorBlock)errorBlock {
    NSString* string = [NSString stringWithFormat:@"https://news-at.zhihu.com/api/4/news/before/%@", timeString];
    
    string = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL* url = [NSURL URLWithString:string];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    NSURLSession* session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        LastStoriesModel* lastStoriesModel = [[LastStoriesModel alloc] initWithData:data error:nil];
        
        if (error == nil) {
            succeedBlock(lastStoriesModel);
        } else {
            errorBlock(error);
        }
    }];
    
    [dataTask resume];
}

- (void) setWebImage:(WKWebView *)webImage WithString:(NSString *)string {
    NSString* urlString = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSLog(@"%@", string);
    
    NSURL* url = [NSURL URLWithString:urlString];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    [webImage loadRequest:request];
}

- (void) getWebWithID:(NSString *)string StorieContentData:(StorieContentBlock)succeedBlock error:(ErrorBlock)errorBlock {
    NSString* urlString = [NSString stringWithFormat:@"https://news-at.zhihu.com/api/4/news/%@", string];
    
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL* url = [NSURL URLWithString:urlString];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    NSURLSession* session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        StorieContentModel* storieContentModel = [[StorieContentModel alloc] initWithData:data error:nil];
        
        if (error == nil) {
            succeedBlock(storieContentModel);
        } else {
            errorBlock(error);
        }
    }];
    
    [dataTask resume];
}

- (void) getExtraContentWithID:(NSString*)string StorieExtraContentData:(StorieExtraContentBlock)succeedBlock error:(ErrorBlock)errorBlock {
    NSString* urlString = [NSString stringWithFormat:@"https://news-at.zhihu.com/api/4/story-extra/%@", string];
    
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL* url = [NSURL URLWithString:urlString];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    NSURLSession* session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        StorieExtraContentModel* storieExtraContentModel = [[StorieExtraContentModel alloc] initWithData:data error:nil];
        
        if (error == nil) {
            succeedBlock(storieExtraContentModel);
        } else {
            errorBlock(error);
        }
    }];
    
    [dataTask resume];
}

- (void) getLongCommentWithID:(NSString *)string CommentData:(CommentModelBlock)succeedBlock error:(ErrorBlock)errorBlock {
    NSString* urlstring = [NSString stringWithFormat:@"https://news-at.zhihu.com/api/4/story/%@/long-comments", string];
    
    urlstring = [urlstring stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL* url = [NSURL URLWithString:urlstring];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    NSURLSession* session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            CommentModel* commentModel = [[CommentModel alloc] initWithData:data error:nil];
            succeedBlock(commentModel);
        } else {
            errorBlock(error);
        }
    }];
    
    [dataTask resume];
}

- (void) getShortCommentWithID:(NSString *)string CommentData:(CommentModelBlock)succeedBlock error:(ErrorBlock)errorBlock {
    NSString* urlstring = [NSString stringWithFormat:@"https://news-at.zhihu.com/api/4/story/%@/short-comments", string];
    
    urlstring = [urlstring stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL* url = [NSURL URLWithString:urlstring];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    NSURLSession* session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            CommentModel* commentModel = [[CommentModel alloc] initWithData:data error:nil];
            succeedBlock(commentModel);
        } else {
            errorBlock(error);
        }
    }];
    
    [dataTask resume];
}

- (void) getCollectConentWithID:(NSString *)string CollectData:(MyCollectContentBlock)succeedBlock error:(ErrorBlock)errorBlock {
    NSString* urlString = [NSString stringWithFormat:@"https://news-at.zhihu.com/api/4/news/%@", string];
    
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL* url = [NSURL URLWithString:urlString];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    NSURLSession* session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            MyCollectContentModel* contentModel = [[MyCollectContentModel alloc] initWithData:data error:nil];
            succeedBlock(contentModel);
        } else {
            errorBlock(error);
        }
    }];
    
    [dataTask resume];
}

@end
