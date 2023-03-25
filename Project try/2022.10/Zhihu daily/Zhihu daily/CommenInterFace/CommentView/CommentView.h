//
//  CommentView.h
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/11/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommentView : UIView
<UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, strong) UITableView* tableView;

@property (nonatomic, copy) NSDictionary* commentDict;
@property (nonatomic, strong) NSMutableSet* unfoldSet;

@property (nonatomic, assign) CGFloat cellHeight;

- (void) ViewInit;

- (void) viewReload;

@end

NS_ASSUME_NONNULL_END
