//
//  SelectCityViewController.m
//  Weather Report
//
//  Created by 孙旭东 on 2022/8/10.
//

#import "SelectCityViewController.h"

@interface SelectCityViewController ()

@end

@implementation SelectCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView* NavigationBackView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 150)];
    [NavigationBackView setImage:[UIImage imageNamed:@"qing_img.jpeg"]];
    [self.view addSubview:NavigationBackView];
    
    [self initArrayCityID];
    
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

#pragma - 创建tableView

- (void) creatTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.frame = CGRectMake(0, 50, self.view.bounds.size.width, self.view.bounds.size.height - 50);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    UIView* view = [[UIView alloc] init];
    _tableView.tableFooterView = view;
    _tableView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_tableView];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrayCityID.count + 1;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row != _arrayCityID.count) {
        return 120;
    } else {
        return 80;
    }
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row != _arrayCityID.count) {
        NSString* cellName = @"SelectCell";
        
        SelectTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[SelectTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        
        cell.cityID = _arrayCityID[indexPath.row];
        
        return cell;
    } else {
        NSString* cellName = @"addCell";
        
        UITableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        
        [self createAddButton];
        [cell.contentView addSubview:_addButton];
        
        cell.backgroundColor = [UIColor clearColor];
        
        return cell;
    }
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row != _arrayCityID.count) {
        _showCitysViewController = [[ShowCitysViewController alloc] init];
        
        _nav = [[UINavigationController alloc] initWithRootViewController:_showCitysViewController];
        
        _nav.modalPresentationStyle = UIModalPresentationFullScreen;
        
        _showCitysViewController.cityIDArray = self.arrayCityID;
        
        _showCitysViewController.pageNow = indexPath.row;
        
        
        [self presentViewController:_nav animated:YES completion:nil];
    } else {
        [self pressAddButton];
    }
}

#pragma - 创建添加按钮
- (void) createAddButton {
    _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _addButton.frame = CGRectMake(20, 0, 80, 80);
    [_addButton setTintColor:[UIColor redColor]];
    [_addButton setImage:[UIImage imageNamed:@"jiahao-2.png"] forState:UIControlStateNormal];
    [_addButton addTarget:self action:@selector(pressAddButton) forControlEvents:UIControlEventTouchUpInside];
}

- (void) pressAddButton {
    SearchViewController* viewController = [[SearchViewController alloc] init];
    viewController.delegate = self;
    
    [self presentViewController:viewController animated:YES completion:nil];
}

#pragma - 初始化
// 初始化城市ID数组
- (void) initArrayCityID {
    _arrayCityID = [[NSMutableArray alloc] init];
    [_arrayCityID addObject:@"101110101"];
}

#pragma - 接收添加城市ID的协议方法
- (void) getCityID:(NSString *)cityID {
    [_arrayCityID addObject:cityID];
    
    [_tableView reloadData];
}

@end
