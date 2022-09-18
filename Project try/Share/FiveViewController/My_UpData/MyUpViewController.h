//
//  MyUpViewController.h
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyUpViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
{
    UIScrollView* _scrollView;
    UITableView* _firstTableView;
    UITableView* _secondTableView;
    UITableView* _thridTableView;
    NSMutableArray* _arrayData;
    NSMutableArray* _arrayUsers;
    NSMutableArray* _arrarTime;
    NSMutableArray* _arraySecondData;
    NSMutableArray* _arraySecondUsers;
    NSMutableArray* _arrarSecondTime;
    NSMutableArray* _arrayThirdData;
    NSMutableArray* _arrayThirdUsers;
    NSMutableArray* _arrarThirdTime;
    UIView* _buttonSelectedView;
}

@end

NS_ASSUME_NONNULL_END
