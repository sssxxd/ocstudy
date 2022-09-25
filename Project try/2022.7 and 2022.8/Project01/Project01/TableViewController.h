//
//  TableViewController.h
//  Project01
//
//  Created by 孙旭东 on 2022/7/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    UITableView* _tableView;
}

@property (nonatomic, copy) NSString* userName;
@property (nonatomic, copy) NSString* accont;
@property (nonatomic) NSInteger numberOfFriends;

@end

NS_ASSUME_NONNULL_END
