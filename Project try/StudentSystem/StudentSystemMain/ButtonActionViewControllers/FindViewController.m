//
//  FindViewController.m
//  StudentSystem
//
//  Created by 孙旭东 on 2022/8/5.
//

#import "FindViewController.h"

@interface FindViewController ()

@end

@implementation FindViewController

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
    [self.actionButton setTitle:@"find" forState:UIControlStateNormal];
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

// 按钮事件函数
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
                NSString* studentNumer = nil;
                for (int i = 0; i < [self.studentData[ARRAY_STUDENTNUMBER] count]; i++) {
                    if ([self.studentData[ARRAY_STUDENTNAME][i] isEqual:studentName] && [self.studentData[ARRAY_STUDENTCLASS][i] isEqual:studentClass]) {
                        studentNumer = self.studentData[ARRAY_STUDENTNUMBER][i];
                    }
                }
                NSString* student = [NSString stringWithFormat:@"姓名：%@ 班级：%@ 分数：%@", studentName, studentClass, studentNumer];
                UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"该学生信息如下" message:student preferredStyle:UIAlertControllerStyleAlert];
                        
                [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil]];
                        
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
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入查找的学生信息" preferredStyle:UIAlertControllerStyleAlert];
                
        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil]];
                
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void) pressExitButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
