//
//  ViewController.m
//  UISlider&UIProgressView
//
//  Created by 孙旭东 on 2022/7/18.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize slider = _slier;
@synthesize pView = _progressView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // 进度条创建
    _progressView = [[UIProgressView alloc] init];

    // 进度条位置
    // 高度不可以变化
    _progressView.frame = CGRectMake(50, 200, 200, 40);

    // 设置进度条风格颜色值
    _progressView.progressTintColor = [UIColor redColor];

    _progressView.trackTintColor = [UIColor yellowColor];

    // 设置进度条进度值
    // 范围0～1
    _progressView.progress = 0.5;

    // 设置进度条风格特征
    _progressView.progressViewStyle = UIProgressViewStyleBar;

    [self.view addSubview:_progressView];
    
    // 创建滑动条对象
    _slider = [[UISlider alloc] init];
    
    _slider.frame = CGRectMake(60, 300, 300, 40);
    
    // 设置最大值
    _slider.maximumValue = 1;
    
    // 设置最小值(可以为负值)
    _slider.minimumValue = 0;
    
    // 设置滑块位置float值
    _slider.value = 0.5;
    
    // 左侧滑条背景颜色
    _slider.minimumTrackTintColor = [UIColor blueColor];
    
    // 右侧滑条背景颜色
    _slider.maximumTrackTintColor = [UIColor greenColor];
    
    // 设置滑块颜色
    _slider.thumbTintColor = [UIColor orangeColor];
    
    // 对滑动条添加事件函数
    [_slider addTarget:self action:@selector(pressSlider) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_slider];
    
}

- (void) pressSlider {
    _progressView.progress = _slider.value;
    NSLog(@"value = %f", _slider.value);
}

@end
