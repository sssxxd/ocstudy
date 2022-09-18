//
//  LoginViewController.h
//  KaoHe
//
//  Created by 孙旭东 on 2022/8/5.
//

#import <UIKit/UIKit.h>
#import "EnrollViewController.h"
#import "MainViewController.h"
#import "SearchViewController.h"
#import "FirendsViewController.h"
#import "XiaoViewController.h"
#import "LastViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController
<SendAccontToLoginViewController>

@property (nonatomic, strong) UITextField* userAccont;
@property (nonatomic, strong) UITextField* userPassword;
@property (nonatomic, strong) UIButton* loginButton;
@property (nonatomic, strong) UIButton* enrollButton;

@property (nonatomic, strong) NSMutableArray* accontData;
@property (nonatomic, strong) NSMutableArray* passwordData;

@property (nonatomic, strong) UITabBarController* tabBarController;

@property (nonatomic, strong) NSMutableArray* arrayViewControllers;

@end

NS_ASSUME_NONNULL_END
