//
//  HomeViewScrollViewCollectionViewCell.h
//  Find
//
//  Created by 孙旭东 on 2023/3/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 设置全局变量
extern NSString *const HomeViewKnoledgeBaseButtonPressed;

@interface HomeViewScrollViewCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) NSArray* dataArray;
@end

NS_ASSUME_NONNULL_END
