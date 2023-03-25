//
//  SelectTableViewCell.h
//  Weather Report
//
//  Created by 孙旭东 on 2022/8/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SelectTableViewCell : UITableViewCell
<NSURLSessionDelegate>

// UI设计
@property (nonatomic, strong) UILabel* time;
@property (nonatomic, strong) UILabel* cityName;
@property (nonatomic, strong) UIImageView* backImage;
@property (nonatomic, strong) UILabel* tem;

// api请求需要的数据
@property (nonatomic, copy) NSString* cityID;
// api返回的数据
@property (nonatomic, strong) NSMutableData* data;

@end

NS_ASSUME_NONNULL_END
