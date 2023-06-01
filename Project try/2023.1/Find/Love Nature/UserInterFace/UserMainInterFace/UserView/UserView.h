//
//  UserView.h
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class UserData;

@interface UserView : UIView
<UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, strong) UITableView* tableView;

@property (nonatomic, copy) NSArray* setTitleArray;

@property (nonatomic, strong) UserData* userData;

- (void) reloadtableView;

@end

NS_ASSUME_NONNULL_END
