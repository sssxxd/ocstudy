//
//  LoginView.h
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginView : UIView

// label
@property (nonatomic, strong) UILabel* AccountLabel;
@property (nonatomic, strong) UILabel* PasswordLabel;
@property (nonatomic, strong) UILabel* TitleLabel;

// textField
@property (nonatomic, strong) UITextField* AccountTextField;
@property (nonatomic, strong) UITextField* PasswordTextField;

// Button
@property (nonatomic, strong) UIButton* LoginButton;
@property (nonatomic, strong) UIButton* EnrollButton;
@property (nonatomic, strong) UIButton* VerCodeButton;

@end

NS_ASSUME_NONNULL_END
