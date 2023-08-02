//
//  MyViewController.h
//  NSNotification
//
//  Created by 孙旭东 on 2023/7/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MyViewControllerDelegate <NSObject>

- (void)changUILabelText:(NSString *)string;

@end

@interface MyViewController : UIViewController
@property (nonatomic, weak) id<MyViewControllerDelegate> delegate;

@property (nonatomic, strong) UITextField *myTextField;
@end

NS_ASSUME_NONNULL_END
