//
//  Danli.m
//  Singleton
//
//  Created by 孙旭东 on 2023/7/27.
//

#import "Danli.h"

@implementation Danli
static id manager = nil;
//+ (instancetype)shareInstance {
//    // 防止多次加锁
//    if (!manager) {
//        @synchronized (self) {
//            if (!manager) {
//                manager = [[super allocWithZone:NULL] init];
//            }
//        }
//    }
//    return manager;
//}

//+ (instancetype)shareInstance {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        manager = [[super allocWithZone:NULL] init];
//    });
//    return manager;
//}
//
//- (instancetype)copyWithZone:(NSZone *)zone {
//    return [Danli shareInstance];
//}
//
//- (instancetype)mutableCopyWithZone:(NSZone *)zone {
//    return [Danli shareInstance];
//}
//
//+ (instancetype)allocWithZone:(struct _NSZone *)zone {
//    return [Danli shareInstance];
//}

+ (void)load {
    [super load];
    manager = [[super allocWithZone:NULL] init];
}

+ (instancetype)shareInstance {
    return manager;
}

- (instancetype)copyWithZone:(NSZone *)zone {
    return manager;
}

- (instancetype)mutableCopyWithZone:(NSZone *)zone {
    return manager;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return manager;
}

@end
