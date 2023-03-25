//
//  BookcaseFaceCell.h
//  Bookcase
//
//  Created by 孙旭东 on 2022/12/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BookcaseFaceCell : UICollectionViewCell
<
UICollectionViewDelegate,
UICollectionViewDataSource
>

@property (nonatomic, strong) UICollectionView* collectionView;

@end

NS_ASSUME_NONNULL_END
