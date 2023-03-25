//
//  InterFaceView.h
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/10/16.
//

#import <UIKit/UIKit.h>
#import "Manage.h"

NS_ASSUME_NONNULL_BEGIN

@interface InterFaceView : UIView
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView* tableView;

@property (nonatomic, strong) NSMutableArray* imageViewArray;
@property (nonatomic, strong) NSMutableArray* topTitleArray;
@property (nonatomic, strong) NSMutableArray* topUserNameArray;

@property (nonatomic, strong) NSMutableArray* stories;

@property (nonatomic, strong) NSMutableArray* lastDateArray;

@property (nonatomic, assign) BOOL isLoading;


- (void) viewInit;

@end

NS_ASSUME_NONNULL_END
