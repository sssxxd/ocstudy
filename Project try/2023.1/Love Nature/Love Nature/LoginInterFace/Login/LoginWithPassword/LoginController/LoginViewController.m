//
//  LoginViewController.m
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/5.
//

#import "LoginViewController.h"
#import "EnrollViewController.h"
#import "LoginWithVerCodeViewController.h"
#import "UserViewController.h"
#import "UserModel.h"
#import "HomeViewController.h"
#import "ShareCircleViewController.h"

// 网络请求类
#import "Manage.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initLoginView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma - 初始化视图

- (void) initLoginView {
    self.loginView = [[LoginView alloc] initWithFrame:self.view.bounds];
    
    [self.loginView.EnrollButton addTarget:self action:@selector(pressEnrollButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.loginView.LoginButton addTarget:self action:@selector(pressLoginButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.loginView.VerCodeButton addTarget:self action:@selector(pressVerCodeButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.loginView];
}

#pragma - 按钮事件

// 注册按钮
- (void) pressEnrollButton {
    EnrollViewController* viewController = [[EnrollViewController alloc] init];
    
    viewController.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self.navigationController pushViewController:viewController animated:YES];
}

// 登陆按钮
- (void) pressLoginButton {
    [[Manage shareManage] postEmail:self.loginView.AccountTextField.text Password:self.loginView.PasswordTextField.text getLoginModelBlock:^(LoginModel * _Nonnull loginModel) {
        
        if (loginModel.code == 200) {
            self.loginModel = loginModel;
            [self createTabBarController];
        } else {
            UIAlertController* alertController = [UIAlertController alertControllerWithTitle:loginModel.msg message:nil preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
            
            [alertController addAction:action];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
        
    } andErrorBlock:^(NSError * _Nonnull error) {
        NSLog(@"Login With Password Error");
    }];
}

// 验证码登陆
- (void) pressVerCodeButton {
    LoginWithVerCodeViewController* viewController = [[LoginWithVerCodeViewController alloc] init];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void) createTabBarController {
    UITabBarController* tabBarController = [[UITabBarController alloc] init];
    
    NSMutableArray* array = [[NSMutableArray alloc] init];
    
    HomeViewController* homeViewController = [[HomeViewController alloc] init];
    UserViewController* userViewController = [[UserViewController alloc] init];
    ShareCircleViewController* shareCircleViewController = [[ShareCircleViewController alloc] init];
    
    [userViewController initUserModel];
    userViewController.userModel.nickName = self.loginModel.data.nickName;
    userViewController.userModel.token = self.loginModel.data.token;
    
    UITabBarItem* homeTabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:nil tag:0];
    UITabBarItem* userTabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:nil tag:0];
    UITabBarItem* shareCircleTabBarItem = [[UITabBarItem alloc] initWithTitle:@"分享圈" image:nil tag:0];
    
    UINavigationController* nav1 = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    
    UINavigationController* nav2 = [[UINavigationController alloc] initWithRootViewController:shareCircleViewController];
    
    UINavigationController* nav3 = [[UINavigationController alloc] initWithRootViewController:userViewController];
    
    nav1.tabBarItem = homeTabBarItem;
    nav3.tabBarItem = userTabBarItem;
    nav2.tabBarItem = shareCircleTabBarItem;
    
    [array addObject:nav1];
    [array addObject:nav2];
    [array addObject:nav3];
    
    
    tabBarController.viewControllers = array;
    
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:tabBarController];
    
    [self.view.window setRootViewController:navigationController];
}

@end
