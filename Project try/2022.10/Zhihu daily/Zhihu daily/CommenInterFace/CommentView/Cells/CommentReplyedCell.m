//
//  CommentReplyedCell.m
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/11/4.
//

#import "CommentReplyedCell.h"
#import "Masonry.h"

#define SCREEN_SIZE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE_WIDTH [UIScreen mainScreen].bounds.size.width

#define USERICON_SIZE (SCREEN_SIZE_HEIGHT/25)

@implementation CommentReplyedCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.replyComment = [[UILabel alloc] init];
        self.replyComment.font = [UIFont systemFontOfSize:16];
        self.replyComment.textColor = [UIColor grayColor];
        self.replyComment.numberOfLines = 2;
        
        self.unFoldButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.unFoldButton.tintColor = [UIColor grayColor];
        
        self.unFoldLabel = [[UILabel alloc] init];
        self.unFoldLabel.font = [UIFont systemFontOfSize:16];
        self.unFoldLabel.textColor = [UIColor grayColor];
        self.unFoldLabel.text = @"展开全文";
        
        [self.contentView addSubview:self.replyComment];
        [self.contentView addSubview:self.unFoldLabel];
        [self.contentView addSubview:self.unFoldButton];
        
        [self.userComment mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).mas_offset(48);
            make.left.mas_equalTo(self.userIcon.mas_right).mas_offset(10);
            make.right.mas_equalTo(-20);
            make.height.mas_lessThanOrEqualTo(SCREEN_SIZE_HEIGHT);
        }];
        
        [self.replyComment mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.userComment.mas_bottom).mas_offset(10);
            make.left.mas_equalTo(self.userComment.mas_left);
            make.right.mas_equalTo(-20);
            make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-60);
        }];
        
        [self.unFoldLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.contentView).mas_offset(-20);
            make.left.mas_equalTo(self.time.mas_right).mas_offset(20);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(80);
        }];
        
        [self.unFoldButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.contentView).mas_offset(-20);
            make.left.mas_equalTo(self.time.mas_right).mas_offset(20);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(80);
        }];
    }
    return self;
}

- (void) layoutSubviews {
    
//    if ([self.unfoldSelected containsObject:[NSString stringWithFormat:@"%ld", self.unFoldButton.tag]]) {
//        [self.unFoldButton setTitle:@"收起" forState:UIControlStateNormal];
//        self.replyComment.numberOfLines = 0;
//    } else {
//        [self.unFoldButton setTitle:@"展开全文" forState:UIControlStateNormal];
//        self.replyComment.numberOfLines = 2;
//    }
    
    [self.likeButton setImage:[[UIImage imageNamed:@"like.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    
    [self.commentButton setImage:[[UIImage imageNamed:@"huifu.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
}

@end
