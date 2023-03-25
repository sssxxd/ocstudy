//
//  CommentReplyedCell.h
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/11/4.
//

#import "CommentCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommentReplyedCell : CommentCell

@property (nonatomic, strong) UILabel* replyComment;
@property (nonatomic, strong) UIButton* unFoldButton;
@property (nonatomic, strong) UILabel* unFoldLabel;

//@property (nonatomic, strong) NSSet* unfoldSelected;

@end

NS_ASSUME_NONNULL_END
