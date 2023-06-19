//
//  person.m
//  MessageSend
//
//  Created by 孙旭东 on 2023/6/4.
//

#import "person.h"
#import <objc/message.h>
#import <objc/runtime.h>

@implementation person
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"%s, self = %@", __func__, NSStringFromSelector(sel));
    if (sel == @selector(test)) {
        IMP imp = class_getMethodImplementation(self.class, @selector(addMethod));
        class_addMethod(self.class, sel, imp, "v@:");
    }
    return  [super resolveInstanceMethod:sel];
}

- (void)addMethod {
    NSLog(@"%s", __func__);
}
@end
