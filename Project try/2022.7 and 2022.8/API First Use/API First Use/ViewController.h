//
//  ViewController.h
//  API First Use
//
//  Created by 孙旭东 on 2022/8/9.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<
UITextFieldDelegate,
UITableViewDelegate,
UITableViewDataSource,
NSURLSessionDelegate
>

@property (nonatomic, strong) UITextField* textField;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSMutableArray* cityArray;
@property (nonatomic, strong) NSMutableData* data;

@end

