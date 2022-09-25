//
//  MyInformationCell.h
//  Project01
//
//  Created by 孙旭东 on 2022/7/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyInformationCell : UITableViewCell

@property (nonatomic, weak) UIImageView* iconView;
@property (nonatomic, weak) UILabel* userName;
@property (nonatomic, weak) UILabel* accont;
@property (nonatomic, weak) UILabel* cueAccontCard;
@property (nonatomic, weak) UIView* userState;
@property (nonatomic, weak) UIView* userFriendsState;
@property (nonatomic, weak) UIImageView* QRCode;
@property (nonatomic, weak) UIButton* cradArrow;

// 创建用户状态按钮
- (void) createUserStateButton;
// 创建用户朋友状态按钮
- (void) createUserFriendsStateButtonWithNumberOfFriends:(NSInteger)numberOfFriends;

@end

NS_ASSUME_NONNULL_END
