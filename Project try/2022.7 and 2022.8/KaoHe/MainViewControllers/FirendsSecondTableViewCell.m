//
//  FirendsSecondTableViewCell.m
//  KaoHe
//
//  Created by 孙旭东 on 2022/8/5.
//

#import "FirendsSecondTableViewCell.h"

@implementation FirendsSecondTableViewCell

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
        _userIcon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
        
        _userName = [[UILabel alloc] initWithFrame:CGRectMake(70, 10, 100, 20)];
        _userName.textColor = [UIColor blueColor];
        
        _shareTitle = [[UILabel alloc] initWithFrame:CGRectMake(70, 30, 200, 20)];
        
        [self.contentView addSubview:_userName];
        [self.contentView addSubview:_userIcon];
        [self.contentView addSubview:_shareTitle];
    }
    return  self;
}

@end
