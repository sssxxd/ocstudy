//
//  EnrollViewController.m
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/6.
//

#import "EnrollViewController.h"
#import "Manage.h"

@interface EnrollViewController ()

@end

@implementation EnrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initEnrollView];
    
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

- (void) initEnrollView {
    self.enrollView = [[EnrollView alloc] initWithFrame:self.view.bounds];
    
    self.enrollView.backgroundColor = [UIColor greenColor];
    
    [self.enrollView.EnrollButton addTarget:self action:@selector(pressEnrollButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.enrollView.VerificationCodeButton addTarget:self action:@selector(pressVerificationCodeButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.enrollView];
}

- (void) creatBackButton {
    UIBarButtonItem* backItem  = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"31fanhui1-2.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressBackButton)];
    
    backItem.tintColor = [UIColor blackColor];
    
    self.navigationItem.leftBarButtonItem = backItem;
}

#pragma - 按钮事件

- (void) pressEnrollButton {
    if (self.enrollView.PasswordTextField.text && self.enrollView.RePasswordTextField.text) {
        if ([self.enrollView.PasswordTextField.text isEqualToString:self.enrollView.RePasswordTextField.text]) {
            [[Manage shareManage] postEmail:self.enrollView.AccountTextField.text Password:self.enrollView.PasswordTextField.text VerificationCode:self.enrollView.VerificationCodeTextField.text getEnrollModelBlock:^(EnrollModel * _Nonnull enrollModel) {
                
                if (enrollModel.data) {
                    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:enrollModel.data message:nil preferredStyle:UIAlertControllerStyleAlert];
                    
                    UIAlertAction* action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
                    
                    [alertController addAction:action];
                    
                    [self presentViewController:alertController animated:YES completion:nil];
                } else {
                    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:enrollModel.msg message:nil preferredStyle:UIAlertControllerStyleAlert];
                    
                    UIAlertAction* action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
                    
                    [alertController addAction:action];
                    
                    [self presentViewController:alertController animated:YES completion:nil];
                }
                
            } andErrorBlock:^(NSError * _Nonnull error) {
                NSLog(@"enroll error");
            }];
        } else {
            UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"两次密码不一致" message:nil preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
            
            [alertController addAction:action];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
    }
}

- (void) pressVerificationCodeButton {
    [[Manage shareManage] postEmail:self.enrollView.AccountTextField.text getVerificationCodeWithEnrollModelBlock:^(EnrollModel * _Nonnull enrollModel) {
        
        if (enrollModel.data == nil) {
            UIAlertController* alertController = [UIAlertController alertControllerWithTitle:enrollModel.msg message:nil preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
            
            [alertController addAction:action];
            
            [self presentViewController:alertController animated:YES completion:nil];
        } else {
            [self.enrollView.VerificationCodeButton setTitle:@"60 s后" forState:UIControlStateNormal];
            
            self.seconds = 60;
            
            self.enrollView.VerificationCodeButton.userInteractionEnabled = NO;
            
            [self.enrollView.VerificationCodeButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            
            [self createTimer];
        }
        
    } andErrorBlock:^(NSError * _Nonnull error) {
        NSLog(@"VerificationCode error");
    }];
}

- (void) pressBackButton {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma - 验证码计时器及其事件
- (void) createTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(readSeconds) userInfo:nil repeats:YES];
}

- (void) readSeconds {
    if (self.seconds > 0) {
        self.seconds--;
        
        [self.enrollView.VerificationCodeButton setTitle:[NSString stringWithFormat:@"%ld s后", self.seconds] forState:UIControlStateNormal];
    } else {
        [self.timer invalidate];
        
        self.enrollView.VerificationCodeButton.userInteractionEnabled = YES;
        
        [self.enrollView.VerificationCodeButton setTitle:@"重新发送" forState:UIControlStateNormal];
        
        [self.enrollView.VerificationCodeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
}

@end
