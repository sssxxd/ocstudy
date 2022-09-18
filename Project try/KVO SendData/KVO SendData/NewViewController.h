//
//  NewViewController.h
//  KVO SendData
//
//  Created by 孙旭东 on 2022/8/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewViewController : UIViewController
<UITextFieldDelegate>

@property (nonatomic, copy) NSString* content;
@property (nonatomic, strong) UIButton* button;
@property (nonatomic, strong) UITextField* text;


@end

NS_ASSUME_NONNULL_END
