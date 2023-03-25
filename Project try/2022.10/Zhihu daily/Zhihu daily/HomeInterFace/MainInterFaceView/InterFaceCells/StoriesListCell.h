//
//  StoriesListCell.h
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/10/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StoriesListCell : UITableViewCell

@property (nonatomic, strong) UIImageView* titleView;
@property (nonatomic, strong) UILabel* titleLable;
@property (nonatomic, strong) UILabel* hintLable;

@end

NS_ASSUME_NONNULL_END
