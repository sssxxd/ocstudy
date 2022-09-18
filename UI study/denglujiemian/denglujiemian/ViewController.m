//
//  ViewController.m
//  denglujiemian
//
//  Created by 孙旭东 on 2022/7/18.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _labelUserName = [[UILabel alloc] init];
    _labelUserName.frame = CGRectMake(20, 60, 80, 40);
    _labelUserName.text = @"用户名:";
    _labelUserName.font = [UIFont systemFontOfSize:20];
    _labelUserName.textAlignment = NSTextAlignmentLeft;
    
    _labelPassWord = [[UILabel alloc] init];
    _labelPassWord.frame = CGRectMake(20, 140, 80, 40);
    _labelPassWord.text = @"密码:";
    _labelPassWord.font = [UIFont systemFontOfSize:20];
    _labelPassWord.textAlignment = NSTextAlignmentLeft;
    
    _textFieldUserName = [[UITextField alloc] init];
    _textFieldUserName.frame = CGRectMake(120, 60, 180, 40);
    _textFieldUserName.placeholder = @"请输入用户名";
    _textFieldUserName.borderStyle = UITextBorderStyleRoundedRect;
    
    _textFieldPassWord = [[UITextField alloc] init];
    _textFieldPassWord.frame = CGRectMake(120, 140, 180, 40);
    _textFieldPassWord.placeholder = @"请输入密码";
    _textFieldPassWord.borderStyle = UITextBorderStyleRoundedRect;
    _textFieldPassWord.secureTextEntry = YES;
    
    _buttonLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _buttonLogin.frame = CGRectMake(120, 300, 80, 40);
    [_buttonLogin setTitle:@"登陆" forState:UIControlStateNormal];
    [_buttonLogin addTarget:self
                     action:@selector(pressLogin)
           forControlEvents:UIControlEventTouchUpInside];
    
    _buttonRegister = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _buttonRegister.frame = CGRectMake(120, 360, 80, 40);
    [_buttonRegister setTitle:@"注册" forState:UIControlStateNormal];
    [_buttonRegister addTarget:self
                        action:@selector(pressRegister)
              forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_labelUserName];
    [self.view addSubview:_labelPassWord];
    [self.view addSubview:_textFieldPassWord];
    [self.view addSubview:_textFieldUserName];
    [self.view addSubview:_buttonLogin];
    [self.view addSubview:_buttonRegister];
}

- (void) pressLogin {
    NSString* userName = @"sxd";
    NSString* userPassword = @"123";
    
    // 获取输入框字符串
    NSString* stringTextUserName = _textFieldUserName.text;
    NSString* stringTextPassword = _textFieldPassWord.text;
    
    if ([userName isEqual:stringTextUserName] &&
        [userPassword isEqual:stringTextPassword]) {
        NSLog(@"用户名正确");
        
        UIAlertController* alertController = [UIAlertController
                                              alertControllerWithTitle:@"提示"
                                              message:@"登陆成功"
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil]];
        
        [self presentViewController:alertController animated:YES completion:nil];
    } else {
        UIAlertController* alertController = [UIAlertController
                                              alertControllerWithTitle:@"提示"
                                              message:@"登录失败，用户名或密码错误"
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:nil]];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

- (void) pressRegister {
    
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_textFieldPassWord resignFirstResponder];
    [_textFieldUserName resignFirstResponder];
}

@end
