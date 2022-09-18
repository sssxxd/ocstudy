//
//  MainViewController.m
//  StudentSystem
//
//  Created by 孙旭东 on 2022/8/4.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backImage.jpeg"]];
    _backImageView.frame = self.view.bounds;
    
    [self.view addSubview:_backImageView];
    
    [self createTableView];
    
    [self createButtons];
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
    
    [self createStudentData];
    
    [_tableView reloadData];
    
    [self.view addSubview:_tableView];
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

#pragma - 创建数据

- (void) createStudentData {
    _studentData = [[NSMutableArray alloc] init];
    NSMutableArray* studentName = [[NSMutableArray alloc] init];
    NSMutableArray* studentClass = [[NSMutableArray alloc] init];
    NSMutableArray* studentNumber = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 4; i++) {
        if (i == 0) {
            [studentName addObject:@"小明"];
            [studentClass addObject:@"class 1"];
            [studentNumber addObject:@"78"];
        } else if (i == 1) {
            [studentName addObject:@"小红"];
            [studentClass addObject:@"class 2"];
            [studentNumber addObject:@"89"];
        } else if (i == 2) {
            [studentName addObject:@"小王"];
            [studentClass addObject:@"class 3"];
            [studentNumber addObject:@"92"];
        } else if (i == 3) {
            [studentName addObject:@"小丽"];
            [studentClass addObject:@"class 4"];
            [studentNumber addObject:@"68"];
        }
    }
    [_studentData addObject:studentName];
    [_studentData addObject:studentClass];
    [_studentData addObject:studentNumber];
}

#pragma - 创建按钮

- (void) createButtons {
    _addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _deleteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _changeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _findButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _exitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _sortButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [_addButton setTitle:@"add" forState:UIControlStateNormal];
    [_deleteButton setTitle:@"delete" forState:UIControlStateNormal];
    [_changeButton setTitle:@"change" forState:UIControlStateNormal];
    [_findButton setTitle:@"find" forState:UIControlStateNormal];
    [_exitButton setTitle:@"exit" forState:UIControlStateNormal];
    [_sortButton setTitle:@"sort" forState:UIControlStateNormal];
    
    _addButton.frame = CGRectMake(90, self.view.bounds.size.width / 2 + 330, 80, 20);
    _deleteButton.frame = CGRectMake(230, self.view.bounds.size.width / 2 + 330, 80, 20);
    _changeButton.frame = CGRectMake(90, self.view.bounds.size.width / 2 + 380, 80, 20);
    _findButton.frame = CGRectMake(230, self.view.bounds.size.width / 2 + 380, 80, 20);
    _exitButton.frame = CGRectMake(230, self.view.bounds.size.width / 2 + 430, 80, 20);
    _sortButton.frame = CGRectMake(90, self.view.bounds.size.width / 2 + 430, 80, 20);
    
    [_addButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_deleteButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_changeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_findButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_exitButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_sortButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    _addButton.titleLabel.font = [UIFont systemFontOfSize:22];
    _deleteButton.titleLabel.font = [UIFont systemFontOfSize:22];
    _changeButton.titleLabel.font = [UIFont systemFontOfSize:22];
    _findButton.titleLabel.font = [UIFont systemFontOfSize:22];
    _exitButton.titleLabel.font = [UIFont systemFontOfSize:22];
    _sortButton.titleLabel.font = [UIFont systemFontOfSize:22];
    
    [_exitButton addTarget:self action:@selector(pressExit) forControlEvents:UIControlEventTouchUpInside];
    [_addButton addTarget:self action:@selector(pressAdd) forControlEvents:UIControlEventTouchUpInside];
    [_findButton addTarget:self action:@selector(pressFind) forControlEvents:UIControlEventTouchUpInside];
    [_deleteButton addTarget:self action:@selector(pressDelete) forControlEvents:UIControlEventTouchUpInside];
    [_changeButton addTarget:self action:@selector(pressChange) forControlEvents:UIControlEventTouchUpInside];
    [_sortButton addTarget:self action:@selector(pressSort) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_addButton];
    [self.view addSubview:_deleteButton];
    [self.view addSubview:_changeButton];
    [self.view addSubview:_findButton];
    [self.view addSubview:_exitButton];
    [self.view addSubview:_sortButton];
}

// 实现按钮方法
- (void) pressExit {
    LoginViewController* loginViewController = [[LoginViewController alloc] init];
    
    loginViewController.userAccont = self.userAccont;
    loginViewController.userPassword = self.userPassword;
    
    self.view.window.rootViewController = loginViewController;
}

- (void) pressAdd {
    AddViewController* addViewController = [[AddViewController alloc] init];
    
    addViewController.studentData = self.studentData;
    addViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:addViewController animated:YES completion:nil];
    
    // 接收新的学生信息
    [addViewController sendStudentDataToMain:^(NSMutableArray* studentData) {
        self.studentData = studentData;
        // 刷新tableView
        [self.tableView reloadData];
    }];
}

- (void) pressFind {
    FindViewController* findViewController = [[FindViewController alloc] init];
    
    findViewController.studentData = self.studentData;
    findViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:findViewController animated:YES completion:nil];
}

- (void) pressDelete {
    deleteViewController* DeleteViewController = [[deleteViewController alloc] init];
    
    DeleteViewController.studentData = self.studentData;
    DeleteViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:DeleteViewController animated:YES completion:nil];
    
    // 接收新的学生信息
    [DeleteViewController sendStudentDataToMain:^(NSMutableArray* studentData) {
        self.studentData = studentData;
        // 刷新tableView
        [self.tableView reloadData];
    }];
}

- (void) pressChange {
    changeViewController* ChangeViewController = [[changeViewController alloc] init];
    
    ChangeViewController.studentData = self.studentData;
    ChangeViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:ChangeViewController animated:YES completion:nil];
    
    // 接收新的学生信息
    [ChangeViewController sendStudentDataToMain:^(NSMutableArray* studentData) {
        self.studentData = studentData;
        // 刷新tableView
        [self.tableView reloadData];
    }];
}

- (void) pressSort {
    NSMutableArray* studentSort = [[NSMutableArray alloc] init];
    for (int index = 0; index < [self.studentData[ARRAY_STUDENTNAME] count]; index++) {
        Student* student = [[Student alloc] init];
        
        student.studentName = self.studentData[ARRAY_STUDENTNAME][index];
        student.studentClass = self.studentData[ARRAY_STUDENTCLASS][index];
        student.studentNumber = self.studentData[ARRAY_STUDENTNUMBER][index];
        
        [studentSort addObject:student];
    }
    NSArray* studentSorted = [NSArray arrayWithArray:[studentSort sortedArrayUsingSelector:@selector(compareStudent:)]];
    
    NSMutableArray* newStudentData = [[NSMutableArray alloc] init];
    
    NSMutableArray* studentName = [[NSMutableArray alloc] init];
    NSMutableArray* studentClass = [[NSMutableArray alloc] init];
    NSMutableArray* studentNumber = [[NSMutableArray alloc] init];
    
    for (Student* object in studentSorted) {
        [studentName addObject:object.studentName];
        [studentClass addObject:object.studentClass];
        [studentNumber addObject:object.studentNumber];
    }
    
    [newStudentData addObject:studentName];
    [newStudentData addObject:studentClass];
    [newStudentData addObject:studentNumber];
    
    self.studentData = newStudentData;
    
    [self.tableView reloadData];
}



@end
