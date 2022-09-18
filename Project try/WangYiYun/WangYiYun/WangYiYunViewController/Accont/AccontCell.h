//
//  AccontCell.h
//  WangYiYun
//
//  Created by 孙旭东 on 2022/7/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AccontCell : UITableViewCell

@property (nonatomic, weak) UIImageView* iconCard;
@property (nonatomic, weak) UILabel* cradName;
@property (nonatomic, weak) UIButton* cradArrow;
@property (nonatomic, strong) UISwitch* switchNight;

@end

NS_ASSUME_NONNULL_END
