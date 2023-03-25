//
//  CommentCell.m
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/11/1.
//

#import "CommentCell.h"
#import "Masonry.h"

#define SCREEN_SIZE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE_WIDTH [UIScreen mainScreen].bounds.size.width

#define USERICON_SIZE (SCREEN_SIZE_HEIGHT/25)

@implementation CommentCell

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
        
        self.userIcon = [[UIImageView alloc] init];
        self.userIcon.layer.masksToBounds = YES;
        self.userIcon.layer.cornerRadius = USERICON_SIZE / 2;
        
        self.userName = [[UILabel alloc] init];
        [self.userName setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
        
        self.userComment = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        [self.userComment setFont:[UIFont systemFontOfSize:18]];
        self.userComment.numberOfLines = 0;
        
        self.time = [[UILabel alloc] init];
        [self.time setFont:[UIFont systemFontOfSize:14]];
        self.time.textColor = [UIColor grayColor];
        
        self.timeDay = [[UILabel alloc] init];
        [self.timeDay setFont:[UIFont systemFontOfSize:14]];
        self.timeDay.textColor = [UIColor grayColor];
        
        self.likeNumber = [[UILabel alloc] init];
        [self.likeNumber setFont:[UIFont systemFontOfSize:14]];
        self.likeNumber.textColor = [UIColor grayColor];
        
        self.likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.likeButton.tintColor = [UIColor grayColor];
        
        self.commentButton = [[UIImageView alloc] init];
        self.commentButton.tintColor = [UIColor grayColor];
        
        [self.contentView addSubview:self.userIcon];
        [self.contentView addSubview:self.userName];
        [self.contentView addSubview:self.userComment];
        [self.contentView addSubview:self.time];
        [self.contentView addSubview:self.timeDay];
        [self.contentView addSubview:self.likeNumber];
        [self.contentView addSubview:self.likeButton];
        [self.contentView addSubview:self.commentButton];
        
        [self.userIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.top.equalTo(self.contentView.mas_top).offset(20);
            make.size.mas_equalTo(USERICON_SIZE);
        }];
        
        [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.userIcon.mas_right).mas_offset(10);
            make.top.equalTo(self.contentView.mas_top).offset(22);
            make.width.mas_offset(SCREEN_SIZE_WIDTH);
        }];
        
        [self.userComment mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).mas_offset(48);
            make.left.mas_equalTo(self.userIcon.mas_right).mas_offset(10);
            make.right.mas_equalTo(-20);
            make.height.mas_lessThanOrEqualTo(SCREEN_SIZE_HEIGHT);
            make.bottom.equalTo(self.contentView).mas_offset(-60);
        }];
        
        [self.timeDay mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.userIcon.mas_right).mas_offset(10);
            make.bottom.mas_equalTo(self.contentView).mas_offset(-20);
        }];
        
        [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.contentView).mas_offset(-20);
            make.left.mas_equalTo(self.timeDay.mas_right).mas_offset(10);
        }];
        
        [self.commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.contentView).mas_offset(-20);
            make.right.mas_equalTo(-20);
            make.size.mas_equalTo(20);
        }];
        
        [self.likeButton mas_makeConstraints:^(MASConstraintMaker *make ){
            make.bottom.mas_equalTo(self.contentView).mas_offset(-20);
            make.right.mas_equalTo(self.commentButton.mas_left).mas_offset(-30);
            make.size.mas_equalTo(20);
        }];
        
        [self.likeNumber mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.contentView).mas_offset(-20);
            make.right.mas_equalTo(self.likeButton.mas_left);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(20);
        }];
    }
    return self;
}


- (void) layoutSubviews {
    [self.likeButton setImage:[[UIImage imageNamed:@"like.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    
    [self.commentButton setImage:[[UIImage imageNamed:@"huifu.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
}

//- (CGFloat) getAutoCellHeight {
//    return self.timeDay.frame.origin.y + self.timeDay.frame.size.height + 20;
//}

@end
