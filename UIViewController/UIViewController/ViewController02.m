//
//  ViewController02.m
//  UIViewController
//
//  Created by 孙旭东 on 2022/6/8.
//

#import "ViewController02.h"

@interface ViewController02 ()

@end

@implementation ViewController02

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 控制器二的颜色
    self.view.backgroundColor = [UIColor blueColor];
}

// 点击当前视图控制器二的界面屏幕时
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 使当前的控制器消失掉
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 当视图控制器的视图即将显示时，调用此函数
// 视图分为：1.显示前（不显示） 2.正在显示 3.已经被隐藏。
// 参数：表示是否动画切换显示
- (void) viewWillAppear:(BOOL)animated {
    NSLog(@"viewWillAppear02 视图即将显示");
}

// 视图即将消失时，调用此函数
// 参数：表示是否动画切换显示
// 当前状态：视图显示在屏幕上
- (void) viewWillDisappear:(BOOL)animated {
    NSLog(@"viewWillDisappear02 视图即将消失");
}

// 当视图已经显示到屏幕后的瞬间调用此函数
// 参数：表示是否动画切换显示
// 当前状态：已经显示到屏幕上
- (void) viewDidAppear:(BOOL)animated {
    NSLog(@"viewDidAppear02");
}

// 当视图已经消失的瞬间调用此函数
// 参数：表示是否动画切换显示
// 当前状态：已经消失
- (void) viewDidDisappear:(BOOL)animated {
    NSLog(@"viewDidDisappear02");
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
