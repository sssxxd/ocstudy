//
//  HeadViewTableViewCell.m
//  KaoHe
//
//  Created by 孙旭东 on 2022/8/5.
//

#import "HeadViewTableViewCell.h"

@implementation HeadViewTableViewCell

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
        _backImageView = [[UIImageView alloc] init];
        _backImageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
        
        _userIcon = [[UIImageView alloc] init];
        _userIcon.frame = CGRectMake(300, 160, 60, 60);
        
        _userName = [[UILabel alloc] init];
        _userName.frame = CGRectMake(230, 180, 70, 20);
        _userName.textColor = [UIColor whiteColor];
        _userName.font = [UIFont systemFontOfSize:20];
        
        [self.contentView addSubview:_backImageView];
        [self.contentView addSubview:_userIcon];
        [self.contentView addSubview:_userName];
    }
    return  self;
}

@end
