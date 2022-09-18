//
//  MyGuanZhuViewController.h
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol UIButtonSelectedSet <NSObject>

- (void) setSelectedSet:(NSMutableSet*) selectdeSet;

@end

@interface MyGuanZhuViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSMutableArray* arrayData;
@property (nonatomic, strong) NSMutableSet* selectdeSet;

@property (nonatomic, strong) id<UIButtonSelectedSet> delegate;

@end

NS_ASSUME_NONNULL_END
