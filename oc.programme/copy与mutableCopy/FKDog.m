//
//  FKDog.m
//  oc.programme
//
//  Created by 孙旭东 on 2022/5/31.
//

#import "FKDog.h"

@implementation FKDog
- (id)copyWithZone:(NSZone*) zone {
    // 使用zone参数创建FKDog对象
    FKDog* dog = [[[self class] allocWithZone:zone] init];
    dog.name = [self.name mutableCopy];
    dog.age = self.age;
    return dog;
}
@end
