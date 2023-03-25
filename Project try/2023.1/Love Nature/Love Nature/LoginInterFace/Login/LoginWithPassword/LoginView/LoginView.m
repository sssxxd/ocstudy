//
//  LoginView.m
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/5.
//

#import "LoginView.h"
#import "Masonry.h"

@implementation LoginView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor greenColor];
        
        [self initLabel];
        [self initTextField];
        [self initButton];
    }
    return self;
}

- (void) initLabel {
    self.TitleLabel = [[UILabel alloc] init];
    self.TitleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:40];
    self.TitleLabel.textColor = [UIColor blackColor];
    self.TitleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.TitleLabel];
    
    self.AccountLabel = [[UILabel alloc] init];
    self.AccountLabel.font = [UIFont systemFontOfSize:20];
    self.AccountLabel.textColor = [UIColor blackColor];
    [self addSubview:self.AccountLabel];
    
    self.PasswordLabel = [[UILabel alloc] init];
    self.PasswordLabel.font = [UIFont systemFontOfSize:20];
    self.PasswordLabel.textColor = [UIColor blackColor];
    [self addSubview:self.PasswordLabel];
    
    [self.TitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(100);
        make.right.mas_offset(-30);
        make.left.mas_offset(30);
    }];
    
    [self.AccountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.TitleLabel).mas_offset(250);
        make.right.mas_offset(-300);
    }];
    
    [self.PasswordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.AccountLabel).mas_offset(60);
        make.right.mas_offset(-300);
    }];
    
    self.TitleLabel.text = @"Love Nature";
    self.AccountLabel.text = @"账号";
    self.PasswordLabel.text = @"密码";
}

- (void) initTextField {
    self.AccountTextField = [[UITextField alloc] init];
    self.AccountTextField.backgroundColor = [UIColor whiteColor];
    self.AccountTextField.keyboardType = UIKeyboardTypeEmailAddress;
    self.AccountTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.AccountTextField.placeholder = @"邮箱";
    
    [self addSubview:self.AccountTextField];
    
    self.PasswordTextField = [[UITextField alloc] init];
    self.PasswordTextField.backgroundColor = [UIColor whiteColor];
    self.PasswordTextField.placeholder = @"8~16位字母、符号或数字";
    self.PasswordTextField.secureTextEntry = YES;
    
    [self addSubview:self.PasswordTextField];
    
    [self.AccountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.AccountLabel).mas_offset(-5);
        make.left.equalTo(self.AccountLabel).mas_offset(60);
        make.right.mas_offset(-40);
        make.height.mas_offset(40);
    }];
    
    [self.PasswordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.PasswordLabel).mas_offset(-5);
        make.left.equalTo(self.PasswordLabel).mas_offset(60);
        make.right.mas_offset(-40);
        make.height.mas_offset(40);
    }];
}

- (void) initButton {
    self.LoginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.LoginButton setTitle:@"登陆" forState:UIControlStateNormal];
    self.LoginButton.tintColor = [UIColor blackColor];
    self.LoginButton.layer.cornerRadius = 8;
    self.LoginButton.layer.borderWidth = 1;
    self.LoginButton.layer.borderColor = [UIColor blackColor].CGColor;
    [self addSubview:self.LoginButton];
    
    self.EnrollButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.EnrollButton setTitle:@"注册" forState:UIControlStateNormal];
    self.EnrollButton.tintColor = [UIColor blackColor];
    self.EnrollButton.layer.cornerRadius = 8;
    self.EnrollButton.layer.borderWidth = 1;
    self.EnrollButton.layer.borderColor = [UIColor blackColor].CGColor;
    [self addSubview:self.EnrollButton];
    
    [self.LoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.PasswordLabel).mas_offset(90);
        make.left.mas_offset(60);
        make.width.mas_offset(100);
        make.height.mas_offset(40);
    }];
    
    [self.EnrollButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.PasswordLabel).mas_offset(90);
        make.right.mas_offset(-60);
        make.width.mas_offset(100);
        make.height.mas_offset(40);
    }];
    
    self.VerCodeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.VerCodeButton setTitle:@"验证码登陆" forState:UIControlStateNormal];
    self.VerCodeButton.tintColor = [UIColor blackColor];
    [self addSubview:self.VerCodeButton];
    
    [self.VerCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.PasswordLabel).mas_offset(40);
        make.right.equalTo(self.PasswordTextField).mas_offset(-5);
        make.width.mas_offset(80);
        make.height.mas_offset(30);
    }];
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.AccountTextField resignFirstResponder];
    [self.PasswordTextField resignFirstResponder];
}

@end
