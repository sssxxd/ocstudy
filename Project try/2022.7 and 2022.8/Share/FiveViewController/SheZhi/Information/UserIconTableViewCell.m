//
//  UserIconTableViewCell.m
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import "UserIconTableViewCell.h"

@implementation UserIconTableViewCell

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
        _icon = [[UIImageView alloc] initWithFrame:CGRectMake(100, 10, 80, 80)];
        
        _userName = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, 60, 20)];
        _userName.text = @"头像";
        
        [self.contentView addSubview:_icon];
        [self.contentView addSubview:_userName];
    }
    return self;
}

@end
