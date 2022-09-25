//
//  FiveViewController.m
//  Share
//
//  Created by 孙旭东 on 2022/7/29.
//

#import "FiveViewController.h"
#import "UserInformstionCell.h"
#import "CradCell.h"
#import "My_UpData/MyUpViewController.h"
#import "My_massage/MyMassageViewController.h"
#import "My_TuiJian/MyTuiViewController.h"
#import "SheZhi/ShezhiViewController.h"
#import "SheZhi/Password/PasswordViewController.h"

@interface FiveViewController ()

@end

@implementation FiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _MyMaggage = [[MyMassageViewController alloc] init];
    
    _SheZhi =[[ShezhiViewController alloc] init];

    
    // 初始化头像
    _iconUserName = @"sixin_img1.png";
    
    // 设置导航栏
    UINavigationBarAppearance *appperance = [[UINavigationBarAppearance alloc]init];
            //添加背景色
    appperance.backgroundColor = [UIColor colorWithRed:0.31 green:0.47 blue:0.78 alpha:1];
    appperance.shadowImage = [[UIImage alloc]init];
    appperance.shadowColor = nil;
    // 标题
    self.title = @"个人信息";
    self.navigationController.title = nil;
    [appperance setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]}];

     
    self.navigationController.navigationBar.standardAppearance = appperance;
    self.navigationController.navigationBar.scrollEdgeAppearance = appperance;
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];

    [self createTableView];
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
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self createData];
    
    [_tableView reloadData];
    
    [self.view addSubview:_tableView];
}

#pragma - 设置cell
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return 6;
    }
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        NSString* cellName = @"UserCell";
        
        UserInformstionCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[UserInformstionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        [cell.iconUser setImage:[UIImage imageNamed:_iconUserName]];
        cell.userName.text = @"share小白";
        cell.shareNumber.text = @"15";
        cell.heartNumber.text = @"120";
        cell.eyeNumber.text = @"80";
        return cell;
    } else {
        NSString* cellName = @"CradCell";
        
        CradCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[CradCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        
        cell.cradName.text = _arrayCardNames[indexPath.row];
        UIImage* image = [UIImage imageNamed:_arrayCradIcons[indexPath.row]];
        [cell.iconCard setImage:image];
        
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

// cell选中事件
- (void) tableView:(UITableView*)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        
    } else {
        if (indexPath.row == 0) {
            MyUpViewController* myUpViewControllew = [[MyUpViewController alloc] init];
            
            [self.navigationController pushViewController:myUpViewControllew animated:YES];
        } else if (indexPath.row == 1) {
            
            [self.navigationController pushViewController:_MyMaggage animated:YES];
        } else if (indexPath.row == 2) {
            MyTuiViewController* MyTuiController = [[MyTuiViewController alloc] init];
            
            [self.navigationController pushViewController:MyTuiController animated:YES];
        } else if (indexPath.row == 4) {
            
            [self.navigationController pushViewController:_SheZhi animated:YES];
        }
    }
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma - 创建数据
- (void) createData {
    _arrayCardNames = [[NSMutableArray alloc] init];
    _arrayCradIcons = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 6; i++) {
        if (i == 0) {
            [_arrayCardNames addObject:@"我上传的"];
            [_arrayCradIcons addObject:@"img2.png"];
        } else if (i == 1) {
            [_arrayCardNames addObject:@"我的信息"];
            [_arrayCradIcons addObject:@"img4"];
        } else if (i == 2) {
            [_arrayCardNames addObject:@"我推荐的"];
            [_arrayCradIcons addObject:@"button_zan.png"];
        } else if (i == 3) {
            [_arrayCardNames addObject:@"院系通知"];
            [_arrayCradIcons addObject:@"img5.png"];
        } else if (i == 4) {
            [_arrayCardNames addObject:@"设置"];
            [_arrayCradIcons addObject:@"img6.png"];
        } else if (i == 5) {
            [_arrayCardNames addObject:@"退出"];
            [_arrayCradIcons addObject:@"img7.png"];
        }
    }
}

@end
