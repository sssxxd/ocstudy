//
//  FirendsTableViewCell.h
//  KaoHe
//
//  Created by 孙旭东 on 2022/8/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirendsTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView* userIcon;
@property (nonatomic, strong) UIImageView* sharePicture;
@property (nonatomic, strong) UILabel* userName;
@property (nonatomic, strong) UILabel* shareTitle;

@end

NS_ASSUME_NONNULL_END
