//
//  UserMainViewController.m
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/1/31.
//

#import "UserMainViewController.h"

// 引入工具类
#import "LNManager.h"

// 引入视图类
#import "UserMainView.h"

// 引入模型类
#import "UserMainModel.h"
#import "UserLoginModel.h"

// 引入视图控制器
#import "UserLoginViewController.h"
#import "UserMainSettingViewController.h"

// 引入全局变量
extern NSString *const UserMainViewUserInfoTableViewCellEditUserInfo;
extern NSString *const UserMainViewUserInfoTableViewCellUpDataIcon;
extern NSString *const UserMainViewUserInfoTableViewCellSetting;

@interface UserMainViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
// 视图和模型属性
@property (nonatomic, strong) UserMainView* userMainView;
@property (nonatomic, strong) UserMainModel* userMainModel;

@property (nonatomic, strong) UIBarButtonItem* moreItem;
@property (nonatomic, strong) UIBarButtonItem* shareItem;
@end

@implementation UserMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavSubViews];
    [self initUserMainView];
    [self initUserMainModel];
    
    [self addNotification];
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// 初始化模型
- (void) initUserMainModel {
    self.userMainModel = [[UserMainModel alloc] init];
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    if (_userMainModel.nickName) {
        [[LNManager shareLNManager] getUserInfoWithNickName:_userMainModel.nickName AndToken:_userMainModel.token UserInfoModelBlock:^(UserInfoModel * _Nonnull userInfoModel) {
            
            self.userMainModel.userInfoModel = userInfoModel;

            dispatch_group_leave(group);
        } ErrorBlack:^(NSError * _Nonnull error) {
            NSLog(@"getUserInfoWithNickName error");
            dispatch_group_leave(group);
        }];
    }
    
    dispatch_group_notify(group, dispatch_queue_create(0, 0), ^{
        if (self.userMainModel.userInfoModel.data != nil) {
            NSMutableArray* array2 = [[NSMutableArray alloc] init];
            for (int i = 0; i < 6; i++) {
                UserContentDataModel* data = [[UserContentDataModel alloc] init];
                if (i == 0) {
                    data.userName = @"铲屎官";
                    data.title = @"是会跳伞的兔子嘞";
                    data.mainImage = @"WechatIMG1497";
                    data.userIcon = @"userIcon.jpeg";
                } else if (i == 1) {
                    data.userName = @"铲屎官";
                    data.title = @"晒太阳的羊驼";
                    data.mainImage = @"WechatIMG1498";
                    data.userIcon = @"userIcon.jpeg";
                } else if (i == 2) {
                    data.userName = @"铲屎官";
                    data.title = @"可爱可爱的荷兰猪";
                    data.mainImage = @"WechatIMG1499";
                    data.userIcon = @"userIcon.jpeg";
                } else {
                    data.userName = @"铲屎官";
                    data.title = @"杯子里的刺猬";
                    data.mainImage = @"WechatIMG1500";
                    data.userIcon = @"userIcon.jpeg";
                }
                
                [array2 addObject:data];
            }
            self.userMainModel.userPetFileContentModel.data = (NSArray<UserContentDataModel>*)array2;
            self.userMainModel.userCollectContentModel.data = (NSArray<UserContentDataModel>*)array2;
            self.userMainModel.userLikeContentModel.data = (NSArray<UserContentDataModel>*)array2;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.userMainView.userInfoDataModel = self.userMainModel.userInfoModel.data;
            self.userMainView.userPetFileContentDataArray = (NSArray*)self.userMainModel.userPetFileContentModel.data;
            self.userMainView.userCollectContentDataArray = (NSArray*)self.userMainModel.userPetFileContentModel.data;
            self.userMainView.userLikeContentDataArray = (NSArray*)self.userMainModel.userPetFileContentModel.data;
            [self.userMainView reloadTableView];
        });
    });
}

// 初始化视图
- (void) initUserMainView {
    self.userMainView = [[UserMainView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:_userMainView];
}

- (void) initNavSubViews {
    self.navigationItem.leftBarButtonItem = self.moreItem;
    self.navigationItem.rightBarButtonItem = self.shareItem;
}


// 设置通知
- (void) addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getMessageOfToLogin) name:messageOfToLogin object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(UserLoginViewControllerLoginSucceedWithNotification:) name:UserLoginViewControllerLoginSucceed object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(exitLogout) name:TuiChuDengLu object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(UpDataUserIcon) name:UserMainViewUserInfoTableViewCellUpDataIcon object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(createUserSettingViewController) name:UserMainViewUserInfoTableViewCellSetting object:nil];
}

#pragma mark - 通知方法

// 打开设置界面
- (void) createUserSettingViewController {
    UserMainSettingViewController* viewController = [[UserMainSettingViewController alloc] init];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

// 编辑个人信息
- (void) createEditUserInfoViewController {
    
}

// 换头像
- (void) UpDataUserIcon {
    if (self.userMainModel.userInfoModel.data == nil) {
        [self getMessageOfToLogin];
    } else {
        UIImagePickerController* picker = [[UIImagePickerController alloc] init];
        
        [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        
        picker.delegate = self;
        
        [self presentViewController:picker animated:YES completion:nil];
    }
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    
    UIImage* image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [[LNManager shareLNManager] postUserIconImage:image withNickName:_userMainModel.nickName token:_userMainModel.token SucceedBlock:^(EditUserInfoModel * _Nonnull editUserInfoModel) {

        [self reloadUserMainModel];
    } errorBlock:^(NSError * _Nonnull error) {
        NSLog(@"postIcon error");
    }];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

// 打开登陆界面的通知触发的方法
- (void) getMessageOfToLogin {
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"用户未登陆" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* actionLogin = [UIAlertAction actionWithTitle:@"登陆" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self initUserLoginViewController];
    }];
    
    UIAlertAction* actionCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alertController addAction:actionLogin];
    [alertController addAction:actionCancel];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

// 初始化登陆界面
- (void) initUserLoginViewController {
    UserLoginViewController* viewController = [[UserLoginViewController alloc] init];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

// 登陆成功触发方法
- (void) UserLoginViewControllerLoginSucceedWithNotification:(NSNotification*)notification {
    _userMainModel.nickName = notification.userInfo[@"nickName"];
    _userMainModel.token = notification.userInfo[@"token"];
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    [[LNManager shareLNManager] getUserInfoWithNickName:_userMainModel.nickName AndToken:_userMainModel.token UserInfoModelBlock:^(UserInfoModel * _Nonnull userInfoModel) {
        self.userMainModel.userInfoModel = userInfoModel;
        
        self.userMainView.userInfoDataModel = userInfoModel.data;
        
        dispatch_group_leave(group);
    } ErrorBlack:^(NSError * _Nonnull error) {
        NSLog(@"getUserInfoWithNickName error");
        dispatch_group_leave(group);
    }];
    
    dispatch_group_notify(group, dispatch_queue_create(0, 0), ^{
        if (self.userMainModel.userInfoModel != nil) {
            NSMutableArray* array2 = [[NSMutableArray alloc] init];
            for (int i = 0; i < 6; i++) {
                UserContentDataModel* data = [[UserContentDataModel alloc] init];
                if (i == 0) {
                    data.userName = @"铲屎官";
                    data.title = @"是会跳伞的兔子嘞";
                    data.mainImage = @"WechatIMG1497";
                    data.userIcon = @"userIcon.jpeg";
                } else if (i == 1) {
                    data.userName = @"铲屎官";
                    data.title = @"晒太阳的羊驼";
                    data.mainImage = @"WechatIMG1498";
                    data.userIcon = @"userIcon.jpeg";
                } else if (i == 2) {
                    data.userName = @"铲屎官";
                    data.title = @"可爱可爱的荷兰猪";
                    data.mainImage = @"WechatIMG1499";
                    data.userIcon = @"userIcon.jpeg";
                } else {
                    data.userName = @"铲屎官";
                    data.title = @"杯子里的刺猬";
                    data.mainImage = @"WechatIMG1500";
                    data.userIcon = @"userIcon.jpeg";
                }
                
                [array2 addObject:data];
            }
            self.userMainModel.userPetFileContentModel.data = (NSArray<UserContentDataModel>*)array2;
            self.userMainModel.userCollectContentModel.data = (NSArray<UserContentDataModel>*)array2;
            self.userMainModel.userLikeContentModel.data = (NSArray<UserContentDataModel>*)array2;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.userMainView.userPetFileContentDataArray = (NSArray*)self.userMainModel.userPetFileContentModel.data;
            self.userMainView.userCollectContentDataArray = (NSArray*)self.userMainModel.userPetFileContentModel.data;
            self.userMainView.userLikeContentDataArray = (NSArray*)self.userMainModel.userPetFileContentModel.data;
            [self.userMainView reloadTableView];
            
            [self.userMainModel saveUserInfoNickName:self.userMainModel.nickName token:self.userMainModel.token icon:self.userMainModel.userInfoModel.data.icon];
        });
    });
}

- (void) exitLogout {
    [[LNManager shareLNManager] postNickName:_userMainModel.nickName token:_userMainModel.token exitUserSucceedBlock:^(UserEnrollModel * _Nonnull userEnrollModel) {
        
        NSString* alertTitle = nil;
        if (userEnrollModel.data) {
            alertTitle = userEnrollModel.data;
        } else {
            alertTitle = userEnrollModel.msg;
        }
        
        UIAlertController* alertController = [UIAlertController alertControllerWithTitle:alertTitle message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self reloadUserMainModel];
            });
        }];
        
        [alertController addAction:action];
        
        [self presentViewController:alertController animated:YES completion:nil];
    } errorBlock:^(NSError * _Nonnull error) {
        NSLog(@"exitUser error");
    }];
}

- (void) reloadUserMainModel {
    if (_userMainModel.nickName) {
        [[LNManager shareLNManager] getUserInfoWithNickName:_userMainModel.nickName AndToken:_userMainModel.token UserInfoModelBlock:^(UserInfoModel * _Nonnull userInfoModel) {
            
            self.userMainModel.userInfoModel = userInfoModel;
            
            self.userMainView.userInfoDataModel = userInfoModel.data;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.userMainView reloadTableView];
            });
        } ErrorBlack:^(NSError * _Nonnull error) {
            NSLog(@"getUserInfoWithNickName error");
        }];
    }
}

#pragma mark - 懒加载

- (UIBarButtonItem*) moreItem {
    if (_moreItem == nil) {
        self.moreItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"gengduomore-1.png"] style:UIBarButtonItemStyleDone target:self action:nil];
        
        _moreItem.tintColor = [UIColor blackColor];
    }
    return _moreItem;
}

- (UIBarButtonItem*) shareItem {
    if (_shareItem == nil) {
        self.shareItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"share.png"] style:UIBarButtonItemStyleDone target:self action:nil];
        
        _shareItem.tintColor = [UIColor blackColor];
    }
    return _shareItem;
}

@end
