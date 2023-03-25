//
//  LoginWithVerCodeViewController.m
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/7.
//

#import "LoginWithVerCodeViewController.h"

// 网络模块
#import "Manage.h"

@interface LoginWithVerCodeViewController ()

@end

@implementation LoginWithVerCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initLoginWithVerCodeView];
    
    [self creatBackButton];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma - 初始化视图

- (void) initLoginWithVerCodeView {
    self.loginWithVerCodeView = [[LoginWithVerCodeView alloc] initWithFrame:self.view.bounds];
    
    [self.loginWithVerCodeView.LoginButton addTarget:self action:@selector(pressLoginButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.loginWithVerCodeView.VerCodeButton addTarget:self action:@selector(pressVerCodeButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.loginWithVerCodeView];
}

- (void) creatBackButton {
    UIBarButtonItem* backItem  = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"31fanhui1-2.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressBackButton)];
    
    backItem.tintColor = [UIColor blackColor];
    
    self.navigationItem.leftBarButtonItem = backItem;
}

#pragma - 按钮事件

// 返回
- (void) pressBackButton {
    [self.navigationController popViewControllerAnimated:YES];
}

// 请求验证码
- (void) pressVerCodeButton {
    [[Manage shareManage] postEmail:self.loginWithVerCodeView.AccountTextField.text getVerificationCodeWithEnrollModelBlock:^(EnrollModel * _Nonnull enrollModel) {
        
        if (enrollModel.data == nil) {
            UIAlertController* alertController = [UIAlertController alertControllerWithTitle:enrollModel.msg message:nil preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
            
            [alertController addAction:action];
            
            [self presentViewController:alertController animated:YES completion:nil];
        } else {
            [self.loginWithVerCodeView.VerCodeButton setTitle:@"60 s后" forState:UIControlStateNormal];
            
            self.seconds = 60;
            
            self.loginWithVerCodeView.VerCodeButton.userInteractionEnabled = NO;
            
            [self.loginWithVerCodeView.VerCodeButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            
            [self createTimer];
        }
        
    } andErrorBlock:^(NSError * _Nonnull error) {
        NSLog(@"VerCode error");
    }];
    
}

// 登陆
- (void) pressLoginButton {
    [[Manage shareManage] postEmail:self.loginWithVerCodeView.AccountTextField.text VerCode:self.loginWithVerCodeView.VerCodeTextField.text getLoginModeBlock:^(LoginModel * _Nonnull loginModel) {
        
        if (loginModel.code == 200) {
            NSLog(@"%@", loginModel.data);
        } else {
            UIAlertController* alertController = [UIAlertController alertControllerWithTitle:loginModel.msg message:nil preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
            
            [alertController addAction:action];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
        
    } andErrorBlock:^(NSError * _Nonnull error) {
        NSLog(@"login error");
    }];
}

#pragma - 验证码计时器
- (void) createTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(readSeconds) userInfo:nil repeats:YES];
}

- (void) readSeconds {
    if (self.seconds > 0) {
        self.seconds--;
        
        [self.loginWithVerCodeView.VerCodeButton setTitle:[NSString stringWithFormat:@"%ld s后", self.seconds] forState:UIControlStateNormal];
    } else {
        [self.timer invalidate];
        
        self.loginWithVerCodeView.VerCodeButton.userInteractionEnabled = YES;
        
        [self.loginWithVerCodeView.VerCodeButton setTitle:@"重新发送" forState:UIControlStateNormal];
        
        [self.loginWithVerCodeView.VerCodeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
}


@end
