//
//  LoginWithVerCodeView.m
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/7.
//

#import "LoginWithVerCodeView.h"
#import "Masonry.h"

@implementation LoginWithVerCodeView

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
    
    self.VerCodeLabel = [[UILabel alloc] init];
    self.VerCodeLabel.font = [UIFont systemFontOfSize:20];
    self.VerCodeLabel.textColor = [UIColor blackColor];
    [self addSubview:self.VerCodeLabel];
    
    [self.TitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(100);
        make.right.mas_offset(-30);
        make.left.mas_offset(30);
    }];
    
    [self.AccountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.TitleLabel).mas_offset(150);
        make.right.mas_offset(-300);
    }];
    
    [self.VerCodeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.AccountLabel).mas_offset(60);
        make.right.mas_offset(-300);
    }];
    
    self.AccountLabel.text = @"账号";
    self.VerCodeLabel.text = @"验证码";
    self.TitleLabel.text = @"Love Nature";
}

- (void) initTextField {
    self.AccountTextField = [[UITextField alloc] init];
    self.AccountTextField.backgroundColor = [UIColor whiteColor];
    self.AccountTextField.placeholder = @"邮箱";
    self.AccountTextField.keyboardType = UIKeyboardTypeEmailAddress;
    self.AccountTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self addSubview:self.AccountTextField];
    
    self.VerCodeTextField = [[UITextField alloc] init];
    self.VerCodeTextField.backgroundColor = [UIColor whiteColor];
    self.VerCodeTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self addSubview:self.VerCodeTextField];
    
    [self.AccountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.AccountLabel).mas_offset(-5);
        make.left.mas_equalTo(self.AccountLabel.mas_right).mas_offset(10);
        make.right.mas_offset(-40);
        make.height.mas_offset(40);
    }];
    
    [self.VerCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.VerCodeLabel).mas_offset(-5);
        make.left.mas_equalTo(self.VerCodeLabel.mas_right).mas_offset(10);
        make.right.mas_offset(-150);
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
    
    self.VerCodeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.VerCodeButton setTitle:@"发送验证码" forState:UIControlStateNormal];
    [self.VerCodeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.VerCodeButton.layer.cornerRadius = 8;
    self.VerCodeButton.layer.borderWidth = 1;
    self.VerCodeButton.layer.borderColor = [UIColor blackColor].CGColor;
    [self addSubview:self.VerCodeButton];
    
    [self.LoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.VerCodeLabel).mas_offset(90);
        make.right.mas_offset(-140);
        make.left.mas_offset(140);
        make.height.mas_offset(40);
    }];
    
    [self.VerCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.VerCodeTextField);
        make.left.mas_equalTo(self.VerCodeTextField.mas_right).mas_offset(10);
        make.right.mas_offset(-40);
        make.height.mas_equalTo(self.VerCodeTextField.mas_height);
    }];
}

@end
