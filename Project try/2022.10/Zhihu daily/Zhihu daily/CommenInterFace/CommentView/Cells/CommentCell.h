//
//  CommentCell.h
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/11/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommentCell : UITableViewCell

@property (nonatomic, strong) UIImageView* userIcon;
@property (nonatomic, strong) UILabel* userName;
@property (nonatomic, strong) UILabel* userComment;
@property (nonatomic, strong) UILabel* timeDay;
@property (nonatomic, strong) UILabel* time;
@property (nonatomic, strong) UILabel* likeNumber;
@property (nonatomic, strong) UIImageView* commentButton;
@property (nonatomic, strong) UIButton* likeButton;

//- (CGFloat) getAutoCellHeight;

@end

NS_ASSUME_NONNULL_END
