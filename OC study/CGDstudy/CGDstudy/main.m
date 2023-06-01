//
//  main.m
//  CGDstudy
//
//  Created by 孙旭东 on 2023/4/23.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        dispatch_queue_t queue = dispatch_queue_create("testQueue", DISPATCH_QUEUE_SERIAL);
//            dispatch_sync(queue, ^{
//                    // 追加任务 1
//                    [NSThread sleepForTimeInterval:1];              // 模拟耗时操作
//                    NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
//            });
//            dispatch_sync(queue, ^{
//                    // 追加任务 2
//                    [NSThread sleepForTimeInterval:3];              // 模拟耗时操作
//                    NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
//            });
//            dispatch_sync(queue, ^{
//                    // 追加任务 3
//                    [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
//                    NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
//            });
//            NSLog(@"syncSerial---end");
        
//        /**
//             * 串行队列 + 异步执行
//             * 特点：会开启新线程。执行完一个任务，再执行下一个任务。
//             */
//            dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_SERIAL);
//            dispatch_async(queue, ^{
//                    // 任务 1
//                    [NSThread sleepForTimeInterval:1];              // 模拟耗时操作
//                    NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
//            });
//            dispatch_async(queue, ^{
//                    // 任务 2
//                    [NSThread sleepForTimeInterval:3];              // 模拟耗时操作
//                    NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
//            });
//            dispatch_async(queue, ^{
//                    // 任务 3
//                    [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
//                    NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
//            });
//            NSLog(@"asyncSerial---end");
        
//        /**
//          * 并发队列 + 同步执行
//          * 特点：在当前线程中执行任务，不会开启新线程，执行完一个任务，再执行下一个任务。
//          */
//          dispatch_queue_t queue = dispatch_queue_create("testQueue", DISPATCH_QUEUE_CONCURRENT);
//          dispatch_sync(queue, ^{
//                 // 任务 1
//                 [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
//                 NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
//          });
//          dispatch_sync(queue, ^{
//                 // 任务 2
//                 [NSThread sleepForTimeInterval:3];              // 模拟耗时操作
//                 NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
//          });
//          dispatch_sync(queue, ^{
//                 // 任务 3
//                 [NSThread sleepForTimeInterval:1];              // 模拟耗时操作
//                 NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
//          });
//          NSLog(@"syncConcurrent---end");
//

        
        
//        /**
//          * 并发队列 + 异步执行
//          * 特点：可以开启多个线程，任务同时执行。
//          */
//         dispatch_queue_t queue = dispatch_queue_create("testQueue", DISPATCH_QUEUE_CONCURRENT);
//         dispatch_async(queue, ^{
//                 // 任务 1
//                 [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
//                 NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
//         });
//         dispatch_async(queue, ^{
//                 // 任务 2
//                 [NSThread sleepForTimeInterval:3];              // 模拟耗时操作
//                 NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
//         });
//         dispatch_async(queue, ^{
//                 // 任务 3
//                 [NSThread sleepForTimeInterval:1];              // 模拟耗时操作
//                 NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
//         });
//         NSLog(@"asyncConcurrent---end");
        
        while(1) {

        };
    }
    return 0;
}
