//
//  LoginViewController.h
//  StudentSystem
//
//  Created by 孙旭东 on 2022/8/3.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "EnrollViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController
<UITextFieldDelegate>

@property (nonatomic, strong) UITextField* accontTextField;
@property (nonatomic, strong) UITextField* passwordTextField;
@property (nonatomic, strong) UIButton* loginButton;
@property (nonatomic, strong) UIButton* enrallButton;
@property (nonatomic, strong) UIImageView* backImageView;

// 账号密码
@property (nonatomic, strong) NSMutableSet* userAccont;
@property (nonatomic, strong) NSMutableDictionary* userPassword;

@end

NS_ASSUME_NONNULL_END
