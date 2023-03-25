//
//  UserEnrollView.h
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 设置块
    // 注册需要的信息
typedef void (^EnrollNeedInfoCompletionHandler)(NSString * _Nonnull emailString, NSString * _Nonnull passwordString, NSString * _Nonnull codeString);

// 设置全局变量
    // 通知名称
extern NSString *const enrollMessageOfGetVerCode;

@interface UserEnrollView : UIView

@property (nonatomic, strong) NSString* emailString;
@property (nonatomic, strong) NSString* passwordString;
@property (nonatomic, strong) NSString* codeString;

@property (nonatomic, strong) UIButton* enrollButton;

- (void) enrollWithEnrollNeedInfoCompletionHandler:(EnrollNeedInfoCompletionHandler)enrollNeedInfoCompletionHandler;
@end

NS_ASSUME_NONNULL_END
