//
//  EnrollViewController.m
//  StudentSystem
//
//  Created by 孙旭东 on 2022/8/5.
//

#import "EnrollViewController.h"

@interface EnrollViewController ()

@end

@implementation EnrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backImage.jpeg"]];
    _backImageView.frame = self.view.bounds;
    
    [self.view addSubview:_backImageView];
    
    [self createTextField];
    
    [self enrollButton];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma - 创建文本输入框

- (void) createTextField {
    _userAccont = [[UITextField alloc] initWithFrame:CGRectMake(45, 330, 300, 50)];
    _userPassword  = [[UITextField alloc] initWithFrame:CGRectMake(45, 410, 300, 50)];
    _userEmail = [[UITextField alloc] initWithFrame:CGRectMake(45, 250, 300, 50)];
    
    _userAccont.borderStyle = UITextBorderStyleRoundedRect;
    _userPassword.borderStyle = UITextBorderStyleRoundedRect;
    _userEmail.borderStyle = UITextBorderStyleRoundedRect;
    
    _userAccont.backgroundColor = [UIColor whiteColor];
    _userPassword.backgroundColor = [UIColor whiteColor];
    _userEmail.backgroundColor = [UIColor whiteColor];
    
    _userPassword.secureTextEntry = YES;
    
    _userAccont.keyboardType = UIKeyboardTypeDefault;
    _userPassword.keyboardType = UIKeyboardTypeDefault;
    _userEmail.keyboardType = UIKeyboardTypeDefault;
    
    _userAccont.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _userAccont.adjustsFontSizeToFitWidth = YES;
    _userEmail.adjustsFontSizeToFitWidth = YES;
    _userPassword.adjustsFontSizeToFitWidth = YES;
    
    [_userAccont setLeftView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhanghao.png"]]];
    [_userPassword setLeftView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"password.png"]]];
    [_userEmail setLeftView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"email-fill.png"]]];
    _userAccont.leftViewMode = UITextFieldViewModeAlways;
    _userPassword.leftViewMode = UITextFieldViewModeAlways;
    _userEmail.leftViewMode = UITextFieldViewModeAlways;
    
    _userAccont.delegate = self;
    _userPassword.delegate = self;
    _userEmail.delegate = self;
    
    [self.view addSubview:_userEmail];
    [self.view addSubview:_userAccont];
    [self.view addSubview:_userPassword];
}

- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_userEmail resignFirstResponder];
    [_userAccont resignFirstResponder];
    [_userPassword resignFirstResponder];
}

#pragma - 尝试enroll懒加载
- (UIButton*) enrollButton {
    if (!_enrollButton) {
        _enrollButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_enrollButton setTitle:@"确认注册" forState:UIControlStateNormal];
        [_enrollButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_enrollButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
        [_enrollButton addTarget:self action:@selector(pressEnrollButton) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_enrollButton];
        
        _enrollButton.frame = CGRectMake(150, 490, 100, 30);
    }
    return _enrollButton;
}

#pragma - block传值方法
- (void) sendUserAccontToLoginView:(UserAccontBlock)block {
    self.userAccontBlock = block;
}

- (void) sendUserPasswordToLoginView:(UserPasswordBlock)block {
    self.userPasswordBlock = block;
}

// 注册按钮方法实现
- (void) pressEnrollButton {
    // 获取用户注册信息
    NSString* enrollAccont = _userAccont.text;
    NSString* enrollPassword = _userPassword.text;
    NSString* enrollEmail = _userEmail.text;
    if (enrollEmail.length  && enrollAccont.length && enrollPassword.length ) {
        // 判断账号是否重复
        if ([_userEnrollAccont containsObject:enrollAccont]) {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"账号重复注册" preferredStyle:UIAlertControllerStyleAlert];
            
            [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil]];
            
            [self presentViewController:alert animated:YES completion:nil];
        } else {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"账号注册成功" preferredStyle:UIAlertControllerStyleAlert];
            
            [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {
                // 添加注册信息
                [self->_userEnrollAccont addObject:enrollAccont];
                [self->_userEnrollPassword setObject:enrollPassword forKey:enrollAccont];
                // 返回信息
                self->_userAccontBlock(self->_userEnrollAccont);
                self->_userPasswordBlock(self->_userEnrollPassword);
                
                [self dismissViewControllerAnimated:YES completion:nil];
            }]];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
    } else {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请认真填写信息" preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil]];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}
@end
