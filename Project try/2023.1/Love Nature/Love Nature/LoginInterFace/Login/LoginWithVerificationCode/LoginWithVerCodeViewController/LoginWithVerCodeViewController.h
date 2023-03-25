//
//  LoginWithVerCodeViewController.h
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/7.
//

#import <UIKit/UIKit.h>
#import "LoginWithVerCodeView.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginWithVerCodeViewController : UIViewController

@property (nonatomic, strong) LoginWithVerCodeView* loginWithVerCodeView;

// 计时器
@property (nonatomic, strong) NSTimer* timer;
@property (nonatomic, assign) NSInteger seconds;

@end

NS_ASSUME_NONNULL_END
