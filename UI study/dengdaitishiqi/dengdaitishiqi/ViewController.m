//
//  ViewController.m
//  dengdaitishiqi
//
//  Created by 孙旭东 on 2022/7/18.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize  alertController = _alertController;
@synthesize  activityIndicator = _activityIndicator;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    for (int i = 0; i < 2; i++) {
        UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        button.frame = CGRectMake(100, 100 + 100 * i, 100, 40);
        
        if (i == 0) {
            [button setTitle:@"警告对话框" forState:UIControlStateNormal];
        } else if (i == 1) {
            [button setTitle:@"等待指示器" forState:UIControlStateNormal];
        }
        
        button.tag = 101 + i;
        
        [button addTarget:self
                   action:@selector(pressButton:)
         forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
    }
}

- (void) pressButton:(UIButton*) button {
    if (button.tag == 101) {
        // 警告对话框
        _alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"请检查网络" preferredStyle:UIAlertControllerStyleAlert];
        
        [_alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];

        [_alertController addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            NSLog(@"点击了确认按钮");
        }]];
        
        [self presentViewController:_alertController animated:YES completion:nil];
        
    } else if (button.tag == 102) {
        // 等待指示器（宽高不可变）
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(100, 300, 80, 90)];
        
        // 设定提示风格
        _activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleLarge;
        
        [self.view addSubview:_activityIndicator];
        
        // 启动动画并行显示
        [_activityIndicator startAnimating];
        
        // 停止动画并隐藏
        // [_activityIndicator stopAnimating];
        
        
    }
}

@end
