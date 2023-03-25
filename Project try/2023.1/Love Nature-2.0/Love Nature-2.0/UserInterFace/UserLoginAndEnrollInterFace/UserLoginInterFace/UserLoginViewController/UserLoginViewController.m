//
//  UserLoginViewController.m
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/1.
//

#import "UserLoginViewController.h"

// 引入视图和模型
#import "UserLoginView.h"
#import "UserLoginModel.h"

// 引入工具类
#import "LNManager.h"

// 引入注册页面视图控制器
#import "UserEnrollViewController.h"

// 设置全局变量
    // 通知名称
NSString *const UserLoginViewControllerLoginSucceed = @"UserLoginViewControllerLoginSucceed";

@interface UserLoginViewController ()
@property (nonatomic, strong) UserLoginView* userLoginView;
@end

@implementation UserLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUserLoginView];
    [self setNSNotification];
    
    [self createBackItem];
}

// 设置Item
- (void) createBackItem {
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fanhui.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressBackItem)];
    
    item.tintColor = [UIColor blackColor];
    
    self.navigationItem.leftBarButtonItem = item;
}

- (void) pressBackItem {
    [self.navigationController popViewControllerAnimated:YES];
}

// 初始化视图
- (void) initUserLoginView {
    self.userLoginView = [[UserLoginView alloc] initWithFrame:self.view.bounds];
    
    [_userLoginView.loginButton addTarget:self action:@selector(pressUserLoginViewLoginButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_userLoginView];
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// 注册通知
- (void) setNSNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getVerCode) name:loginMessageOfGetVerCode object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openEnrollViewController) name:messageOfOpenEnrollViewController object:nil];
}

// 获取验证码方法
- (void) getVerCode {
    [[LNManager shareLNManager] postEmail:_userLoginView.emailString getVerCodeSucceedBlock:^(UserEnrollModel * _Nonnull userEnrollModel) {
        
        if (userEnrollModel.data == nil) {
            UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"发送失败" message:userEnrollModel.msg preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            
            [alertController addAction:action];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
        
    } errorBlock:^(NSError * _Nonnull error) {
        NSLog(@"get VerCode error");
    }];
}

// 打开注册页面视图控制器
- (void) openEnrollViewController {
    UserEnrollViewController* viewController = [[UserEnrollViewController alloc] init];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

// 登陆方法
- (void) pressUserLoginViewLoginButton {
    __block NSString* localEmailString;
    __block NSString* localPassowrdOrCodeString;
    __block UserLoginViewLoginMethod localUserLoginViewMethod;
    
    [_userLoginView loginNeedInfoCompletionHandler:^(NSString * _Nonnull emailString, NSString * _Nonnull passwordOrCodeString, UserLoginViewLoginMethod userLoginViewMethod) {
        
        localEmailString = emailString;
        localPassowrdOrCodeString = passwordOrCodeString;
        localUserLoginViewMethod = userLoginViewMethod;
    }];
    
    switch (localUserLoginViewMethod) {
        case UserLoginViewLoginMethodPassword:
            [self loginWithEmail:localEmailString Password:localPassowrdOrCodeString];
            break;
        case UserLoginViewLoginMethodVerCode:
            [self loginWithEmail:localEmailString VerCode:localPassowrdOrCodeString];
            break;
    }
}

// 密码登陆
- (void) loginWithEmail:(NSString*)emailString Password:(NSString*)passwordString {
    [[LNManager shareLNManager] postEmail:emailString password:passwordString loginUserSucceedBlock:^(UserLoginModel * _Nonnull userLoginModel) {

        if (userLoginModel.data) {
            [[NSNotificationCenter defaultCenter] postNotificationName:UserLoginViewControllerLoginSucceed object:nil userInfo:@{@"nickName":userLoginModel.data.nickName, @"token":userLoginModel.data.token}];
            
            [self.navigationController popViewControllerAnimated:YES];
        } else {
            UIAlertController* alertController = [UIAlertController alertControllerWithTitle:userLoginModel.msg message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            
            [alertController addAction:action];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
        
    } errorBlock:^(NSError * _Nonnull error) {
        NSLog(@"user Login error");
    }];
}

// 验证码登陆
- (void) loginWithEmail:(NSString*)emailString VerCode:(NSString*)verCodeString {
    [[LNManager shareLNManager] postEmail:emailString code:verCodeString loginUserSucceedBlock:^(UserLoginModel * _Nonnull userLoginModel) {
        if (userLoginModel.data) {
            [[NSNotificationCenter defaultCenter] postNotificationName:UserLoginViewControllerLoginSucceed object:nil userInfo:@{@"nickName":userLoginModel.data.nickName, @"token":userLoginModel.data.token}];
            
            [self.navigationController popViewControllerAnimated:YES];
        } else {
            UIAlertController* alertController = [UIAlertController alertControllerWithTitle:userLoginModel.msg message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            
            [alertController addAction:action];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
        
    } errorBlock:^(NSError * _Nonnull error) {
        NSLog(@"user Login error");
    }];
}

@end
