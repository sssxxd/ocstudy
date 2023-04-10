//
//  UserMainSettingViewController.m
//  Find
//
//  Created by 孙旭东 on 2023/3/27.
//

#import "UserMainSettingViewController.h"

NSString *const TuiChuDengLu = @"TuiChuDengLu";

@interface UserMainSettingViewController ()

@end

@implementation UserMainSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton* tuiChuDengLuButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    tuiChuDengLuButton.frame = CGRectMake(100, 100, 100, 100);
    
    [tuiChuDengLuButton setTitle:@"退出登陆" forState:UIControlStateNormal];
    [tuiChuDengLuButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [tuiChuDengLuButton addTarget:self action:@selector(pressTuiChuDenglu) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:tuiChuDengLuButton];
    
    
}

- (void) pressTuiChuDenglu {
    [[NSNotificationCenter defaultCenter] postNotificationName:TuiChuDengLu object:nil];
    [self.navigationController popViewControllerAnimated:YES];
}



@end
