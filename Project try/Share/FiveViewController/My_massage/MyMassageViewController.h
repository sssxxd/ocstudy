//
//  MyMassageViewController.h
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import <UIKit/UIKit.h>
#import "MyGuanZhu/MyGuanZhuViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyMassageViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource, UIButtonSelectedSet>

@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSMutableArray* arrayData;
@property (nonatomic, strong) NSMutableSet* buttonSelectedSet;

@end

NS_ASSUME_NONNULL_END
