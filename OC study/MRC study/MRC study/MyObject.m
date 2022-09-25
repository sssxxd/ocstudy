//
//  MyObject.m
//  MRC study
//
//  Created by 孙旭东 on 2022/9/25.
//

#import "MyObject.h"

@implementation MyObject

+ (id) allocObject {
    // 自己生成并持有对象
    id object = [[NSObject alloc] init];
    
    // 自己持有对象
    
    return object;
}

+ (id) object {
    // 自己生成并持有对象
    id object = [[NSObject alloc] init];
    
    [object autorelease];
    
    // 取得的对象存在，但自己不持有对象
    
    return object;
}

- (id) init {
    if (self = [super init]) {
        self.str = @"111";
    }
    return self;
}

@end
