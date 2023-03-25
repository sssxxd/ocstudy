//
//  EOCNetwork.h
//  Study Block
//
//  Created by 孙旭东 on 2023/2/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class EOCNetwork;
@protocol EOCNetworkDelegate <NSObject>

- (void)network:(EOCNetwork*)network didFinishWithData:(NSData*)data;

@end

@interface EOCNetwork : NSObject

@property (nonatomic, weak) id<EOCNetworkDelegate> delegate;

- (id) initWithURL:(NSString*)string;
- (void) start;

@end

NS_ASSUME_NONNULL_END
