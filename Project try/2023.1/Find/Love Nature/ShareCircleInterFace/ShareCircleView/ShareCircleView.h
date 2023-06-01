//
//  ShareCircleView.h
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShareCircleView : UIView
<UICollectionViewDelegate,
UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView* collectionView;

@end

NS_ASSUME_NONNULL_END
