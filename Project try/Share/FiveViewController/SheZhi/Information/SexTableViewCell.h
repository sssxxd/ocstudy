//
//  SexTableViewCell.h
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SexTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel* sex;
@property (nonatomic, strong) UILabel* boy;
@property (nonatomic, strong) UILabel* girl;
@property (nonatomic, strong) UIButton* buttonBoy;
@property (nonatomic, strong) UIButton* buttonGirl;

@end

NS_ASSUME_NONNULL_END
