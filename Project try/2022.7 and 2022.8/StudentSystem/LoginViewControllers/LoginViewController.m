//
//  LoginViewController.m
//  StudentSystem
//
//  Created by 孙旭东 on 2022/8/3.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backImage.jpeg"]];
    _backImageView.frame = self.view.bounds;
    
    [self.view addSubview:_backImageView];
    
    // 初始化用户账号密码
    if (_userAccont == nil && _userPassword == nil) {
        [self initUserAccontAndPassword];
    }
 
    [self createTextField];
    
}

- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_accontTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}

#pragma - 创建输入框
- (void) createTextField {
    _accontTextField = [[UITextField alloc] initWithFrame:CGRectMake(45, 330, 300, 50)];
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(45, 410, 300, 50)];
    
    _accontTextField.borderStyle = UITextBorderStyleRoundedRect;
    _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    _accontTextField.backgroundColor = [UIColor whiteColor];
    _passwordTextField.backgroundColor = [UIColor whiteColor];
    
    // 加密
    _passwordTextField.secureTextEntry = YES;
    
    _accontTextField.adjustsFontSizeToFitWidth = YES;
    _passwordTextField.adjustsFontSizeToFitWidth = YES;
    
    _accontTextField.keyboardType = UIKeyboardTypeDefault;
    _passwordTextField.keyboardType = UIKeyboardTypeDefault;
    
    // 首字母大写
    _accontTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _accontTextField.delegate = self;
    _passwordTextField.delegate = self;
    
    [self.view addSubview:_accontTextField];
    [self.view addSubview:_passwordTextField];
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _enrallButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    _loginButton.frame = CGRectMake(90, 500, 80, 40);
    _enrallButton.frame = CGRectMake(210, 500, 80, 40);
    
    [_loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    [_enrallButton setTitle:@"注册" forState:UIControlStateNormal];
    [_loginButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [_enrallButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [_loginButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_enrallButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [_loginButton addTarget:self action:@selector(pressLogin) forControlEvents:UIControlEventTouchUpInside];
    [_enrallButton addTarget:self action:@selector(pressEnroll) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView* accontLogoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhanghao.png"]];
    UIImageView* passwordLogoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"password.png"]];
    
    _accontTextField.leftView = accontLogoView;
    _passwordTextField.leftView = passwordLogoView;
    _accontTextField.leftViewMode = UITextFieldViewModeAlways;
    _passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    
    
    [self.view addSubview:_enrallButton];
    [self.view addSubview:_loginButton];
}

#pragma - 登陆按钮事件
// 登陆
- (void) pressLogin {
    // 获取登陆信息
    NSString* loginAccont = _accontTextField.text;
    NSString* loginPassword = _passwordTextField.text;
    
    if (loginAccont.length != 0 && loginPassword.length != 0) {
        // 判断账号
        if ([_userAccont containsObject:loginAccont]) {
            // 账号存在
            if ([loginPassword isEqual:[_userPassword objectForKey:loginAccont]]) {
                // 密码正确
                // 登陆主页面
                MainViewController* mainViewController = [[MainViewController alloc] init];
                // 把自己传到主页面
                mainViewController.userAccont = _userAccont;
                mainViewController.userPassword = _userPassword;
                
                [self.view.window setRootViewController:mainViewController];
            } else {
                UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"账号或密码错误" preferredStyle:UIAlertControllerStyleAlert];
                
                [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil]];
                
                [self presentViewController:alert animated:YES completion:nil];
            }
        } else {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"账号或密码错误" preferredStyle:UIAlertControllerStyleAlert];
            
            [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil]];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
    } else {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请认真填写信息" preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil]];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

// 注册
- (void) pressEnroll {
    EnrollViewController* enrollViewController = [[EnrollViewController alloc] init];
    
    enrollViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    
    // 属性传值
    enrollViewController.userEnrollAccont = _userAccont;
    enrollViewController.userEnrollPassword = _userPassword;
    
    __weak typeof(self) weakSelf = self;// 修改全局属性，避免重复利用
    [enrollViewController sendUserAccontToLoginView:^(NSMutableSet* userAccont) {
        weakSelf.userAccont = userAccont;
    }];
    [enrollViewController sendUserPasswordToLoginView:^(NSMutableDictionary* userPassword) {
        weakSelf.userPassword = userPassword;
    }];
    [self presentViewController:enrollViewController animated:YES completion:nil];
}

#pragma - 初始化账号密码
- (void) initUserAccontAndPassword {
    _userAccont = [[NSMutableSet alloc] init];
    _userPassword = [[NSMutableDictionary alloc] init];
    
    [_userAccont addObject:@"sxd"];
    [_userPassword setObject:@"123" forKey:@"sxd"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
