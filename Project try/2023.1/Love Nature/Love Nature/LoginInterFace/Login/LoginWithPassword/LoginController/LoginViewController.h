//
//  LoginViewController.h
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/5.
//

#import <UIKit/UIKit.h>
#import "LoginView.h"

@class LoginModel;

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController

@property (nonatomic, strong) LoginView* loginView;
@property (nonatomic, strong) LoginModel* loginModel;

@end

NS_ASSUME_NONNULL_END
