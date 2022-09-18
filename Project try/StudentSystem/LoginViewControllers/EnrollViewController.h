//
//  EnrollViewController.h
//  StudentSystem
//
//  Created by 孙旭东 on 2022/8/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^UserAccontBlock)(NSMutableSet* userAccont);
typedef void(^UserPasswordBlock)(NSMutableDictionary* userPassword);

@interface EnrollViewController : UIViewController
<UITextFieldDelegate>

@property (nonatomic, strong) UIImageView* backImageView;
@property (nonatomic, strong) UITextField* userEmail;
@property (nonatomic, strong) UITextField* userAccont;
@property (nonatomic, strong) UITextField* userPassword;
@property (nonatomic, strong) UIButton* enrollButton;

// 账号密码
@property (nonatomic, strong) NSMutableSet* userEnrollAccont;
@property (nonatomic, strong) NSMutableDictionary* userEnrollPassword;

// block传值
@property (nonatomic, copy) UserAccontBlock userAccontBlock;
@property (nonatomic, copy) UserPasswordBlock userPasswordBlock;
- (void) sendUserAccontToLoginView:(UserAccontBlock)block;
- (void) sendUserPasswordToLoginView:(UserPasswordBlock)block;

@end

NS_ASSUME_NONNULL_END
