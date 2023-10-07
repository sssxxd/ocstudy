//
//  ViewController.m
//  Lock
//
//  Created by 孙旭东 on 2023/8/2.
//

#import "ViewController.h"
#import <libkern/OSAtomic.h>
#import <os/lock.h>
#import <pthread.h>

@interface ViewController ()
////@property (nonatomic, assign) OSSpinLock spinLock;
//@property (nonatomic, assign) os_unfair_lock_t unfairLock;
@property (nonatomic, strong) NSCondition *condition;
@property (nonatomic, strong) NSConditionLock *conditionLock;

@end

// 记录共出售多少票的全局变量
int cnt = 0;

os_unfair_lock unfairLock;

pthread_mutex_t _lock;

NSLock *lock;

NSRecursiveLock *recursiveLock;

NSRecursiveLock *reclock;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
//    [self startSell];
//    recursiveLock = [[NSRecursiveLock alloc] init];
//    [self recursiveDeadlocksWithValue:3];
//    [self startSell];
//    self.conditionLock = [[NSConditionLock alloc] init];
//    [self conditionLockTest];
    NSObject *obj = [[NSObject alloc] init];
    @synchronized (obj) {
    }
}

//- (void)conditionLockTest {
//    for (int i = 0; i < 5; ++i) {
//        //调用测试函数
//        [self test];
//        //修改Condition参数值为3
//        [self.conditionLock lockWhenCondition:0];
//        [self.conditionLock unlockWithCondition:3];
//    }
//    return;
//}
//
////测试函数
//- (void)test {
//    self.conditionLock = [[NSConditionLock alloc] initWithCondition:3];
//    dispatch_queue_t globalQ = dispatch_get_global_queue(0, 0);
//    dispatch_async(globalQ, ^{
//        [self.conditionLock lockWhenCondition:3];
//        NSLog(@"任务1");
//        [self.conditionLock unlockWithCondition:2];
//    });
//
//    dispatch_async(globalQ, ^{
//        [self.conditionLock lockWhenCondition:2];
//        NSLog(@"任务2");
//        [self.conditionLock unlockWithCondition:1];
//    });
//
//    dispatch_async(globalQ, ^{
//        [self.conditionLock lockWhenCondition:1];
//        NSLog(@"任务3");
//        [self.conditionLock unlockWithCondition:0];
//    });
//}
//
//
//
//- (void)startSell {
//    // 一共有50张票
//    self.ticketSurplusCount = 50;
//
//    __weak typeof (self) weakSelf = self;
////    self.spinLock = OS_SPINLOCK_INIT;
////    unfairLock = OS_UNFAIR_LOCK_INIT;
////    pthread_mutex_init(&_lock, NULL);
//
////    lock = [[NSLock alloc] init];
//    self.condition = [[NSCondition alloc] init];
//    recursiveLock = [[NSRecursiveLock alloc] init];
//
//    // 一号售卖口
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [weakSelf saleTicketSafeWithConditionLock];
//    });
//
//    // 二号售卖口
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [weakSelf saleTicketSafeWithConditionLock];
//    });
//
////    for (int i = 0; i < 10; ++i) {
////            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
////                [weakSelf saleTicketRecursiveLock];
////            });
////        }
//}
//
////递归锁死锁的例子
//
////- (void)recursiveDeadlocks {
////    NSRecursiveLock *recursiveLock = [[NSRecursiveLock alloc] init];
////    for (int i = 0; i < 10; i++) {
////        dispatch_async(dispatch_get_global_queue(0, 0), ^{
////            static void __weak (^block)(int);
////            NSLog(@"cdv");
////            block = ^(int value) {
////                [recursiveLock lock];
////                NSLog(@"value——%@ %@", block, [NSThread currentThread]);
////                if (value > 0) {
//////                    NSLog(@"value——%d %@", value, [NSThread currentThread]);
////                    block(value - 1);
////                }
////                [recursiveLock unlock];
//////                NSLog(@"unlock—— %@", [NSThread currentThread]);
////            };
////            block(10);
////        });
////    }
////}
//
//
//
////- (void)recursiveDeadlocks {
////    NSRecursiveLock *recursiveLock = [[NSRecursiveLock alloc] init];
////    NSString *string = @"xcsdrejfdoinveofivjnm";
////    for (int i = 0; i < 10; i++) {
////        dispatch_async(dispatch_get_global_queue(0, 0), ^{
////            static void __weak (^block)(int);
////
////            block = ^(int value) {
////                NSLog(@"%@, %@", [NSThread currentThread], string);
//////                usleep(2000000);
////                if (value > 0) {
//////                    NSLog(@"%@, %d", string, value);
////                    block(value - 1);
////                }
////                usleep(2000000);
////                NSLog(@"%@, %d, %@", string, value, block);
////                usleep(2000000);
////            };
////            block(10);
////        });
////    }
////}
//
//- (void) recursiveDeadlocksWithValue:(int)value {
//    [recursiveLock lock];
//    NSLog(@"%d---%@", value, [NSThread currentThread]);
//    dispatch_group_t group = dispatch_group_create();
//    dispatch_group_enter(group);
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        if (value > 0) {
//            [self recursiveDeadlocksWithValue:value - 1];
//        }
//        dispatch_group_leave(group);
//    });
//    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
//    [recursiveLock unlock];
//}
//
//
//
//- (void)demo:(int)value{
//    [reclock lock];
//    NSLog(@"lock---%@", [NSThread currentThread]);
//    if (value > 0) {
//        NSLog(@"value---%d %@", value, [NSThread currentThread]);
//        [self demo:value - 1];
//    }
//    NSLog(@"unlock--%@", [NSThread currentThread]);
//    [reclock unlock];
//}
//
////售票的方法
//- (void)saleTicketSafeWithConditionLock {
//    while (1) {
//        // 加锁
//        [_condition lock];
//        if (self.ticketSurplusCount > 0) {  // 如果还有票，继续售卖
//            self.ticketSurplusCount--;
//            cnt++;
//            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%ld 窗口：%@", self.ticketSurplusCount, [NSThread currentThread]]);
//            [NSThread sleepForTimeInterval:0.2];
//        } else { // 如果已卖完，关闭售票窗口
//            NSLog(@"所有火车票均已售完,共售出%d张票", cnt);
//            // 解锁
//            [_condition unlock];
//            break;
//        }
//        // 解锁
//        [_condition unlock];
//    }
//}
//
//
//
////卖票的函数
//- (void)saleTicketRecursiveLock {
//    //加锁
//    [recursiveLock lock];
//    if (self.ticketSurplusCount > 0) {  // 如果还有票，继续售卖
//        self.ticketSurplusCount--;
//        cnt++;
//        NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%ld 窗口：%@", self.ticketSurplusCount, [NSThread currentThread]]);
//        [NSThread sleepForTimeInterval:0.2];
//        //递归调用卖票函数
//        [self saleTicketRecursiveLock];
//    } else { // 如果已卖完，关闭售票窗口
//        NSLog(@"所有火车票均已售完,共售出%d张票", cnt);
//    }
//    //解锁
//    [recursiveLock unlock];
//}
//
//
//- (void)saleTickWithNSLock {
//    while(1) {
//        // 加锁
//        [lock lock];
//        if (self.ticketSurplusCount > 0) {  // 如果还有票，继续售卖
//            self.ticketSurplusCount--;
//            cnt++;
//            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%ld 窗口：%@", self.ticketSurplusCount, [NSThread currentThread]]);
//            [NSThread sleepForTimeInterval:0.2];
//        } else { // 如果已卖完，关闭售票窗口
//            NSLog(@"所有火车票均已售完,共售出%d张票", cnt);
//            // 解锁
//            break;
//        }
//        // 解锁
//    }
//}
//
//- (void)saleTickWithPthreadMutex{
//    while (1) {
//            // 加锁
//            pthread_mutex_lock(&_lock);
//            if (self.ticketSurplusCount > 0) {  // 如果还有票，继续售卖
//                self.ticketSurplusCount--;
//                cnt++;
//                NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%ld 窗口：%@", self.ticketSurplusCount, [NSThread currentThread]]);
//                [NSThread sleepForTimeInterval:0.2];
//            } else { // 如果已卖完，关闭售票窗口
//                NSLog(@"所有火车票均已售完,共售出%d张票", cnt);
//                // 解锁
//                pthread_mutex_unlock(&_lock);
//                // 释放锁
//                pthread_mutex_destroy(&_lock);
//                break;
//            }
//            // 解锁
//            pthread_mutex_unlock(&_lock);
//        }
//}
//
//- (void)saleTickWithOsUnfairLock {
//    while(1) {
//        // 加锁
//        os_unfair_lock_lock(&unfairLock);
//        if (self.ticketSurplusCount > 0) {
//            self.ticketSurplusCount--;
//            cnt++;
//            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%ld 窗口：%@", self.ticketSurplusCount, [NSThread currentThread]]);
//            [NSThread sleepForTimeInterval:0.2];
//        } else {
//            NSLog(@"所有火车票均已售完，共售出%d张票", cnt);
//
//            // 解锁
//            os_unfair_lock_unlock(&unfairLock);
//            break;
//        }
//        // 解锁
//        os_unfair_lock_unlock(&unfairLock);
//    }
//}
//
////- (void)saleTick {
////
////    while(1) {
////        // 加锁
////        OSSpinLockLock(&_spinLock);
////        if (self.ticketSurplusCount > 0) {
////            self.ticketSurplusCount--;
////            cnt++;
////            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%ld 窗口：%@", self.ticketSurplusCount, [NSThread currentThread]]);
////            [NSThread sleepForTimeInterval:0.2];
////        } else {
////            NSLog(@"所有火车票均已售完，共售出%d张票", cnt);
////
////            // 解锁
////            OSSpinLockUnlock(&_spinLock);
////            break;
////        }
////        // 解锁
////        OSSpinLockUnlock(&_spinLock);
////    }
////}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
