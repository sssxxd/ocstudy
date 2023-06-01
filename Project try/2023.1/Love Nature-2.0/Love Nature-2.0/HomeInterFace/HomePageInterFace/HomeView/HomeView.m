//
//  HomeView.m
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/6.
//

#import "HomeView.h"

// 引入CollectionView自定义类别
#import "ConllectionView+homeView.h"

// 引入第三方库
#import "Masonry.h"

// 引入模型类
#import "HomeModel.h"

// 引入CollectionView相关类
#import "HomeViewCollevtionViewFlowLayout.h"
#import "HomeViewScrollViewCollectionViewCell.h"
#import "HomeViewShareCollectionViewCell.h"

// 设置全局变量
static NSString *const HomeViewScrollViewCollectionViewCellName = @"HomeViewScrollViewCollectionViewCell";
static NSString *const HomeViewShareCollectionViewCellName = @"HomeViewShareCollectionViewCell";

NSString *const HomeViewTitleCellPressed = @"HomeViewTitleCellPressed";

@interface HomeView ()
<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView* collectionView;
@end

@implementation HomeView

- (void) initView {
    [self addSubview:self.collectionView];
}

- (void) reloadView {
    [self.collectionView reloadData];
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

#pragma mark - collection代理方法
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.HomeShareDataArray.count + 1;
}

- (__kindof UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        HomeViewScrollViewCollectionViewCell* cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:HomeViewScrollViewCollectionViewCellName forIndexPath:indexPath];

        cell.dataArray = self.HomeTopRecommendDataArray;
        
        return cell;
    } else {
        HomeViewShareCollectionViewCell* cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:HomeViewShareCollectionViewCellName forIndexPath:indexPath];
        
        HomeShareDataModel* shareDataModel = self.HomeShareDataArray[indexPath.row - 1];
        cell.shareDataModel = shareDataModel;
        
        [cell layoutIfNeeded];
        
        return cell;
    }
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row != 0) {
        NSNumber* num = [NSNumber numberWithInteger:indexPath.row - 1];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:HomeViewTitleCellPressed object:nil userInfo:@{@"value":num}];
    }
}

#pragma mark - 懒加载
- (UICollectionView*) collectionView {
    if (_collectionView == nil) {
//        CGFloat itemWidth = ([UIScreen mainScreen].bounds.size.width - 30) / 2;
        
        HomeViewCollevtionViewFlowLayout* layout = [[HomeViewCollevtionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.itemCount = self.HomeShareDataArray.count + 1;
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        
        [_collectionView registerClass:[HomeViewScrollViewCollectionViewCell class] forCellWithReuseIdentifier:HomeViewScrollViewCollectionViewCellName];
        [_collectionView registerClass:[HomeViewShareCollectionViewCell class] forCellWithReuseIdentifier:HomeViewShareCollectionViewCellName];
    }
    return _collectionView;
}

@end
