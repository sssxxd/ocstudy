//
//  LoginWithVerCodeView.h
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginWithVerCodeView : UIView

// label
@property (nonatomic, strong) UILabel* TitleLabel;
@property (nonatomic, strong) UILabel* AccountLabel;
@property (nonatomic, strong) UILabel* VerCodeLabel;

// textField
@property (nonatomic, strong) UITextField* AccountTextField;
@property (nonatomic, strong) UITextField* VerCodeTextField;

// button
@property (nonatomic, strong) UIButton* LoginButton;
@property (nonatomic, strong) UIButton* VerCodeButton;

@end

NS_ASSUME_NONNULL_END
