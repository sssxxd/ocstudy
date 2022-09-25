//
//  FindViewController.h
//  StudentSystem
//
//  Created by 孙旭东 on 2022/8/5.
//

#import <UIKit/UIKit.h>
#import "StudentsTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface FindViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (nonatomic, strong) UITableView* tableView;

@property (nonatomic, strong) NSMutableArray* studentData;
@property (nonatomic, strong) NSMutableSet* studentName;
@property (nonatomic, strong) NSMutableSet* studentClass;

@property (nonatomic, strong) UIImageView* backImageView;

@property (nonatomic, strong) UITextField* studentNameTextField;
@property (nonatomic, strong) UITextField* studentClassTextField;

@property (nonatomic, strong) UIButton* actionButton;
@property (nonatomic, strong) UIButton* exitButton;

@end

NS_ASSUME_NONNULL_END
