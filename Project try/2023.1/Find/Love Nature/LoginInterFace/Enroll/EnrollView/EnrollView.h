//
//  EnrollView.h
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EnrollView : UIView

// label
@property (nonatomic, strong) UILabel* TitleLabel;
@property (nonatomic, strong) UILabel* AccountLabel;
@property (nonatomic, strong) UILabel* PasswordLabel;
@property (nonatomic, strong) UILabel* RePasswordLabel;
@property (nonatomic, strong) UILabel* VerificationCodeLabel;

// textField
@property (nonatomic, strong) UITextField* AccountTextField;
@property (nonatomic, strong) UITextField* PasswordTextField;
@property (nonatomic, strong) UITextField* RePasswordTextField;
@property (nonatomic, strong) UITextField* VerificationCodeTextField;

// button
@property (nonatomic, strong) UIButton* EnrollButton;
@property (nonatomic, strong) UIButton* VerificationCodeButton;

@end

NS_ASSUME_NONNULL_END
