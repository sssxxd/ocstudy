//
//  main.m
//  Study Block 2
//
//  Created by 孙旭东 on 2023/3/15.
//

#import <Foundation/Foundation.h>
#import "MyClass.h"

//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//
//        int val = 0;
//
//        void (^blk)(void) = ^{val = 1;};
//    }
//    return 0;
//}

//int global_val = 1;
//static int static_global_avl = 2;
//
//int main (){
//    static int static_val = 3;
//
//    void (^blk)(void) = ^{
//        global_val *= 1;
//        static_global_avl *= 2;
//        static_val *= 3;
//    };
//
//    return 0;
//}

//int main(){
//    __block int val = 10;
//
//    void (^blk)(void) = ^{val = 1;};
//}

//int main(){
//    __block int val = 10;
//
//    void (^blk0)(void) = ^{val = 0;};
//
//    void (^blk1)(void) = ^{val = 1;};
//}

//void (^blk)(void) = ^{printf("Global Block\n");};
//
//int main(){
//    return 0;
//}

//typedef int (^blk_t)(int);
//
//blk_t func(int rate)
//{
//    return ^(int count){return rate * count;};
//}
//
//int main(){
//    blk_t blk_t1 = func(2);
//    NSLog(@"%d", blk_t1(2));
//    return 0;
//}



//typedef int (^blk)(void);
//
//int main(){
//    @autoreleasepool {
//        __block int val = 10;
//        int *intPtr = &val;  // 保存int的指针，检测block和val一样在栈上还是被设置到堆上
//        blk blk0 = ^(){printf("val_block = %d\n", ++val); return val;};
//        blk blk1 = [blk0 copy];
//        blk1();
//        printf("valPointer = %d\n", *intPtr);
//    }
//}

//id getBlockArray(void) {
//    int val = 10;
//
//    return [[NSArray alloc] initWithObjects:
//            ^{NSLog(@"blk0:%d", val);},
//            ^{NSLog(@"blk1:%d", val + 1);}, nil];
//}
//
//int main(){
//    @autoreleasepool {
//        id obj = getBlockArray();
//
//        typedef void (^blk_t)(void);
//
//        blk_t blk = (blk_t)[obj objectAtIndex:0];
//
//        blk();
//    }
//}

//int main(){
//    @autoreleasepool {
//        MyClass *myClass = [[MyClass alloc] init];
//
//        [myClass exampleMethod];
//
//        NSLog(@"myClassMyStringPointer = %p  %@", myClass.myString, myClass.myString);
//    }
//}

// 设置两个全局变量，一个初始化，一个不初始化
//int num1 = 1;
//int num2;
//
//int main(){
//    @autoreleasepool {
//        NSLog(@"num1 pointer = %p", &num1);
//        NSLog(@"num2 pointer = %p", &num2);
//
//        // 初始化num2
//        num2 = 2;
//        NSLog(@"init num2 pointer = %p", &num2);
//
//        // 设置两个静态变量，一个初始化，一个不初始化
//        static int sNum1 = 1;
//        static int sNum2;
//
//        NSLog(@"sNum1 pointer = %p", &sNum1);
//        NSLog(@"sNum2 pointer = %p", &sNum2);
//
//        sNum2 = 2;
//        NSLog(@"init sNum2 pointer = %p", &sNum2);
//
//        const int cNum = 3;
//        NSLog(@"cNum pointer = %p", &cNum);
//    }
//}

//int main(){
//    @autoreleasepool {
//        NSString *str = [NSString stringWithFormat:@"gg"];
//        NSLog(@"%p-%@-%@", str, str, str.class);
//    }
//}

typedef void (^blk_t)(id obk);

int main(){
    @autoreleasepool {
        blk_t blk;
        {
            id array = [[NSMutableArray alloc] init];
            blk = ^(id obj) {
                [array addObject:obj];
                NSLog(@"array count = %ld", [array count]);
                };
        }
        blk([[NSObject alloc] init]);
        blk([[NSObject alloc] init]);
        blk([[NSObject alloc] init]);
    }
}
