//
//  VView.h
//  MVCsample
//
//  Created by 孙旭东 on 2022/9/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VView : UIView

@property (nonatomic, strong) UIButton* redButton;
@property (nonatomic, strong) UIButton* blueButton;

- (void) viewInit;
@end

NS_ASSUME_NONNULL_END
