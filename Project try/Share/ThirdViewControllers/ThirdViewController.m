//
//  ThirdViewController.m
//  Share
//
//  Created by 孙旭东 on 2022/7/29.
//

#import "ThirdViewController.h"
#import "ThirdShareTableViewCell.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 设置导航栏
    UINavigationBarAppearance *appperance = [[UINavigationBarAppearance alloc]init];
            //添加背景色
    appperance.backgroundColor = [UIColor colorWithRed:0.31 green:0.47 blue:0.78 alpha:1];
    appperance.shadowImage = [[UIImage alloc]init];
    appperance.shadowColor = nil;
    // 标题
    self.title = @"文章";
    self.navigationController.title = nil;
    [appperance setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]}];

     
    self.navigationController.navigationBar.standardAppearance = appperance;
    self.navigationController.navigationBar.scrollEdgeAppearance = appperance;
    
    [self selectedBackColor];
    [self createButtons];
    [self createScrollView];
    [self createFirstTableView];
    [self craeteThirdTableView];
    [self createSecondTableView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma - 创建三个按钮
- (void) createButtons {
    UIButton* firstButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton* secondButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton* thirdButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    firstButton.frame = CGRectMake(0, 80, 130, 50);
    secondButton.frame = CGRectMake(130, 80, 130, 50);
    thirdButton.frame = CGRectMake(260, 80, 130, 50);
    firstButton.backgroundColor = [UIColor grayColor];
    secondButton.backgroundColor = [UIColor grayColor];
    thirdButton.backgroundColor = [UIColor grayColor];
    
    firstButton.titleLabel.font = [UIFont systemFontOfSize:18];
    secondButton.titleLabel.font = [UIFont systemFontOfSize:18];
    thirdButton.titleLabel.font = [UIFont systemFontOfSize:18];
    
    [firstButton setTitle:@"精选文章" forState:UIControlStateNormal];
    [secondButton setTitle:@"热门推荐" forState:UIControlStateNormal];
    [thirdButton setTitle:@"全部文章" forState:UIControlStateNormal];
    
    [firstButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [secondButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [thirdButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    
    firstButton.tintColor = [UIColor whiteColor];
    secondButton.tintColor = [UIColor whiteColor];
    thirdButton.tintColor = [UIColor whiteColor];
    
    firstButton.tag = 301;
    secondButton.tag = 302;
    thirdButton.tag = 303;
    
    [firstButton addSubview:_buttonSelectedView];
    
    [self.view addSubview:firstButton];
    [self.view addSubview:secondButton];
    [self.view addSubview:thirdButton];
}

- (void) pressButton:(UIButton*)sender {
    
    [_buttonSelectedView removeFromSuperview];
    [sender addSubview:_buttonSelectedView];
    
    if (sender.tag == 301) {
        [_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    } else if (sender.tag == 302) {
        [_scrollView setContentOffset:CGPointMake(self.view.bounds.size.width, 0) animated:YES];
    } else if (sender.tag == 303) {
        [_scrollView setContentOffset:CGPointMake(self.view.bounds.size.width * 2, 0) animated:YES];
    }
}

// 颜色设计
- (void) selectedBackColor {
    _buttonSelectedView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 130, 50)];
    _buttonSelectedView.backgroundColor = [UIColor grayColor];
    _buttonSelectedView.alpha = 0.8;
}

#pragma - 设置Cell

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellName = @"ShareTableCiewCell";
    
    if (tableView.tag == 311) {
        ThirdShareTableViewCell* cell = [_firstTableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[ThirdShareTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        
        [cell.listImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"first_list_img%ld.jpeg", indexPath.section + 1]]];
        cell.shareTitle.text = _arrayData[indexPath.section];
        cell.shareByWho.text = [NSString stringWithFormat:@"share by %@", _arrayUsers[indexPath.section]];
        cell.shareTime.text = _arrarTime[indexPath.section];
        cell.heartNumber.text = @"102";
        cell.eyeNumber.text = @"55";
        cell.shareNumber.text = @"68";
        
        return cell;
    } else if (tableView.tag == 312) {
        ThirdShareTableViewCell* cell = [_secondTableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[ThirdShareTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        
        [cell.listImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"second_list_img%ld.jpeg", indexPath.section + 1]]];
        cell.shareTitle.text = _arraySecondData[indexPath.section];
        cell.shareByWho.text = [NSString stringWithFormat:@"share by %@", _arraySecondUsers[indexPath.section]];
        cell.shareTime.text = _arrarSecondTime[indexPath.section];
        cell.heartNumber.text = @"102";
        cell.eyeNumber.text = @"55";
        cell.shareNumber.text = @"68";
        
        return cell;
    } else {
        ThirdShareTableViewCell* cell = [_thridTableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[ThirdShareTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        
        [cell.listImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"third_list_img%ld.jpeg", indexPath.section + 1]]];
        cell.shareTitle.text = _arrayThirdData[indexPath.section];
        cell.shareByWho.text = [NSString stringWithFormat:@"share by %@", _arrayThirdUsers[indexPath.section]];
        cell.shareTime.text = _arrarThirdTime[indexPath.section];
        cell.heartNumber.text = @"102";
        cell.eyeNumber.text = @"55";
        cell.shareNumber.text = @"68";
        
        return cell;
    }
}

// cell高度
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

// cell动画自动取消选中
- (void) tableView:(UITableView*)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    [_firstTableView deselectRowAtIndexPath:indexPath animated:YES];
    [_secondTableView deselectRowAtIndexPath:indexPath animated:YES];
    [_thridTableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma - 创建数据

- (void) createArrayData {
    // 分享单元格标题
    _arrayData = [[NSMutableArray alloc] init];
    // 分享用户
    _arrayUsers = [[NSMutableArray alloc] init];
    // 分享时间
    _arrarTime = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        if (i == 0) {
            NSString* data = @"蹭饭技术";
            NSString* user = @"银时";
            [_arrayData addObject:data];
            [_arrayUsers addObject:user];
            [_arrarTime addObject:@"34分钟前"];
        } else if (i == 1) {
            NSString* data = @"淑女的养成方法";
            NSString* user = @"远坂凛";
            [_arrayData addObject:data];
            [_arrayUsers addObject:user];
            [_arrarTime addObject:@"42分钟前"];
        } else if (i == 2){
            NSString* data = @"通向顶点的路";
            NSString* user = @"成田路";
            [_arrarTime addObject:@"16分钟前"];
            [_arrayData addObject:data];
            [_arrayUsers addObject:user];
        } else if (i == 3) {
            NSString* data = @"麻瓜的自我修养";
            NSString* user = @"小王";
            [_arrarTime addObject:@"17分钟前"];
            [_arrayData addObject:data];
            [_arrayUsers addObject:user];
        } else if (i == 4) {
            NSString* data = @"无语了";
            NSString* user = @"sxd";
            [_arrarTime addObject:@"1分钟前"];
            [_arrayData addObject:data];
            [_arrayUsers addObject:user];
        }
    }
}

- (void) createSecondData {
    // 分享单元格标题
    _arraySecondData = [[NSMutableArray alloc] init];
    // 分享用户
    _arraySecondUsers = [[NSMutableArray alloc] init];
    // 分享时间
    _arrarSecondTime = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        if (i == 0) {
            NSString* data = @"异世界奇遇";
            NSString* user = @"舅舅";
            [_arraySecondData addObject:data];
            [_arraySecondUsers addObject:user];
            [_arrarSecondTime addObject:@"4分钟前"];
        } else if (i == 1) {
            NSString* data = @"人渣的觉悟";
            NSString* user = @"和真";
            [_arraySecondData addObject:data];
            [_arraySecondUsers addObject:user];
            [_arrarSecondTime addObject:@"53分钟前"];
        } else if (i == 2){
            NSString* data = @"外星怪马-黄金船";
            NSString* user = @"训练员";
            [_arrarSecondTime addObject:@"31分钟前"];
            [_arraySecondData addObject:data];
            [_arraySecondUsers addObject:user];
        } else if (i == 3) {
            NSString* data = @"扭曲文学";
            NSString* user = @"泛先生";
            [_arrarSecondTime addObject:@"17分钟前"];
            [_arraySecondData addObject:data];
            [_arraySecondUsers addObject:user];
        } else if (i == 4) {
            NSString* data = @"职场交际";
            NSString* user = @"xxx领导";
            [_arrarSecondTime addObject:@"54分钟前"];
            [_arraySecondData addObject:data];
            [_arraySecondUsers addObject:user];
        }
    }
}

- (void) createThirdData {
    // 分享单元格标题
    _arrayThirdData = [[NSMutableArray alloc] init];
    // 分享用户
    _arrayThirdUsers = [[NSMutableArray alloc] init];
    // 分享时间
    _arrarThirdTime = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        if (i == 0) {
            NSString* data = @"童年回忆";
            NSString* user = @"某大学生";
            [_arrayThirdData addObject:data];
            [_arrayThirdUsers addObject:user];
            [_arrarThirdTime addObject:@"44分钟前"];
        } else if (i == 1) {
            NSString* data = @"摆烂的艺术";
            NSString* user = @"反卷人士";
            [_arrayThirdData addObject:data];
            [_arrayThirdUsers addObject:user];
            [_arrarThirdTime addObject:@"24分钟前"];
        } else if (i == 2){
            NSString* data = @"好歌剧与和田龙二";
            NSString* user = @"爱马仕";
            [_arrarThirdTime addObject:@"16分钟前"];
            [_arrayThirdData addObject:data];
            [_arrayThirdUsers addObject:user];
        } else if (i == 3) {
            NSString* data = @"百合赛高";
            NSString* user = @"小王";
            [_arrarThirdTime addObject:@"22分钟前"];
            [_arrayThirdData addObject:data];
            [_arrayThirdUsers addObject:user];
        } else if (i == 4) {
            NSString* data = @"数媒设计";
            NSString* user = @"小李";
            [_arrarThirdTime addObject:@"14分钟前"];
            [_arrayThirdData addObject:data];
            [_arrayThirdUsers addObject:user];
        }
    }
}

#pragma - 创建UITableView
- (void) createFirstTableView {
    // 创建_tableView
    _firstTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _firstTableView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 220);
    
    _firstTableView.delegate = self;
    _firstTableView.dataSource = self;
    
    _firstTableView.tag = 311;
    
    [_firstTableView reloadData];
    
    // 创建数据
    [self createArrayData];
    [_scrollView addSubview:_firstTableView];
}

- (void) createSecondTableView {
    // 创建_tableView
    _secondTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _secondTableView.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height - 220);
    
    _secondTableView.delegate = self;
    _secondTableView.dataSource = self;
    
    _secondTableView.tag = 312;
    
    [_secondTableView reloadData];
    
    // 创建数据
    [self createSecondData];
    [_scrollView addSubview:_secondTableView];
}

- (void) craeteThirdTableView {
    // 创建_tableView
    _thridTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _thridTableView.frame = CGRectMake(self.view.bounds.size.width * 2, 0, self.view.bounds.size.width, self.view.bounds.size.height - 220);
    
    _thridTableView.delegate = self;
    _thridTableView.dataSource = self;
    
    _thridTableView.tag = 313;
    
    [_thridTableView reloadData];
    
    // 创建数据
    [self createThirdData];
    [_scrollView addSubview:_thridTableView];
}

#pragma - 创建滚动视图
- (void) createScrollView {
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = CGRectMake(0, 130, self.view.bounds.size.width, self.view.bounds.size.height + 150);
    _scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 3, self.view.bounds.size.height + 150);
    _scrollView.pagingEnabled = YES;
    _scrollView.scrollEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    
    [self.view addSubview:_scrollView];
}

#pragma - 手势操作
- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger offsetX = (_scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width);
    
    [_buttonSelectedView removeFromSuperview];
    
    UIButton* button = (UIButton*)[self.view viewWithTag:301 + offsetX];
    
    [button addSubview:_buttonSelectedView];
}

@end
