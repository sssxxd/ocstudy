//
//  ViewController.m
//  UIViewController
//
//  Created by 孙旭东 on 2022/6/8.
//

#import "ViewController.h"
#import "ViewController02.h"

@interface ViewController ()

@end

@implementation ViewController

// 当屏幕被点击时，调用函数
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    ViewController02* vc =[[ViewController02 alloc] init];
    
    // 设置新视图控制器全屏显示
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    
    // 显示一个新的视图控制器到屏幕上
    // P1：新的视图控制器对象
    // P2：使用动画切换动画效果
    // P3：切换结束后功能调用，不需要传空
    [self presentViewController:vc animated:YES completion:nil];
}


// 当视图控制器第一次被加载显示视图时，调用此函数
// 布局初始化视图来使用，初始化资源使用
// 只会加载一次
- (void)viewDidLoad {
    // 调用父类的加载视图函数
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIView* view = [[UIView alloc] init];
//
//    view.frame = CGRectMake(100, 100, 100, 100);
//
//    view.backgroundColor = [UIColor orangeColor];
//
//    // 将一个视图添加到当前控制视图上
//    [self.view addSubview:view];
    
    self.view.backgroundColor = [UIColor redColor];
    
    NSLog(@"viewDidLoad 第一次加载");
}

// 当视图控制器的视图即将显示时，调用此函数
// 视图分为：1.显示前（不显示） 2.正在显示 3.已经被隐藏。
// 参数：表示是否动画切换显示
- (void) viewWillAppear:(BOOL)animated {
    NSLog(@"viewWillAppear 视图即将显示");
}

// 视图即将消失时，调用此函数
// 参数：表示是否动画切换显示
// 当前状态：视图显示在屏幕上
- (void) viewWillDisappear:(BOOL)animated {
    NSLog(@"viewWillDisappear 视图即将消失");
}

// 当视图已经显示到屏幕后的瞬间调用此函数
// 参数：表示是否动画切换显示
// 当前状态：已经显示到屏幕上
- (void) viewDidAppear:(BOOL)animated {
    NSLog(@"viewDidAppear");
}

// 当视图已经消失的瞬间调用此函数
// 参数：表示是否动画切换显示
// 当前状态：已经消失
- (void) viewDidDisappear:(BOOL)animated {
    NSLog(@"viewDidDisappear");
}

@end
