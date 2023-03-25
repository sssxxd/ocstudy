//
//  HomeViewCollevtionViewFlowLayout.m
//  Find
//
//  Created by 孙旭东 on 2023/3/6.
//

#import "HomeViewCollevtionViewFlowLayout.h"

@interface HomeViewCollevtionViewFlowLayout ()

@end

@implementation HomeViewCollevtionViewFlowLayout {
    NSMutableArray* _attributeArray;
}

- (void) prepareLayout {
    [super prepareLayout];
    
    _attributeArray = [[NSMutableArray alloc] init];
    
    CGFloat itemWidth = ([UIScreen mainScreen].bounds.size.width - 30) / 2;
    CGFloat itemHeight = itemWidth / 4 * 5;
    
    CGFloat height[2] = {0};
    
    for (int i = 0; i < self.itemCount; i++) {
        NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        UICollectionViewLayoutAttributes* attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        
        if (i == 0) {
            attributes.frame = CGRectMake(self.sectionInset.left, self.sectionInset.top, [UIScreen mainScreen].bounds.size.width - 20, 300);
            height[0] = height[1] = 310;
        } else {
            int flage = (i + 1) % 2;
            attributes.frame = CGRectMake(self.sectionInset.left + (itemWidth + self.minimumInteritemSpacing) * flage, height[flage] + self.minimumLineSpacing, itemWidth, itemHeight);
            
            height[flage] = height[flage] + itemHeight + self.minimumLineSpacing;
        }
        
        [_attributeArray addObject:attributes];
        
    }
    
    if (height[0] > height[1]) {
        self.itemSize = CGSizeMake(itemWidth, (height[0] - self.sectionInset.top - 310) * 2 / (self.itemCount - 2) + self.minimumLineSpacing);
    } else {
        self.itemSize = CGSizeMake(itemWidth, (height[1] - self.sectionInset.top - 310) * 2 / (self.itemCount - 1) + self.minimumLineSpacing);
    }
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes*>*) layoutAttributesForElementsInRect:(CGRect)rect {
    return  _attributeArray;
}

@end
