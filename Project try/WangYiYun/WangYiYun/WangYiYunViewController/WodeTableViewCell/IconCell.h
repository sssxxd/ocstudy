//
//  IconCell.h
//  WangYiYun
//
//  Created by 孙旭东 on 2022/7/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IconCell : UITableViewCell

@property (nonatomic, strong) UILabel* userName;
@property (nonatomic, strong) UILabel* isVIP;
@property (nonatomic, strong) UILabel* putLv;
@property (nonatomic, strong) UILabel* heiJiao;
@property (nonatomic, strong) UIImageView* userIcon;
@property (nonatomic, strong) UIImageView* jiantou;

- (void) setPutLvWithLV:(NSInteger) Lv;

@end

NS_ASSUME_NONNULL_END
