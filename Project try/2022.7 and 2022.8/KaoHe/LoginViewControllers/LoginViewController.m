//
//  LoginViewController.m
//  KaoHe
//
//  Created by 孙旭东 on 2022/8/5.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    if (_accontData == nil && _passwordData == nil) {
        [self initAccontAndPassword];
    }
    
    [self createTextField];
    
    [self createButtons];
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

- (void) createButtons {
    _loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _enrollButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    _loginButton.frame = CGRectMake(100, 380, 100, 30);
    _enrollButton.frame = CGRectMake(230, 380, 100, 30);
    
    [_enrollButton addTarget:self action:@selector(pressEnroll) forControlEvents:UIControlEventTouchUpInside];
    [_loginButton addTarget:self action:@selector(pressLogin) forControlEvents:UIControlEventTouchUpInside];
    
    [_loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    [_enrollButton setTitle:@"注册" forState:UIControlStateNormal];
    
    [self.view addSubview:_loginButton];
    [self.view addSubview:_enrollButton];
}

- (void) initAccontAndPassword {
    _accontData = [[NSMutableArray alloc] init];
    _passwordData = [[NSMutableArray alloc] init];
    
    [_accontData addObject:@"iOSnb123"];
    [_passwordData addObject:@"123456789"];
    
    [_accontData addObject:@"W"];
    [_passwordData addObject:@"W"];
}

- (void) pressEnroll {
    EnrollViewController* enrollViewController = [[EnrollViewController alloc] init];
    enrollViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    
    enrollViewController.accontData = self.accontData;
    enrollViewController.passwordData = self.passwordData;
    enrollViewController.delegate = self;
    
    [self presentViewController:enrollViewController animated:YES completion:nil];
}

- (void) pressLogin {
    NSString* accont = _userAccont.text;
    NSString* password = _userPassword.text;
    
    for (id object in _accontData) {
        if ([accont isEqual:object]) {
            NSInteger index = [_accontData indexOfObject:accont];
            if ([password isEqual:[_passwordData objectAtIndex:index]]) {
                [self createTabBarController];
                
                self.view.window.rootViewController = _tabBarController;
            }
        }
    }
}

- (void) sendAccontData:(NSMutableArray *)accontData {
    self.accontData = accontData;
    
    _userAccont.text = [accontData lastObject];
}

- (void) sendPasswordData:(NSMutableArray *)passwordData {
    self.passwordData = passwordData;
}



- (void) createTabBarController {
    _tabBarController = [[UITabBarController alloc] init];
    _tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
    
    
    _arrayViewControllers = [[NSMutableArray alloc] init];
    
    [self creatMainViewController];
    [self creatSearchViewController];
    [self creatFirendsViewController];
    [self creatXiaoViewController];
    [self creatLastViewController];
    
    _tabBarController.viewControllers = _arrayViewControllers;
}

- (void) creatMainViewController {
    MainViewController* mainViewController = [[MainViewController alloc] init];
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    navigationController.title = @"视图一";
    [_arrayViewControllers addObject:navigationController];
}

- (void) creatSearchViewController {
    SearchViewController* searchViewController = [[SearchViewController alloc] init];
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:searchViewController];
    navigationController.title = @"视图二";
    [_arrayViewControllers addObject:navigationController];
}

- (void) creatFirendsViewController {
    FirendsViewController* ViewController = [[FirendsViewController alloc] init];
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:ViewController];
    navigationController.title = @"视图三";
    [_arrayViewControllers addObject:navigationController];
}

- (void) creatXiaoViewController {
    XiaoViewController* ViewController = [[XiaoViewController alloc] init];
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:ViewController];
    navigationController.title = @"视图四";
    [_arrayViewControllers addObject:navigationController];
}

- (void) creatLastViewController {
    LastViewController* ViewController = [[LastViewController alloc] init];
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:ViewController];
    navigationController.title = @"视图五";
    [_arrayViewControllers addObject:navigationController];
}

@end
