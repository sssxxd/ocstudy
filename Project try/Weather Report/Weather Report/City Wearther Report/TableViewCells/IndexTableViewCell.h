//
//  IndexTableViewCell.h
//  Weather Report
//
//  Created by 孙旭东 on 2022/8/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IndexTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel* titleFirst;
@property (nonatomic, strong) UILabel* titleSecond;
@property (nonatomic, strong) UILabel* dataFirst;
@property (nonatomic, strong) UILabel* dataSecond;

@end

NS_ASSUME_NONNULL_END
