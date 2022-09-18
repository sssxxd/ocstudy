//
//  NewViewController.m
//  KVO SendData
//
//  Created by 孙旭东 on 2022/8/5.
//

#import "NewViewController.h"

@interface NewViewController ()

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button.backgroundColor = [UIColor blueColor];
    _button.frame = CGRectMake(100, 100, 30, 30);
    [_button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
    _text = [[UITextField alloc] initWithFrame:CGRectMake(100, 200, 200, 20)];
    _text.keyboardType = UIKeyboardTypeDefault;
    _text.borderStyle = UITextBorderStyleRoundedRect;
    _text.delegate = self;
    [self.view addSubview:_text];
}

- (void) pressButton:(UIButton*)button {
    self.content = _text.text;
    [self dismissViewControllerAnimated:YES completion:nil];
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
