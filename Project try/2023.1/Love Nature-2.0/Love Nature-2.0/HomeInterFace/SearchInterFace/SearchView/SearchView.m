//
//  SearchView.m
//  Find
//
//  Created by 孙旭东 on 2023/3/29.
//

#import "SearchView.h"

// 引入Cell
#import "KeyListTableViewCell.h"
#import "KeyTitleCollectionViewCell.h"

// 引入模型类
#import "SearchModel.h"

// 全局变量
static NSString *const KeyListTableViewCellName = @"KeyListTableViewCell";
static NSString *const KeyTitleCollectionViewCellName = @"KeyTitleCollectionViewCell";

@interface SearchView ()
<UITableViewDelegate,
UITableViewDataSource,
UICollectionViewDelegate,
UICollectionViewDataSource>

@property (nonatomic, strong) UIScrollView* mainScrollView;

@property (nonatomic, strong) UITableView* keyListTableView;
@property (nonatomic, strong) UICollectionView* keyTitleCollectionView;

@end

@implementation SearchView

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.mainScrollView];
    }
    return self;
}

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

- (void) subViewReload {
    [self.keyTitleCollectionView reloadData];
    [self.keyListTableView reloadData];
}

#pragma mark - table代理方法
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UIScreen mainScreen].bounds.size.width / 4;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchKeyListArray.count;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KeyListTableViewCell* cell = [self.keyListTableView dequeueReusableCellWithIdentifier:KeyListTableViewCellName forIndexPath:indexPath];
    
    cell.dataModel = self.searchKeyListArray[indexPath.row];
    [cell layoutIfNeeded];
    
    return cell;
}

#pragma mark - collectionView代理方法
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.searchTitleDataArray.count;
}

- (__kindof UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    KeyTitleCollectionViewCell* cell = [self.keyTitleCollectionView dequeueReusableCellWithReuseIdentifier:KeyTitleCollectionViewCellName forIndexPath:indexPath];
    
    cell.shareDataModel = self.searchTitleDataArray[indexPath.row];
    [cell layoutIfNeeded];
    
    return cell;
}

#pragma mark - 懒加载
- (UITableView*) keyListTableView {
    if (_keyListTableView == nil) {
        self.keyListTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
        _keyListTableView.backgroundColor = [UIColor clearColor];
        _keyListTableView.delegate = self;
        _keyListTableView.dataSource = self;
        
        [_keyListTableView registerClass:[KeyListTableViewCell class] forCellReuseIdentifier:KeyListTableViewCellName];
    }
    return _keyListTableView;
}

- (UICollectionView*) keyTitleCollectionView {
    if (_keyTitleCollectionView == nil) {
        UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width - 30) / 2, (([UIScreen mainScreen].bounds.size.width - 30) / 2) / 4 * 5);
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        self.keyTitleCollectionView = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:layout];
        _keyTitleCollectionView.delegate = self;
        _keyTitleCollectionView.dataSource = self;
        _keyTitleCollectionView.showsVerticalScrollIndicator = NO;
        _keyTitleCollectionView.backgroundColor = [UIColor clearColor];
        _keyTitleCollectionView.scrollEnabled = NO;
        
        [_keyTitleCollectionView registerClass:[KeyTitleCollectionViewCell class] forCellWithReuseIdentifier:KeyTitleCollectionViewCellName];
    }
    return _keyTitleCollectionView;
}

- (UIScrollView*) mainScrollView {
    if (_mainScrollView == nil) {
        self.mainScrollView = [[UIScrollView alloc] initWithFrame:self.frame];
        _mainScrollView.scrollEnabled = NO;
        _mainScrollView.contentSize = CGSizeMake(self.frame.size.width * 2, self.frame.size.height - 221);
        _mainScrollView.showsHorizontalScrollIndicator = NO;
        _mainScrollView.pagingEnabled = YES;
        _mainScrollView.bounces = NO;
        _mainScrollView.alwaysBounceHorizontal = NO;
        
        [_mainScrollView addSubview:self.keyTitleCollectionView];
        [_mainScrollView addSubview:self.keyListTableView];
    }
    return _mainScrollView;
}

@end
