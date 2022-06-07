//
//  ViewController.m
//  UIButton
//
//  Created by 孙旭东 on 2022/6/6.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// 创建普通按钮函数
- (void) createUIRectButton {
    // 创建UIButton对象，根据类型创建btn
    // 圆角类型btn:UIButtonTypeRoundedRect
    // 通过类方法来创建buttonWithType: 类名+方法名
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    // 设置按钮位置
    btn.frame = CGRectMake(140, 100, 100, 40);
    
    // 设置按钮文字
    // @parameter
    // P1: 字符串类型，显示到按钮上的文字
    // P2: 设置文字显示的状态类型：UIControlStateNormalml，正常状态
    [btn setTitle:@"按钮01" forState:UIControlStateNormal];
    
    // P1: 字符串类型，显示到按钮上的文字
    // P2: 设置文字显示的状态类型：UIControlStateHighlighted，按下状态
    [btn setTitle:@"按钮按下" forState:UIControlStateHighlighted];
    
    // 设置按钮颜色
    btn.backgroundColor = [UIColor yellowColor];
    // 添加到视图中并显示
    [self.view addSubview:btn];
    
    // 设置按钮文字颜色
    // P1: 颜色
    // P2: 状态
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    // 设置按钮文字颜色
    // P1: 颜色
    // P2: 状态
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    
    // 设置按钮风格颜色
    // [btn setTintColor:[UIColor whiteColor]];
    
    // titleLabel:UILabel控件
    btn.titleLabel.font = [UIFont systemFontOfSize:18];
}

- (void) createImageBtn {
    // 创建一个自定义类型的btn
    UIButton* btnImage = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btnImage.frame = CGRectMake(140, 200, 100, 100);
    
    UIImage* icon01 = [UIImage imageNamed:@"btn01.jpeg"];
    
    UIImage* icon02 = [UIImage imageNamed:@"btn02.jpeg"];
    
    // 设置按钮图片方法设置
    // P1：显示图片对象
    // P2：控件状态
    [btnImage setImage:icon01 forState:UIControlStateNormal];
    
    [btnImage setImage:icon02 forState:UIControlStateHighlighted];
    
    [self.view addSubview:btnImage];
}

- (void) createBtn {
    // 创建圆角按钮
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    btn.frame = CGRectMake(140, 100, 100, 40);
    
    [btn setTitle:@"按钮01" forState:UIControlStateNormal];
    
    // 向按钮添加事件函数
    // P1：谁来实现事件函数，实现者对象就是“谁”
    // P2：函数对象，当按钮满足P3事件类型时，调用该函数
    // P3：事件处理函数类型
    // UIControlEventTouchUpInside，按钮弹起时，手指在按钮范围内
    // UIControlEventTouchDown，当我们手指触碰到屏幕上时
    // [btn addTarget:self
    //         action:@selector(createXiaqiu)
  // forControlEvents:UIControlEventTouchUpInside];
    
    [btn addTarget:self
            action:@selector(pressBtn:)
  forControlEvents:UIControlEventTouchUpInside];
    
    [btn addTarget:self
            action:@selector(touchDown)
  forControlEvents:UIControlEventTouchDown];
    
    UIButton* btn02 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [btn02 setTitle:@"按钮02" forState:UIControlStateNormal];
    
    btn02.frame = CGRectMake(140, 300, 100, 40);
    
    // 是可以多个按钮使用一个事件函数
    [btn02 addTarget:self
            action:@selector(pressBtn:)
  forControlEvents:UIControlEventTouchUpInside];
    
    // 设置按钮标记值
    btn.tag = 101;
    btn02.tag = 102;
    
    [self.view addSubview:btn02];
    [self.view addSubview:btn];
}

- (void) touchDown {
    NSLog(@"btn touchDown");
}

- (void) pressBtn:(UIButton*) btn {
    if (btn.tag == 101) {
        NSLog(@"btn01");
    } else if (btn.tag == 102) {
        NSLog(@"btn02");
    }
}

- (void) createXiaqiu {
    UIButton* btnImage = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btnImage.frame = CGRectMake(100, 400, 200, 200);
    
    UIImage* icon = [UIImage imageNamed:@"Xiaqiu.jpg"];
    
    [btnImage setImage:icon forState:UIControlStateNormal];
    
    [self.view addSubview:btnImage];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // [self createUIRectButton];
    
    // [self createImageBtn];
    
    [self createBtn];
}


@end
