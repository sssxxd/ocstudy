//
//  UserEnrollViewController.m
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/3.
//

#import "UserEnrollViewController.h"

// 引入视图类和模型类
#import "UserEnrollView.h"
#import "UserLoginModel.h"

// 引入工具类
#import "LNManager.h"

@interface UserEnrollViewController ()
@property (nonatomic, strong) UserEnrollView* userEnrollView;
@end

@implementation UserEnrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUserErollView];
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
- (void) initUserErollView {
    self.userEnrollView = [[UserEnrollView alloc] initWithFrame:self.view.bounds];
    
    [_userEnrollView.enrollButton addTarget:self action:@selector(pressEnrollViewEnrollButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_userEnrollView];
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// 注册通知
- (void) setNSNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getVerCode) name:enrollMessageOfGetVerCode object:nil];
}

// 获取验证码方法
- (void) getVerCode {
    [[LNManager shareLNManager] postEmail:_userEnrollView.emailString getVerCodeSucceedBlock:^(UserEnrollModel * _Nonnull userEnrollModel) {
        
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

// 注册方法
- (void) pressEnrollViewEnrollButton {
    __block NSString* localEmailString;
    __block NSString* localPasswordString;
    __block NSString* localCodeString;

    [_userEnrollView enrollWithEnrollNeedInfoCompletionHandler:^(NSString * _Nonnull emailString, NSString * _Nonnull passwordString, NSString * _Nonnull codeString) {
        
        localEmailString = emailString;
        localPasswordString = passwordString;
        localCodeString = codeString;
    }];
    
    [[LNManager shareLNManager] postEmail:localEmailString password:localPasswordString code:localCodeString enrollUserSucceedBlock:^(UserEnrollModel * _Nonnull userEnrollModel) {
        
        UIAlertController* alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleAlert];
    
        if (userEnrollModel.data) {
            // 注册成功
            alertController.title = userEnrollModel.data;
            
            UIAlertAction* action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self.navigationController popViewControllerAnimated:YES];
            }];
            [alertController addAction:action];
        } else {
            UIAlertAction* action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            
            [alertController addAction:action];
            // 注册失败
            alertController.title = userEnrollModel.msg;
        }
        
        [self presentViewController:alertController animated:YES completion:nil];
        
    } errorBlock:^(NSError * _Nonnull error) {
        NSLog(@"enroll error");
    }];
}

@end
