//
//  HeadViewTableViewCell.h
//  KaoHe
//
//  Created by 孙旭东 on 2022/8/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HeadViewTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView* backImageView;
@property (nonatomic, strong) UIImageView* userIcon;
@property (nonatomic, strong) UILabel* userName;

@end

NS_ASSUME_NONNULL_END
