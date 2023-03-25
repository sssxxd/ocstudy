//
//  MyLayout.m
//  Picture Wall
//
//  Created by 孙旭东 on 2022/11/22.
//

#import "MyLayout.h"

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width

@implementation MyLayout

- (void) prepareLayout {
    [super prepareLayout];
    [self calculateItems];
}

- (void) calculateItems {
    self.itemSize = CGSizeMake((SCREENWIDTH - 60) / 3, 150);
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumLineSpacing = 35;
    self.minimumInteritemSpacing = 10;
    self.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);
}

- (BOOL) shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *) layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSArray* array = [super layoutAttributesForElementsInRect:rect];
    
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.bounds.size;
    
    NSMutableArray* attArray = [[NSMutableArray alloc] init];
    
    for (UICollectionViewLayoutAttributes* attributes in array) {
        
        UICollectionViewLayoutAttributes* att = [attributes copy];
        if (CGRectIntersectsRect(attributes.frame, rect)) {
            CGFloat distance = CGRectGetMidX(visibleRect) - att.center.x;
            if (distance < self.itemSize.width - 35 && - self.itemSize.width + 35 < distance) {
                
                CGFloat zoom = 1.5;
                att.transform3D = CATransform3DMakeScale(zoom, zoom, 3.0);
            }
        }
        [attArray addObject:att];
    }
    return attArray;
}

//- (CGPoint) targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {m
//
//}

@end
