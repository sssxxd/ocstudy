//
//  UserEnrollView.m
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/3.
//

#import "UserEnrollView.h"

// 引入第三方库
#import "Masonry.h"

// 设置全局变量
    // 记录获取验证码剩余时间
static NSInteger timeOfPressgetVerCodeButton = 60;
    // 通知名称
NSString *const enrollMessageOfGetVerCode = @"enrollMessageOfGetVerCode";


@interface UserEnrollView ()
// 标题
@property (nonatomic, strong) UILabel* titleWelcomeLabel;
@property (nonatomic, strong) UILabel* titleToLabel;
@property (nonatomic, strong) UILabel* titleFINDLabel;

// label
@property (nonatomic, strong) UILabel* emailLabel;
@property (nonatomic, strong) UILabel* verCodeLabel;
@property (nonatomic, strong) UILabel* passwordLabel;
@property (nonatomic, strong) UILabel* rePasswordLabel;

// textField
@property (nonatomic, strong) UITextField* emailTextField;
@property (nonatomic, strong) UITextField* verCodeTextField;
@property (nonatomic, strong) UITextField* passwordTextField;
@property (nonatomic, strong) UITextField* rePasswordTextField;

// button
@property (nonatomic, strong) UIButton* getVerCodeButton;

// 计时器
@property (nonatomic, weak) NSTimer* getVerCodeTimer;
@end


@implementation UserEnrollView

// 重写init
- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self layoutViews];
    }
    return self;
}

// 放下键盘
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_emailTextField resignFirstResponder];
    [_verCodeTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
    [_rePasswordTextField resignFirstResponder];
}

#pragma mark - 初始化UI视图
- (void) layoutViews {
    [self.titleWelcomeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(100);
        make.left.mas_offset(30);
    }];
    
    [self.titleToLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleWelcomeLabel.mas_bottom).mas_offset(4);
        make.left.mas_offset(30);
    }];
    
    [self.titleFINDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleWelcomeLabel.mas_bottom).mas_offset(8);
        make.centerX.equalTo(self);
    }];
    
    [self.emailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleFINDLabel.mas_bottom).mas_offset(30);
        make.left.mas_offset(60);
    }];
    
    [self.emailTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.emailLabel.mas_bottom).mas_offset(4);
        make.left.mas_offset(40);
        make.right.mas_offset(-40);
        make.height.mas_offset(46);
    }];
    
    [self.passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.emailTextField.mas_bottom).mas_offset(12);
        make.left.mas_offset(60);
    }];
    
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordLabel.mas_bottom).mas_offset(4);
        make.left.mas_offset(40);
        make.right.mas_offset(-40);
        make.height.mas_offset(46);
    }];
    
    [self.rePasswordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordTextField.mas_bottom).mas_offset(12);
        make.left.mas_offset(60);
    }];
    
    [self.rePasswordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.rePasswordLabel.mas_bottom).mas_offset(4);
        make.left.mas_offset(40);
        make.right.mas_offset(-40);
        make.height.mas_offset(46);
    }];
    
    [self.verCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.rePasswordTextField.mas_bottom).mas_offset(34);
        make.left.mas_offset(40);
        make.right.mas_offset(-40);
        make.height.mas_offset(46);
    }];
    
    [self.enrollButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.verCodeTextField.mas_bottom).mas_offset(34);
        make.left.mas_offset(47);
        make.right.mas_offset(-47);
        make.height.mas_offset(42);
    }];
}

// 获取验证码
- (void) pressGetVerCodeButton:(UIButton*)sender {
    NSLog(@"cdv");
    sender.userInteractionEnabled = NO;
    [sender setTitle:[NSString stringWithFormat:@"%ld s后", timeOfPressgetVerCodeButton] forState:UIControlStateNormal];
    [self createGetVerCodeTimer];
    self.emailString = _emailTextField.text;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:enrollMessageOfGetVerCode object:nil];
}

// 获取验证码计时器
- (void) createGetVerCodeTimer {
    self.getVerCodeTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(getVerCodeTimerAction) userInfo:nil repeats:YES];
}

- (void) getVerCodeTimerAction {
    if (timeOfPressgetVerCodeButton != 0) {
        timeOfPressgetVerCodeButton--;
        
        [_getVerCodeButton setTitle:[NSString stringWithFormat:@"%ld s后", timeOfPressgetVerCodeButton] forState:UIControlStateNormal];
    } else {
        [_getVerCodeButton setTitle:@"重新获取" forState:UIControlStateNormal];
        _getVerCodeButton.userInteractionEnabled = YES;
        
        [_getVerCodeTimer invalidate];
        self.getVerCodeTimer = nil;
        
        timeOfPressgetVerCodeButton = 60;
    }
}

// 注册方法，使用块传值给viewController
- (void) enrollWithEnrollNeedInfoCompletionHandler:(EnrollNeedInfoCompletionHandler)enrollNeedInfoCompletionHandler {
    
    self.emailString = _emailTextField.text;
    self.codeString = _verCodeTextField.text;
    self.passwordString = _passwordTextField.text;
    
    if ([_passwordString isEqualToString:_rePasswordTextField.text]) {
        enrollNeedInfoCompletionHandler(_emailString, _passwordString, _codeString);
    }
}

#pragma mark - 懒加载
- (UILabel*) titleWelcomeLabel {
    if (_titleWelcomeLabel == nil) {
        self.titleWelcomeLabel = [[UILabel alloc] init];
        _titleWelcomeLabel.textColor = [UIColor blackColor];
        _titleWelcomeLabel.text = @"Welcome";
        _titleWelcomeLabel.font = [UIFont fontWithName:@"Georgia-BoldItalic" size:24];
        
        [self addSubview:_titleWelcomeLabel];
    }
    return _titleWelcomeLabel;
}

- (UILabel*) titleToLabel {
    if (_titleToLabel == nil) {
        self.titleToLabel = [[UILabel alloc] init];
        _titleToLabel.textColor = [UIColor blackColor];
        _titleToLabel.text = @"to";
        _titleToLabel.font = [UIFont fontWithName:@"Georgia-BoldItalic" size:24];
        
        [self addSubview:_titleToLabel];
    }
    return _titleToLabel;
}

- (UILabel*) titleFINDLabel {
    if (_titleFINDLabel == nil) {
        self.titleFINDLabel = [[UILabel alloc] init];
        _titleFINDLabel.textColor = [UIColor blackColor];
        _titleFINDLabel.text = @"FIND";
        _titleFINDLabel.font = [UIFont fontWithName:@"Georgia-BoldItalic" size:36];
        
        [self addSubview:_titleFINDLabel];
    }
    return _titleFINDLabel;
}

- (UILabel*) emailLabel {
    if (_emailLabel == nil) {
        self.emailLabel = [[UILabel alloc] init];
        _emailLabel.textColor = [UIColor blackColor];
        _emailLabel.text = @"邮箱";
        _emailLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
        
        [self addSubview:_emailLabel];
    }
    return _emailLabel;
}

- (UILabel*) passwordLabel {
    if (_passwordLabel == nil) {
        self.passwordLabel = [[UILabel alloc] init];
        _passwordLabel.textColor = [UIColor blackColor];
        _passwordLabel.text = @"密码";
        _passwordLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
        
        [self addSubview:_passwordLabel];
    }
    return _passwordLabel;
}

- (UILabel*) rePasswordLabel {
    if (_rePasswordLabel == nil) {
        self.rePasswordLabel = [[UILabel alloc] init];
        _rePasswordLabel.textColor = [UIColor blackColor];
        _rePasswordLabel.text = @"确认密码";
        _rePasswordLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
        
        [self addSubview:_rePasswordLabel];
    }
    return _rePasswordLabel;
}

- (UITextField*) emailTextField {
    if (_emailTextField == nil) {
        self.emailTextField = [[UITextField alloc] init];
        _emailTextField.keyboardType = UIKeyboardTypeEmailAddress;
        _emailTextField.autocapitalizationType = NO;
        _emailTextField.layer.cornerRadius = 46 / 2;
        _emailTextField.layer.masksToBounds = YES;
        _emailTextField.layer.borderColor = [UIColor blackColor].CGColor;
        _emailTextField.layer.borderWidth = 2;
        _emailTextField.font = [UIFont systemFontOfSize:20];
        
        UIView* paddView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 46)];
        _emailTextField.leftView = paddView;
        _emailTextField.leftViewMode = UITextFieldViewModeAlways;
        
        [self addSubview:_emailTextField];
    }
    return _emailTextField;
}

- (UITextField*) passwordTextField {
    if (_passwordTextField == nil) {
        self.passwordTextField = [[UITextField alloc] init];
//        _passwordTextField.secureTextEntry = YES;
        _passwordTextField.layer.cornerRadius = 46 / 2;
        _passwordTextField.layer.masksToBounds = YES;
        _passwordTextField.layer.borderColor = [UIColor blackColor].CGColor;
        _passwordTextField.layer.borderWidth = 2;
        
        UIView* paddView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 46)];
        _passwordTextField.leftView = paddView;
        _passwordTextField.leftViewMode = UITextFieldViewModeAlways;
        
        [self addSubview:_passwordTextField];
    }
    return _passwordTextField;
}

- (UITextField*) rePasswordTextField {
    if (_rePasswordTextField == nil) {
        self.rePasswordTextField = [[UITextField alloc] init];
//        _rePasswordTextField.secureTextEntry = YES;
        _rePasswordTextField.layer.cornerRadius = 46 / 2;
        _rePasswordTextField.layer.masksToBounds = YES;
        _rePasswordTextField.layer.borderColor = [UIColor blackColor].CGColor;
        _rePasswordTextField.layer.borderWidth = 2;
        
        UIView* paddView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 46)];
        _rePasswordTextField.leftView = paddView;
        _rePasswordTextField.leftViewMode = UITextFieldViewModeAlways;
        
        [self addSubview:_rePasswordTextField];
    }
    return _rePasswordTextField;
}

- (UIButton*) getVerCodeButton {
    if (_getVerCodeButton == nil) {
        self.getVerCodeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_getVerCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_getVerCodeButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _getVerCodeButton.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [_getVerCodeButton addTarget:self action:@selector(pressGetVerCodeButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _getVerCodeButton;
}

- (UITextField*) verCodeTextField {
    if (_verCodeTextField == nil) {
        self.verCodeTextField = [[UITextField alloc] init];
        _verCodeTextField.keyboardType = UIKeyboardTypeNumberPad;
        _verCodeTextField.layer.cornerRadius = 46 / 2;
        _verCodeTextField.layer.masksToBounds = YES;
        _verCodeTextField.layer.borderColor = [UIColor blackColor].CGColor;
        _verCodeTextField.layer.borderWidth = 2;
        
        UIView* paddView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 46)];
        _verCodeTextField.leftView = paddView;
        _verCodeTextField.leftViewMode = UITextFieldViewModeAlways;
        
        UIView* lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor grayColor];
        
        [_verCodeTextField addSubview:lineView];
        
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-100);
            make.top.equalTo(_verCodeTextField);
            make.bottom.equalTo(_verCodeTextField);
            make.width.mas_offset(1);
        }];
        
        [_verCodeTextField addSubview:self.getVerCodeButton];
        
        [self.getVerCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(0);
            make.right.mas_offset(0);
            make.bottom.mas_offset(0);
            make.width.mas_offset(100);
        }];
        
        [self addSubview:_verCodeTextField];
    }
    return _verCodeTextField;
}

- (UIButton*) enrollButton {
    if (_enrollButton == nil) {
        self.enrollButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        [_enrollButton setTitle:@"注册" forState:UIControlStateNormal];
        [_enrollButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _enrollButton.backgroundColor = [UIColor colorWithRed:0.165f green:0.510f blue:0.895f alpha:1];
        _enrollButton.titleLabel.font = [UIFont systemFontOfSize:22];
        
        [self addSubview:_enrollButton];
    }
    return _enrollButton;
}


@end
