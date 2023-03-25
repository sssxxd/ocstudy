//
//  SearchViewController.h
//  Weather Report
//
//  Created by 孙旭东 on 2022/8/12.
//

#import <UIKit/UIKit.h>
#import "AddCityViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchViewController : UIViewController
<
UITextFieldDelegate,
UITableViewDelegate,
UITableViewDataSource,
NSURLSessionDelegate
>

@property (nonatomic, strong) UITextField* searchTextField;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UIButton* cencalButton;

// 接收城市数组数据
@property (nonatomic, strong) NSMutableArray* cityArray;
// 接收城市ID
@property (nonatomic, strong) NSMutableArray* cityIDArray;
// 接收api返回字典
@property (nonatomic, strong) NSMutableData* data;

@property (nonatomic, strong) id<SendCityIDToSelectCityViewController> delegate;

@end

NS_ASSUME_NONNULL_END
