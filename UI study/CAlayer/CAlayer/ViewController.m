//
//  ViewController.m
//  CAlayer
//
//  Created by 孙旭东 on 2022/12/25.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self initView];
    [self initCALayer];
}


- (void) initView {
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor redColor];
    // layer边框宽度
    view.layer.borderWidth = 10;
    // layer边框颜色（这是CGColor）
    view.layer.borderColor = [UIColor blueColor].CGColor;
    // layer的圆角半径大小
    view.layer.cornerRadius = 20;
    // 设置阴影颜色(CGColor)
    view.layer.shadowColor = [UIColor grayColor].CGColor;
    // 设置阴影偏移量，正数在左，负数在右
    view.layer.shadowOffset = CGSizeMake(10, 10);
    // 设置阴影的显示程度
    view.layer.shadowOpacity = 0.3;
    // 剪切掉多余部分，但是如果设置了阴影，阴影也会被剪切。
//    view.layer.masksToBounds = YES;
    
    [self.view addSubview:view];
}

- (void) initCALayer {
    CALayer* layer = [CALayer layer];
    // 设置宽✖️高
    layer.bounds = CGRectMake(0, 0, 100, 100);
    // 设置位置
    layer.position = CGPointMake(100, 100);
    // 设置锚点
    layer.anchorPoint = CGPointMake(0, 0);
    
    
    
    [self.view.layer addSublayer:layer];
}


@end
