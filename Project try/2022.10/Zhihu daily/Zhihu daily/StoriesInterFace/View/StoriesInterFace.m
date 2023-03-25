//
//  StoriesInerFace.m
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/10/22.
//

#import "StoriesInterFace.h"

#define SCREEN_SIZE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation StoriesInterFace
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void) ViewInit {
    self.backgroundColor = [UIColor whiteColor];
    
    self.nowWebViewSet = [[NSMutableSet alloc] init];
    self.nowWebViewArray = [[NSMutableArray alloc] init];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    self.scrollView.contentSize = CGSizeMake(SCREEN_SIZE_WIDTH * self.numberOfStories, 0);
    self.scrollView.contentOffset = CGPointMake(SCREEN_SIZE_WIDTH * (self.nowStoriesNumber - 1), 0);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    self.scrollView.alwaysBounceHorizontal = NO;
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    [self addSubview:self.scrollView];
}

//- (void) setNowWebImageWithString:(NSString *)string andNumber:(NSInteger)number {
//    if ([[[UIDevice currentDevice]systemVersion]intValue ] >= 9.0) {
//            NSArray * types =@[WKWebsiteDataTypeMemoryCache,WKWebsiteDataTypeDiskCache]; // 9.0之后才有的
//            NSSet *websiteDataTypes = [NSSet setWithArray:types];
//            NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
//            [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
//            }];
//        }else{
//            NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask,YES) objectAtIndex:0];
//            NSString *cookiesFolderPath = [libraryPath stringByAppendingString:@"/Cookies"];
//            NSLog(@"%@", cookiesFolderPath);
//            NSError *errors;
//            [[NSFileManager defaultManager] removeItemAtPath:cookiesFolderPath error:&errors];
//        }
//    _nowWebView = [[WKWebView alloc] initWithFrame:CGRectMake(SCREEN_SIZE_WIDTH * (number - 1), 0, SCREEN_SIZE_WIDTH, SCREEN_SIZE_HEIGHT)];
//    _nowWebView.navigationDelegate = self;
//    _nowWebView.UIDelegate = self;
//
//    [[Manage sharedManage] setWebImage:_nowWebView WithString:string];
//
//    [_scrollView addSubview:_nowWebView];
//}

- (void) setNextWebImageWithString:(NSString*)string andNumber:(NSInteger)number{
    if ([self.nowWebViewSet containsObject:[NSNumber numberWithInteger:number]]) {
        return;
    }
    if ([[[UIDevice currentDevice]systemVersion]intValue ] >= 9.0) {
            NSArray * types =@[WKWebsiteDataTypeMemoryCache,WKWebsiteDataTypeDiskCache]; // 9.0之后才有的
            NSSet *websiteDataTypes = [NSSet setWithArray:types];
            NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
            [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
            }];
        }else{
            NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask,YES) objectAtIndex:0];
            NSString *cookiesFolderPath = [libraryPath stringByAppendingString:@"/Cookies"];
            NSLog(@"%@", cookiesFolderPath);
            NSError *errors;
            [[NSFileManager defaultManager] removeItemAtPath:cookiesFolderPath error:&errors];
        }
    self.nextWebView = [[WKWebView alloc] initWithFrame:CGRectMake(SCREEN_SIZE_WIDTH * number, 0, SCREEN_SIZE_WIDTH, SCREEN_SIZE_HEIGHT - 108)];
    self.nextWebView.navigationDelegate = self;
    
    [[Manage sharedManage] setWebImage:self.nextWebView WithString:string];
    
    [self.scrollView addSubview:self.nextWebView];
    
    [self.nowWebViewSet addObject:[NSNumber numberWithInteger:number]];
    [self.nowWebViewArray addObject:self.nextWebView];
}

- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *credential))completionHandler {
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        if ([challenge previousFailureCount] == 0) {
            NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
            completionHandler(NSURLSessionAuthChallengeUseCredential, credential);
        } else {
            completionHandler(NSURLSessionAuthChallengeCancelAuthenticationChallenge, nil);
        }
    } else {
        completionHandler(NSURLSessionAuthChallengeCancelAuthenticationChallenge, nil);
    }
}

//- (void) scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//    _offSetX = _scrollView.contentOffset.x;
//}

//- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat x = fmod(_scrollView.contentOffset.x, SCREEN_SIZE_WIDTH);
//    if (x > 20 && x < (SCREEN_SIZE_WIDTH - 20)) {
//        if (_nextWebView == nil) {
//            NSInteger page = (_scrollView.contentOffset.x - x) / SCREEN_SIZE_WIDTH;
//            NSNumber* pageNumber = [NSNumber numberWithInteger:page];
//            if (x > (SCREEN_SIZE_WIDTH / 2)) {
//                [[NSNotificationCenter defaultCenter] postNotificationName:@"rightScrolling" object:nil userInfo:@{@"value":pageNumber}];
//            } else {
//                [[NSNotificationCenter defaultCenter] postNotificationName:@"leftScrolling" object:nil userInfo:@{@"value":pageNumber}];
//            }
//        }
//    } else if (_nextWebView != nil) {
//        [self updataNowWebViewAndNextWebView];
//    }
//}

//- (void) updataNowWebViewAndNextWebView {
//    CGFloat x = fmod(_scrollView.contentOffset.x, SCREEN_SIZE_WIDTH);
//    NSInteger page = 0;
//
//    if (x > (SCREEN_SIZE_WIDTH / 2)) {
//        page = (_scrollView.contentOffset.x - x) / SCREEN_SIZE_WIDTH + 2;
//    } else {
//        page = (_scrollView.contentOffset.x - x) / SCREEN_SIZE_WIDTH + 1;
//    }
//
//    if (page == _nowStoriesNumber) {
//        [_nextWebView removeFromSuperview];
//        [_nextWebView stopLoading];
//        _nextWebView.navigationDelegate = nil;
//        _nextWebView.UIDelegate = nil;
//        _nextWebView = nil;
//    } else {
//        [_nowWebView removeFromSuperview];
//        [_nowWebView stopLoading];
//        _nowWebView.navigationDelegate = nil;
//        _nowWebView.UIDelegate = nil;
//        _nowWebView = nil;
//        _nowWebView = _nextWebView;
//        _nextWebView = nil;
//    }
//}

- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView {
    [self.nextWebView reload];
}

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger number = self.scrollView.contentOffset.x / SCREEN_SIZE_WIDTH;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"scrollViewDidEndDecelerating" object:nil userInfo:@{@"value":[NSNumber numberWithInteger:number]}];
}

@end
