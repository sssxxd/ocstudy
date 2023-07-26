//
//  main.m
//  isKindOfClass&isMenberOfClass
//
//  Created by 孙旭东 on 2023/7/24.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface MySuperClass : NSObject
@end

@implementation MySuperClass
@end

@interface MyClass : MySuperClass
@end

@implementation MyClass
@end

void demo(void) {
    BOOL f1 = [(id)[NSObject class] isKindOfClass:[NSObject class]];
    BOOL f2 = [(id)[MyClass class] isKindOfClass:[MyClass class]];
    BOOL f3 = [(id)[MySuperClass class] isKindOfClass:[MySuperClass class]];
    BOOL f4 = [(id)[MyClass class] isKindOfClass:[MySuperClass class]];
    
    BOOL f5 = [(id)[NSObject alloc] isKindOfClass:[NSObject class]];
    BOOL f6 = [(id)[MyClass alloc] isKindOfClass:[NSObject class]];
    BOOL f7 = [(id)[MySuperClass alloc] isKindOfClass:[NSObject class]];
    
    NSLog(@"NSObjectClass ISKindOf NSObjectClass:%d", f1);
    NSLog(@"MyClassClass ISKindOf MyClassClass:%d", f2);
    NSLog(@"MySuperClassClass ISKindOf MySuperCassClass:%d", f3);
    NSLog(@"MyClassClass ISKindOf MySuperClassClass:%d", f4);
    NSLog(@"NSObjectObj ISKindOf NSObjectClass:%d", f5);
    NSLog(@"MyClassObj ISKindOf NSObjectClass:%d", f6);
    NSLog(@"MySuperClassObj ISKindOf NSObjectClass:%d", f7);
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        demo();
    }
    return 0;
}
