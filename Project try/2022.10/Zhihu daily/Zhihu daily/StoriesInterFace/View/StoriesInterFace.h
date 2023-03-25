//
//  StoriesInerFace.h
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/10/22.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "SDWebImage.h"
#import "Manage.h"
#import "Masonry.h"

NS_ASSUME_NONNULL_BEGIN

@interface StoriesInterFace : UIView
<UIScrollViewDelegate,
WKNavigationDelegate,
WKUIDelegate>

@property (nonatomic, assign) NSInteger offSetX;

@property (nonatomic, strong) UIScrollView* scrollView;

@property (nonatomic, assign) NSInteger numberOfStories;
@property (nonatomic, assign) NSInteger nowStoriesNumber;

@property (nonatomic, strong) NSMutableSet* nowWebViewSet;
@property (nonatomic, strong) NSMutableArray* nowWebViewArray;
@property (nonatomic, strong) WKWebView* nextWebView;

- (void) ViewInit;

- (void) setNextWebImageWithString:(NSString*)string andNumber:(NSInteger)number;

//- (void) setNowWebImageWithString:(NSString*)string andNumber:(NSInteger)number;

@end

NS_ASSUME_NONNULL_END
