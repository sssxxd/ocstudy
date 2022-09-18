//
//  FirstViewController.m
//  Share
//
//  Created by 孙旭东 on 2022/7/29.
//

#import "FirstViewController.h"
#import "ScrollViewCell.h"
#import "ShareTableViewCell.h"
#import "FirstShow/FirstShowViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    // 设置导航栏
    UINavigationBarAppearance *appperance = [[UINavigationBarAppearance alloc]init];
            //添加背景色
    appperance.backgroundColor = [UIColor colorWithRed:0.31 green:0.47 blue:0.78 alpha:1];
    appperance.shadowImage = [[UIImage alloc]init];
    appperance.shadowColor = nil;
    
    self.title = @"SHARE";
    self.navigationController.title = nil;
    [appperance setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]}];

     
    self.navigationController.navigationBar.standardAppearance = appperance;
    self.navigationController.navigationBar.scrollEdgeAppearance = appperance;
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    // 初始化是否点赞
    _isSelected = 0;
    
    // 创建_tableView
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView reloadData];
    
    // 创建数据
    [self createArrayData];
    [self.view addSubview:_tableView];

//    //导航栏上面的填色
//    UIView* backViewUpNavigationController = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
//    backViewUpNavigationController.backgroundColor = [UIColor redColor];
//    [self.view addSubview:backViewUpNavigationController];
}

#pragma - 设置UITableView
// 行数
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

// 组数
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

// 返回cell
- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        NSString* cellName = @"ScrollView";
        
        ScrollViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[ScrollViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        return cell;
    } else {
        NSString* cellName = @"ShareTableCiewCell";
        
        ShareTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[ShareTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        [cell.listImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"list_img%ld.png", indexPath.section]]];
        cell.shareTitle.text = _arrayData[indexPath.section - 1];
        cell.shareByWho.text = [NSString stringWithFormat:@"share by %@", _arrayUsers[indexPath.section - 1]];
        cell.shareTime.text = _arrarTime[indexPath.section - 1];
        
        cell.eyeNumber.text = @"55";
        cell.shareNumber.text = @"68";

        cell.heartLogo.tag = 100 + indexPath.row;
        cell.heartNumber.tag = 150 + indexPath.row;
        
        cell.heartNumber.text = [NSString stringWithFormat:@"%ld", 101 + _isSelected];
        
        [cell.heartLogo addTarget:self action:@selector(pressHeartLogo:) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
    }
}

- (void) pressHeartLogo:(UIButton*)sender {
    if ([_selected containsObject:[NSString stringWithFormat:@"%ld", sender.tag]]) {
        [_selected removeObject:[NSString stringWithFormat:@"%ld", sender.tag]];
        _isSelected = 0;
        [_tableView reloadData];
    } else {
        [_selected addObject:[NSString stringWithFormat:@"%ld", sender.tag]];
        _isSelected = 1;
        [_tableView reloadData];
    }
}

// cell高度
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 168;
    } else {
        return 150;
    }
}

// cell组距
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 20;
}

- (UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 0)];
    view.backgroundColor = [UIColor clearColor];
    return  view;
}

- (UIView*) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 2)];
    view.backgroundColor = [UIColor clearColor];
    return  view;
}

// cell动画自动取消选中
- (void) tableView:(UITableView*)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        FirstShowViewController* viewController = [[FirstShowViewController alloc] init];
        viewController.selected = _isSelected;
        viewController.delegate = self;
        
        [self.navigationController pushViewController:viewController animated:YES];
    }
    
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma - 创建数据

- (void) createArrayData {
    // 分享单元格标题
    _arrayData = [[NSMutableArray alloc] init];
    // 分享用户
    _arrayUsers = [[NSMutableArray alloc] init];
    // 分享时间
    _arrarTime = [[NSMutableArray alloc] init];
    
    _selected = [NSMutableSet set];
    for (int i = 0; i < 4; i++) {
        if (i == 0) {
            NSString* data = @"假日";
            NSString* user = @"江小白";
            [_arrayData addObject:data];
            [_arrayUsers addObject:user];
            [_arrarTime addObject:@"14分钟前"];
        } else if (i == 1) {
            NSString* data = @"国外画册分析";
            NSString* user = @"小王";
            [_arrayData addObject:data];
            [_arrayUsers addObject:user];
            [_arrarTime addObject:@"15分钟前"];
        } else if (i == 2){
            NSString* data = @"collection扁平设计";
            NSString* user = @"小吕";
            [_arrarTime addObject:@"16分钟前"];
            [_arrayData addObject:data];
            [_arrayUsers addObject:user];
        } else if (i == 3) {
            NSString* data = @"版本整理术：高效解决多风格要求";
            NSString* user = @"小王";
            [_arrarTime addObject:@"17分钟前"];
            [_arrayData addObject:data];
            [_arrayUsers addObject:user];
        }
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

#pragma - 传输协议
- (void) sendSelected:(NSInteger)selected {
    _isSelected = selected;
    
    [_tableView reloadData];
}


@end
