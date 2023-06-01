//
//  Manage.h
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/6.
//

#import <UIKit/UIKit.h>

// 注册模块
#import "EnrollModel.h"
typedef void (^EnrollModelBlock)(EnrollModel * _Nonnull enrollModel);

// 登陆模块
#import "LoginModel.h"
typedef void (^LoginModelBlock)(LoginModel * _Nonnull loginModel);

NS_ASSUME_NONNULL_BEGIN

// 用户信息模块
@class  UserInfoModel;
typedef void (^UserInfoModelBlock)(UserInfoModel * _Nonnull userInfoModel);

typedef void (^ErrorBlock)(NSError * _Nonnull error);

@interface Manage : NSObject

+ (instancetype) shareManage;

// 请求验证码
- (void) postEmail:(NSString*)email getVerificationCodeWithEnrollModelBlock:(EnrollModelBlock)enrollModelBlock andErrorBlock:(ErrorBlock)errorBLock;

// 注册
- (void) postEmail:(NSString*)email Password:(NSString*)Password VerificationCode:(NSString*)code getEnrollModelBlock:(EnrollModelBlock)enrollModelBlock andErrorBlock:(ErrorBlock)errorBlock;

// 密码登陆
- (void) postEmail:(NSString*)email Password:(NSString*)Password getLoginModelBlock:(LoginModelBlock)loginModelBlock andErrorBlock:(ErrorBlock)errorBlock;

// 验证码登陆
- (void) postEmail:(NSString*)email VerCode:(NSString*)VerCode getLoginModeBlock:(LoginModelBlock)loginModelBlock andErrorBlock:(ErrorBlock)errorBlock;

// 加载网络图片
- (void) setUIImageView:(UIImageView*)imageView withURL:(NSString*)string;

// 获取用户信息
- (void) getUserInfoWithNickName:(NSString*)nickName Token:(NSString*)token UserInfoData:(UserInfoModelBlock)succeedBlock andErrorBlock:(ErrorBlock)errorBlock;

@end

NS_ASSUME_NONNULL_END
