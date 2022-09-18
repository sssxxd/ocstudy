//
//  ViewController.m
//  UISwitch
//
//  Created by 孙旭东 on 2022/6/11.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// 同步属性和成员变量
@synthesize mySwitch = _mySwitch;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 创建一个开关对象
    // 继承与UIView对象
    _mySwitch = [[UISwitch alloc] init];
    
    // 苹果官方的控件控制函数
    // 位置x，y的值可以改变
    // 宽度和高度无法改变
    _mySwitch.frame = CGRectMake(100, 100, 100, 100);
    
    // 开关状态设置属性
    _mySwitch.on = YES;
    
    // 也可以使用set函数
    [_mySwitch setOn:YES];
    
    // 设置开关状态
    // P1：状态
    // P2：是否开启动画
    [_mySwitch setOn:YES animated:YES];
    
    [self.view addSubview:_mySwitch];
    
    // 设置开启状态的风格颜色
    [_mySwitch setOnTintColor:[UIColor redColor]];

    // 设置开关圆钮颜色
    [_mySwitch setThumbTintColor:[UIColor greenColor]];
    
    // 设置开关风格颜色
    [_mySwitch setTintColor:[UIColor purpleColor]];
    
    // 向开关控件添加事件函数
    // P1：函数实现对象
    // P2：函数对象
    // P3：事件响应时的事件类型，UIControlEventValueChanged开关状态发生改变
    [_mySwitch addTarget:self action:@selector(swChange:) forControlEvents:UIControlEventValueChanged];
}

// 参数传入开关对象本身
- (void) swChange:(UISwitch*) sW {
    if(sW.on == YES) {
        NSLog(@"开关被打开");
    } else {
        NSLog(@"开关被关闭");
    }
}

@end
