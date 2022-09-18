//
//  MassageSheZhiViewController.m
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import "MassageSheZhiViewController.h"
#import "MassageSheZhiTableViewCell.h"

@interface MassageSheZhiViewController ()

@end

@implementation MassageSheZhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (_selectedSet == nil) {
        _selectedSet = [NSMutableSet set];
    }
    
    [self createTableView];
    
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
#pragma  - 创建TableView
- (void) createTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView reloadData];
    
    [self createArrayData];
    
    [self.view addSubview:_tableView];
}

#pragma - 创建数据
- (void) createArrayData {
    _arrayData = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 5; i++) {
        if (i == 0) {
            [_arrayData addObject:@"接收所有新消息通知"];
        } else if (i == 1) {
            [_arrayData addObject:@"通知显示栏"];
        } else if (i == 2) {
            [_arrayData addObject:@"声音"];
        } else if (i == 3) {
            [_arrayData addObject:@"振动"];
        } else if (i == 4) {
            [_arrayData addObject:@"关注更新"];
        }
    }
}

#pragma - 设置cell
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellName = @"MyMassageCell";
    
    MassageSheZhiTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
    
    if (cell == nil) {
        cell = [[MassageSheZhiTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    
    cell.cradLabel.text = _arrayData[indexPath.row];
    [cell.arrowLogo addTarget:self action:@selector(chooesAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.arrowLogo.tag = 530 + indexPath.row;
    
    if ([self.selectedSet containsObject:[NSString stringWithFormat:@"%ld", 530 + indexPath.row]]) {
        cell.arrowLogo.selected = YES;
    }
    
    return cell;
}

- (void) chooesAction:(UIButton*) sender {
    if (sender.selected == NO) {
        sender.selected = YES;
        [self.selectedSet addObject:[NSString stringWithFormat:@"%ld", sender.tag]];
    } else {
        sender.selected = NO;
        [self.selectedSet removeObject:[NSString stringWithFormat:@"%ld", sender.tag]];
    }
    [self.delegate setArrowLogoSelected:_selectedSet];
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

#pragma - 导航栏按钮设计
- (void) createBarButtonItem {
    UIBarButtonItem* itemImage = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_img.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressBack)];
    
    [itemImage setTintColor:[UIColor whiteColor]];
    
    self.navigationItem.leftBarButtonItem = itemImage;
    
    
}

- (void) pressBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
