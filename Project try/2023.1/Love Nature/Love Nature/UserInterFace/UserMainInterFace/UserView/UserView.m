//
//  UserView.m
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/7.
//

#import "UserView.h"
#import "UserMainTableViewCell.h"
#import "Manage.h"
#import "UserModel.h"

@implementation UserView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initTableView];
        [self craeteSetTitleArray];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void) initTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerClass:[UserMainTableViewCell class] forCellReuseIdentifier:@"userMainTableViewCellName"];
    
    [self addSubview:self.tableView];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } if (section == 1) {
        return 2;
    } if (section == 2) {
        return 3;
    } if (section == 3) {
        return 3;
    }
    return 1;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 170;
    }
    return 60;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UserMainTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"userMainTableViewCellName" forIndexPath:indexPath];
        
        [[Manage shareManage] setUIImageView:cell.userIcon withURL:_userData.icon];
        cell.userNameLabel.text = _userData.nickName;
        if (_userData.introduction) {
            cell.userSignatureLabel.text = _userData.introduction;
        } else {
            cell.userSignatureLabel.text = @"这个人很懒，还没有签名";
        }
        
        [self createTapGetstureFor:cell.userIcon];
        
        cell.userAttentionLabel.text = [NSString stringWithFormat:@"关注：%@", _userData.followee];
        cell.userFansLable.text = [NSString stringWithFormat:@"粉丝：%@", _userData.fans];
        
        return cell;
    }
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"cellName"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellName"];
    }
    
    cell.textLabel.text = self.setTitleArray[indexPath.section - 1][indexPath.row];
    
    return cell;
}

- (UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];
    return view;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (void) craeteSetTitleArray {
    self.setTitleArray = @[@[@"个人信息", @"账号安全"], @[@"消息", @"收藏", @"浏览历史"], @[@"设置", @"青少年守护", @"版本信息"], @[@"退出登录"]];
}

#pragma - 换头像
- (void) createTapGetstureFor:(UIImageView*)icon {
    UITapGestureRecognizer* tapGetsture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressIcon)];
    
    [icon addGestureRecognizer:tapGetsture];
}

// 换头像
- (void) pressIcon {
    
}

#pragma - 更新视图
- (void) reloadtableView {
    [_tableView reloadData];
}

@end
