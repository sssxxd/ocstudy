//
//  FirstViewController.h
//  Share
//
//  Created by 孙旭东 on 2022/7/29.
//

#import <UIKit/UIKit.h>
#import "ShareTableViewCell.h"
#import "FirstShow/FirstShowViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource, sendSelectedToFirstViewController>
{
    UITableView* _tableView;
    NSMutableArray* _arrayData;
    NSMutableArray* _arrayUsers;
    NSMutableArray* _arrarTime;
}

@property (nonatomic, strong) NSMutableSet* selected;

@property (nonatomic) NSInteger isSelected;

@end

NS_ASSUME_NONNULL_END
