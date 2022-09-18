//
//  AddViewController.m
//  StudentSystem
//
//  Created by 孙旭东 on 2022/8/5.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backImage.jpeg"]];
    _backImageView.frame = self.view.bounds;
    _backImageView.userInteractionEnabled = YES;
    
    [self.view addSubview:_backImageView];
    
    // 初始化学生学号
    [self initStudentNumber];
    
    [self createTableView];
    
    [self createUITextField];
    
    [self createAddButton];
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

#pragma - 初始化学生学号
- (void) initStudentNumber {
    _studentNumber = [NSMutableSet set];
    for (id object in _studentData[ARRAY_STUDENTNAME]) {
        [_studentNumber addObject:object];
    }
}

#pragma - 创建文本输入框
- (void) createUITextField {
    _studentNameTextDield = [[UITextField alloc] initWithFrame:CGRectMake(45, self.view.bounds.size.height / 2 + 50, 300, 40)];
    _studentClassTextField = [[UITextField alloc] initWithFrame:CGRectMake(45, self.view.bounds.size.height / 2 + 110, 300, 40)];
    _studentNumberTextField = [[UITextField alloc] initWithFrame:CGRectMake(45, self.view.bounds.size.height / 2 + 170, 300, 40)];
    
    _studentNameTextDield.borderStyle = UITextBorderStyleRoundedRect;
    _studentClassTextField.borderStyle = UITextBorderStyleRoundedRect;
    _studentNumberTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    _studentNameTextDield.keyboardType = UIKeyboardTypeDefault;
    _studentClassTextField.keyboardType = UIKeyboardTypeDefault;
    _studentNumberTextField.keyboardType = UIKeyboardTypeDefault;
    
    _studentNameTextDield.placeholder = @"请输入学生姓名";
    _studentClassTextField.placeholder = @"请输入学生班级";
    _studentNumberTextField.placeholder = @"请输入学生分数";
    
    _studentNameTextDield.delegate = self;
    _studentClassTextField.delegate = self;
    _studentNumberTextField.delegate = self;
    
    [self.backImageView addSubview:_studentNameTextDield];
    [self.backImageView addSubview:_studentClassTextField];
    [self.backImageView addSubview:_studentNumberTextField];
}

- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.studentNameTextDield resignFirstResponder];
    [self.studentClassTextField resignFirstResponder];
    [self.studentNumberTextField resignFirstResponder];
    
    [self.backImageView setTransform:CGAffineTransformMakeTranslation(0, 0)];
}

- (void) textFieldDidBeginEditing:(UITextField *)textField {
    [self.backImageView setTransform:CGAffineTransformMakeTranslation(0, -180)];
}

#pragma - 添加按钮
- (void) createAddButton {
    self.addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.addButton.frame = CGRectMake(80, self.view.bounds.size.height / 2 + 250, 100, 30);
    [self.addButton setTitle:@"add" forState:UIControlStateNormal];
    [self.addButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.addButton.titleLabel setFont:[UIFont systemFontOfSize:22]];
    
    [self.addButton addTarget:self action:@selector(pressAddButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.backImageView addSubview:self.addButton];
    
    self.exitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.exitButton.frame = CGRectMake(220, self.view.bounds.size.height / 2 + 250, 100, 30);
    [self.exitButton setTitle:@"exit" forState:UIControlStateNormal];
    [self.exitButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.exitButton.titleLabel setFont:[UIFont systemFontOfSize:22]];
    
    [self.exitButton addTarget:self action:@selector(pressExitButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.backImageView addSubview:self.exitButton];
}

- (void) pressAddButton {
    // 获取数据
    NSString* studentName = self.studentNameTextDield.text;
    NSString* studentClass = self.studentClassTextField.text;
    NSString* studentNumber = self.studentNumberTextField.text;
    
    // 视图跟随键盘归位
    [self.backImageView setTransform:CGAffineTransformMakeTranslation(0, 0)];
    
    // 判断成绩
    NSInteger number = [studentNumber integerValue];
    if (number < 0 || number > 100) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入正确的成绩" preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil]];
        
        [self presentViewController:alert animated:YES completion:nil];
        
        return;
    }
    
    // 判断用户是否输入
    if (studentName.length && studentClass.length && studentNumber.length) {
        // 判断姓名是否重复
        if ([self.studentNumber containsObject:studentName]) {
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
                UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"该学生已经注册，请重新输入" preferredStyle:UIAlertControllerStyleAlert];

                [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil]];

                [self presentViewController:alert animated:YES completion:nil];
                
            } else {
                // 添加学生信息
                [self.studentNumber addObject:studentName];
                
                [self.studentData[ARRAY_STUDENTNUMBER] addObject:studentNumber];
                [self.studentData[ARRAY_STUDENTNAME] addObject:studentName];
                [self.studentData[ARRAY_STUDENTCLASS] addObject:studentClass];
                
                // 刷新_tableView
                [_tableView reloadData];
                
                // 传递新的学生信息
                self.studentDataBlock(self.studentData);
                
                // 重制文本框为空
                self.studentNameTextDield.text = @"";
                self.studentClassTextField.text = @"";
                self.studentNumberTextField.text = @"";
                
                
                UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"添加成功" preferredStyle:UIAlertControllerStyleAlert];
                
                [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil]];
                
                [self presentViewController:alert animated:YES completion:nil];
            }
        } else {
            // 添加学生信息
            [self.studentNumber addObject:studentName];
            
            [self.studentData[ARRAY_STUDENTNUMBER] addObject:studentNumber];
            [self.studentData[ARRAY_STUDENTNAME] addObject:studentName];
            [self.studentData[ARRAY_STUDENTCLASS] addObject:studentClass];
            
            // 刷新_tableView
            [_tableView reloadData];
            
            // 传递新的学生信息
            self.studentDataBlock(self.studentData);
            
            // 重制文本框为空
            self.studentNameTextDield.text = @"";
            self.studentClassTextField.text = @"";
            self.studentNumberTextField.text = @"";
            
            
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"添加成功" preferredStyle:UIAlertControllerStyleAlert];
            
            [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil]];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
    } else {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入待添加的学生信息" preferredStyle:UIAlertControllerStyleAlert];
                
        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil]];
                
        [self presentViewController:alert animated:YES completion:nil];
        
    }
}

- (void) pressExitButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 实现为Block属性赋值的方法
- (void) sendStudentDataToMain:(StudentDataBlock)block {
    self.studentDataBlock = block;
}

@end
