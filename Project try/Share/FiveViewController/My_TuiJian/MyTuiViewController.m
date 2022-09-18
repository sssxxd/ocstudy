//
//  MyTuiViewController.m
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import "MyTuiViewController.h"
#import "ShareTableViewCell.h"

@interface MyTuiViewController ()

@end

@implementation MyTuiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 创建_tableView
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView reloadData];
    
    // 创建数据
    [self createArrayData];
    [self.view addSubview:_tableView];
    
    [self createBarButtonItem];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma - 设置UITableView
// 行数
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

// 组数
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

// 返回cell
- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellName = @"ShareTableCiewCell";
    
    ShareTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
    
    if (cell == nil) {
        cell = [[ShareTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    [cell.listImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"list_img%ld.png", indexPath.section + 1]]];
    cell.shareTitle.text = _arrayData[indexPath.section];
    cell.shareByWho.text = [NSString stringWithFormat:@"share by %@", _arrayUsers[indexPath.section]];
    cell.shareTime.text = _arrarTime[indexPath.section];
    cell.heartNumber.text = @"102";
    cell.eyeNumber.text = @"55";
    cell.shareNumber.text = @"68";
    
    return cell;
}
// cell高度
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
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

#pragma - 导航栏按钮设计
- (void) createBarButtonItem {
    UIBarButtonItem* itemImage = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_img.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressBack)];
    
    [itemImage setTitle:@"我上传的"];
    
    [itemImage setTintColor:[UIColor whiteColor]];
    
    self.navigationItem.leftBarButtonItem = itemImage;
    
    
}

- (void) pressBack {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
