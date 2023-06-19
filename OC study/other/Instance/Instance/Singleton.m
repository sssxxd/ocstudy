//
//  Singleton.m
//  Instance
//
//  Created by 孙旭东 on 2022/9/18.
//

#import "Singleton.h"
static id _instance = nil;  //定义static全局变量

@implementation Singleton

+ (id) shareInstance {
    return [[self alloc] init];
}

+ (id) allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

@end


