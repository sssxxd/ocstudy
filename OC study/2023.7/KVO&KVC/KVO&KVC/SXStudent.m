//
//  SXStudent.m
//  KVO&KVC
//
//  Created by 孙旭东 on 2023/7/25.
//

#import "SXStudent.h"
#import <objc/runtime.h>

@implementation SXStudent
//- (void)setAge:(NSInteger)age {
//    NSLog(@"setAge");
//    _age = age;
//}
//- (void)willChangeValueForKey:(NSString *)key {
//    NSLog(@"willChangeValueForKey begin");
//    [super willChangeValueForKey:key];
//    NSLog(@"willChangeValueForKey end");
//}
//
//- (void)didChangeValueForKey:(NSString *)key {
//    NSLog(@"didChangeValueForKey begin");
//    [super didChangeValueForKey:key];
//    NSLog(@"didChangeValueForKey end");
//}
//- (id)init {
//    if (self = [super init]) {
//        self.dog = [[SXDog alloc] init];
//    }
//    return self;
//}

- (void)setAge:(NSInteger)aage {
//    [self didChangeValueForKey:@"age"];
    _age = aage;
    
}

@end
