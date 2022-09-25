//
//  SearchView.m
//  Share
//
//  Created by 孙旭东 on 2022/8/1.
//

#import "SearchView.h"

@implementation SearchView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createTableView];

}

#pragma - 加载数据
- (void) createArrayData {
    // 分享单元格标题
    _arrayData = [[NSMutableArray alloc] init];
    // 分享用户
    _arrayUsers = [[NSMutableArray alloc] init];
    // 分享时间
    _arrarTime = [[NSMutableArray alloc] init];
    // 标签
    _arrayCardLabel = [[NSMutableArray alloc] init];
    for (int i = 0; i < 2; i++) {
        if (i == 0) {
            NSString* data = @"Icon of Baymax";
            NSString* user = @"小白";
            [_arrayData addObject:data];
            [_arrayUsers addObject:user];
            [_arrarTime addObject:@"15分钟前"];
            [_arrayCardLabel addObject:@"原创-UI-icon"];
        } else if (i == 1) {
            NSString* data = @"每个人都需要一个大白";
            NSString* user = @"小王";
            [_arrayData addObject:data];
            [_arrayUsers addObject:user];
            [_arrarTime addObject:@"1个月前"];
            [_arrayCardLabel addObject:@"原创作品-摄影"];
        }
    }
}

#pragma - 创建TableView
- (void) createTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView reloadData];
    
    [self createArrayData];
    [self.view addSubview:_tableView];
}

#pragma - 设置cell
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

// cell高度
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

// cell动画自动取消选中
- (void) tableView:(UITableView*)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellName = @"SearchViewCell";
    
    ShareTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
    
    if (cell == nil) {
        cell = [[ShareTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    
    [cell.listImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"search0%ld.jpeg", indexPath.section + 1]]];
    cell.shareTitle.text = _arrayData[indexPath.section];
    cell.shareByWho.text = [NSString stringWithFormat:@"share by %@", _arrayUsers[indexPath.section]];
    cell.shareTime.text = _arrarTime[indexPath.section];
    cell.heartNumber.text = @"102";
    cell.eyeNumber.text = @"26";
    cell.shareNumber.text = @"20";
    cell.cradLabel.text = _arrayCardLabel[indexPath.section];
    
    return cell;
}

@end
