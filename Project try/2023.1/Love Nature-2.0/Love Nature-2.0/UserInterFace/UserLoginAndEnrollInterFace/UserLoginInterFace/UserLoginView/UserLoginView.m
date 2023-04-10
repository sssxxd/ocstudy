//
//  UserLoginView.m
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/1.
//

#import "UserLoginView.h"

// 引入第三方库
#import "Masonry.h"

// 预定义屏幕宽
#define KSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

// 定义全局变量
    // 用于记录重新获取验证码所需时间
static NSInteger timeOfPressgetVerCodeButton = 60;
    // 记录现在使用的登陆状态
static UserLoginViewLoginMethod userLoginViewLoginMethod = UserLoginViewLoginMethodPassword;
    // 通知名称
NSString *const loginMessageOfGetVerCode = @"messageOfGetVerCode";
NSString *const messageOfOpenEnrollViewController = @"messageOfOpenEnrollViewController";

@interface UserLoginView ()

// 标题
@property (nonatomic, strong) UILabel* titleWelcomeLabel;
@property (nonatomic, strong) UILabel* titleToLabel;
@property (nonatomic, strong) UILabel* titleFINDLabel;

// 登陆方式切换密码
@property (nonatomic, strong) UIButton* passwordorVodeCodeLoginButton;
    // 遮挡视图
@property (nonatomic, strong) UIView* whiteTextFieldBackView;

// 邮箱
@property (nonatomic, strong) UILabel* emailLabel;
@property (nonatomic, strong) UITextField* emailTextField;

// 密码登陆
@property (nonatomic, strong) UILabel* passwordLabel;
@property (nonatomic, strong) UITextField* passwordTextField;

// 验证码登陆
@property (nonatomic, strong) UILabel* verCodeLabel;
@property (nonatomic, strong) UITextField* verCodeTextField;
@property (nonatomic, strong) UIButton* verCodeGetButton;
@property (nonatomic, weak) NSTimer* getVerCodeTimer;

// 用户提示
@property (nonatomic, strong) UILabel* userPointOutLabel;
@property (nonatomic, strong) UIImageView* userPointOutImageView;

// 其他登陆方式图标
@property (nonatomic, strong) UIButton* weChatLoginButton;
@property (nonatomic, strong) UIButton* QQLoginButton;
@property (nonatomic, strong) UIButton* phoneLoginBuuton;

@end



@implementation UserLoginView

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self layoutViews];
        [self initLoginAndEnrollButton];
    }
    return self;
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// 放下键盘
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_passwordTextField resignFirstResponder];
    [_verCodeTextField resignFirstResponder];
    [_emailTextField resignFirstResponder];
}

#pragma mark - UI设计
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
    
    [self.verCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordTextField);
        make.left.equalTo(self.passwordTextField);
        make.right.equalTo(self.passwordTextField);
        make.height.equalTo(self.passwordTextField);
    }];
    
    [self.whiteTextFieldBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordTextField);
        make.left.equalTo(self.passwordTextField);
        make.right.equalTo(self.passwordTextField);
        make.height.equalTo(self.passwordTextField);
    }];
    
    [self.passwordorVodeCodeLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordTextField.mas_bottom).mas_offset(4);
        make.right.mas_offset(-110);
    }];
    
    [self.userPointOutImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordTextField.mas_bottom).mas_offset(45);
        make.left.mas_offset(70);
        make.size.mas_offset(20);
    }];
    
    [self.userPointOutLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.userPointOutImageView).mas_offset(2);
        make.left.mas_equalTo(self.userPointOutImageView.mas_right).mas_offset(24);
    }];
    
    [self.weChatLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordTextField.mas_bottom).mas_offset(150);
        make.left.mas_offset(70);
        make.size.mas_offset(40);
    }];
    
    [self.QQLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.weChatLoginButton);
        make.centerX.equalTo(self);
        make.size.mas_offset(45);
    }];
    
    [self.phoneLoginBuuton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.weChatLoginButton);
        make.right.mas_offset(-70);
        make.size.equalTo(self.weChatLoginButton);
    }];
    
    // 使密码输入框显示
    [self bringSubviewToFront:self.passwordTextField];
}


#pragma mark - 按钮及其事件
// 获取验证码
- (void) pressVerCodeGetButton:(UIButton*)sender {
    sender.userInteractionEnabled = NO;
    [sender setTitle:[NSString stringWithFormat:@"%ld s后", timeOfPressgetVerCodeButton] forState:UIControlStateNormal];
    [self createGetVerCodeTimer];
    self.emailString = _emailTextField.text;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:loginMessageOfGetVerCode object:nil];
}

// 获取验证码计时器
- (void) createGetVerCodeTimer {
    self.getVerCodeTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(getVerCodeTimerAction) userInfo:nil repeats:YES];
}

- (void) getVerCodeTimerAction {
    if (timeOfPressgetVerCodeButton != 0) {
        timeOfPressgetVerCodeButton--;
        
        [_verCodeGetButton setTitle:[NSString stringWithFormat:@"%ld s后", timeOfPressgetVerCodeButton] forState:UIControlStateNormal];
    } else {
        [_verCodeGetButton setTitle:@"重新获取" forState:UIControlStateNormal];
        _verCodeGetButton.userInteractionEnabled = YES;
        
        [_getVerCodeTimer invalidate];
        self.getVerCodeTimer = nil;
        
        timeOfPressgetVerCodeButton = 60;
    }
}

// 切换登录方式
- (void) pressPasswordOrVierCodeLoginButton:(UIButton*)sender {
    if (userLoginViewLoginMethod == UserLoginViewLoginMethodPassword) {
        userLoginViewLoginMethod = UserLoginViewLoginMethodVerCode;
        
        [self.passwordorVodeCodeLoginButton setTitle:@"密码登陆" forState:UIControlStateNormal];
        
        self.passwordTextField.userInteractionEnabled = NO;
        self.passwordLabel.alpha = 0;
        
        self.verCodeTextField.userInteractionEnabled = YES;
        self.verCodeGetButton.userInteractionEnabled = YES;
        self.verCodeLabel.alpha = 1;
        
        [self bringSubviewToFront:self.whiteTextFieldBackView];
        [self bringSubviewToFront:self.verCodeTextField];
    } else {
        userLoginViewLoginMethod = UserLoginViewLoginMethodPassword;
        
        [_passwordorVodeCodeLoginButton setTitle:@"验证码登陆" forState:UIControlStateNormal];
        
        self.passwordTextField.userInteractionEnabled = YES;
        self.passwordLabel.alpha = 1;
        
        self.verCodeTextField.userInteractionEnabled = NO;
        self.verCodeLabel.alpha = 0;
        
        [self bringSubviewToFront:self.whiteTextFieldBackView];
        [self bringSubviewToFront:self.passwordTextField];
    }
}

// 注册和登陆按钮
- (void) initLoginAndEnrollButton {
    self.enrollButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_enrollButton setTitle:@"注册" forState:UIControlStateNormal];
    [_enrollButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self addSubview:_enrollButton];
    
    [_enrollButton addTarget:self action:@selector(pressEnrollButton) forControlEvents:UIControlEventTouchUpInside];
    
    self.loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    [_loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _loginButton.backgroundColor = [UIColor colorWithRed:0.165f green:0.510f blue:0.895f alpha:1];
    _loginButton.titleLabel.font = [UIFont systemFontOfSize:22];
    [self addSubview:_loginButton];
    
    [self.enrollButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordTextField.mas_bottom).mas_offset(4);
        make.right.mas_offset(-60);
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.userPointOutLabel.mas_bottom).mas_offset(18);
        make.left.mas_offset(47);
        make.right.mas_offset(-47);
        make.height.mas_offset(42);
    }];
}

// 打开注册页面
- (void) pressEnrollButton {
    [[NSNotificationCenter defaultCenter] postNotificationName:messageOfOpenEnrollViewController object:nil];
}

// 传输登陆所需信息
- (void) loginNeedInfoCompletionHandler:(LoginNeedInfoCompletionHandler)handler {
    switch (userLoginViewLoginMethod) {
        case UserLoginViewLoginMethodPassword:
            self.emailString = _emailTextField.text;
            self.passwordOrCodeString = _passwordTextField.text;
            
            handler(_emailString, _passwordOrCodeString, userLoginViewLoginMethod);
            break;
        case UserLoginViewLoginMethodVerCode:
            self.emailString = _emailTextField.text;
            self.passwordOrCodeString = _verCodeTextField.text;
            
            handler(_emailString, _passwordOrCodeString, userLoginViewLoginMethod);
            break;
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

- (UILabel*) userPointOutLabel {
    if (_userPointOutLabel == nil) {
        self.userPointOutLabel = [[UILabel alloc] init];
        _userPointOutLabel.textColor = [UIColor blackColor];
        _userPointOutLabel.text = @"我已阅读相关用户协议并同意继续";
        _userPointOutLabel.font = [UIFont systemFontOfSize:14];
        
        [self addSubview:_userPointOutLabel];
    }
    return _userPointOutLabel;
}

- (UIButton*) verCodeGetButton {
    if (_verCodeGetButton == nil) {
        self.verCodeGetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_verCodeGetButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_verCodeGetButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _verCodeGetButton.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [_verCodeGetButton addTarget:self action:@selector(pressVerCodeGetButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _verCodeGetButton;
}

- (UIButton*) passwordorVodeCodeLoginButton {
    if (_passwordorVodeCodeLoginButton == nil) {
        self.passwordorVodeCodeLoginButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_passwordorVodeCodeLoginButton setTitle:@"验证码登陆" forState:UIControlStateNormal];
        [_passwordorVodeCodeLoginButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        [_passwordorVodeCodeLoginButton addTarget:self action:@selector(pressPasswordOrVierCodeLoginButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_passwordorVodeCodeLoginButton];
    }
    return _passwordorVodeCodeLoginButton;
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
        _passwordTextField.secureTextEntry = YES;
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

- (UITextField*) verCodeTextField {
    if (_verCodeTextField == nil) {
        self.verCodeTextField = [[UITextField alloc] init];
        _verCodeTextField.keyboardType = UIKeyboardTypeNumberPad;
        _verCodeTextField.layer.cornerRadius = 46 / 2;
        _verCodeTextField.layer.masksToBounds = YES;
        _verCodeTextField.layer.borderColor = [UIColor blackColor].CGColor;
        _verCodeTextField.layer.borderWidth = 2;
        _verCodeTextField.userInteractionEnabled = NO;
        
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
        
        [_verCodeTextField addSubview:self.verCodeGetButton];
        
        [self.verCodeGetButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(0);
            make.right.mas_offset(0);
            make.bottom.mas_offset(0);
            make.width.mas_offset(100);
        }];
        
        [self addSubview:_verCodeTextField];
    }
    return _verCodeTextField;
}

- (UIImageView*) userPointOutImageView {
    if (_userPointOutImageView == nil) {
        self.userPointOutImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WechatIMG6.jpeg"]];
        
        [self addSubview:_userPointOutImageView];
    }
    return _userPointOutImageView;
}

- (UIButton*) weChatLoginButton {
    if (_weChatLoginButton == nil) {
        self.weChatLoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_weChatLoginButton setImage:[UIImage imageNamed:@"WechatIMG9.jpeg"] forState:UIControlStateNormal];
        
        [self addSubview:_weChatLoginButton];
    }
    return _weChatLoginButton;
}

- (UIButton*) QQLoginButton {
    if (_QQLoginButton == nil) {
        self.QQLoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_QQLoginButton setImage:[UIImage imageNamed:@"WechatIMG7.jpeg"] forState:UIControlStateNormal];
        
        [self addSubview:_QQLoginButton];
    }
    return _QQLoginButton;
}

- (UIButton*) phoneLoginBuuton {
    if (_phoneLoginBuuton == nil) {
        self.phoneLoginBuuton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_phoneLoginBuuton setImage:[UIImage imageNamed:@"WechatIMG8.jpeg"] forState:UIControlStateNormal];
        
        [self addSubview:_phoneLoginBuuton];
    }
    return _phoneLoginBuuton;
}

- (UIView*) whiteTextFieldBackView {
    if (_whiteTextFieldBackView == nil) {
        self.whiteTextFieldBackView = [[UIView alloc] init];
        _whiteTextFieldBackView.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:_whiteTextFieldBackView];
    }
    return _whiteTextFieldBackView;
}

@end
