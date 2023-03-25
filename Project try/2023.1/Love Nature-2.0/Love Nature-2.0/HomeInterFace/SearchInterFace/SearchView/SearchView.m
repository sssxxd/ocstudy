//
//  SearchView.m
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/6.
//

#import "SearchView.h"

// 引入第三方库
#import "Masonry.h"

// 引入模型类
#import "HomeModel.h"

// 引入cell
#import "SearchViewTableViewCell.h"

// 预定义屏幕宽
#define KSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

// 设置全局变量
    // cellName
static NSString *const cellName = @"SearchViewTableViewCell";
    // 通知名称
NSString *const SearchViewSearchPetInfo = @"SearchViewSearchPetInfo";

@interface SearchView ()
@property (nonatomic, strong) UITableView* tableView;
@end

@implementation SearchView

// 重写init方法
- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self initTableView];
    }
    return self;
}

// 初始化UItableView
- (void) initTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.userInteractionEnabled = YES;
    
    [_tableView registerClass:[SearchViewTableViewCell class] forCellReuseIdentifier:cellName];
    
    [self addSubview:_tableView];
}

- (void) reloadTableView {
    [_tableView reloadData];
    
    if (!_keywordListModel.data) {
        UILabel* lable = [[UILabel alloc] init];
        lable.text = @"没有搜索到结果";
        lable.textColor = [UIColor grayColor];
        lable.font = [UIFont systemFontOfSize:18];
        
        [self addSubview:lable];
        
        [lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(100);
            make.centerX.equalTo(self);
        }];
    }
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _keywordListModel.data.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return KSCREEN_WIDTH / 4.2;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SearchViewTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath];
    
    KeywordListDataModel* dataModel = _keywordListModel.data[indexPath.row];
    
    cell.nameLabel.text = dataModel.name;
    cell.imageString = dataModel.image;
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    KeywordListDataModel* dataModel = _keywordListModel.data[indexPath.row];
    NSString* name = dataModel.name;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:SearchViewSearchPetInfo object:nil userInfo:@{@"name":name}];
}

@end
