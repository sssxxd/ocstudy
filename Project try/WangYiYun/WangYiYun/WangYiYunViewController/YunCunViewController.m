//
//  YunCunViewController.m
//  WangYiYun
//
//  Created by 孙旭东 on 2022/7/23.
//

#import "YunCunViewController.h"
#import "AccontCell.h"
#import "UserCell.h"

@interface YunCunViewController ()

@end

@implementation YunCunViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self creatDataArray];
    
    [self createTableView];
    
    [self createSearchRQ];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) createTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 80) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    [_tableView reloadData];
}

- (void) creatDataArray {
    _dataArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 6; i++) {
        NSMutableArray* smallArray = [[NSMutableArray alloc] init];
        if (i == 0) {
            NSString* string = @"王小明";
            [smallArray addObject:string];
        } else if (i == 1) {
            NSString* string = @"创作者中心";
            [smallArray addObject:string];
        } else if (i == 2) {
            for (int j = 0; j < 5; j++) {
                NSString* string = [[NSString alloc] init];
                if (j == 0) {
                    string = @"音乐服务";
                } else if (j == 1) {
                    string = @"演出";
                } else if (j == 2) {
                    string = @"商城";
                } else if (j == 3) {
                    string = @"口袋彩铃";
                } else {
                    string = @"在线听歌免流量";
                }
                [smallArray addObject:string];
            }
        } else if (i == 3) {
            for (int j = 0; j < 9; j++) {
                NSString* string = [[NSString alloc] init];
                if (j == 0) {
                    string = @"小工具";
                } else if (j == 1) {
                    string = @"设置";
                } else if (j == 2) {
                    string = @"夜间模式";
                } else if (j == 3) {
                    string = @"定时关闭";
                } else if (j == 4){
                    string = @"音乐黑名单";
                } else if (j == 5) {
                    string = @"鲸云音效";
                } else if (j == 6) {
                    string = @"添加Siri捷径";
                } else if (j == 7) {
                    string = @"音乐闹钟";
                } else {
                    string = @"青少年模式";
                }
                [smallArray addObject:string];
            }
        } else if (i == 4) {
            for (int j = 0; j < 4; j++) {
                NSString* string = [[NSString alloc] init];
                if (j == 0) {
                    string = @"我的订单";
                } else if (j == 1) {
                    string = @"优惠卷";
                } else if (j == 2) {
                    string = @"分享网易云音乐";
                } else {
                    string = @"关于";
                }
                [smallArray addObject:string];
            }
        } else {
            NSString* string = @"退出登陆";
            [smallArray addObject:string];
        }
        [_dataArray addObject:smallArray];
    }
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return  1;
    } else if (section == 1) {
        return 1;
    } else if (section == 2) {
        return 5;
    } else if (section == 3) {
        return 9;
    } else if (section == 4) {
        return 4;
    } else {
        return 1;
    }
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        NSString* cellName = @"userCell";
        
        UserCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[UserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        cell.userName.text = _dataArray[indexPath.section][indexPath.row];
        [cell.userIcon setImage:[UIImage imageNamed:@"userIcon.jpeg"]];
        
        return  cell;
    } else if (indexPath.section == 1 || indexPath.section == 4) {
        NSString* cellName = @"AccontCell";
        
        AccontCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[AccontCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        
        [self setAccontCellWithCell:cell andIndex:indexPath];
        
        return  cell;
    } else if (indexPath.section == 2 || indexPath.section == 3) {
        if (indexPath.row != 0) {
            NSString* cellName = @"AccontCell";
            
            AccontCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
            
            if (cell == nil) {
                cell = [[AccontCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
            }
            
            [self setAccontCellWithCell:cell andIndex:indexPath];
            
            [self nightSwitch:_dataArray[indexPath.section][indexPath.row] withCell:cell];
            
            return  cell;
        } else {
            NSString* cellName = @"YinYueFuWu";
            
            UITableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
            
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
            }
            
            cell.textLabel.text = _dataArray[indexPath.section][indexPath.row];
            
            return  cell;
        }
    } else {
        NSString* cellName = @"TuiChuCell";
        
        UITableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        cell.textLabel.text = _dataArray[indexPath.section][indexPath.row];
        
        cell.textLabel.textColor = [UIColor redColor];
        
        return cell;
    }
}

- (void) setAccontCellWithCell:(AccontCell*)cell andIndex:(NSIndexPath*)indexPath {
    cell.cradName.text = _dataArray[indexPath.section][indexPath.row];
    [cell.iconCard setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png", _dataArray[indexPath.section][indexPath.row]]]];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section != 0) {
        if (indexPath.section == 2 || indexPath.section == 3) {
            if (indexPath.row == 0) {
                return [_tableView rowHeight];
            } else {
                return 60;
            }
        } else {
            return 60;
        }
    }
    return  180;
}

- (void) tableView:(UITableView*)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void) createSearchRQ {
    UIBarButtonItem* button = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"saomiao-3.png"] style:UIBarButtonItemStylePlain target:self action:nil];
    
    button.tintColor = [UIColor blackColor];
    
    self.navigationItem.leftBarButtonItem = button;
}

- (void) nightSwitch:(NSString*)cardName withCell:(AccontCell*)cell{
    if ([cardName isEqual:@"夜间模式"]) {
        _switchNight = [[UISwitch alloc] initWithFrame:CGRectMake(cell.bounds.size.width, 15, 0, 0)];
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(cell.bounds.size.width + 20, 15, 30, 30)];
        view.backgroundColor = [UIColor whiteColor];
        
        [cell.contentView addSubview:view];
        [cell.contentView addSubview:_switchNight];
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 2;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 2;
}

- (UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 2)];
    view.backgroundColor = [UIColor clearColor];
    return  view;
}

- (UIView*) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 2)];
    view.backgroundColor = [UIColor clearColor];
    return  view;
}

@end
