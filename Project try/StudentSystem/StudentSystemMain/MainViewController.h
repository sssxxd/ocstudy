//
//  MainViewController.h
//  StudentSystem
//
//  Created by 孙旭东 on 2022/8/4.
//

#import <UIKit/UIKit.h>
#import "StudentsTableViewCell.h"
#import "LoginViewController.h"
#import "AddViewController.h"
#import "FindViewController.h"
#import "DeleteViewController.h"
#import "ChangeViewController.h"
#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@class LoginViewController;

@interface MainViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UIButton* addButton;
@property (nonatomic, strong) UIButton* deleteButton;
@property (nonatomic, strong) UIButton* changeButton;
@property (nonatomic, strong) UIButton* findButton;
@property (nonatomic, strong) UIButton* exitButton;
@property (nonatomic, strong) UIButton* sortButton;
@property (nonatomic, strong) UIImageView* backImageView;
@property (nonatomic, strong) NSMutableArray* studentData;

// 账号密码属性
@property (nonatomic, strong) NSMutableSet* userAccont;
@property (nonatomic, strong) NSMutableDictionary* userPassword;


@end

NS_ASSUME_NONNULL_END
