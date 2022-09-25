//
//  changeViewController.m
//  StudentSystem
//
//  Created by 孙旭东 on 2022/8/5.
//

#import "ChangeViewController.h"

@interface changeViewController ()

@end

@implementation changeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backImage.jpeg"]];
    _backImageView.frame = self.view.bounds;
    _backImageView.userInteractionEnabled = YES;
    
    [self.view addSubview:_backImageView];
    
    // 初始化学生学号
    [self initStudentName];
    
    [self createTableView];
    
    [self createUITextField];
    
    [self createActionButton];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma - 创建tableView

- (void) createTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height / 2) style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView setBackgroundColor:[UIColor clearColor]];
    
    [_tableView reloadData];
    
    [self.backImageView addSubview:_tableView];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_studentData[ARRAY_STUDENTNUMBER] count];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellName = @"StudentTableViewCell";
    
    StudentsTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
    
    if (cell == nil) {
        cell = [[StudentsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    cell.studentName.text = _studentData[ARRAY_STUDENTNAME][indexPath.row];
    cell.studentClass.text = _studentData[ARRAY_STUDENTCLASS][indexPath.row];
    cell.studentNumber.text = _studentData[ARRAY_STUDENTNUMBER][indexPath.row];
    return cell;
}

#pragma - 初始化学生信息
- (void) initStudentName {
    _studentName = [NSMutableSet set];
    _studentClass = [NSMutableSet set];
    for (id object in _studentData[ARRAY_STUDENTNAME]) {
        [_studentName addObject:object];
    }
}

#pragma - 创建文本输入框
- (void) createUITextField {
    _studentNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(45, self.view.bounds.size.height / 2 + 80, 300, 40)];
    _studentClassTextField = [[UITextField alloc] initWithFrame:CGRectMake(45, self.view.bounds.size.height / 2 + 140, 300, 40)];
    
    _studentNameTextField.borderStyle = UITextBorderStyleRoundedRect;
    _studentClassTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    _studentNameTextField.keyboardType = UIKeyboardTypeDefault;
    _studentClassTextField.keyboardType = UIKeyboardTypeDefault;
    
    _studentNameTextField.placeholder = @"请输入学生姓名";
    _studentClassTextField.placeholder = @"请输入学生班级";
    
    _studentNameTextField.delegate = self;
    _studentClassTextField.delegate = self;
    
    [self.backImageView addSubview:_studentNameTextField];
    [self.backImageView addSubview:_studentClassTextField];

}

- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.studentNameTextField resignFirstResponder];
    [self.studentClassTextField resignFirstResponder];
    
    [self.backImageView setTransform:CGAffineTransformMakeTranslation(0, 0)];
}

- (void) textFieldDidBeginEditing:(UITextField *)textField {
    [self.backImageView setTransform:CGAffineTransformMakeTranslation(0, -180)];
}

#pragma - 添加按钮
- (void) createActionButton {
    self.actionButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.actionButton.frame = CGRectMake(80, self.view.bounds.size.height / 2 + 250, 100, 30);
    [self.actionButton setTitle:@"change" forState:UIControlStateNormal];
    [self.actionButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.actionButton.titleLabel setFont:[UIFont systemFontOfSize:22]];
    
    [self.actionButton addTarget:self action:@selector(pressActionButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.backImageView addSubview:self.actionButton];
    
    self.exitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.exitButton.frame = CGRectMake(220, self.view.bounds.size.height / 2 + 250, 100, 30);
    [self.exitButton setTitle:@"exit" forState:UIControlStateNormal];
    [self.exitButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.exitButton.titleLabel setFont:[UIFont systemFontOfSize:22]];
    
    [self.exitButton addTarget:self action:@selector(pressExitButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.backImageView addSubview:self.exitButton];
}

// 按钮事件
- (void) pressExitButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) pressActionButton {
    // 获取数据
    NSString* studentName = self.studentNameTextField.text;
    NSString* studentClass = self.studentClassTextField.text;
    
    // 视图跟随键盘恢复位置
    [self.backImageView setTransform:CGAffineTransformMakeTranslation(0, 0)];
    
    if (studentName.length && studentClass.length) {
        if ([self.studentName containsObject:studentName]) {
            // 勇于记录数组下标
            NSInteger index = 0;
            for (id object in self.studentData[ARRAY_STUDENTNAME]) {
                if ([studentName isEqual:object]) {
                    [self.studentClass addObject:self.studentData[ARRAY_STUDENTCLASS][index]];
                }
                index++;
            }
            if ([self.studentClass containsObject:studentClass]) {
                UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入更改后的学生信息" preferredStyle:UIAlertControllerStyleAlert];
                        
                [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                    textField.placeholder = @"请输入学生姓名";
                }];
                [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                    textField.placeholder = @"请输入学生班级";
                }];
                [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                    textField.placeholder = @"请输入学生分数";
                }];
                
                [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
                
                [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    // 获取数据
                    UITextField* changeNameTextField = [alert.textFields objectAtIndex:0];
                    UITextField* changeClassTextField = [alert.textFields objectAtIndex:1];
                    UITextField* changeNumberTextField = [alert.textFields objectAtIndex:2];
                    
                    NSString* changeName = changeNameTextField.text;
                    NSString* changeClass = changeClassTextField.text;
                    NSString* changeNumber = changeNumberTextField.text;
                    
                    // 判断学生信息是否合理
                    if ([self judgeStudentName:changeName Class:changeClass Number:changeNumber]) {
                        // for循环定位index
                        for (int i = 0; i < [self.studentData[ARRAY_STUDENTNUMBER] count]; i++) {
                            if ([self.studentData[ARRAY_STUDENTNAME][i] isEqual:studentName] && [self.studentData[ARRAY_STUDENTCLASS][i] isEqual:studentClass]) {
                                // 移除集合中的元素
                                [self.studentName removeObject:studentName];
                                [self.studentClass removeObject:studentClass];
                                // 向集合添加改变后的元素
                                [self.studentName addObject:changeName];
                                [self.studentClass addObject:changeClass];
                                
                                // 改变数组元素
                                [self.studentData[ARRAY_STUDENTNAME] replaceObjectAtIndex:i withObject:changeName];
                                [self.studentData[ARRAY_STUDENTCLASS] replaceObjectAtIndex:i withObject:changeClass];
                                [self.studentData[ARRAY_STUDENTNUMBER] replaceObjectAtIndex:i withObject:changeNumber];
                            }
                        }
                        [self.tableView reloadData];
                        
                        self.studentDataBlock(self.studentData);
                        
                        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"更改成功" preferredStyle:UIAlertControllerStyleAlert];
                                
                        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil]];
                                
                        [self presentViewController:alert animated:YES completion:nil];
                    } else {
                        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"更改失败，请重新尝试" preferredStyle:UIAlertControllerStyleAlert];
                                
                        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil]];
                                
                        [self presentViewController:alert animated:YES completion:nil];
                    }
                }]];
                        
                [self presentViewController:alert animated:YES completion:nil];
                
                
                self.studentNameTextField.text = @"";
                self.studentClassTextField.text = @"";

            } else {
                UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"查无此人，请重新输入信息" preferredStyle:UIAlertControllerStyleAlert];
                        
                [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil]];
                        
                [self presentViewController:alert animated:YES completion:nil];
            }
        } else {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"查无此人，请重新输入信息" preferredStyle:UIAlertControllerStyleAlert];
                    
            [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil]];
                    
            [self presentViewController:alert animated:YES completion:nil];
        }
    } else {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入改变的学生信息" preferredStyle:UIAlertControllerStyleAlert];
                
        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil]];
                
        [self presentViewController:alert animated:YES completion:nil];
    }
}

// 实现为Block属性赋值的方法
- (void) sendStudentDataToMain:(StudentDataBlock)block {
    self.studentDataBlock = block;
}

// 判断更改后的信息是否合理
- (BOOL) judgeStudentName:(NSString*)studentName Class:(NSString*)studentClass Number:(NSString*)studentNumber {
    // 判断成绩
    NSInteger number = [studentNumber integerValue];
    if (number < 0 || number > 100) {
        return NO;
    }
    
    // 判断用户是否输入
    if (studentName.length && studentClass.length && studentNumber.length) {
        // 判断姓名是否重复
        if ([self.studentName containsObject:studentName]) {
            // 创建班级集合，用于判断班级是否重合
            NSMutableSet* studentClassSet = [NSMutableSet set];
            // 用于记录数组下标
            NSInteger index = 0;
            for (id object in self.studentData[ARRAY_STUDENTNAME]) {
                if ([studentName isEqual:object]) {
                    [studentClassSet addObject:self.studentData[ARRAY_STUDENTCLASS][index]];
                }
                index++;
            }
            if ([studentClassSet containsObject:studentClass]) {
                return NO;
            } else {
                return YES;
            }
        } else {
            return YES;
        }
    } else {
        return NO;
    }
}

@end
