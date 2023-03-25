//
//  UserLoginView.h
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 枚举登陆状态
typedef NS_ENUM(NSUInteger, UserLoginViewLoginMethod) {
    UserLoginViewLoginMethodPassword,
    UserLoginViewLoginMethodVerCode,
};

// 设置块
    // 登陆需要的信息
typedef void (^LoginNeedInfoCompletionHandler)(NSString * _Nonnull emailString, NSString * _Nonnull passwordOrCodeString, UserLoginViewLoginMethod userLoginViewMethod);

// 引入全局变量
    // 通知名称
extern NSString *const loginMessageOfGetVerCode;
extern NSString *const messageOfOpenEnrollViewController;

@interface UserLoginView : UIView

@property (nonatomic, strong) NSString* emailString;
@property (nonatomic, strong) NSString* passwordOrCodeString;

// 注册按钮和登陆按钮
@property (nonatomic, strong) UIButton* loginButton;
@property (nonatomic, strong) UIButton* enrollButton;

- (void) loginNeedInfoCompletionHandler:(LoginNeedInfoCompletionHandler)handler;

@end

NS_ASSUME_NONNULL_END
