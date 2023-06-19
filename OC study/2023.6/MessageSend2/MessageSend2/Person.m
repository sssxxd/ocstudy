//
//  Person.m
//  MessageSend2
//
//  Created by 孙旭东 on 2023/6/10.
//

#import "Person.h"
#import "Blank.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation Person

//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    NSLog(@"%s, aSelector = %@", __func__, NSStringFromSelector(aSelector));
//
//    if (aSelector == @selector(func1)) {
//        return [Blank alloc];
//    }
//
//    return [super forwardingTargetForSelector:aSelector];
//}

//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
//    NSLog(@"%s, aSelector = %@", __func__, NSStringFromSelector(aSelector));
//    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
//}
//
//- (void)forwardInvocation:(NSInvocation *)anInvocation {
//
//}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"%s, sel = %@", __func__, NSStringFromSelector(sel));
    
    return [super resolveInstanceMethod:sel];
}

- (void)addMethod {
    NSLog(@"%s", __func__);
}
@end
