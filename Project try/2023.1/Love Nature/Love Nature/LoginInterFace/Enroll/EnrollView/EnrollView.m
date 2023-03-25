//
//  EnrollView.m
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/6.
//

#import "EnrollView.h"
#import "Masonry.h"

@implementation EnrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
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
    
    self.RePasswordLabel = [[UILabel alloc] init];
    self.RePasswordLabel.font = [UIFont systemFontOfSize:20];
    self.RePasswordLabel.textColor = [UIColor blackColor];
    [self addSubview:self.RePasswordLabel];
    
    self.VerificationCodeLabel = [[UILabel alloc] init];
    self.VerificationCodeLabel.font = [UIFont systemFontOfSize:20];
    self.VerificationCodeLabel.textColor = [UIColor blackColor];
    [self addSubview:self.VerificationCodeLabel];
    
    [self.TitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(100);
        make.right.mas_offset(-30);
        make.left.mas_offset(30);
    }];
    
    [self.AccountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.TitleLabel).mas_offset(150);
        make.right.mas_offset(-300);
    }];
    
    [self.VerificationCodeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.AccountLabel).mas_offset(60);
        make.right.mas_offset(-300);
    }];
    
    [self.PasswordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.VerificationCodeLabel).mas_offset(60);
        make.right.mas_offset(-300);
    }];
    
    [self.RePasswordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.PasswordLabel).mas_offset(60);
        make.right.mas_offset(-300);
    }];
    
    self.TitleLabel.text = @"Love Nature";
    self.AccountLabel.text = @"账号";
    self.PasswordLabel.text = @"密码";
    self.RePasswordLabel.text = @"确认密码";
    self.VerificationCodeLabel.text = @"验证码";
}

- (void) initTextField {
    self.AccountTextField = [[UITextField alloc] init];
    self.AccountTextField.backgroundColor = [UIColor whiteColor];
    self.AccountTextField.placeholder = @"邮箱";
    self.AccountTextField.keyboardType = UIKeyboardTypeEmailAddress;
    self.AccountTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self addSubview:self.AccountTextField];
    
    self.VerificationCodeTextField = [[UITextField alloc] init];
    self.VerificationCodeTextField.backgroundColor = [UIColor whiteColor];
    self.VerificationCodeTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self addSubview:self.VerificationCodeTextField];
    
    self.PasswordTextField = [[UITextField alloc] init];
    self.PasswordTextField.backgroundColor = [UIColor whiteColor];
    self.PasswordTextField.placeholder = @"8~16位字母、符号或数字";
    [self addSubview:self.PasswordTextField];
    
    self.RePasswordTextField = [[UITextField alloc] init];
    self.RePasswordTextField.backgroundColor = [UIColor whiteColor];
    self.RePasswordTextField.placeholder = @"8~16位字母、符号或数字";
    [self addSubview:self.RePasswordTextField];
    
    [self.AccountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.AccountLabel).mas_offset(-5);
        make.left.mas_equalTo(self.AccountLabel.mas_right).mas_offset(10);
        make.right.mas_offset(-40);
        make.height.mas_offset(40);
    }];
    
    [self.VerificationCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.VerificationCodeLabel).mas_offset(-5);
        make.left.mas_equalTo(self.VerificationCodeLabel.mas_right).mas_offset(10);
        make.right.mas_offset(-150);
        make.height.mas_offset(40);
    }];
    
    [self.PasswordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.PasswordLabel).mas_offset(-5);
        make.left.mas_equalTo(self.PasswordLabel.mas_right).mas_offset(10);
        make.right.mas_offset(-40);
        make.height.mas_offset(40);
    }];
    
    [self.RePasswordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.RePasswordLabel).mas_offset(-5);
        make.left.mas_equalTo(self.RePasswordLabel.mas_right).mas_offset(10);
        make.right.mas_offset(-40);
        make.height.mas_offset(40);
    }];
}

- (void) initButton {
    self.EnrollButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.EnrollButton setTitle:@"注册" forState:UIControlStateNormal];
    self.EnrollButton.tintColor = [UIColor blackColor];
    self.EnrollButton.layer.cornerRadius = 8;
    self.EnrollButton.layer.borderWidth = 1;
    self.EnrollButton.layer.borderColor = [UIColor blackColor].CGColor;
    [self addSubview:self.EnrollButton];
    
    self.VerificationCodeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.VerificationCodeButton setTitle:@"发送验证码" forState:UIControlStateNormal];
    [self.VerificationCodeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.VerificationCodeButton.layer.cornerRadius = 8;
    self.VerificationCodeButton.layer.borderWidth = 1;
    self.VerificationCodeButton.layer.borderColor = [UIColor blackColor].CGColor;
    [self addSubview:self.VerificationCodeButton];
    
    [self.EnrollButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.RePasswordLabel).mas_offset(90);
        make.right.mas_offset(-140);
        make.left.mas_offset(140);
        make.height.mas_offset(40);
    }];
    
    [self.VerificationCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.VerificationCodeTextField);
        make.left.mas_equalTo(self.VerificationCodeTextField.mas_right).mas_offset(10);
        make.right.mas_offset(-40);
        make.bottom.mas_equalTo(self.PasswordTextField.mas_top).mas_offset(-20);
    }];
    
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.PasswordTextField resignFirstResponder];
    [self.AccountTextField resignFirstResponder];
    [self.RePasswordTextField resignFirstResponder];
    [self.VerificationCodeTextField resignFirstResponder];
}

@end
