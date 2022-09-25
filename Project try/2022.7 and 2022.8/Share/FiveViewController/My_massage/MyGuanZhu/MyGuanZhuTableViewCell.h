//
//  MyGuanZhuTableViewCell.h
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyGuanZhuTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView* firendsIcon;
@property (nonatomic, strong) UILabel* friendName;
@property (nonatomic, strong) UIButton* button;
@property (nonatomic) NSInteger cellTag;

@end

NS_ASSUME_NONNULL_END
