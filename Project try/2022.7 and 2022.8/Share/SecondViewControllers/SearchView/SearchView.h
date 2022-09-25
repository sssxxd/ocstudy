//
//  SearchView.h
//  Share
//
//  Created by 孙旭东 on 2022/8/1.
//

#import <UIKit/UIKit.h>
#import "ShareTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchView : UIViewController
<UITableViewDelegate, UITableViewDataSource>
{
    UITableView* _tableView;
    NSMutableArray* _arrayData;
    NSMutableArray* _arrayUsers;
    NSMutableArray* _arrarTime;
    NSMutableArray* _arrayCardLabel;
}
@end

NS_ASSUME_NONNULL_END
