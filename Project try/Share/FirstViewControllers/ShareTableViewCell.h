//
//  ShareTableViewCell.h
//  Share
//
//  Created by 孙旭东 on 2022/7/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShareTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView* listImageView;
@property (nonatomic, strong) UILabel* shareTitle;
@property (nonatomic, strong) UILabel* shareByWho;
@property (nonatomic, strong) UILabel* shareTime;
@property (nonatomic, strong) UIButton* heartLogo;
@property (nonatomic, strong) UIButton* eyeLogo;
@property (nonatomic, strong) UIButton* shareLogo;
@property (nonatomic, strong) UILabel* heartNumber;
@property (nonatomic, strong) UILabel* eyeNumber;
@property (nonatomic, strong) UILabel* shareNumber;
@property (nonatomic, strong) UILabel* cradLabel;

@property (nonatomic) NSInteger selectedHeart;


@end

NS_ASSUME_NONNULL_END
