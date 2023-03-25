//
//  UserView.h
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/11/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserView : UIView

@property (nonatomic, strong) UIImageView* userIconView;
@property (nonatomic, strong) UILabel* userName;

@property (nonatomic, strong) UILabel* myCollectLabel;
@property (nonatomic, strong) UILabel* commentCenterLabel;

@property (nonatomic, strong) UIButton* myCollectButton;

- (void) viewInit;

@end

NS_ASSUME_NONNULL_END
