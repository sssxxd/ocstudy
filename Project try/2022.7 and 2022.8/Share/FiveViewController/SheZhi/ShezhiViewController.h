//
//  ShezhiViewController.h
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import <UIKit/UIKit.h>
#import "MyMassageTableViewCell.h"
#import "MassageSheZhi/MassageSheZhiViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShezhiViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource, MassageArrowSelected>

@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSMutableArray* arrayData;
@property (nonatomic, strong) NSMutableSet* arrowSelected;

@end

NS_ASSUME_NONNULL_END
