//
//  FourViewController.m
//  Share
//
//  Created by 孙旭东 on 2022/7/29.
//

#import "FourViewController.h"
#import "FourTableViewCell.h"

@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    UINavigationBarAppearance* appearance = [[UINavigationBarAppearance alloc] init];
    appearance.backgroundColor = [UIColor colorWithRed:0.31 green:0.47 blue:0.78 alpha:1];
    appearance.shadowImage = [UIImage new];
    appearance.shadowColor = nil;
    
    self.title = @"活动";
    self.navigationController.title = nil;
    
    [appearance setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    
    self.navigationController.navigationBar.standardAppearance = appearance;
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    
    [self creatTableView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) creatTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView reloadData];
    
    [self createArrayData];
    
    [self.view addSubview:_tableView];
}

- (void) createArrayData {
    
    _arrayData = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 2; i++) {
        if (i == 0) {
            [_arrayData addObject:@"下周也要美美的，从一条围裙开始--六月的新围裙设计大赛"];
        } else {
            [_arrayData addObject:@"MIUI主题市场让你的创意改变世界"];
        }
    }
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}

// cell高度
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 180;
}

- (void) tableView:(UITableView*)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellName = @"FourTableView";
    
    FourTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
    
    if (cell == nil) {
        cell = [[FourTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    
    [cell.picture setImage:[UIImage imageNamed:[NSString stringWithFormat:@"four_main_list%ld.jpeg", indexPath.row + 1]]];
    
    if (indexPath.row < [_arrayData count]) {
        cell.imageTitle.text = _arrayData[indexPath.row];
    }
    
    return cell;
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

@end
