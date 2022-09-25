//
//  KVCObject.m
//  KVC
//
//  Created by 孙旭东 on 2022/9/25.
//

#import "KVCObject.h"

@implementation KVCObject

- (instancetype)init{
    self = [super init];
    if (self) {
        self.isShow = YES;
        self.name = @"张三";
        self.textArray = @[@"advhfudsiv",@"dsvbids", @"svgsg"];
    }
    return self;
}


- (void)printProtroty{
    NSLog(@"在类中输出一下name=%@",_name);
    
    NSLog(@"在类里输出一下所有字符串的长度 = %@", [self.textArray valueForKeyPath:@"@sum.length"]);
}

@end
