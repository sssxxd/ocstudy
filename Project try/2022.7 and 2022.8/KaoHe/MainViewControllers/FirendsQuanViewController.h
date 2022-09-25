//
//  FirendsQuanViewController.h
//  KaoHe
//
//  Created by 孙旭东 on 2022/8/5.
//

#import <UIKit/UIKit.h>
#import "HeadViewTableViewCell.h"
#import "FirendsTableViewCell.h"
#import "FirendsSecondTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirendsQuanViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSMutableArray* arrayData;

@end

NS_ASSUME_NONNULL_END
