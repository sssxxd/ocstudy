//
//  SelectCityViewController.h
//  Weather Report
//
//  Created by 孙旭东 on 2022/8/10.
//

#import <UIKit/UIKit.h>
#import "SelectTableViewCell.h"
#import "SearchViewController.h"
#import "ShowCitysViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SelectCityViewController : UIViewController
<
UITableViewDelegate,
UITableViewDataSource,
NSURLSessionDelegate,
SendCityIDToSelectCityViewController
>

@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UIButton* addButton;

@property (nonatomic, strong) ShowCitysViewController* showCitysViewController;
@property (nonatomic, strong) UINavigationController* nav;

// 保存以选择的城市ID
@property (nonatomic, strong) NSMutableArray* arrayCityID;

@end

NS_ASSUME_NONNULL_END
