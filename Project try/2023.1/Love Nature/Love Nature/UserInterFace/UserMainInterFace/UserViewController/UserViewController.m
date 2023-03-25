//
//  UserViewController.m
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/7.
//

#import "UserViewController.h"
#import "Manage.h"

#import "UserView.h"
#import "UserModel.h"

@interface UserViewController ()

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的";
    
    [self initUserView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma  - 初始化视图
- (void) initUserView {
    [[Manage shareManage] getUserInfoWithNickName:_userModel.nickName Token:_userModel.token UserInfoData:^(UserInfoModel * _Nonnull userInfoModel) {
        
        self.userModel.userInfoModel = userInfoModel;
        
        self.userView.userData = userInfoModel.data;
        
        [self.userView reloadtableView];
        
        NSLog(@"%@", userInfoModel);
        
    } andErrorBlock:^(NSError * _Nonnull error) {
        NSLog(@"get UserInfo Error");
    }];
    
    self.userView = [[UserView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:self.userView];
}

#pragma - 初始化模组
- (void) initUserModel {
    self.userModel = [[UserModel alloc] init];
}


@end
