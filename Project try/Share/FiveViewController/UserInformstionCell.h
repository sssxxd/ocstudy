//
//  UserInformstionCell.h
//  Share
//
//  Created by 孙旭东 on 2022/7/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserInformstionCell : UITableViewCell

@property (nonatomic, strong) UIImageView* iconUser;
@property (nonatomic, strong) UILabel* userName;
@property (nonatomic, strong) UILabel* userSelected;
@property (nonatomic, strong) UILabel* userMassge;
@property (nonnull, strong) UIButton* heartLogo;
@property (nonnull, strong) UIButton* eyeLogo;
@property (nonnull, strong) UIButton* shareLogo;
@property (nonnull, strong) UILabel* heartNumber;
@property (nonnull, strong) UILabel* eyeNumber;
@property (nonnull, strong) UILabel* shareNumber;

@end

NS_ASSUME_NONNULL_END
