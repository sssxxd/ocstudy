//
//  UserMainView.m
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/1/31.
//

#import "UserMainView.h"

// 引入Cell
#import "UserMainViewCells/UserMainViewUserInfoTableViewCell.h"
#import "UserMainViewContentTableViewCell.h"

// 引入Model
#import "UserMainModel.h"

// 引入第三方库
#import "Masonry.h"

// 预定义屏幕高和宽
#define KSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define KSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

// 定义全局变量
NSString *const messageOfToLogin = @"messageOfToLogin";

NSString *const UserMainViewPressPetFile = @"UserMainViewPressPetFile";
NSString *const UserMainViewPressCollect = @"UserMainViewPressCollect";
NSString *const UserMainViewPressLike = @"UserMainViewPressLike";
NSString *const UserMainViewSetIsSunCellScroll = @"UserMainViewSetIsSunCellScroll";

static CGFloat const sectionHeight = 60;
static CGFloat const topHeight = 200.952;
static CGFloat const topStatusHeight = 30;
static CGFloat const topNavHeight = 90.6;

extern NSString *const mainScrollOnPetFileNow;
extern NSString *const mainScrollOnCollectNow;
extern NSString *const mainScrollOnLikeNow;
extern NSString *const UserMainViewContentTableViewCellMainTableCanScroll;

// 类别
@interface UserMainView ()
@property (nonatomic, strong) UITableView* tableView;

// 标签栏
@property (nonatomic, strong) UIView* titleView;
@property (nonatomic, strong) UIView* titleLineView;

@property (nonatomic, strong) UIButton* petFileButton;
@property (nonatomic, strong) UIButton* collectButton;
@property (nonatomic, strong) UIButton* likeButton;

@property (nonatomic, assign) BOOL isMainTableViewScroll;
@property (nonatomic, assign) BOOL isSubCellScroll;
@property (nonatomic, assign) CGFloat userInfoCellHeight;
@end

// 实现
@implementation UserMainView

// init方法
- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initTableView];
        
        self.isMainTableViewScroll = YES;
        self.isSubCellScroll = NO;
        self.userInfoCellHeight = KSCREEN_HEIGHT / 4.2f;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeLineViewToPetFile) name:mainScrollOnPetFileNow object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeLineViewToCollect) name:mainScrollOnCollectNow object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeLineViewToLike) name:mainScrollOnLikeNow object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mainTableCanScroll:) name:UserMainViewContentTableViewCellMainTableCanScroll object:nil];
    }
    return self;
}

// 渲染
- (void) drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
        // 颜色空间
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        
        // 创建颜色数组
    CGFloat compoents[12] = {
            0.439f, 0.521f, 0.714f, 1,
            0.530f, 0.655f, 0.851f, 1,
            0.97f, 0.97f, 0.97f, 1
    };
        
        // 渐变位置(0~1)，数组元素个数不小于颜色数
    CGFloat locations[3] = {0, 0.4, 0.8};
        
        // 创建梯度上下文
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, compoents, locations, 3);
        
    CGContextDrawLinearGradient(ctx, gradient, CGPointMake(self.frame.size.width/2, 0), CGPointMake(self.frame.size.width/2, self.frame.size.height/2.5), kCGGradientDrawsAfterEndLocation);
        
        // 释放颜色空间
    CGColorSpaceRelease(colorSpace);
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// 初始化UItableView
- (void) initTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.userInteractionEnabled = YES;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.bounces = NO;
    self.tableView.alwaysBounceVertical = NO;
    
    [self.tableView registerClass:[UserMainViewUserInfoTableViewCell class] forCellReuseIdentifier:@"UserMainViewUserInfoTableViewCell"];
    
    [self addSubview:_tableView];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return self.userInfoCellHeight;
    } else if (indexPath.section == 1) {
        return [UIScreen mainScreen].bounds.size.height - sectionHeight - topHeight + topStatusHeight;
    }
    return 60;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        NSString* cellName = @"UserMainViewUserInfoTableViewCell";
        
        UserMainViewUserInfoTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[UserMainViewUserInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        if (_userInfoDataModel) {
            [cell setUserMainViewUserInfoTableViewCellSex:_userInfoDataModel.sex];
            cell.userNickNameLabel.text = _userInfoDataModel.nickName;
            if (![_userInfoDataModel.introduction isEqualToString:@""]) {
                cell.userIntroductionLanel.text = _userInfoDataModel.introduction;
            } else {
                cell.userIntroductionLanel.text = @"这个人比较懒，还没有简介。";
            }
            cell.userIconURLString = _userInfoDataModel.icon;
            cell.userFansString = _userInfoDataModel.fans;
            cell.userFolloweeString = _userInfoDataModel.followee;
            cell.userNotesNumberString = _userInfoDataModel.notesNumber;
            
            [cell setUserInfoWithData];
        } else {
            [cell setUserMainViewUserInfoTableViewCellSex:0];
            [cell setUserMainViewUserInfoTableViewCellSex:0];
            cell.userNickNameLabel.text = @" 游客";
            cell.userIntroductionLanel.text = @"请先登陆/注册";
            cell.userIconURLString = @"";
            cell.userFansString = @"0";
            cell.userFolloweeString = @"0";
            cell.userNotesNumberString = @"0";
            
            [cell setUserInfoWithData];
        }
        return cell;
    } else if (indexPath.section == 1 && indexPath.row == 0) {
        NSString* cellName = @"UserMainViewContentTableViewCell";
        
        UserMainViewContentTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[UserMainViewContentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        cell.userPetFileContentDataArray = self.userPetFileContentDataArray;
        cell.userCollectContentDataArray = self.userCollectContentDataArray;
        cell.userLikeContentDataArray = self.userLikeContentDataArray;
        
        [cell reloadSubViews];
        
       [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        return cell;
    }
    else {
        NSString* cellName = @"cellName";
        
        UITableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        
        cell.textLabel.text = @"退出登陆";
        cell.textLabel.textColor = [UIColor redColor];
        
        return cell;
    }
}

// 设置tableView行间距
- (UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, 0)];
    return view;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

// 标签栏
- (UIView*) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return self.titleView;
    }
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, 0)];
    return view;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return sectionHeight;
}

// 刷新视图
- (void) reloadTableView {
    [_tableView reloadData];
}

#pragma mark - 点击事件
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        if (_userInfoDataModel == nil) {
            [[NSNotificationCenter defaultCenter] postNotificationName:messageOfToLogin object:nil];
        }
    }
}

- (void) pressPetFileButton {
    [self removeLineViewToPetFile];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:UserMainViewPressPetFile object:nil];
}

- (void) pressCollectButton {
    [self removeLineViewToCollect];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:UserMainViewPressCollect object:nil];
}

- (void) pressLikeButton {
    [self removeLineViewToLike];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:UserMainViewPressLike object:nil];
}

- (void) removeLineViewToPetFile {
    [self.titleLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(1);
        make.top.mas_equalTo(self.petFileButton.mas_bottom);
        make.width.equalTo(self.petFileButton);
        make.centerX.equalTo(self.petFileButton);
    }];
}

- (void) removeLineViewToCollect {
    [self.titleLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(1);
        make.top.mas_equalTo(self.collectButton.mas_bottom);
        make.width.equalTo(self.collectButton);
        make.centerX.equalTo(self.collectButton);
    }];
}

- (void) removeLineViewToLike {
    [self.titleLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(1);
        make.top.mas_equalTo(self.likeButton.mas_bottom);
        make.width.equalTo(self.likeButton);
        make.centerX.equalTo(self.likeButton);
    }];
}

#pragma mark - 处理滚动
- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableView) {
        if (scrollView.contentOffset.y > self.userInfoCellHeight - topNavHeight) {
            // 标签栏到顶部
            self.isSubCellScroll = YES;
            self.isMainTableViewScroll = NO;
            
            // 还原位置
            scrollView.contentOffset = CGPointMake(0, self.userInfoCellHeight - topNavHeight);
        }
    }
}

- (void) mainTableCanScroll:(NSNotification*)notification {
    self.isMainTableViewScroll = YES;
    
    NSNumber* number = notification.userInfo[@"number"];
    NSValue* value = notification.userInfo[@"value"];
    
    BOOL shouldInheritInertia = [number boolValue];
    CGPoint inertiaVelocity = [value CGPointValue];

    if (shouldInheritInertia) {
        CGPoint newOffset = self.tableView.contentOffset;
        
        if (inertiaVelocity.y / 10 > 210) {
            newOffset.y -= 180;
        } else {
            newOffset.y -= inertiaVelocity.y / 10;
        }
        
        [self.tableView setContentOffset:newOffset animated:YES];
    }
}

#pragma  mark - 懒加载
- (UIView*) titleView {
    if (_titleView == nil) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width / 3.4f;
        
        self.titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];
        self.titleView.backgroundColor = [UIColor whiteColor];
        
        UIButton* petFileButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [petFileButton setTitle:@"宠物档案" forState:UIControlStateNormal];
        [petFileButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [petFileButton addTarget:self action:@selector(pressPetFileButton) forControlEvents:UIControlEventTouchUpInside];
        [self.titleView addSubview:petFileButton];
        self.petFileButton = petFileButton;
        
        UIButton* collectButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [collectButton setTitle:@"收藏" forState:UIControlStateNormal];
        [collectButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [collectButton addTarget:self action:@selector(pressCollectButton) forControlEvents:UIControlEventTouchUpInside];
        [self.titleView addSubview:collectButton];
        self.collectButton = collectButton;
        
        UIButton* likeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [likeButton setTitle:@"点赞" forState:UIControlStateNormal];
        [likeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [likeButton addTarget:self action:@selector(pressLikeButton) forControlEvents:UIControlEventTouchUpInside];
        [self.titleView addSubview:likeButton];
        self.likeButton = likeButton;
        
        [collectButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.titleView);
            make.width.mas_offset(width);
            make.height.equalTo(self.titleView);
        }];
        
        [petFileButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(collectButton);
            make.right.mas_equalTo(collectButton.mas_left);
            make.top.equalTo(collectButton);
        }];
        
        [likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(collectButton);
            make.left.mas_equalTo(collectButton.mas_right);
            make.top.equalTo(collectButton);
        }];
        
        [self.titleView addSubview:self.titleLineView];
        
        [self.titleLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_offset(1);
            make.top.mas_equalTo(petFileButton.mas_bottom);
            make.width.equalTo(petFileButton);
            make.centerX.equalTo(petFileButton);
        }];
    }
    return _titleView;
}

- (UIView*) titleLineView {
    if (_titleLineView == nil) {
        _titleLineView = [[UIView alloc] init];
        _titleLineView.backgroundColor = [UIColor grayColor];
    }
    return _titleLineView;
}

- (void) setIsMainTableViewScroll:(BOOL)isMainTableViewScroll {
    self.tableView.scrollEnabled = isMainTableViewScroll;
    _isMainTableViewScroll = isMainTableViewScroll;
}

- (void) setIsSubCellScroll:(BOOL)isSubCellScroll {
    NSNumber *number = [NSNumber numberWithBool:isSubCellScroll];
    [[NSNotificationCenter defaultCenter] postNotificationName:UserMainViewSetIsSunCellScroll object:nil userInfo:@{@"value":number}];
    
    _isSubCellScroll = isSubCellScroll;
}

@end
