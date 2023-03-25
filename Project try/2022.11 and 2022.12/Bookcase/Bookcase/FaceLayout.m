//
//  FaceLayout.m
//  Bookcase
//
//  Created by 孙旭东 on 2022/12/18.
//

#import "FaceLayout.h"

@implementation FaceLayout

- (void) prepareLayout {
    [super prepareLayout];
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes*> *) layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray* arr = [[NSArray alloc] initWithArray:[super layoutAttributesForElementsInRect:rect] copyItems:YES];
    
    for (UICollectionViewLayoutAttributes* attributes in arr) {
        if (attributes.indexPath.row == 0) {
            attributes.transform = CGAffineTransformMakeScale(2.2, 2.2);
        }
    }
    
    return arr;
}

@end
