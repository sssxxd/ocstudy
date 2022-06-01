//
//  main.m
//  oc.programme
//
//  Created by 孙旭东 on 2022/5/31.
//

#import "FKDog.h"

int main(void) {
    @autoreleasepool {
        FKDog* dog1 = [[FKDog alloc] init];
        dog1.name = [NSMutableString stringWithString:@"大黄"];
        dog1.age = 12;
        // 复制副本
        FKDog* dog2 = [dog1 copy];
        // 尝试输出副本
        NSLog(@"dog2: %@ %d", dog2.name, dog2.age);
        // 更改副本
        [dog2.name replaceCharactersInRange:NSMakeRange(0, 2)
                                 withString:@"snoopy"];
        dog2.age = 14;
        // 尝试输出
        NSLog(@"dog1: %@ %d", dog1.name, dog1.age);
        NSLog(@"dog2: %@ %d", dog2.name, dog2.age);
    }
}
