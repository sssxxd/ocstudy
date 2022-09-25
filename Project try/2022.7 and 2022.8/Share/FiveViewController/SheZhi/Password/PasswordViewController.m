//
//  PasswordViewController.m
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import "PasswordViewController.h"

@interface PasswordViewController ()

@end

@implementation PasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createBarButtonItem];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextField* oldPassword = [[UITextField alloc] initWithFrame:CGRectMake(20, 90, 350, 40)];
    UITextField* newPassword =  [[UITextField alloc] initWithFrame:CGRectMake(20, 130, 350, 40)];
    UITextField* aginPassword =  [[UITextField alloc] initWithFrame:CGRectMake(20, 170, 350, 40)];
    
    oldPassword.borderStyle = UITextBorderStyleRoundedRect;
    // 文本自适应大小
    oldPassword.adjustsFontSizeToFitWidth = YES;
    // 首字母不自助大写
    oldPassword.autocorrectionType = UITextAutocorrectionTypeNo;
    // 密码加密
    oldPassword.secureTextEntry = YES;
    // 设置键盘
    oldPassword.keyboardType = UIKeyboardTypeDefault;
    oldPassword.placeholder = @"6-20英文或数字组合";
    UILabel* oldlabel = [[UILabel alloc] init];
    oldlabel.text = @"旧密码";
    oldPassword.leftView = oldlabel;
    [oldPassword setLeftViewMode:UITextFieldViewModeAlways];

    newPassword.borderStyle = UITextBorderStyleRoundedRect;
    // 文本自适应大小
    newPassword.adjustsFontSizeToFitWidth = YES;
    // 首字母不自助大写
    newPassword.autocorrectionType = UITextAutocorrectionTypeNo;
    // 密码加密
    newPassword.secureTextEntry = YES;
    // 设置键盘
    newPassword.keyboardType = UIKeyboardTypeDefault;
    newPassword.placeholder = @"6-20英文或数字组合";
    UILabel* newlabel = [[UILabel alloc] init];
    newlabel.text = @"新密码";
    newPassword.leftView = newlabel;
    [newPassword setLeftViewMode:UITextFieldViewModeAlways];
    
    aginPassword.borderStyle = UITextBorderStyleRoundedRect;
    // 文本自适应大小
    aginPassword.adjustsFontSizeToFitWidth = YES;
    // 首字母不自助大写
    aginPassword.autocorrectionType = UITextAutocorrectionTypeNo;
    // 密码加密
    aginPassword.secureTextEntry = YES;
    // 设置键盘
    aginPassword.keyboardType = UIKeyboardTypeDefault;
    aginPassword.placeholder = @"请再次确认输入密码";
    UILabel* aginlabel = [[UILabel alloc] init];
    aginlabel.text = @"确认密码";
    aginPassword.leftView = aginlabel;
    [aginPassword setLeftViewMode:UITextFieldViewModeAlways];
    
    _nnewPassword = newPassword;
    _oldPassword = oldPassword;
    _aginPassword = aginPassword;
    
    [self.view addSubview:oldPassword];
    [self.view addSubview:newPassword];
    [self.view addSubview:aginPassword];
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.backgroundColor = [UIColor blackColor];
    [button setTitle:@"提交" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(150, 260, 80, 30);
    [button addTarget:self action:@selector(pressButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void) pressButton {
    if ([_nnewPassword.text isEqual:_aginPassword.text]) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"修改成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil]];
        
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"密码不一致" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil]];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_nnewPassword resignFirstResponder];
    [_oldPassword resignFirstResponder];
    [_aginPassword resignFirstResponder];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma - 导航栏按钮设计
- (void) createBarButtonItem {
    UIBarButtonItem* itemImage = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_img.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressBack)];
    
    [itemImage setTintColor:[UIColor whiteColor]];
    
    self.navigationItem.leftBarButtonItem = itemImage;
    
    
}

- (void) pressBack {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
