//
//  ViewController.m
//  NSOperation
//
//  Created by 孙旭东 on 2023/5/11.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        /*code*/
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        /*code*/
    }];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        /*code*/
    }];
    
    [op1 addExecutionBlock:^{
        /*code*/
    }];
    
    [op2 addExecutionBlock:^{
        /*code*/
    }];
    
    [op3 addExecutionBlock:^{
        /*code*/
    }];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [queue addOperation:op1]; // 内部已经调用了[op1 start];
    [queue addOperation:op2];
    [queue addOperation:op3];
}


@end
