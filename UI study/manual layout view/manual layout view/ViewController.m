//
//  ViewController.m
//  manual layout view
//
//  Created by 孙旭东 on 2022/7/19.
//

#import "ViewController.h"
#import "superView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    superView* sView = [[superView alloc] init];
    
    sView.frame = CGRectMake(20, 20, 180, 280);
    
    [sView createSubViews];
    
    sView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:sView];
    
    UIButton* buttonBig = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    buttonBig.frame = CGRectMake(240, 480, 80, 40);
    
    [buttonBig setTitle:@"放大" forState:UIControlStateNormal];
    
    [buttonBig addTarget:self action:@selector(pressButtonB) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:buttonBig];
    
    UIButton* buttonSm = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    buttonSm.frame = CGRectMake(120, 480, 80, 40);
    
    [buttonSm setTitle:@"缩小" forState:UIControlStateNormal];
    
    [buttonSm addTarget:self action:@selector(pressButtonS) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:buttonSm];
    
    sView.tag = 101;
}

// 放大
- (void) pressButtonB {
    superView* sView = (superView*)[self.view viewWithTag:101];
    
    [UIView animateWithDuration:1 animations:^{
        sView.transform = CGAffineTransformMakeScale(1.2, 1.2);
    }];
}

// 缩小
- (void) pressButtonS {
    superView* sView = (superView*)[self.view viewWithTag:101];
    
    [UIView animateWithDuration:1 animations:^{
        sView.transform = CGAffineTransformIdentity;
    }];
}

@end
