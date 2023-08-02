//
//  ViewController.m
//  NSNotification
//
//  Created by 孙旭东 on 2023/7/27.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(test) name:@"NotificationName" object:nil];
    
    self.myView = [[MyViewController alloc] init];
    self.myView.delegate = self;
}

- (void)changUILabelText:(NSString *)string {
    NSLog(@"%@", string);
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    dispatch_queue_t queue = dispatch_queue_create("test.queue", DISPATCH_QUEUE_SERIAL);
//    dispatch_async(queue, ^{
//        NSLog(@"--currect thread:%@", [NSThread currentThread]);
//        NSLog(@"Begin post notification");
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"NotificationName" object:nil];
//        NSLog(@"End");
//    });
//}
//
//- (void)test {
//    NSLog(@"--current thread:%@", [NSThread currentThread]);
//    NSLog(@"Handle notification and sleep 3s");
//    sleep(3);
//}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"--currect thread:%@", [NSThread currentThread]);
//    NSLog(@"Begin post notification");
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"NotificationName" object:nil];
//    NSLog(@"End");
//}
//
//- (void)test {
//    dispatch_queue_t queue = dispatch_queue_create("test.queue", DISPATCH_QUEUE_SERIAL);
//    dispatch_async(queue, ^{
//        NSLog(@"--currect thread:%@", [NSThread currentThread]);
//        NSLog(@"Handle notification and sleep 3s");
//        sleep(3);
//        NSLog(@"Test End");
//    });
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"--current thread:%@", [NSThread currentThread]);
    NSLog(@"Begin post notification");
    NSNotification *notification = [NSNotification notificationWithName:@"NotificationName" object:nil];
    [[NSNotificationQueue defaultQueue] enqueueNotification:notification postingStyle:NSPostASAP];
    NSLog(@"End");
}

- (void)test {
    NSLog(@"--current thread:%@", [NSThread currentThread]);
    NSLog(@"Handle notification and sleep 3s");
    sleep(3);
    NSLog(@"Test End");
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Notification" object:nil];
}

@end
