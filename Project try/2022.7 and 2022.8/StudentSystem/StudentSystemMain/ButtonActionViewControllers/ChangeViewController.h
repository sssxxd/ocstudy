//
//  changeViewController.h
//  StudentSystem
//
//  Created by 孙旭东 on 2022/8/5.
//

#import <UIKit/UIKit.h>
#import "StudentsTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN
// 定义传递学生数据的Block
typedef void(^StudentDataBlock)(NSMutableArray* studentData);

@interface changeViewController : UIViewController
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

// 声明Block属性
@property (nonatomic) StudentDataBlock studentDataBlock;
// 声明为Block赋值的方法
- (void) sendStudentDataToMain:(StudentDataBlock)block;
@end

NS_ASSUME_NONNULL_END
