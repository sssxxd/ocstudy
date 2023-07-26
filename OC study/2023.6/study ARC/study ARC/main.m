//
//  main.m
//  study ARC
//
//  Created by 孙旭东 on 2023/7/17.
//

#import <Foundation/Foundation.h>

extern void _objc_autoreleasePoolPrint(void);

//@interface MyClass : NSObject
//@property (nonatomic, weak) id obj;
//@end
//
//@implementation MyClass {
//    id _obj;
//}
//
//@end

@interface TestPerson : NSObject {
    // 成员变量
    // @public
    NSString *_age; // 4个字节
}
@property (nonatomic, copy) NSString *name; // 属性

@end

@implementation TestPerson

@end


int main(int argc, const char * argv[]) {
//    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
//    // 等同于objc_autoreleasePoolPush()
//
//    id obj = [[NSObject alloc] init];
//
//    [obj autorelease];
//    // 等同于objc_autorelease(obj)
//    _objc_autoreleasePoolPrint();
//
//    [pool drain];
//    // 等同于objc_autoreleasePoolPop(pool)
//
//    _objc_autoreleasePoolPrint();
    
//    id __strong obj0;
//    id __weak obj1;
//    id __autoreleasing obj2;
//    id __strong obj0 = nil;
//    id __weak obj1 = nil;
//    id __autoreleasing obj2 = nil;
//
//    {
//        id __strong obj0 = [[NSObject alloc] init];
//
//        id __weak obj1 = obj0;
//    }
    
//    id __weak obj1 = nil;
//    {
//        id __strong obj0 = [[NSObject alloc] init];
//
//        obj1 = obj0;
//
//        NSLog(@"A:%@", obj1);
//    }
//    NSLog(@"B:%@", obj1);
    
//    id __unsafe_unretained obj1 = nil;
//    {
//        id __strong obj0 = [[NSObject alloc] init];
//
//        obj1 = obj0;
//
//        NSLog(@"A:%@", obj1);
//    }
//    NSLog(@"B:%@", obj1);
//

//    {
//        id objs[2];
//        objs[0] = [[NSObject alloc] init];
//        objs[1] = [NSMutableArray array];
//    }
    
//    id __strong obj = [[NSObject alloc] init];
//
//    {
//        id __weak obj = [[NSObject alloc] init];
//    }
//    @autoreleasepool {
//        id obj = [[NSObject alloc] init];
//
//        {
//            id __weak o = obj;
//    //        id __strong tmp = o;
//            id __autoreleasing tmp = o;
//            NSLog(@"%@", o);
//            NSLog(@"%@", o);
//            NSLog(@"%@", o);
////            NSLog(@"%@", o);
////            NSLog(@"%@", o);
//            _objc_autoreleasePoolPrint();
//        }
//    }
    
//    @autoreleasepool {
//        id __autoreleasing obj = [[NSObject alloc] init];
//    }
}
