//
//  SXTeacher.m
//  KVO&KVC
//
//  Created by 孙旭东 on 2023/7/25.
//

#import "SXTeacher.h"
#import <objc/runtime.h>

@implementation SXTeacher

//- (id)init {
//    if (self = [super init]) {
//        self.student1 = [[SXStudent alloc] init];
//        self.student2 = [[SXStudent alloc] init];
//
//        self.student1.age = 1;
//        self.student2.age = 2;
//
////        NSLog(@"添加监听之前 - p1 = %p, p2 = %p", [self.student1 methodForSelector:@selector(setAge:)], [self.student2 methodForSelector:@selector(setAge:)]);
//
//        // 添加监听
//        NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
//        [self.student1 addObserver:self forKeyPath:@"age" options:options context:nil];
//
////        NSLog(@"添加监听之后 - p1 = %p, p2 = %p", [self.student1 methodForSelector:@selector(setAge:)], [self.student2 methodForSelector:@selector(setAge:)]);
//    }
//    return self;
//}
//
- (void)demo {

    self.student1.age = 20;
//    self.student2.age = 30;
}
//
//- (void)demo2 {
//    [self printMethods:object_getClass(self.student1)];
//    [self printMethods:object_getClass(self.student2)];
//}
//
//- (void)demo3 {
//    NSLog(@"类对象 - student1:%@<%p> student2:%@<%p>",
//          object_getClass(self.student1),
//          object_getClass(self.student1),
//          object_getClass(self.student2),
//          object_getClass(self.student2)
//          );
//
//    NSLog(@"元类对象 - student1:%@<%p> student2:%@<%p>",
//          object_getClass(object_getClass(self.student1)),
//          object_getClass(object_getClass(self.student1)),
//          object_getClass(object_getClass(self.student2)),
//          object_getClass(object_getClass(self.student2))
//          );
//}
//
//- (void) printMethods:(Class)cls {
//    unsigned int count;
//    Method *methods = class_copyMethodList(cls, &count);
//    NSMutableString *methodNames = [NSMutableString string];
//    [methodNames appendFormat:@"%@ - ", cls];
//    NSLog(@"%@ superClass ----> %@", NSStringFromClass(cls), NSStringFromClass(class_getSuperclass(cls)));
//
//    for (int i = 0; i < count; i++) {
//        Method method = methods[i];
//        NSString *methodName = NSStringFromSelector(method_getName(method));
//
//        [methodNames appendFormat:@"%@ ", methodName];
//    }
//
//    NSLog(@"%@", methodNames);
//    free(methods);
//}
//
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@的%@被改变：%@", object, keyPath, change);
}
//
//- (void)dealloc {
//    // 移除监听
//    [self.student1 removeObserver:self forKeyPath:@"age"];
//}

- (id)init {
    if (self = [super init]) {
        self.student1 = [[SXStudent alloc] init];
        
        NSKeyValueObservingOptions option = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
        [self.student1 addObserver:self forKeyPath:@"age" options:option context:nil];
        
//        [self.student1 setValue:@20 forKey:@"age"];
//        self.student1.age = 10;
//        NSLog(@"%d", self.student1->_isAge);
//
//        NSLog(@"-----");
        
//        [self.student1 willChangeValueForKey:@"age"];
//        [self.student1 didChangeValueForKey:@"age"];
        
    }
    return self;
}

//- (void)demoSetValueForKeyAndValueForKey {
//    [self.student1 setValue:@20 forKey:@"age"];
//    NSLog(@"点语法：%ld", self.student1.age);
//    NSNumber *value = [self.student1 valueForKey:@"age"];
//    NSLog(@"KVC：%@", value);
//}
//
//- (void)demoSetValueForKeyPathAndValueForKeyPath {
//    [self.student1 setValue:@16 forKeyPath:@"dog.weight"];
//    NSLog(@"点语法：%lf", self.student1.dog.weight);
//    NSNumber *value = [self.student1 valueForKeyPath:@"dog.weight"];
//    NSLog(@"KVC：%@", value);
//}


@end
