//
//  MyCollectView.h
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/11/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyCollectView : UIView
<UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, strong) UITableView* tableView;

@property (nonatomic, copy) NSArray* titleArray;
@property (nonatomic, copy) NSArray* imagePathArray;

- (void) ViewInit;

- (void) viewReload;

@end

NS_ASSUME_NONNULL_END
