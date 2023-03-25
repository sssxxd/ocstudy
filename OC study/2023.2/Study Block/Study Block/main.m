//
//  main.m
//  Study Block
//
//  Created by 孙旭东 on 2023/2/3.
//

#import <Foundation/Foundation.h>
#import "EGClass.h"
#import "EOCClass.h"

// eg1:
//void add(void) {
//    int (^addBlock)(int  a, int b) = ^(int a, int b) {
//        return a + b;
//    };
//
//    int add = addBlock(2, 3);
//    NSLog(@"%d", add);
//}

//eg2:
//void add(void) {
//    int additional = 5;
//    int (^addBlock)(int a, int b) = ^(int a, int b) {
//        return a + b + additional;
//    };
//
//    int add = addBlock(2, 5);
//    NSLog(@"%d", add);
//}

//eg3:
//void add(void) {
//    __block int additional = 5;
//
//    NSLog(@"%p", &additional);
//    int (^addBlock)(int a, int b) = ^(int a, int b) {
//        additional++;
//        NSLog(@"%p", &additional);
//        return a + b + additional;
//    };
//
//    int add = addBlock(2, 5);
//    NSLog(@"%d %d", add, additional); // 13, 6
//}



//eg4:
//void eg4(void) {
//    NSArray* array = @[@0, @1, @2, @3, @4, @5];
//    __block NSInteger count = 0;
//    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSNumber* number = (NSNumber*)obj;
//        if ([number compare:@2] == NSOrderedAscending) {
//            count++;
//        }
//    }];
//    NSLog(@"%ld", count);
//}

// eg5:
//void eg5(void) {
//    int a = 2;
//    NSLog(@"%p", &a);
//    void (^eg)(void) = ^() {
//        NSLog(@"%p", &a);
//    };
//    eg();
//}

//void (^block)() = &{
//    NSLog(@"This is a block");
//};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        void (^blk)(void) = ^{printf("Block");};
        
        blk();
        
        return 0;
    }
    return 0;
}
