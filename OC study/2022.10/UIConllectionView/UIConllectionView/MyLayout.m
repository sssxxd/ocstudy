//
//  MyLayout.m
//  UIConllectionView
//
//  Created by 孙旭东 on 2022/11/20.
//

#import "MyLayout.h"

@implementation MyLayout {
    NSMutableArray* attributeArray;
}

- (void) prepareLayout {
    attributeArray = [[NSMutableArray alloc] init];
    [super prepareLayout];
    
    float WIDTH = ([UIScreen mainScreen].bounds.size.width - self.minimumInteritemSpacing - self.sectionInset.left - self.sectionInset.right) / 2;
    
    CGFloat colHight[2] = {0};
    
    for (int i = 0; i < self.itemCount; i++) {
        NSIndexPath* index = [NSIndexPath indexPathForItem:i inSection:0];
        
        UICollectionViewLayoutAttributes* attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:index];
        
        CGFloat hight = arc4random()%150 + 40;
        
        int width = 0;
        if (colHight[0] < colHight[1]) {
            colHight[0] = colHight[0] + hight + self.minimumLineSpacing;
            width = 0;
        } else {
            colHight[1] = colHight[1] + hight + self.minimumLineSpacing;
            width = 1;
        }
        attributes.frame = CGRectMake(self.sectionInset.left + (self.minimumInteritemSpacing + WIDTH) * width, colHight[width] - hight - self.minimumLineSpacing, WIDTH, hight);
        [attributeArray addObject:attributes];
    }
    
    if (colHight[0] > colHight[1]) {
        self.itemSize = CGSizeMake(WIDTH, ((colHight[0] - self.sectionInset.top) * 2 / self.itemCount - self.minimumLineSpacing));
    } else {
        self.itemSize = CGSizeMake(WIDTH, ((colHight[1] - self.sectionInset.top) * 2 / self.itemCount - self.minimumLineSpacing));
    }
    
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return attributeArray;
}

@end
