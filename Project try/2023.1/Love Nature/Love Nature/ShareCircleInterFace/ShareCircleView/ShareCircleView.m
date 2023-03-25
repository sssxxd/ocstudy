//
//  ShareCircleView.m
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/15.
//

#import "ShareCircleView.h"
#import "ShareCricleViewCell/ShareCricleCollectionViewCell.h"

static const NSInteger KItemHeight = 300;

static NSString* cellName = @"ShareCricleCollectionViewCell";

@implementation ShareCircleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initCollectionView];
    }
    return self;
}

- (void) initCollectionView {
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake((self.bounds.size.width - 30) / 2, KItemHeight);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    
    [_collectionView registerClass:[ShareCricleCollectionViewCell class] forCellWithReuseIdentifier:cellName];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    [self addSubview:_collectionView];
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (__kindof UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ShareCricleCollectionViewCell* cell = [_collectionView dequeueReusableCellWithReuseIdentifier:cellName forIndexPath:indexPath];
    
    return cell;
}

@end
