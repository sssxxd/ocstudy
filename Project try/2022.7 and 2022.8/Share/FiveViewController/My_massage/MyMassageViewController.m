//
//  MyMassageViewController.m
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import "MyMassageViewController.h"
#import "MyMassageTableViewCell.h"
#import "MyGuanZhu/MyGuanZhuViewController.h"

@interface MyMassageViewController ()

@end

@implementation MyMassageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
            [_arrayData addObject:@"评论"];
        } else if (i == 1) {
            [_arrayData addObject:@"推荐我"];
        } else if (i == 2) {
            [_arrayData addObject:@"新关注的"];
        } else if (i == 3) {
            [_arrayData addObject:@"私信"];
        } else if (i == 4) {
            [_arrayData addObject:@"活动通知"];
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
    
    MyMassageTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
    
    if (cell == nil) {
        cell = [[MyMassageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    
    cell.cradLabel.text = _arrayData[indexPath.row];
    cell.numberOfCrad.text = @"6";
    
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

#pragma - cell事件
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 2) {
        MyGuanZhuViewController* myGuanZhu = [[MyGuanZhuViewController alloc] init];
        myGuanZhu.delegate = self;
        if (_buttonSelectedSet != nil) {
            myGuanZhu.selectdeSet = _buttonSelectedSet;
        }
        [self.navigationController pushViewController:myGuanZhu animated:YES];
    }
    
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void) setSelectedSet:(NSMutableSet *)selectdeSet {
    _buttonSelectedSet = selectdeSet;
}

@end
