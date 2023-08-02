//
//  ViewController.m
//  GCD
//
//  Created by 孙旭东 on 2023/7/31.
//

#import "ViewController.h"

dispatch_semaphore_t semaphoreLock;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    /**
     * 异步执行 + 主队列
     * 特点：只在主线程中执行任务，执行完一个任务，再执行下一个任务
     */
//    [self barrier];
//    [self asyncBarrierAndOneSerial];
//    [self syncBarrierAndOneSerial];
//    [self syncBarrierAndOneConcurrent];
//    [self asyncBarrierAndSerials];
//    [self asyncBarrierAndConcurrents];
//    [self syncBarrierAndSerials];
//    [self syncBarrierAndConcurrents];
//    [self after];
//    [self apply];
//    [self group];
//    [self groupWait];
//    [self groupWithEnterAndLeave];
//    [self semaphoreSync];
//    [self ticketStatusNotSafe];
//    [self ticketStatusSafe];
    
    [self interviewThird];
}

//经典面试题
- (void)interviewThird {
    //全局队列
    dispatch_queue_t globQueue = dispatch_get_global_queue(0, 0);
    __block int a = 0;
    while (a < 100) {
//        NSLog(@"csa");
        dispatch_async(globQueue, ^{
//            NSLog(@"内部： %d  - %@",a,[NSThread currentThread]);
            printf("%d", a);
            a++;
        });
    };
    NSLog(@"外部打印_____ %d",a);
}

- (void)interviewFourth {
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    __block int a = 0;
    for (int i = 0; i < 100; i++) {
//        NSLog(@"cd");
        dispatch_async(globalQueue, ^{
            a++;
        });
    }
    NSLog(@"外部答应_____ %d",a);
}



/**
 * 异步执行 + 主队列
 * 特点：只在主线程中执行任务，执行完一个任务，再执行下一个任务
 */
- (void)asyncMain {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"asyncMain---begin");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    dispatch_async(queue, ^{
        // 追加任务 1
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
    });
    
    dispatch_async(queue, ^{
        // 追加任务 2
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
    });
    
    dispatch_async(queue, ^{
        // 追加任务 3
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
    });
    
    NSLog(@"asyncMain---end");
}

- (void) barrier {
    dispatch_queue_t queue = dispatch_queue_create("net.testQueue", DISPATCH_QUEUE_CONCURRENT);
        
        dispatch_async(queue, ^{
            // 追加任务 1
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        });
        dispatch_async(queue, ^{
            // 追加任务 2
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        });
        
        dispatch_barrier_async(queue, ^{
            // 追加任务 barrier
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"barrier---%@",[NSThread currentThread]);// 打印当前线程
        });
        
        dispatch_async(queue, ^{
            // 追加任务 3
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        });
        dispatch_async(queue, ^{
            // 追加任务 4
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"4---%@",[NSThread currentThread]);      // 打印当前线程
        });

}

- (void) asyncBarrierAndOneSerial {
    dispatch_queue_t queue = dispatch_queue_create("net.testQueue", DISPATCH_QUEUE_SERIAL);
        
        dispatch_async(queue, ^{
            // 追加任务 1
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        });
        dispatch_async(queue, ^{
            // 追加任务 2
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        });
        
        dispatch_barrier_async(queue, ^{
            // 追加任务 barrier
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"barrier---%@",[NSThread currentThread]);// 打印当前线程
        });
        
        dispatch_async(queue, ^{
            // 追加任务 3
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        });
        dispatch_async(queue, ^{
            // 追加任务 4
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"4---%@",[NSThread currentThread]);      // 打印当前线程
        });
}



- (void)syncBarrierAndOneSerial {
    dispatch_queue_t queue = dispatch_queue_create("net.testQueue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{
        // 追加任务1
        [NSThread sleepForTimeInterval:2];            // 模拟耗时操作
        NSLog(@"1--%@", [NSThread currentThread]);    // 打印当前线程
    });
    
    dispatch_async(queue, ^{
        // 追加任务2
        [NSThread sleepForTimeInterval:2];            // 模拟耗时操作
        NSLog(@"2--%@", [NSThread currentThread]);    // 打印当前线程
    });
    
    dispatch_barrier_sync(queue, ^{
        // 追加任务 barrier
        [NSThread sleepForTimeInterval:2];            // 模拟耗时操作
        NSLog(@"2--%@", [NSThread currentThread]);    // 打印当前线程
    });
    
    dispatch_async(queue, ^{
        // 追加任务3
        [NSThread sleepForTimeInterval:2];            // 模拟耗时操作
        NSLog(@"3--%@", [NSThread currentThread]);    // 打印当前线程
    });
    
    dispatch_async(queue, ^{
        // 追加任务4
        [NSThread sleepForTimeInterval:2];            // 模拟耗时操作
        NSLog(@"4--%@", [NSThread currentThread]);    // 打印当前线程
    });
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)syncBarrierAndOneConcurrent {
    dispatch_queue_t queue =  dispatch_queue_create("net.testQuquq", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        // 追加任务1
        [NSThread sleepForTimeInterval:2];             // 模拟耗时操作
        NSLog(@"1--%@", [NSThread currentThread]);     // 打印当前线程
    });
    dispatch_async(queue, ^{
        // 追加任务2
        [NSThread sleepForTimeInterval:2];             // 模拟耗时操作
        NSLog(@"2--%@", [NSThread currentThread]);     // 打印当前线程
    });
    
    dispatch_barrier_sync(queue, ^{
        // 追加barrier
        [NSThread sleepForTimeInterval:2];             // 模拟耗时操作
        NSLog(@"barrier--%@", [NSThread currentThread]);     // 打印当前线程
    });
    
    dispatch_async(queue, ^{
        // 追加任务3
        [NSThread sleepForTimeInterval:2];             // 模拟耗时操作
        NSLog(@"3--%@", [NSThread currentThread]);     // 打印当前线程
    });
    dispatch_async(queue, ^{
        // 追加任务4
        [NSThread sleepForTimeInterval:2];             // 模拟耗时操作
        NSLog(@"4--%@", [NSThread currentThread]);     // 打印当前线程
    });
}

- (void)asyncBarrierAndSerials {
    dispatch_queue_t queue1 = dispatch_queue_create("net.testQueue1", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue2 = dispatch_queue_create("net.testQueue2", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue3 = dispatch_queue_create("net.testQueue3", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue4 = dispatch_queue_create("net.testQueue4", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue5 = dispatch_queue_create("net.testQueue5", DISPATCH_QUEUE_SERIAL);

    dispatch_async(queue1, ^{
        // 追加任务1
        [NSThread sleepForTimeInterval:2];           // 模拟耗时操作
        NSLog(@"1---%@", [NSThread currentThread]);  // 打印当前线程
    });

    dispatch_async(queue2, ^{
        // 追加任务2
        [NSThread sleepForTimeInterval:2];           // 模拟耗时操作
        NSLog(@"2---%@", [NSThread currentThread]);  // 打印当前线程
    });

    dispatch_barrier_async(queue3, ^{
        // 追加任务 barrier
        [NSThread sleepForTimeInterval:2];           // 模拟耗时操作
        NSLog(@"barrier---%@", [NSThread currentThread]);  // 打印当前线程
    });
    
    dispatch_async(queue4, ^{
        // 追加任务4
        [NSThread sleepForTimeInterval:2];           // 模拟耗时操作
        NSLog(@"4---%@", [NSThread currentThread]);  // 打印当前线程
    });

    dispatch_async(queue5, ^{
        // 追加任务5
        [NSThread sleepForTimeInterval:2];           // 模拟耗时操作
        NSLog(@"5---%@", [NSThread currentThread]);  // 打印当前线程
    });
}

- (void) asyncBarrierAndConcurrents {
    dispatch_queue_t queueFirst = dispatch_queue_create("net.testQueueFirst", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queueSecond = dispatch_queue_create("net.testQueueSecond", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queueThird = dispatch_queue_create("net.testQueueThird", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queueFourth = dispatch_queue_create("net.testQueueFourth", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queueFifth = dispatch_queue_create("net.testQueueFifth", DISPATCH_QUEUE_CONCURRENT);
    
    
        dispatch_async(queueFirst, ^{
            // 追加任务 1
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        });
        dispatch_async(queueSecond, ^{
            // 追加任务 2
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        });
        
        dispatch_barrier_async(queueThird, ^{
            // 追加任务 barrier
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"barrier---%@",[NSThread currentThread]);// 打印当前线程
        });
        
        dispatch_async(queueFourth, ^{
            // 追加任务 3
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        });
        dispatch_async(queueFifth, ^{
            // 追加任务 4
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"4---%@",[NSThread currentThread]);      // 打印当前线程
        });
}

- (void) syncBarrierAndSerials {
    dispatch_queue_t queueFirst = dispatch_queue_create("net.testQueueFirst", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queueSecond = dispatch_queue_create("net.testQueueSecond", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queueThird = dispatch_queue_create("net.testQueueThird", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queueFourth = dispatch_queue_create("net.testQueueFourth", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queueFifth = dispatch_queue_create("net.testQueueFifth", DISPATCH_QUEUE_SERIAL);
    
    
        dispatch_async(queueFirst, ^{
            // 追加任务 1
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        });
        dispatch_async(queueSecond, ^{
            // 追加任务 2
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        });
        
        dispatch_barrier_sync(queueThird, ^{
            // 追加任务 barrier
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"barrier---%@",[NSThread currentThread]);// 打印当前线程
        });
        
        dispatch_async(queueFourth, ^{
            // 追加任务 3
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        });
        dispatch_async(queueFifth, ^{
            // 追加任务 4
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"4---%@",[NSThread currentThread]);      // 打印当前线程
        });
}

- (void) syncBarrierAndConcurrents {
    dispatch_queue_t queueFirst = dispatch_queue_create("net.testQueueFirst", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queueSecond = dispatch_queue_create("net.testQueueSecond", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queueThird = dispatch_queue_create("net.testQueueThird", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queueFourth = dispatch_queue_create("net.testQueueFourth", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queueFifth = dispatch_queue_create("net.testQueueFifth", DISPATCH_QUEUE_CONCURRENT);
    
    
        dispatch_async(queueFirst, ^{
            // 追加任务 1
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        });
        dispatch_async(queueSecond, ^{
            // 追加任务 2
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        });
        
        dispatch_barrier_sync(queueThird, ^{
            // 追加任务 barrier
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"barrier---%@",[NSThread currentThread]);// 打印当前线程
        });
        
        dispatch_async(queueFourth, ^{
            // 追加任务 3
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        });
        dispatch_async(queueFifth, ^{
            // 追加任务 4
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"4---%@",[NSThread currentThread]);      // 打印当前线程
        });
}

- (void)after {
    NSLog(@"currentThread---%@", [NSThread currentThread]);   // 打印当前线程
    NSLog(@"asyncMain---begin");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // NSEC_PER_SEC是一个宏定义，通常用于表示一秒钟所包含的纳秒数。
        // 2.0 秒后异步追加任务代码到主队列，并开始执行
        NSLog(@"after---%@", [NSThread currentThread]);     // 打印当前线程
        NSLog(@"asyncMain---willEnd");
    });
}

- (void)apply {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    NSLog(@"apply---begin");
    dispatch_apply(6, queue, ^(size_t iteration) {
        NSLog(@"%zd---%@", iteration, [NSThread currentThread]);
    });
    NSLog(@"apply---end");
}

- (void)group {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"blk0");
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"blk1");
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"blk2");
    });
    
    //dispatch_group_notify会等到group中的处理全部结束时再开始执行
     //在group中的处理全部结束时，将第三个参数（block）追加到第二个参数所对应的queue中
     dispatch_group_notify(group, dispatch_get_main_queue(), ^{
         NSLog(@"done");
     });
}

- (void)groupWait {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:3];
        NSLog(@"blk0");
    });
    
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:3];
        NSLog(@"blk1");
    });
    
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:3];
        NSLog(@"blk2");
    });
    
    dispatch_group_wait(group, (int64_t)10000.0 * NSEC_PER_SEC);
    NSLog(@"YES!!");
}

- (void)groupWithEnterAndLeave {
    // 首先 需要创建一个线程组
    dispatch_group_t group = dispatch_group_create();
    // 任务1
    dispatch_group_enter(group);
    void (^blockFirst)(int) = ^(int a){
        NSLog(@"任务%d完成！", a);
        dispatch_group_leave(group);
    };
    
    blockFirst(1);
    
    // 任务2
    dispatch_group_enter(group);
    void (^blockSecond)(int) = ^(int a){
        NSLog(@"任务%d完成！", a);
        dispatch_group_leave(group);
    };
    
    blockSecond(2);
    
    // 全部完成
    dispatch_group_notify(group, dispatch_get_main_queue(), ^(){
        NSLog(@"全部完成");
    });
}

- (void)semaphoreSync {
    NSLog(@"currentThread---%@", [NSThread currentThread]);      // 打印当前线程
    NSLog(@"semaphore---begin");
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    __block int number = 0;
    dispatch_async(queue, ^{
        // 追加任务 1
        [NSThread sleepForTimeInterval:2];      // 模拟耗时操作
        NSLog(@"1---%@", [NSThread currentThread]);     // 打印当前线程
        
        number = 100;
        dispatch_semaphore_signal(semaphore);
    });
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    NSLog(@"semaphore---end,number = %d", number);
}

- (void)ticketStatusNotSafe {
    NSLog(@"currentThread---%@", [NSThread currentThread]);    // 打印当前线程
    NSLog(@"semaphore---begin");
    
    self.ticketSurplusCount = 50;
    
    // queue1 代表北京火车票售卖窗口
    dispatch_queue_t queue1 = dispatch_queue_create("net.bujige.testQueue1", DISPATCH_QUEUE_SERIAL);
    // queue2 代表上海火车票售卖窗口
    dispatch_queue_t queue2 = dispatch_queue_create("net.bujige.testQueue2", DISPATCH_QUEUE_SERIAL);
    
    __weak typeof(self) weakSelf = self;
    dispatch_async(queue1, ^{
        [weakSelf saleTicketNotSafe];
    });
    
    dispatch_async(queue2, ^{
        [weakSelf saleTicketNotSafe];
    });
}

/**
 * 售卖火车票（非线程安全）
 */
- (void)saleTicketNotSafe {
    while(1) {
        if (self.ticketSurplusCount > 0) {   // 如果还有票，继续售卖
            self.ticketSurplusCount--;
            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%ld 窗口：%@", self.ticketSurplusCount, [NSThread currentThread]]);
            [NSThread sleepForTimeInterval:0.2];
        } else {  // 如果已卖完，关闭售票窗口
            NSLog(@"火车票均已售完");
            break;
        }
    }
}

- (void)ticketStatusSafe {
    NSLog(@"currentThread---%@", [NSThread currentThread]);    // 打印当前线程
    NSLog(@"semaphore---begin");
    
    semaphoreLock = dispatch_semaphore_create(1);
    
    self.ticketSurplusCount = 50;
    
    // queue1 代表北京火车票售卖窗口
    dispatch_queue_t queue1 = dispatch_queue_create("net.bujige.testQueue1", DISPATCH_QUEUE_SERIAL);
    // queue2 代表上海火车票售卖窗口
    dispatch_queue_t queue2 = dispatch_queue_create("net.bujige.testQueue2", DISPATCH_QUEUE_SERIAL);
    
    __weak typeof(self) weakSelf = self;
    dispatch_async(queue1, ^{
        [weakSelf saleTicketNotSafe];
    });
    
    dispatch_async(queue2, ^{
        [weakSelf saleTicketNotSafe];
    });
}

- (void)saleTicketSafe {
    while(1) {
        dispatch_semaphore_wait(semaphoreLock, DISPATCH_TIME_FOREVER);
        
        if (self.ticketSurplusCount > 0) {
            self.ticketSurplusCount--;
            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%ld 窗口：@", self.ticketSurplusCount, [NSThread currentThread]]);
            [NSThread sleepForTimeInterval:0.2];
        } else {
            NSLog(@"所有火车均已售完");
            
            dispatch_semaphore_signal(semaphoreLock);
        }
        
        dispatch_semaphore_signal(semaphoreLock);
        
    }
}

@end
   
