//
//  UserEditUserInfoView.m
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/10.
//

#import "UserEditUserInfoView.h"

@interface UserEditUserInfoView ()

@property (nonatomic, strong) UITableView* tableView;

@end

@implementation UserEditUserInfoView

// 重写init方法
- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.tableView];
    }
    return self;
}

#pragma mark - 懒加载
- (UITableView*) tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
}

@end
