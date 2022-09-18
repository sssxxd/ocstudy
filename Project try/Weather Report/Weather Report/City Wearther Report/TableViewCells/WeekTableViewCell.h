//
//  WeekTableViewCell.h
//  Weather Report
//
//  Created by 孙旭东 on 2022/8/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeekTableViewCell : UITableViewCell

@property (nonatomic, strong) UIScrollView* scrollView;

@property (nonatomic, strong) NSArray* dataArry;

@end

NS_ASSUME_NONNULL_END
