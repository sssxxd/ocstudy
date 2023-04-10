//
//  UpDataView.h
//  Find
//
//  Created by 孙旭东 on 2023/3/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 全局变量
extern NSString *const UpDataViewaddImageButtonPressed;
extern NSString *const UpDataViewaddressButtonPressed;

@interface UpDataView : UIView

@property (nonatomic, strong, readonly) UITextField* titleTextField;
@property (nonatomic, strong, readonly) UITextView* textTextField;
@property (nonatomic, strong) NSMutableArray* imageArray;
@property (nonatomic, strong) UILabel* addressLabel;

- (void) layoutImageView;
@end

NS_ASSUME_NONNULL_END
