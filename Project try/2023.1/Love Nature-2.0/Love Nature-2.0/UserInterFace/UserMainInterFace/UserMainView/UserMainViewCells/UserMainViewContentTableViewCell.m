//
//  UserMainViewContentTableViewCell.m
//  Find
//
//  Created by 孙旭东 on 2023/3/20.
//

#import "UserMainViewContentTableViewCell.h"

// 引入第三方库
#import "Masonry.h"

// 引入模型类
#import "UserMainModel.h"

// 引入cell
#import "UserContentCollectionViewCell.h"

static NSString *const UserContentCollectionViewCellName = @"UserContentCollectionViewCell";
static NSInteger const sectionHeight = 60;
static NSInteger const topHeight = 200.952;
static NSInteger const topStatusHeight = 30;

extern NSString *const UserMainViewPressPetFile;
extern NSString *const UserMainViewPressCollect;
extern NSString *const UserMainViewPressLike;
extern NSString *const UserMainViewSetIsSunCellScroll;

NSString *const mainScrollOnPetFileNow = @"mainScrollOnPetFileNow";
NSString *const mainScrollOnCollectNow = @"mainScrollOnCollectNow";
NSString *const mainScrollOnLikeNow = @"mainScrollOnLikeNow";
NSString *const UserMainViewContentTableViewCellMainTableCanScroll = @"UserMainViewContentTableViewCellMainTableCanScroll";

// 类别
@interface UserMainViewContentTableViewCell ()
<UIScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UIScrollView* mainScrollView;
@property (nonatomic, strong) UICollectionView* petFileCollectionView;
@property (nonatomic, strong) UICollectionView* collectCollectionView;
@property (nonatomic, strong) UICollectionView* likeCollectionView;

// 滑动视图管理
@property (nonatomic, assign) BOOL isCollectionViewsScroll;
@property (nonatomic, assign) CGPoint inertiaVelocity; // 保存惯性速度
@property (nonatomic, assign) BOOL shouldInheritInertia; // 是否需要继承惯性

@end

@implementation UserMainViewContentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if  (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.mainScrollView];
        [self.mainScrollView addSubview:self.petFileCollectionView];
        [self.mainScrollView addSubview:self.collectCollectionView];
        [self.mainScrollView addSubview:self.likeCollectionView];
        
        self.isCollectionViewsScroll = NO;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(petFilePressed) name:UserMainViewPressPetFile object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(collectPressed) name:UserMainViewPressCollect object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(likePressed) name:UserMainViewPressLike object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setCollectionViewScroll:) name:UserMainViewSetIsSunCellScroll object:nil];
    }
    return self;
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)reloadSubViews {
    [self.petFileCollectionView reloadData];
    [self.collectCollectionView reloadData];
    [self.likeCollectionView reloadData];
}

#pragma mark - 通知方法
- (void) petFilePressed {
    [self.mainScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}

- (void) collectPressed {
    [self.mainScrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width, 0) animated:YES];
}

- (void) likePressed {
    [self.mainScrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width * 2, 0) animated:YES];
}

- (void) setCollectionViewScroll:(NSNotification*)notification {
    NSNumber *number = notification.userInfo[@"value"];
    BOOL isScroll = [number boolValue];
    
    self.isCollectionViewsScroll = isScroll;
}

#pragma mark - CollectionView代理
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (collectionView == self.petFileCollectionView) {
        return self.userPetFileContentDataArray.count;
    } else if (collectionView == self.collectCollectionView) {
        return self.userCollectContentDataArray.count;
    } else {
        return self.userLikeContentDataArray.count;
    }
}

- (__kindof UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UserContentCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:UserContentCollectionViewCellName forIndexPath:indexPath];
    
    if (collectionView == self.petFileCollectionView) {
        UserContentDataModel* dataModel = self.userPetFileContentDataArray[indexPath.row];
        cell.contentDataModel = dataModel;
    } if (collectionView == self.collectCollectionView) {
        UserContentDataModel* dataModel = self.userCollectContentDataArray[indexPath.row];
        cell.contentDataModel = dataModel;
    } else {
        UserContentDataModel* dataModel = self.userLikeContentDataArray[indexPath.row];
        cell.contentDataModel = dataModel;
    }
    
    [cell layoutIfNeeded];
    return cell;
}

#pragma mark - 滑动视图管理

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.mainScrollView) {
        if (self.mainScrollView.contentOffset.x == 0) {
            [[NSNotificationCenter defaultCenter] postNotificationName:mainScrollOnPetFileNow object:nil];
        } else if (self.mainScrollView.contentOffset.x == [UIScreen mainScreen].bounds.size.width) {
            [[NSNotificationCenter defaultCenter] postNotificationName:mainScrollOnCollectNow object:nil];
        } else if (self.mainScrollView.contentOffset.x == [UIScreen mainScreen].bounds.size.width * 2) {
            [[NSNotificationCenter defaultCenter] postNotificationName:mainScrollOnLikeNow object:nil];
        }
    } else {
        // 获取惯性速度和方向
        self.inertiaVelocity = [scrollView.panGestureRecognizer velocityInView:scrollView.superview];
        self.shouldInheritInertia = YES;
    }
}

- (void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (scrollView != self.mainScrollView) {
        // 获取惯性速度和方向
        self.inertiaVelocity = [scrollView.panGestureRecognizer velocityInView:scrollView.superview];
        self.shouldInheritInertia = YES;
    }
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView != self.mainScrollView) {
        if (scrollView.contentOffset.y < 0) {
            self.isCollectionViewsScroll = NO;
            
            CGPoint pointZero = CGPointMake(0, 0);
            
            self.collectCollectionView.contentOffset = pointZero;
            self.likeCollectionView.contentOffset = pointZero;
            self.likeCollectionView.contentOffset = pointZero;
            
            NSNumber* number = [NSNumber numberWithBool:self.shouldInheritInertia];
            NSValue* value = [NSValue valueWithCGPoint:self.inertiaVelocity];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:UserMainViewContentTableViewCellMainTableCanScroll object:nil userInfo:@{@"number":number, @"value":value}];
        }
    }
}

#pragma mark - 懒加载
- (UIScrollView*) mainScrollView {
    if (_mainScrollView == nil) {
        self.mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - topHeight - sectionHeight + topStatusHeight)];
        _mainScrollView.pagingEnabled = YES;
        _mainScrollView.delegate = self;
        _mainScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 3, [UIScreen mainScreen].bounds.size.height - topHeight - sectionHeight + topStatusHeight);
        _mainScrollView.bounces = NO;
        _mainScrollView.alwaysBounceHorizontal = NO;
        _mainScrollView.showsHorizontalScrollIndicator = NO;
    }
    return _mainScrollView;
}

- (UICollectionView*) petFileCollectionView {
    if (_petFileCollectionView == nil) {
        UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width - 30) / 2, (([UIScreen mainScreen].bounds.size.width - 30) / 2) / 4 * 5);
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        self.petFileCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - topHeight - sectionHeight + topStatusHeight) collectionViewLayout:layout];
        _petFileCollectionView.delegate = self;
        _petFileCollectionView.dataSource = self;
        _petFileCollectionView.showsVerticalScrollIndicator = NO;
        _petFileCollectionView.backgroundColor = [UIColor colorWithRed:0.97f green:0.97f blue:0.97f alpha:1];
        _petFileCollectionView.scrollEnabled = NO;
        
        [_petFileCollectionView registerClass:[UserContentCollectionViewCell class] forCellWithReuseIdentifier:UserContentCollectionViewCellName];
    }
    return _petFileCollectionView;
}

- (UICollectionView*) collectCollectionView {
    if (_collectCollectionView == nil) {
        UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width - 30) / 2, (([UIScreen mainScreen].bounds.size.width - 30) / 2) / 4 * 5);
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        self.collectCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - topHeight - sectionHeight + topStatusHeight) collectionViewLayout:layout];
        _collectCollectionView.delegate = self;
        _collectCollectionView.dataSource = self;
        _collectCollectionView.showsVerticalScrollIndicator = NO;
        _collectCollectionView.backgroundColor = [UIColor colorWithRed:0.97f green:0.97f blue:0.97f alpha:1];
        _collectCollectionView.scrollEnabled = NO;
        
        [_collectCollectionView registerClass:[UserContentCollectionViewCell class] forCellWithReuseIdentifier:UserContentCollectionViewCellName];
    }
    return _collectCollectionView;
}

- (UICollectionView*) likeCollectionView {
    if (_likeCollectionView == nil) {
        UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width - 30) / 2, (([UIScreen mainScreen].bounds.size.width - 30) / 2) / 4 * 5);
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        self.likeCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * 2, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - topHeight - sectionHeight + topStatusHeight) collectionViewLayout:layout];
        _likeCollectionView.delegate = self;
        _likeCollectionView.dataSource = self;
        _likeCollectionView.showsVerticalScrollIndicator = NO;
        _likeCollectionView.backgroundColor = [UIColor colorWithRed:0.97f green:0.97f blue:0.97f alpha:1];
        _likeCollectionView.scrollEnabled = NO;
        
        [_likeCollectionView registerClass:[UserContentCollectionViewCell class] forCellWithReuseIdentifier:UserContentCollectionViewCellName];
    }
    return _likeCollectionView;
}

- (void) setIsCollectionViewsScroll:(BOOL)isCollectionViewsScroll {
    _isCollectionViewsScroll = isCollectionViewsScroll;
    
    self.petFileCollectionView.scrollEnabled = isCollectionViewsScroll;
    self.collectCollectionView.scrollEnabled = isCollectionViewsScroll;
    self.likeCollectionView.scrollEnabled = isCollectionViewsScroll;
}

@end
