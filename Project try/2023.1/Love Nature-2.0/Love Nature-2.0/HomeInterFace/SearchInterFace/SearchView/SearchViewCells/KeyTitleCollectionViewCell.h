//
//  KeyTitleCollectionViewCell.h
//  Find
//
//  Created by 孙旭东 on 2023/3/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SearchShareDataModel;

@interface KeyTitleCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) SearchShareDataModel* shareDataModel;

@end

NS_ASSUME_NONNULL_END
