//
//  CardCell.h
//  Project01
//
//  Created by 孙旭东 on 2022/7/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CardCell : UITableViewCell

@property (nonatomic, weak) UIImageView* iconCard;
@property (nonatomic, weak) UILabel* cradName;
@property (nonatomic, weak) UIButton* cradArrow;

@end

NS_ASSUME_NONNULL_END
