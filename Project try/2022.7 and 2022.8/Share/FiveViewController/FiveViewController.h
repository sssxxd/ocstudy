//
//  FiveViewController.h
//  Share
//
//  Created by 孙旭东 on 2022/7/29.
//

#import <UIKit/UIKit.h>
#import "My_massage/MyMassageViewController.h"
#import "SheZhi/ShezhiViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FiveViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>
{
    UITableView* _tableView;
}

@property (nonatomic, strong) NSString* iconUserName;
@property (nonatomic, strong) NSMutableArray* arrayCardNames;
@property (nonatomic, strong) NSMutableArray* arrayCradIcons;

@property (nonatomic, strong) MyMassageViewController* MyMaggage;
@property (nonatomic, strong) ShezhiViewController* SheZhi;

@end

NS_ASSUME_NONNULL_END
