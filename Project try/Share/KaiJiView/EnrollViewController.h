//
//  EnrollViewController.h
//  Share
//
//  Created by 孙旭东 on 2022/7/29.
//

#import <UIKit/UIKit.h>
#import "MYTextField.h"

NS_ASSUME_NONNULL_BEGIN

@protocol RegisterViewControllerDelegate <NSObject>
-(void)pushAccontText:(NSString*)accontText;
-(void)pushPasswordText:(NSString*)passwordText;
@end

@interface EnrollViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) MYTextField* accont;
@property (nonatomic, strong) MYTextField* password;
@property (nonatomic, strong) MYTextField* Email;
@property (nonatomic, strong) UIImageView* LoginLogo;
@property (nonatomic, strong) UILabel* labelTitle;
@property (nonatomic, strong) UIButton* enrollButton;

@property id<RegisterViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
