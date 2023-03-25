//
//  MyLayout.m
//  Bookcase
//
//  Created by 孙旭东 on 2022/12/18.
//

#import "MyLayout.h"

#define KSreenWidth [UIScreen mainScreen].bounds.size.width

@implementation MyLayout

- (void) prepareLayout {
    [super prepareLayout];
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.itemSize = CGSizeMake(100, 80);
    self.minimumInteritemSpacing = 10;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 计算第一个图片所在的位置
    CGFloat margin = (self.collectionView.frame.size.width - self.itemSize.width) / 2;
    self.collectionView.contentInset = UIEdgeInsetsMake(0, margin, 0, margin);
    
}

// 开启刷新
- (BOOL) shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes*> *) layoutAttributesForElementsInRect:(CGRect)rect {
    
    // 扩大刷新范围防止闪屏
    rect.size.width += KSreenWidth;
    rect.origin.x -= KSreenWidth / 2;
    
    // 调用父类获取布局
    NSArray* array = [[NSArray alloc] initWithArray:[super layoutAttributesForElementsInRect:rect] copyItems:YES];
    
    for (UICollectionViewLayoutAttributes* attributes in array) {
        // 保存图片变化系数
        CGFloat scale = 1.0;
        // collectionView的center.x
        CGFloat centerX = self.collectionView.center.x;
        // 图片距离中心的位置
        CGFloat step = ABS(centerX - (attributes.center.x - self.collectionView.contentOffset.x));
        // 使用cos函数计算一个明显顺滑的变化系数
        scale = fabsf(cosf(step / centerX * M_PI / 5));
        
        attributes.transform = CGAffineTransformMakeScale(scale, scale);
    }
    
    return array;
}

    
- (CGPoint) targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    
    // 计算出最终显示的矩形框
    CGRect rect;
    rect.size = self.collectionView.frame.size;
    rect.origin.x = proposedContentOffset.x;
    rect.origin.y = 0;
    
    // 获取布局
    NSArray* array = [super layoutAttributesForElementsInRect:rect];
    
    // 获取collectionView最中心点的x值
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width / 2;
    
    CGFloat minDatle = MAXFLOAT;
    for (UICollectionViewLayoutAttributes* attributes in array) {
        if (ABS(minDatle) > ABS(attributes.center.x - centerX)) {
            minDatle = attributes.center.x - centerX;
        }
    }
    
    // 修正偏移量，保证有一个图片位于屏幕中心
    proposedContentOffset.x += minDatle;
    
    return proposedContentOffset;
}
    
@end
