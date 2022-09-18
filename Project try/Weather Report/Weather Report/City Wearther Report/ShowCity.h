//
//  ShowCity.h
//  Weather Report
//
//  Created by 孙旭东 on 2022/8/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShowCity : UIView
<
UITableViewDelegate,
UITableViewDataSource,
NSURLSessionDelegate
>

@property (nonatomic, strong) UITableView* tableView;

// 接收城市ID
@property (nonatomic, strong) NSString* cityID;

// 接收数据
@property (nonatomic, strong) NSMutableData* data;
@property (nonatomic, strong) NSDictionary* mainDictionary;

@property (nonatomic, strong) NSMutableArray* arrayIndex;
@end

NS_ASSUME_NONNULL_END
