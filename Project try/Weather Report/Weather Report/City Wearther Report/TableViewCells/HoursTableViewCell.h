//
//  HoursTableViewCell.h
//  Weather Report
//
//  Created by 孙旭东 on 2022/8/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HoursTableViewCell : UITableViewCell

@property (nonatomic, strong) UIScrollView* scrollView;

@property (nonatomic, strong) NSArray* hoursArray;

@end

NS_ASSUME_NONNULL_END
