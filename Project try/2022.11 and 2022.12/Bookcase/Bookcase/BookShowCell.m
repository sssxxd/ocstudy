//
//  BookShowCell.m
//  Bookcase
//
//  Created by 孙旭东 on 2022/12/18.
//

#import "BookShowCell.h"
#import "MyLayout.h"
#import "BookcaseCell.h"

@implementation BookShowCell

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initCollectionView];
    }
    return self;
}

- (void) initCollectionView {
    MyLayout* layout = [[MyLayout alloc] init];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    [self.collectionView registerClass:[BookcaseCell class] forCellWithReuseIdentifier:@"bookcase"];
    
    [self.contentView addSubview:self.collectionView];
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

- (__kindof UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BookcaseCell* cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"bookcase" forIndexPath:indexPath];
    
    if (indexPath.row % 2 == 0) {
        [cell.imageView setImage:[UIImage imageNamed:@"book.jpeg"]];
    } else {
        [cell.imageView setImage:[UIImage imageNamed:@"book2.jpeg"]];
    }
    
    return cell;
}

@end
