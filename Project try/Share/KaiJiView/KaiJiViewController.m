//
//  KaiJiViewController.m
//  Share
//
//  Created by 孙旭东 on 2022/7/27.
//

#import "KaiJiViewController.h"
#import "EnrollViewController.h"

@interface KaiJiViewController ()

@end

@implementation KaiJiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 初始设置
    
    [self createViewBackGrond];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma - 创建登陆界面
- (void) createViewBackGrond {
    
    UIImageView* launchImageViewLogin = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kaiji1.png"]];
    launchImageViewLogin.frame = [UIScreen mainScreen].bounds;
    _launchImageViewLogin = launchImageViewLogin;
    _launchImageViewLogin.userInteractionEnabled = YES;
    
    UIImageView* LoginLogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_logo.png"]];
    LoginLogo.frame = CGRectMake(135, 100, 120, 120);
    _LoginLogo = LoginLogo;
    
    UILabel* labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(133, 225, 150, 50)];
    labelTitle.text = @"SHARE";
    labelTitle.font = [UIFont systemFontOfSize:40];
    labelTitle.textColor = [UIColor whiteColor];
    _labelTitle = labelTitle;
    
    self.accont = [[MYTextField alloc] initWithFrame:CGRectMake(45, 330, 300, 50)];
    self.accont.borderStyle = UITextBorderStyleRoundedRect;
    // 文本自适应大小
    self.accont.adjustsFontSizeToFitWidth = YES;
    // 首字母自助大写
    self.accont.autocorrectionType = UITextAutocorrectionTypeNo;
    // 最左侧添加图片
    UIImageView* leftViewOfAccont = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user_img.png"]];
    [self.accont setMyLeftView:leftViewOfAccont];
    self.accont.myLeftView.frame = CGRectMake(2.5, 2.5, 45, 45);
    // 设置键盘
    self.accont.keyboardType = UIKeyboardTypeDefault;
    // 设置代理
    
    self.accont.delegate = self;
    
    self.password = [[MYTextField alloc] initWithFrame:CGRectMake(45, 405, 300, 50)];
    self.password.borderStyle = UITextBorderStyleRoundedRect;
    // 文本自适应大小
    self.password.adjustsFontSizeToFitWidth = YES;
    // 首字母不自助大写
    self.password.autocorrectionType = UITextAutocorrectionTypeNo;
    // 最左侧添加图片
    UIImageView* leftViewOfPassword = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pass_img.png"]];
    [self.password setMyLeftView:leftViewOfPassword];
    self.password.myLeftView.frame = CGRectMake(2.5, 2.5, 45, 45);
    // 密码加密
    self.password.secureTextEntry = YES;
    // 设置键盘
    self.password.keyboardType = UIKeyboardTypeDefault;
    // 设置代理
    self.password.delegate = self;
    
    // 设置登陆和注册按钮
    UIButton* buttonLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton* buttonEnroll = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _buttonLogin = buttonLogin;
    _buttonEnroll = buttonEnroll;
    
    buttonLogin.frame = CGRectMake(80, 490, 100, 40);
    buttonEnroll.frame = CGRectMake(210, 490, 100, 40);
    
    [buttonLogin setTitle:@"登陆" forState:UIControlStateNormal];
    [buttonEnroll setTitle:@"注册" forState:UIControlStateNormal];
    
    buttonLogin.layer.masksToBounds = YES;
    buttonEnroll.layer.masksToBounds = YES;
    
    buttonLogin.layer.cornerRadius = 8;
    buttonEnroll.layer.cornerRadius = 8;
    
    buttonLogin.layer.borderColor = [UIColor whiteColor].CGColor;
    buttonEnroll.layer.borderColor = [UIColor whiteColor].CGColor;
    
    buttonLogin.layer.borderWidth = 0.5;
    buttonEnroll.layer.borderWidth = 0.5;
    
    buttonLogin.tintColor = [UIColor whiteColor];
    buttonEnroll.tintColor = [UIColor whiteColor];
    
    // 为按钮添加事件
    [buttonEnroll addTarget:self action:@selector(pressEnroll) forControlEvents:UIControlEventTouchUpInside];
    [buttonLogin addTarget:self action:@selector(pressLogin) forControlEvents:UIControlEventTouchUpInside];
    
    _buttonAutoLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _buttonAutoLogin.frame = CGRectMake(45, 550, 20, 20);
    [_buttonAutoLogin setImage:[UIImage imageNamed:@"checkbox_unchecked.png"] forState:UIControlStateNormal];
    [_buttonAutoLogin addTarget:self action:@selector(pressAutoLogin) forControlEvents:UIControlEventTouchUpInside];
    _buttonAutoLogin.tag = UNCHECKED;
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(70, 550, 100, 20)];
    label.text = @"自动登录";
    label.textColor = [UIColor colorWithRed:0 green:0.3 blue:0.7 alpha:1];
    _label = label;
    
    [self.view addSubview:launchImageViewLogin];
    [launchImageViewLogin addSubview:LoginLogo];
    [launchImageViewLogin addSubview:labelTitle];
    [launchImageViewLogin addSubview:self.accont];
    [launchImageViewLogin addSubview:self.password];
    [launchImageViewLogin addSubview:buttonLogin];
    [launchImageViewLogin addSubview:buttonEnroll];
    [launchImageViewLogin addSubview:_buttonAutoLogin];
    [launchImageViewLogin addSubview:label];
}

#pragma - 按钮事件
// 注册
- (void) pressEnroll {
    EnrollViewController* enrollViewController = [[EnrollViewController alloc] init];
    enrollViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    
    enrollViewController.delegate = self;
    [self presentViewController:enrollViewController animated:YES completion:nil];
    
}

// 登陆
- (void) pressLogin {
    NSString* accontString = [[NSString alloc] init];
    NSString* passwordString = [[NSString alloc] init];
    NSUInteger indexOfPassword;
    for (id object in _accontString) {
        accontString = object;
        indexOfPassword = [_accontString indexOfObject:object];
        passwordString = [_passwordString objectAtIndex:indexOfPassword];
        
        if ([accontString isEqual:_accont.text] && [passwordString isEqual:_password.text]) {
            // 调用SceneDelegate对象，创建分栏控制器视图，并将其作为根视图
            [self.delegate KaiJiongin];
            return;
        }
    }
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"登陆失败" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

// 自动登陆
- (void) pressAutoLogin {
    if (_buttonAutoLogin.tag == UNCHECKED) {
        [_buttonAutoLogin setImage:[UIImage imageNamed:@"checkbox_checked.png"] forState:UIControlStateNormal];
        _buttonAutoLogin.tag += 1;
    } else {
        [_buttonAutoLogin setImage:[UIImage imageNamed:@"checkbox_unchecked.png"] forState:UIControlStateNormal];
        _buttonAutoLogin.tag -= 1;
    }
}

- (void) textFieldDidBeginEditing:(UITextField *)textField {
    _LoginLogo.frame = CGRectMake(135, 50, 120, 120);
    _labelTitle.frame = CGRectMake(133, 175, 150, 50);
    _accont.frame = CGRectMake(45, 280, 300, 50);
    _password.frame = CGRectMake(45, 355, 300, 50);
    _buttonLogin.frame = CGRectMake(80, 440, 100, 40);
    _buttonEnroll.frame = CGRectMake(210, 440, 100, 40);
    _buttonAutoLogin.frame = CGRectMake(45, 500, 20, 20);
    _label.frame = CGRectMake(70, 500, 100, 20);
}

#pragma - 点击空白处放下键盘
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.accont resignFirstResponder];
    [self.password resignFirstResponder];
    
    _LoginLogo.frame = CGRectMake(135, 100, 120, 120);
    _labelTitle.frame = CGRectMake(133, 225, 150, 50);
    _accont.frame = CGRectMake(45, 330, 300, 50);
    _password.frame = CGRectMake(45, 405, 300, 50);
    _buttonLogin.frame = CGRectMake(80, 490, 100, 40);
    _buttonEnroll.frame = CGRectMake(210, 490, 100, 40);
    _buttonAutoLogin.frame = CGRectMake(45, 550, 20, 20);
    _label.frame = CGRectMake(70, 550, 100, 20);
}

#pragma - 完成协议方法
// 接收账号
- (void) pushAccontText:(NSString *)accontText {
    // 如果数组为空，建立数组
    if (_accontString == nil) {
        _accontString = [[NSMutableArray alloc] init];
    }
    [_accontString addObject:accontText];
}

// 接收密码
- (void) pushPasswordText:(NSString *)passwordText {
    // 如果数组为空，建立数组
    if (_passwordString == nil) {
        _passwordString = [[NSMutableArray alloc] init];
    }
    [_passwordString addObject:passwordText];
}

@end
