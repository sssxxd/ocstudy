//
//  LNManager.m
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/1/31.
//

#import "LNManager.h"

static id manager = nil;

@implementation LNManager
+ (instancetype) shareLNManager {
    if (manager == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [[LNManager alloc] init];
        });
    }
    return manager;
}
@end
