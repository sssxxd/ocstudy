//
//  UserViewController.h
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/7.
//

#import <UIKit/UIKit.h>

@class UserModel;

@class UserView;

NS_ASSUME_NONNULL_BEGIN

@interface UserViewController : UIViewController

@property (nonatomic, strong) UserModel* userModel;
@property (nonatomic, strong) UserView* userView;

- (void) initUserModel;

@end

NS_ASSUME_NONNULL_END
