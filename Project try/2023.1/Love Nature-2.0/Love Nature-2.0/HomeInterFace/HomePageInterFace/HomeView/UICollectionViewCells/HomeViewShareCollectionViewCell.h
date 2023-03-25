//
//  HomeViewShareCollectionViewCell.h
//  Find
//
//  Created by 孙旭东 on 2023/3/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class  HomeShareDataModel;

@interface HomeViewShareCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) HomeShareDataModel* shareDataModel;
@end

NS_ASSUME_NONNULL_END
