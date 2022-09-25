//
//  ThirdShareTableViewCell.h
//  Share
//
//  Created by 孙旭东 on 2022/7/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ThirdShareTableViewCell : UITableViewCell

@property (nonnull, strong) UIImageView* listImageView;
@property (nonnull, strong) UILabel* shareTitle;
@property (nonnull, strong) UILabel* shareByWho;
@property (nonnull, strong) UILabel* shareTime;
@property (nonnull, strong) UIButton* heartLogo;
@property (nonnull, strong) UIButton* eyeLogo;
@property (nonnull, strong) UIButton* shareLogo;
@property (nonnull, strong) UILabel* heartNumber;
@property (nonnull, strong) UILabel* eyeNumber;
@property (nonnull, strong) UILabel* shareNumber;

@end

NS_ASSUME_NONNULL_END
