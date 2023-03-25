//
//  EOCClass.m
//  Study Block
//
//  Created by 孙旭东 on 2023/2/3.
//

#import "EOCClass.h"
#import "EOCNetworkFetcher.h"

//static dispatch_queue_t _syncQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

@implementation EOCClass {
    EOCNetworkFetcher* _networkFetcher;
    NSData* _fetchedData;
    NSString* _someString;
}


//- (void) downloadData {
//    NSURL* url = [[NSURL alloc] initWithString:@"..."];
//    _networkFetcher = [[EOCNetworkFetcher alloc] initWithURL:url];
//    [_networkFetcher startWithCompletionHandler:^(NSData * _Nonnull data) {
//        NSLog(@"Request URL %@ finished", _networkFetcher.url);
//        _fetchedData = data;
//    }];
//}
//
//- (void) anInstanceMethod {
//    self.value = @"dd";
//    void (^someBlock)(void) = ^{
//        self.value = @"Something";
//        NSLog(@"%@ %p", self.value, _value);
//    };
//    someBlock();
//}
//
//- (void) setValue:(NSString *)value {
//    _value = value;
//    NSLog(@"%p", &self);
//}
//
//
//- (void)synchronizedMethod {
//    @synchronized (self) {
//        NSLock *lock = [[NSLock alloc] init];
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            static void (^RecursiveMethod)(int);
//            RecursiveMethod = ^(int value) {
//                [lock lock];
//                if (value > 0) {
//                    NSLog(@"value = %d", value);
//                    sleep(2);
//                    RecursiveMethod(value - 1);
//                }
//                [lock unlock];
//            };
//            RecursiveMethod(5);
//        });
//    }
//}

//- (NSString*)someString {
//    @synchronized(self) {
//        return _someString;
//    }
//}
//
//- (void)setSomeString:(NSString *)someString {
//    @synchronized(self) {
//        _someString = someString;
//    }
//}

//- (NSString*)someString {
//    __block NSString* localSomeString;
//    dispatch_sync(_syncQueue, ^{
//        localSomeString = _someString;
//    });
//    return localSomeString;
//}
//
//- (void)setSomeString:(NSString*)someString {
//    dispatch_barrier_async(_syncQueue, ^{
//        _someString = someString;
//    });
//}

@end
