//
//  KaiJiViewController.h
//  Share
//
//  Created by 孙旭东 on 2022/7/27.
//

#import <UIKit/UIKit.h>
#import "MYTextField.h"
#import "EnrollViewController.h"
#define UNCHECKED 0

NS_ASSUME_NONNULL_BEGIN

@protocol KaiJiLongin <NSObject>

- (void) KaiJiongin;

@end


@interface KaiJiViewController : UIViewController
<RegisterViewControllerDelegate, UITextFieldDelegate> {
    NSMutableArray* _accontString;
    NSMutableArray* _passwordString;
}

@property (nonatomic, strong) MYTextField* accont;
@property (nonatomic, strong) MYTextField* password;
@property (nonatomic, strong) UIButton* buttonAutoLogin;
@property (nonatomic, strong) UIImageView* launchImageViewLogin;
@property (nonatomic, strong) UIImageView* LoginLogo;
@property (nonatomic, strong) UILabel* labelTitle;
@property (nonatomic, strong) UIButton* buttonLogin;
@property (nonatomic, strong) UIButton* buttonEnroll;
@property (nonatomic, strong) UILabel* label;

@property (nonnull, strong) id<KaiJiLongin> delegate;

@end

NS_ASSUME_NONNULL_END
