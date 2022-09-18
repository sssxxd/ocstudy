//
//  TableViewController.m
//  Project01
//
//  Created by 孙旭东 on 2022/7/21.
//

#import "TableViewController.h"
#import "CardCell.h"
#import "MyInformationCell.h"

@interface TableViewController () {
    NSMutableArray* _arrayDate;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createTableView];
    
    // 写入用户信息
    [self setUserName:@"王小明"];
    [self setAccont:@"wangxiaoming"];
    
    // 有状态的好友
    [self setNumberOfFriends:2];
    
    // 把上面的雨单元格不同的背景覆盖
    UIView* backView = [[UIView alloc] init];
    backView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 84);
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
}

- (void) createTableView {
    // 建立tableView
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    // 设置数据视图的代理对象
    _tableView.delegate = self;
    // 设置数据视图的数据源对象
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    
    NSMutableArray* arrayData = [[NSMutableArray alloc] init];
    for (int i = 0; i < 4; i++) {
        // 建立数组
        if (i == 2) {
            NSMutableArray* smallArray = [[NSMutableArray alloc] init];
            for (int j = 0; j < 4; j++) {
                NSString* cellTitle = [[NSString alloc] init];
                if (j == 0) {
                    cellTitle = [NSString stringWithFormat:@"收藏"];
                } else if (j == 1) {
                    cellTitle = [NSString stringWithFormat:@"朋友圈"];
                } else if (j == 2) {
                    cellTitle = [NSString stringWithFormat:@"卡包"];
                } else {
                    cellTitle = [NSString stringWithFormat:@"表情"];
                }
                [smallArray addObject:cellTitle];
            }
            [arrayData addObject:smallArray];
        } else {
            NSMutableArray* smallArray = [[NSMutableArray alloc] init];
            NSString* cellTitle = [[NSString alloc] init];
            if (i == 1) {
                cellTitle = [NSString stringWithFormat:@"服务"];
            } else if (i == 3) {
                cellTitle = [NSString stringWithFormat:@"设置"];
            }
            [smallArray addObject:cellTitle];
            [arrayData addObject:smallArray];
        }
    }
    
    _arrayDate = arrayData;
    
    [_tableView reloadData];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section != 2) {
        return  1;
    } else {
        return 4;
    }
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 非第一格
    if (indexPath.section != 0) {
        NSString* cellName = @"Cardcell";
        // 尝试获取重复的单元格
        CardCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[CardCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        
        // 单元格赋值
        cell.cradName.text = _arrayDate[indexPath.section][indexPath.row];
        
        UIImage* image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld %ld.png", indexPath.section, indexPath.row]];
        [cell.iconCard setImage:image];
        
        return  cell;
    } else {
        NSString* cellName = @"myInformationCell";
        
        MyInformationCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[MyInformationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
            
            [cell.iconView setImage:[UIImage imageNamed:@"userIcon.jpeg"]];
            cell.userName.text = _userName;
            cell.accont.text = _accont;
            // 创建用户状态按钮
            [cell createUserStateButton];
            // 创建用户朋友状态按钮
            [cell createUserFriendsStateButtonWithNumberOfFriends:2];
        }
        return cell;
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 150;
    } else {
        return _tableView.rowHeight;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

