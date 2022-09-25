//
//  YunCunViewController.h
//  WangYiYun
//
//  Created by 孙旭东 on 2022/7/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static UISwitch* _switchNight;

@interface YunCunViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    UITableView* _tableView;
    NSMutableArray* _dataArray;
}

@end

NS_ASSUME_NONNULL_END
