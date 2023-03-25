//
//  EOCNetworkFetcher.h
//  Study Block
//
//  Created by 孙旭东 on 2023/2/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^EOCNetworkFetcherCompletionHandler)(NSData* data);
 
@interface EOCNetworkFetcher : NSObject
@property (nonatomic, strong, readonly) NSURL* url;
- (id) initWithURL:(NSURL*)url;
- (void)startWithCompletionHandler:(EOCNetworkFetcherCompletionHandler)completion;
@end

NS_ASSUME_NONNULL_END
