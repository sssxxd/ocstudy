//
//  TitleTableViewCell.h
//  Weather Report
//
//  Created by 孙旭东 on 2022/8/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TitleTableViewCell : UITableViewCell

@property (nonatomic, strong) NSDictionary* dictionary;
@property (nonatomic, strong) UILabel* cityName;
@property (nonatomic, strong) UILabel* weather;
@property (nonatomic, strong) UILabel* tem;
@property (nonatomic, strong) UILabel* week;
@property (nonatomic, strong) UILabel* day;
@property (nonatomic, strong) UILabel* tem1;
@property (nonatomic, strong) UILabel* tem2;

@end

NS_ASSUME_NONNULL_END
