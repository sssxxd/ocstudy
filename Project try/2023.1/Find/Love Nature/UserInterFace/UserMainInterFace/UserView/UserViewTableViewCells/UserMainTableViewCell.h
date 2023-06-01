//
//  UserMainTableViewCell.h
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserMainTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView* userIcon;
@property (nonatomic, strong) UILabel* userNameLabel;
@property (nonatomic, strong) UILabel* userSignatureLabel;
@property (nonatomic, strong) UIImageView* userSex;
@property (nonatomic, strong) UILabel* userAttentionLabel;
@property (nonatomic, strong) UILabel* userFansLable;

@end

NS_ASSUME_NONNULL_END
