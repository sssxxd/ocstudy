//
//  FirstShowViewController.h
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import <UIKit/UIKit.h>
#import "FirstShowUserTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@protocol sendSelectedToFirstViewController <NSObject>

- (void) sendSelected:(NSInteger)selected;

@end

@interface FirstShowViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic) NSInteger selected;

@property (nonatomic, strong) id<sendSelectedToFirstViewController> delegate;


@end

NS_ASSUME_NONNULL_END
