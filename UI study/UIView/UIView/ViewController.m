//
//  ViewController.m
//  UIView
//
//  Created by 孙旭东 on 2022/6/7.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//
//    // 创建一个UIView对象
//    // UIView是iOS中的视图对象
//    // 显示在屏幕上的所有对象的基础类
//    // 所有显示在屏幕上的对象一定都继承与UIView
//    // 屏幕上能看到的对象都是UIView的子类
//    // UIView是一个矩形对象，有背景颜色，可以显示在屏幕上，有层级关系
//    UIView* view = [[UIView alloc] init];
//
//    // 设置UIView的位置
//    view.frame = CGRectMake(100, 100, 100, 200);
//
//    view.backgroundColor = [UIColor blueColor];
//
//    // 将新建的视图添加都父亲视图上
//    // 将新建的视图显示在屏幕上
//    // 将视图作为父亲视图的子视图管理起来
//    [self.view addSubview:view];
//
//    // 是否隐藏视图
//    // YES：不显示
//    // NO：显示，默认值为NO
//    view.hidden = NO;
//
//    // 设置视图透明度
//    // alpha = 0, 透明
//    // alpha = 1, 不透明
//    // alpha = 0.5, 半透明
//     view.alpha = 0.5;
//
//    // 是否显示不透明
//    view.opaque = YES;
//
//    self.view.backgroundColor = [UIColor redColor];
//
//    // 将自己从父亲视图删除掉
//    // 将父亲管理视图删除
//    // 不会显示在屏幕上
//    [view removeFromSuperview];
//}

- (void) viewDidLoad {
    [super viewDidLoad];
    
    // 创建三个视图对象
    UIView* view01 = [[UIView alloc] init];
    
    view01.frame = CGRectMake(100, 100, 150, 150);
    
    view01.backgroundColor = [UIColor blackColor];
    
    UIView* view02 = [[UIView alloc] init];
    
    view02.frame = CGRectMake(125, 125, 150, 150);
    
    view02.backgroundColor = [UIColor blueColor];
    
    UIView* view03 = [[UIView alloc] init];
    
    view03.frame = CGRectMake(150, 150, 150, 150);
    
    view03.backgroundColor = [UIColor yellowColor];
    
    // 将三个视图对象显示到屏幕
    // 并且添加到父视图上
    // 哪一个视图被先添加到父视图中，就先绘制哪个视图
    [self.view addSubview:view01];
    
    [self.view addSubview:view02];
    
    [self.view addSubview:view03];
    
    // 将一个视图调整到最前面显示
    // 参数：UIView对象，调整哪一个视图到最前方
    [self.view bringSubviewToFront:view03];
    
    // 将一个视图调整到最后面显示
    // 参数：UIView对象，调整哪一个视图到最后方
    [self.view sendSubviewToBack:view03];
    
    // subviews管理所有self.view的子视图的数组
    UIView* viewFront = self.view.subviews[2];
    
    UIView* viewBack = self.view.subviews[1];
    
    if (viewBack == view01) {
        NSLog(@"相等");
    }
}

@end
