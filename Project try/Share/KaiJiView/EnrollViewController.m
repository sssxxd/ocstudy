//
//  EnrollViewController.m
//  Share
//
//  Created by 孙旭东 on 2022/7/29.
//

#import "EnrollViewController.h"

@interface EnrollViewController ()

@end

@implementation EnrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createEnrollView];
    

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) createEnrollView {
    UIImageView* enrollImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kaiji1.png"]];
    enrollImageView.frame = [UIScreen mainScreen].bounds;
    
    UIImageView* LoginLogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_logo.png"]];
    LoginLogo.frame = CGRectMake(135, 100, 120, 120);
    _LoginLogo = LoginLogo;
    
    UILabel* labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(133, 225, 150, 50)];
    labelTitle.text = @"SHARE";
    labelTitle.font = [UIFont systemFontOfSize:40];
    labelTitle.textColor = [UIColor whiteColor];
    _labelTitle = labelTitle;
    
    self.accont = [[MYTextField alloc] initWithFrame:CGRectMake(45, 385, 300, 50)];
    self.accont.borderStyle = UITextBorderStyleRoundedRect;
    // 文本自适应大小
    self.accont.adjustsFontSizeToFitWidth = YES;
    // 首字母不自助大写
    self.accont.autocorrectionType = UITextAutocorrectionTypeNo;
    // 最左侧添加图片
    UIImageView* leftViewOfAccont = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user_img.png"]];
    [self.accont setMyLeftView:leftViewOfAccont];
    self.accont.myLeftView.frame = CGRectMake(2.5, 2.5, 45, 45);
    // 设置键盘
    self.accont.keyboardType = UIKeyboardTypeDefault;
    // 设置代理
    self.accont.delegate = self;
    
    self.password = [[MYTextField alloc] initWithFrame:CGRectMake(45, 460, 300, 50)];
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
    
    self.Email = [[MYTextField alloc] initWithFrame:CGRectMake(45, 310, 300, 50)];
    self.Email.borderStyle = UITextBorderStyleRoundedRect;
    // 文本自适应大小
    self.Email.adjustsFontSizeToFitWidth = YES;
    self.Email.autocorrectionType = UITextAutocorrectionTypeNo;
    // 最左侧添加图片
    UIImageView* leftViewEmail = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"email_img.png"]];
    self.Email.myLeftView = leftViewEmail;
    self.Email.myLeftView.frame = CGRectMake(2.5, 2.5, 45, 45);
    self.Email.keyboardType = UIKeyboardTypeDefault;
    self.Email.delegate = self;
    
    // 确认注册按钮
    UIButton* enrollButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [enrollButton setTitle:@"确认注册" forState:UIControlStateNormal];
    enrollButton.frame = CGRectMake(95, 560, 200, 50);
    enrollButton.layer.masksToBounds = YES;
    enrollButton.layer.cornerRadius = 8;
    enrollButton.layer.borderColor = [UIColor whiteColor].CGColor;
    enrollButton.layer.borderWidth = 0.5;
    enrollButton.tintColor = [UIColor whiteColor];
    // 添加事件
    [enrollButton addTarget:self action:@selector(pressEnroll) forControlEvents:UIControlEventTouchUpInside];
    _enrollButton = enrollButton;
    
    [self.view addSubview:enrollImageView];
    [self.view addSubview:LoginLogo];
    [self.view addSubview:labelTitle];
    [self.view addSubview:self.accont];
    [self.view addSubview:self.password];
    [self.view addSubview:self.Email];
    [self.view addSubview:enrollButton];

}

- (void) textFieldDidBeginEditing:(UITextField *)textField {
    _LoginLogo.frame = CGRectMake(135, 50, 120, 120);
    _labelTitle.frame = CGRectMake(133, 175, 150, 50);
    _accont.frame = CGRectMake(45, 335, 300, 50);
    _password.frame = CGRectMake(45, 410, 300, 50);
    _Email.frame = CGRectMake(45, 260, 300, 50);
    _enrollButton.frame = CGRectMake(95, 510, 200, 50);
}

#pragma - 按钮事件
// 确认注册
- (void) pressEnroll {
    // 调用代理传值
    [self.delegate pushAccontText:self.accont.text];
    [self.delegate pushPasswordText:self.password.text];
    
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma - 点击空白处放下键盘
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.accont resignFirstResponder];
    [self.password resignFirstResponder];
    [self.Email resignFirstResponder];
    
    _LoginLogo.frame = CGRectMake(135, 100, 120, 120);
    _labelTitle.frame = CGRectMake(133, 225, 150, 50);
    _accont.frame = CGRectMake(45, 385, 300, 50);
    _password.frame = CGRectMake(45, 460, 300, 50);
    _Email.frame = CGRectMake(45, 310, 300, 50);
    _enrollButton.frame = CGRectMake(95, 560, 200, 50);
}


@end
