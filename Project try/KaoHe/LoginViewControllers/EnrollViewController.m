//
//  EnrollViewController.m
//  KaoHe
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
    
    self.view.backgroundColor = [UIColor blueColor];
    
    [self createTextField];
    
    [self createButton];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) createTextField {
    _userAccont = [[UITextField alloc] initWithFrame:CGRectMake(45, 200, 300, 50)];
    _userPassword = [[UITextField alloc] initWithFrame:CGRectMake(45, 280, 300, 50)];
    
    _userAccont.borderStyle = UITextBorderStyleRoundedRect;
    _userPassword.borderStyle = UITextBorderStyleRoundedRect;
    
    _userAccont.keyboardType = UIKeyboardTypeDefault;
    _userPassword.keyboardType = UIKeyboardTypeDefault;
    
    _userAccont.placeholder = @"请输入账号";
    _userPassword.placeholder = @"请输入密码";
    
    [self.view addSubview:_userAccont];
    [self.view addSubview:_userPassword];
}

- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_userAccont resignFirstResponder];
    [_userPassword resignFirstResponder];
}

- (void) createButton {
    _enrollButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _enrollButton.frame = CGRectMake(150, 360, 100, 30);
    [_enrollButton setTitle:@"确认注册" forState:UIControlStateNormal];
    
    [_enrollButton addTarget:self action:@selector(pressEnroll) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_enrollButton];
}

- (void) pressEnroll {
    NSString* accont = _userAccont.text;
    NSString* password = _userPassword.text;
    
    if (accont.length && password.length) {
        [_accontData addObject:accont];
        [_passwordData addObject:password];
        
        [self.delegate sendAccontData:_accontData];
        [self.delegate sendPasswordData:_passwordData];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}



@end
