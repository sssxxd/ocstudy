//
//  MyTuiViewController.h
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyTuiViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>
{
    UITableView* _tableView;
    NSMutableArray* _arrayData;
    NSMutableArray* _arrayUsers;
    NSMutableArray* _arrarTime;
}
@end

NS_ASSUME_NONNULL_END
