//
//  WodeViewController.m
//  WangYiYun
//
//  Created by 孙旭东 on 2022/7/23.
//

#import "WodeViewController.h"
#import "IconCell.h"
#import "XiaochengxuCell.h"
#import "ZuiJinBoFangCell.h"
#import "WodeYinYueCell.h"
#import "GeDanCell.h"

@interface WodeViewController ()

@end

@implementation WodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createYun];
    
    [self creatNavigtionItem];
    
    [self creatTableView];
    
    [self createSearchBar];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) createYun {
    _yun = [[YunViewController alloc] init];
    _yun.view.backgroundColor = [UIColor blueColor];
}

- (void) creatTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, self.view.bounds.size.height + 360)];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor blackColor];
    
    [_tableView reloadData];
}

- (void) creatNavigtionItem {
    UIImage* image = [UIImage imageNamed:@"yun.png"];
//    UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
    
    UIBarButtonItem* barButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(pressYun)];
    
    barButtonItem.tintColor = [UIColor redColor];
    
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

- (void) pressYun {
    [self.navigationController pushViewController:_yun animated:YES];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 100;
    }
    else if (indexPath.row == 1) {
        return 120;
    } else if (indexPath.row == 2){
        return 260;
    } else if (indexPath.row == 3){
        return 160;
    } else if (indexPath.row == 4){
        return 320;
    } else {
        return 400;
    }
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        NSString* cellName = @"IconCell";
        
        IconCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[IconCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        
        [cell setPutLvWithLV:7];
        [cell.userIcon setImage:[UIImage imageNamed:@"userIcon.jpeg"]];
        
        return cell;
    } else if (indexPath.row == 1){
        NSString* cellName = @"XiaochengxuCell";
        
        XiaochengxuCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[XiaochengxuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        return cell;
    } else if (indexPath.row == 2){
        NSString* cellName = @"WodeYinYueCell";
        
        WodeYinYueCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[WodeYinYueCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        return cell;
    } else if (indexPath.row == 3){
        NSString* cellName = @"ZuiJinBoFangCell";
        
        ZuiJinBoFangCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[ZuiJinBoFangCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        return cell;
    } else if (indexPath.row == 4){
        NSString* cellName = @"GeDanCell";
        
        GeDanCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[GeDanCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        return cell;
    } else {
        NSString* cellName = @"grandCell";
        
        UITableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        return cell;
    }
    
}

- (void) createSearchBar {
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(40, 0, 80, 30)];
    _searchBar.showsCancelButton = YES;
    _searchBar.placeholder = @"搜索";
    self.navigationItem.titleView = _searchBar;
}

- (void) tableView:(UITableView*)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

@end
