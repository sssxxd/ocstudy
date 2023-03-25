//
//  Manage.h
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/10/17.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "NowStoriesModel.h"
#import "LastStoriesModel.h"
#import "StorieContentModel.h"
#import "CommentModel.h"
#import "MyCollectContentModel.h"

typedef void (^NowStoriesBlock)(NowStoriesModel * _Nonnull nowStoriesModel);

typedef void (^LastStoriesBlock)(LastStoriesModel * _Nonnull lastStoriesModel);

typedef void (^StorieContentBlock)(StorieContentModel * _Nonnull storieContentModel);

typedef void (^StorieExtraContentBlock)(StorieExtraContentModel * _Nonnull storieExtraContentModel);

typedef void (^CommentModelBlock)(CommentModel * _Nonnull commentModel);

typedef void (^MyCollectContentBlock)(MyCollectContentModel * _Nonnull myCollectContenModel);

typedef void (^ErrorBlock)(NSError * _Nonnull error);

NS_ASSUME_NONNULL_BEGIN

static id manage = nil;

@interface Manage : NSObject

+ (id) sharedManage;

- (void) getNowStoriesData:(NowStoriesBlock)succeedBlock error:(ErrorBlock)errorBlock;

+ (void) setImage:(UIImageView*)imageView WithString:(NSString*)string;

- (void) getLastTime:(NSString*)timeString StoriesData:(LastStoriesBlock)succeedBlock error:(ErrorBlock)errorBlock;

- (void) setWebImage:(WKWebView*)webImage WithString:(NSString*)string;

- (void) getWebWithID:(NSString*)string StorieContentData:(StorieContentBlock)succeedBlock error:(ErrorBlock)errorBlock;

- (void) getExtraContentWithID:(NSString*)string StorieExtraContentData:(StorieExtraContentBlock)succeedBlock error:(ErrorBlock)errorBlock;

- (void) getLongCommentWithID:(NSString*)string CommentData:(CommentModelBlock)succeedBlock error:(ErrorBlock)errorBlock;

- (void) getShortCommentWithID:(NSString*)string CommentData:(CommentModelBlock)succeedBlock error:(ErrorBlock)errorBlock;

- (void) getCollectConentWithID:(NSString*)string CollectData:(MyCollectContentBlock)succeedBlock error:(ErrorBlock)errorBlock;

@end

NS_ASSUME_NONNULL_END
