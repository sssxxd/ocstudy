//
//  ViewController.m
//  BujinqiAndFenlankongjian
//
//  Created by 孙旭东 on 2022/7/18.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize stepper = _stepper;
@synthesize segControl = _segControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 创建步进器对象
    _stepper = [[UIStepper alloc] init];
    
    
    
    // 设置位置(宽高不能改变)
    _stepper.frame = CGRectMake(100, 100, 100, 100);
    
    // 设置最小值
    _stepper.minimumValue = 0;
    
    // 设置最大值
    _stepper.maximumValue = 100;
    
    // 设置当前值，默认值0
    _stepper.value = 10;
    
    // 每次向前或向后的步伐
    _stepper.stepValue = 10;
    
    // 是否可以重复响应事件
    _stepper.autorepeat = YES;
    
    // 是否将步进结果通过事件函数响应出来
    _stepper.continuous = YES;
    
    [_stepper addTarget:self
                 action:@selector(stepChange)
       forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_stepper];
    
    // 分栏控件
    _segControl = [[UISegmentedControl alloc] init];
    
    // 设置空间位置（宽度可变，高度不可变）
    _segControl.frame = CGRectMake(10, 200, 300, 40);
    
    // 添加一个按钮元素
    [_segControl insertSegmentWithTitle:@"0元" atIndex:0 animated:YES];
    
    // p1:按钮元素
    // p2:按钮索引位置
    // p3:是否有动画效果
    [_segControl insertSegmentWithTitle:@"5元" atIndex:1 animated:YES];
    
    [_segControl insertSegmentWithTitle:@"10元" atIndex:2 animated:YES];
    
    // 当前默认按钮索引设置
    _segControl.selectedSegmentIndex = 0;
    
    [_segControl addTarget:self
                    action:@selector(segControlChange)
          forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_segControl];
}

- (void) stepChange {
    NSLog(@"step press!");
}

- (void) segControlChange {
    NSLog(@"%ld", _segControl.selectedSegmentIndex);
}

@end
