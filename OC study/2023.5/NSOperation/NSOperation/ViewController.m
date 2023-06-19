//
//  ViewController.m
//  NSOperation
//
//  Created by 孙旭东 on 2023/5/11.
//

#import "ViewController.h"
#import "NSOperationTest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
//        /*code*/
//    }];
//
//    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
//        /*code*/
//    }];
//
//    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
//        /*code*/
//    }];
//
//    [op1 addExecutionBlock:^{
//        /*code*/
//    }];
//
//    [op2 addExecutionBlock:^{
//        /*code*/
//    }];
//
//    [op3 addExecutionBlock:^{
//        /*code*/
//    }];
//
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//
//    [queue addOperation:op1]; // 内部已经调用了[op1 start];
//    [queue addOperation:op2];
//    [queue addOperation:op3];
    
//    NSOperationTest* test = [[NSOperationTest alloc] init];
//    NSLog(@"%d", test.finished);
//    [test start];
//    NSLog(@"%d", test.finished);
    
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//
//    NSBlockOperation *firstOperation = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"firstOperation");
//    }];
//    NSBlockOperation *secondOperation = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"secondOperation");
//    }];
//    NSBlockOperation *thirdOperation = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"thirdOperation");
//    }];
//
//    [queue addOperation:firstOperation];
//    [queue addOperation:secondOperation];
//    [queue addOperation:thirdOperation];
    
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//
//    NSBlockOperation *firstOperation = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"firstOperation");
//    }];
//    NSBlockOperation *secondOperation = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"secondOperation");
//    }];
//    NSBlockOperation *thirdOperation = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"thirdOperation");
//    }];
//
//    [secondOperation addDependency:firstOperation]; // 让secondOperation依赖于firstOperation，即firstOperation先执行，在执行secondOperation
//    [thirdOperation addDependency:secondOperation]; // 让thirdOperation依赖于secondOperation，即secondOperation先执行，在执行thirdOperation
//
//    [queue addOperation:firstOperation];
//    [queue addOperation:secondOperation];
//    [queue addOperation:thirdOperation];

//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//
//    NSBlockOperation *firstOperation = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"firstOperation");
//    }];
//    NSBlockOperation *secondOperation = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"secondOperation");
//    }];
//    NSBlockOperation *thirdOperation = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"thirdOperation");
//    }];
//
//    [secondOperation addDependency:firstOperation]; // 让secondOperation依赖于firstOperation，即firstOperation先执行，在执行secondOperation
//    [firstOperation addDependency:secondOperation]; // 让firstOperation依赖于secondOperation，即secondOperation先执行，在执行firstOperation
//
//    [queue addOperation:firstOperation];
//    [queue addOperation:secondOperation];
//    [queue addOperation:thirdOperation];



//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//
//        NSBlockOperation *firstOperation = [NSBlockOperation blockOperationWithBlock:^{
//            NSLog(@"begin firstOperation");
//            [NSThread sleepForTimeInterval:2];
//            NSLog(@"firstOperation end");
//        }];
//        firstOperation.queuePriority = NSOperationQueuePriorityLow;
//
//        NSBlockOperation *secondOperation = [NSBlockOperation blockOperationWithBlock:^{
//            NSLog(@"begin secondOperation");
//            [NSThread sleepForTimeInterval:2];
//            NSLog(@"secondOperation end");
//        }];
//        secondOperation.queuePriority = NSOperationQueuePriorityHigh;
//
//        NSBlockOperation *thirdOperation = [NSBlockOperation blockOperationWithBlock:^{
//            NSLog(@"begin thirdOperation");
//            [NSThread sleepForTimeInterval:2];
//            NSLog(@"thirdOperation end");
//        }];
//        thirdOperation.queuePriority = NSOperationQueuePriorityNormal;
//
//        queue.maxConcurrentOperationCount = 3;
//
//
//        [queue addOperation:firstOperation];
//        [queue addOperation:secondOperation];
//        [queue addOperation:thirdOperation];

    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
        NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"执行任务1,%@",[NSThread currentThread]);
        }];
        NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"执行任务2,%@",[NSThread currentThread]);
        }];
        NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"执行任务3,%@",[NSThread currentThread]);
        }];
        // 设置服务质量
        op1.qualityOfService = NSQualityOfServiceBackground;
        op2.qualityOfService = NSQualityOfServiceUserInitiated;
        op3.qualityOfService = NSQualityOfServiceUtility;
        // 将操作加入队列
        [queue addOperations:[NSArray arrayWithObjects:op1, op2, op3, nil] waitUntilFinished:YES];



}


@end

