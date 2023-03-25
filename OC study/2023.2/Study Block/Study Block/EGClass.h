//
//  EGClass.h
//  Study Block
//
//  Created by 孙旭东 on 2023/2/3.
//

#import <Cocoa/Cocoa.h>
#import "EOCNetwork.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^AddBlock)(int a, int b);

typedef void (^EOCCompletionHandler)(NSData *data, NSError *error);

@interface EGClass : NSObject <EOCNetworkDelegate>
@property (nonatomic, strong) EOCNetwork* foo;
@property (nonatomic, strong) EOCNetwork* bar;

- (void) add:(AddBlock)addBlock;

- (void) startWithCompletHandler:(EOCCompletionHandler)completion;

@end

NS_ASSUME_NONNULL_END
