//
//  FirstShowUserTableViewCell.m
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import "FirstShowUserTableViewCell.h"

@implementation FirstShowUserTableViewCell

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
        _icon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
        [_icon setImage:[UIImage imageNamed:@"works_head.png"]];
        [self.contentView addSubview:_icon];
        
        _userName = [[UILabel alloc] initWithFrame:CGRectMake(90, 13, 100, 30)];
        _userName.font = [UIFont systemFontOfSize:17];
        _userName.text = @"假日";
        [self.contentView addSubview:_userName];
        
        _showTitle = [[UILabel alloc] initWithFrame:CGRectMake(90, 38, 100, 20)];
        _showTitle.text = @"share小白";
        [self.contentView addSubview:_showTitle];
        
        _time = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width - 30, 13, 100, 20)];
        _time.text = @"15分钟前";
        [self.contentView addSubview:_time];
        
        _heartLogo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _eyeLogo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _shareLogo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _heartLogo.frame = CGRectMake(210, 48, 21, 14);
        _eyeLogo.frame = CGRectMake(270, 48, 21, 14);
        _shareLogo.frame = CGRectMake(330, 48, 21, 14);
        [_heartLogo setImage:[UIImage imageNamed:@"button_zan.png"] forState:UIControlStateNormal];
        [_eyeLogo setImage:[UIImage imageNamed:@"button_guanzhu.png"] forState:UIControlStateNormal];
        [_shareLogo setImage:[UIImage imageNamed:@"button_share.png"] forState:UIControlStateNormal];
        _heartLogo.tintColor = [UIColor colorWithRed:0.31 green:0.55 blue:0.78 alpha:1];
        _eyeLogo.tintColor = [UIColor colorWithRed:0.31 green:0.55 blue:0.78 alpha:1];
        _shareLogo.tintColor = [UIColor colorWithRed:0.31 green:0.55 blue:0.78 alpha:1];
        [self.contentView addSubview:_heartLogo];
        [self.contentView addSubview:_eyeLogo];
        [self.contentView addSubview:_shareLogo];
        
        _heartNumber = [[UILabel alloc] initWithFrame:CGRectMake(230, 48, 30, 20)];
        _eyeNumber = [[UILabel alloc] initWithFrame:CGRectMake(290, 48, 30, 20)];
        _shareNumber = [[UILabel alloc] initWithFrame:CGRectMake(350, 48, 30, 20)];
        _heartNumber.font = [UIFont systemFontOfSize:12];
        _eyeNumber.font = [UIFont systemFontOfSize:12];
        _shareNumber.font = [UIFont systemFontOfSize:12];
        _heartNumber.textColor = [UIColor colorWithRed:0.31 green:0.55 blue:0.78 alpha:1];
        _eyeNumber.textColor = [UIColor colorWithRed:0.31 green:0.55 blue:0.78 alpha:1];
        _shareNumber.textColor = [UIColor colorWithRed:0.31 green:0.55 blue:0.78 alpha:1];
        [self.contentView addSubview:_heartNumber];
        [self.contentView addSubview:_eyeNumber];
        [self.contentView addSubview:_shareNumber];
        
    }
    return self;
}
@end
