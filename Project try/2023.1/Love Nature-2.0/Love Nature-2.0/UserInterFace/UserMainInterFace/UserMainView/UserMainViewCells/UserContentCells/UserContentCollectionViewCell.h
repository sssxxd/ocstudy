//
//  UserContentCollectionViewCell.h
//  Find
//
//  Created by 孙旭东 on 2023/3/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class  UserContentDataModel;

@interface UserContentCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UserContentDataModel* contentDataModel;
@end

NS_ASSUME_NONNULL_END
