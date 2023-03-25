//
//  HomeView.m
//  Find
//
//  Created by 孙旭东 on 2023/3/11.
//

#import "ConllectionView+homeView.h"

@implementation UICollectionView (HomView)

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesBegan:touches withEvent:event];
    [super touchesBegan:touches withEvent:event];
}

@end
