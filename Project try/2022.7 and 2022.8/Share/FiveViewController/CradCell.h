//
//  CradCell.h
//  Share
//
//  Created by 孙旭东 on 2022/7/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CradCell : UITableViewCell

@property (nonatomic, weak) UIImageView* iconCard;
@property (nonatomic, weak) UILabel* cradName;
@property (nonatomic, weak) UIButton* cradArrow;

@end

NS_ASSUME_NONNULL_END
