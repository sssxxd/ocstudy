//
//  ViewController.m
//  MVCsample
//
//  Created by 孙旭东 on 2022/9/11.
//

#import "ViewController.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after blueing the view.
    
    // 加一个通知方法，当收到名为@"red"的通知后，就执行redOK方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(redOK:) name:@"red" object:nil];
    
    // 加一个通知方法，当收到名为@"blue"的通知后，就执行blueOK方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(blueOK:) name:@"blue" object:nil];
    
    // 初始化vView和mModel
    self.vView = [[VView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];

    [self.vView viewInit];
    
    // 为vView中的按钮添加target-action模式
    [self.vView.redButton addTarget:self action:@selector(redButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.vView.blueButton addTarget:self action:@selector(blueButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    self.mModel = [[MModel alloc] init];
    
    [self.view addSubview:self.vView];
}

- (void) redOK:(NSNotification*)notification {
    // 根据mModel的通知，改变vView
    self.vView.backgroundColor = [UIColor redColor];
}

- (void) blueOK:(NSNotification*)notificaton {
    // 根据mModel的通知，改变vView
    self.vView.backgroundColor = [UIColor blueColor];
}

- (void) redButtonPressed:(UIButton*)sender {
    // 调用mMdol的red方法
    [self.mModel red];
}

- (void) blueButtonPressed:(UIButton*)sender {
    // 调用mMdol的blue方法
    [self.mModel blue];
}




@end
