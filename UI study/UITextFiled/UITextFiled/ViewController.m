//
//  ViewController.m
//  UITextFiled
//
//  Created by 孙旭东 on 2022/7/18.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize  textField = _textField;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.textField = [[UITextField alloc] init];
    
    self.textField.frame = CGRectMake(100, 100, 200, 50);
    
    self.textField.text = @"用户名";
    
    self.textField.font = [UIFont systemFontOfSize:15] ;
    
    self.textField.textColor = [UIColor redColor];
    
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    
    self.textField.keyboardType = UIKeyboardTypeDefault;
    
    // 当属性为空时，显示词条信息
    self.textField.placeholder = @"请输入用户名";
    
    // 是否作为密码输入
    self.textField.secureTextEntry = NO;
    
    [self.view addSubview:self.textField];
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textField resignFirstResponder];
}

@end
