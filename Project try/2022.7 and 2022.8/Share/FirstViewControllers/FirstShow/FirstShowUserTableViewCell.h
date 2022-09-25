//
//  FirstShowUserTableViewCell.h
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstShowUserTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView* icon;
@property (nonatomic, strong) UILabel* showTitle;
@property (nonatomic, strong) UILabel* userName;
@property (nonatomic, strong) UILabel* time;
@property (nonatomic, strong) UIButton* heartLogo;
@property (nonatomic, strong) UIButton* eyeLogo;
@property (nonatomic, strong) UIButton* shareLogo;
@property (nonatomic, strong) UILabel* heartNumber;
@property (nonatomic, strong) UILabel* eyeNumber;
@property (nonatomic, strong) UILabel* shareNumber;


@end

NS_ASSUME_NONNULL_END
