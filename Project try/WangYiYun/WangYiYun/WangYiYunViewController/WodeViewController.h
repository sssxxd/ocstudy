//
//  WodeViewController.h
//  WangYiYun
//
//  Created by 孙旭东 on 2022/7/23.
//

#import <UIKit/UIKit.h>
#import "YunViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface WodeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    UITableView* _tableView;
    UISearchBar* _searchBar;
}
@property (nonatomic, strong) YunViewController* yun;

@end

NS_ASSUME_NONNULL_END
