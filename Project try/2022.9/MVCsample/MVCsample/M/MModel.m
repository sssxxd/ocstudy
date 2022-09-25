//
//  MModel.m
//  MVCsample
//
//  Created by 孙旭东 on 2022/9/11.
//

#import "MModel.h"

@implementation MModel

// 重写init方法
- (MModel*) init {
    if (self = [super init]) {
        // 初始化数据
        _colorString = @"red";
        
        // 通知controller视图最初的颜色
        [[NSNotificationCenter defaultCenter] postNotificationName:_colorString object:self];
    }
    return self;
}

- (void) red {
    // 更改数据
    _colorString = @"red";
    
    // 通知controller视图的颜色
    [[NSNotificationCenter defaultCenter] postNotificationName:_colorString object:self];
}

- (void) blue {
    // 更改数据
    _colorString = @"blue";
    
    // 通知controller视图的颜色
    [[NSNotificationCenter defaultCenter] postNotificationName:_colorString object:self];
}

@end
