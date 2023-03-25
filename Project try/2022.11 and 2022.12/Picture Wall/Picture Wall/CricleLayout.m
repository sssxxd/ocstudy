//
//  CricleLayout.m
//  Picture Wall
//
//  Created by 孙旭东 on 2022/12/12.
//

#import "CricleLayout.h"

@implementation CricleLayout



- (void) prepareLayout {
    [super prepareLayout];
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    /*
    计算第一张图片位置，margin就是item左右两边的跟collectionView的边界的距离，
    使第一个item位于collectionView位置
    */
    [self calculateItems];
    CGFloat margin = (self.collectionView.frame.size.width - self.itemSize.width) / 2;
    self.collectionView.contentInset = UIEdgeInsetsMake(0, margin, 0, margin);
}

- (void) calculateItems {
    self.itemSize = CGSizeMake((KScreenWidth - 60) / 3, 150);
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    self.minimumLineSpacing = 35;
//    self.minimumInteritemSpacing = 60;
//    self.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);
}

// layout随着bounds的改变而改变
- (BOOL) shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes*> *) layoutAttributesForElementsInRect:(CGRect)rect {
    // 扩大控制范围，防止出现闪屏问题
    rect.size.width += KScreenWidth;
    rect.origin.x -= KScreenWidth / 2;
    
    // 调用父类方法补好局
    NSArray* arr = [[NSArray alloc] initWithArray:[super layoutAttributesForElementsInRect:rect] copyItems:YES];
    
    for (UICollectionViewLayoutAttributes* attributes in arr) {
        // 保存图片变化系数
        CGFloat scale = 1.0;
        // collectionView的center.x
        CGFloat centerX = self.collectionView.center.x;
        // item与collectionView中心的距离
        CGFloat step = ABS(centerX - (attributes.center.x - self.collectionView.contentOffset.x));
        // 使用cos函数计算比较丝滑的变化系数
        scale = fabsf(cosf(step/centerX * M_PI/5));
        
        attributes.transform = CGAffineTransformMakeScale(scale, scale);
    }
    return arr;
}

- (CGPoint) targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    // 计算最终显示的矩形
    CGRect rect;
    rect.origin.y = 0;
    rect.origin.x = proposedContentOffset.x;
    rect.size = self.collectionView.frame.size;
    
    // 获得布局
    NSArray* arr = [super layoutAttributesForElementsInRect:rect];
    
    // 计算collectionView的中心点的X值
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width / 2;
    
    // 计算里中心点最近的图片离中心的距离
    CGFloat minDelta = MAXFLOAT;
    for (UICollectionViewLayoutAttributes* attributes in arr) {
        if (ABS(minDelta) > ABS(attributes.center.x - centerX)) {
            minDelta = attributes.center.x - centerX;
        }
    }
    
    // 修正距离，使必定有一个图片在最中心位置
    proposedContentOffset.x += minDelta;
    
    return  proposedContentOffset;
}

@end
