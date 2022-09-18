//
//  MyGuanZhuViewController.m
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import "MyGuanZhuViewController.h"
#import "MyGuanZhuTableViewCell.h"

@interface MyGuanZhuViewController ()

@end

@implementation MyGuanZhuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (_selectdeSet == nil) {
        _selectdeSet = [NSMutableSet set];
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
    
    for (int i = 0; i < 6; i++) {
        if (i == 0) {
            [_arrayData addObject:@"share小格"];
        } else if (i == 1) {
            [_arrayData addObject:@"share小兰"];
        } else if (i == 2) {
            [_arrayData addObject:@"share小明"];
        } else if (i == 3) {
            [_arrayData addObject:@"share小雪"];
        } else if (i == 4) {
            [_arrayData addObject:@"share萌萌"];
        } else {
            [_arrayData addObject:@"shareLity"];
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
    
    MyGuanZhuTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
    
    if (cell == nil) {
        cell = [[MyGuanZhuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    
    cell.friendName.text = _arrayData[indexPath.row];
    
    [cell.firendsIcon setImage:[UIImage imageNamed:[NSString stringWithFormat:@"icon_img%ld.jpeg", indexPath.row + 1]]];
    cell.button.tag = 520 + indexPath.row;
    [cell.button addTarget:self action:@selector(chooseAction:) forControlEvents:UIControlEventTouchUpInside];
    
    if ([_selectdeSet containsObject:[NSString stringWithFormat:@"%ld", 520 + indexPath.row]]) {
        cell.button.selected = YES;
    }
    
    
    return cell;
}

- (void) chooseAction:(UIButton*) sender {
    if (sender.selected == NO) {
        sender.selected = YES;
        
        [_selectdeSet addObject:[NSString stringWithFormat:@"%ld", sender.tag]];
    } else {
        sender.selected = NO;
        
        [_selectdeSet removeObject:[NSString stringWithFormat:@"%ld", sender.tag]];
    }
    [self.delegate setSelectedSet:_selectdeSet];
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

// cell高度
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
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
