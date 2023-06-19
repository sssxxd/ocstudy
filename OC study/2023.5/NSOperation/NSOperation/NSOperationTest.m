//
//  NSOperationTest.m
//  NSOperation
//
//  Created by 孙旭东 on 2023/6/15.
//

#import "NSOperationTest.h"

@implementation NSOperationTest

//- (void)main {
//    if (!self.isCancelled) {
//        [NSThread sleepForTimeInterval:2];
//        NSLog(@"test1--%@", [NSThread currentThread]);
//        [NSThread sleepForTimeInterval:2];
//        NSLog(@"test2--%@", [NSThread currentThread]);
//        [NSThread sleepForTimeInterval:2];
//        NSLog(@"test3--%@", [NSThread currentThread]);
//        [NSThread sleepForTimeInterval:2];
//        NSLog(@"test4--%@", [NSThread currentThread]);
//    }
//}

- (void)start {
    if (!self.isCancelled) {
        [NSThread sleepForTimeInterval:2];
        NSLog(@"test1--%@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:2];
        NSLog(@"test2--%@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:2];
        NSLog(@"test3--%@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:2];
        NSLog(@"test4--%@", [NSThread currentThread]);
    }
}

@end
