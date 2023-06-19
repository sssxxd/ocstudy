//
//  ViewController.m
//  NSDateAndView
//
//  Created by 孙旭东 on 2022/6/8.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// 属性和成员变量同步
@synthesize timerView = _timerView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    btn.frame = CGRectMake(140, 100, 100, 50);
    
    [btn setTitle:@"启动定时器" forState:UIControlStateNormal];
    
    btn.backgroundColor = [UIColor greenColor];
    
    [btn addTarget:self action:@selector(pressStart) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    UIButton* btnStop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    btnStop.frame = CGRectMake(140, 300, 100, 50);
    
    [btnStop setTitle:@"停止计时器" forState:UIControlStateNormal];
    
    btnStop.backgroundColor = [UIColor redColor];
    
    [btnStop addTarget:self action:@selector(pressStop) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnStop];
    
    UIView* view = [[UIView alloc] init];
    
    view.frame = CGRectMake(0, 0, 80, 80);
    
    view.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:view];
    
    // 设置view标签值
    // 通过父亲视图对象以及view标签值可以获得相应的视图对象
    view.tag = 101;
    
}

// 按下启动按钮调用
- (void) pressStart {
    // NStimer的类方法创建一个定时器并且启动这个定时器
    // P1：每隔多长时间调用计时器函数，以秒为单位
    // P2：调用定时器函数的对象（指针）
    // P3：定时器函数对象
    // P4：可以传入定时器函数一个参数，无参可以传nil
    // P5：定时器是否重复操作，YES为重复，NO只完成一次函数调用
    // 返回值为一个新建好的定时器对象
    if (_timerView == nil) {
        _timerView = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateTimer:) userInfo:@"小明" repeats:YES];
    }
}

// 定时器函数
// 可以将定时器本身作为参数传入
- (void) updateTimer:(NSTimer*) timer {
    NSLog(@"text!!! name = %@", timer.userInfo);
    
    // 最好Tag从100开始
    UIView* view = [self.view viewWithTag:101];
    
    view.frame = CGRectMake(view.frame.origin.x+1, view.frame.origin.y+1, view.frame.size.width, view.frame.size.height);
}

// 按下停止按钮调用
- (void) pressStop {
    if (_timerView != nil) {
        // 停止定时器
        [_timerView invalidate];
    }
}

@end
