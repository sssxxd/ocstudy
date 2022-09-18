//
//  ViewController.m
//  Hello iOS
//
//  Created by 孙旭东 on 2022/6/6.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// 创建UI控件
- (void) createUI {
    // 创建一个UILabel对象
    // UILabel是可以显示在屏幕上，并且可以显示文字的一种UI视图
    UILabel* label = [[UILabel alloc] init];
    
    // 显示文字的赋值，字符串对象
    label.text = @"Hello iOS! My name is Sun Xudong.";
    
    // 设定label显示位置
    label.frame = CGRectMake(100, 100, 160, 120);
    
    // label背景颜色，clearColor表示背景色
    label.backgroundColor = [UIColor grayColor];
    
    // 屏幕背景色
    // self.view.backgroundColor = [UIColor grayColor];
    
    // 显示label到屏幕上
    [self.view addSubview:label];
    
    // 设置label文字大小，使用系统默认字体
    label.font = [UIFont systemFontOfSize:18];
    
    // 设置label文字颜色
    label.textColor = [UIColor redColor];
    
    // label高级属性
    
    // 设置label阴影属性
    label.shadowColor = [UIColor grayColor];
    
    //设置label引用偏移位置
    label.shadowOffset = CGSizeMake(5, 5);
    
    // 设置text文字在文本框居中对齐，默认为靠左侧对齐
    label.textAlignment = NSTextAlignmentLeft;
    
    // 设定label文字显示行数，默认值为1，只有一行来显示
    // 其他的大于0的行数，文字会尽量按我们的设定行数来显示
    // 如果这个值为0，iOS会对文字自动计算所需行数，按需要行数来显示文字
    label.numberOfLines = 0;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 调用创建UI控件
    [self createUI];
}


@end
