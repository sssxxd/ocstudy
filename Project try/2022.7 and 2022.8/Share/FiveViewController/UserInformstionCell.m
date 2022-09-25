//
//  UserInformstionCell.m
//  Share
//
//  Created by 孙旭东 on 2022/7/31.
//

#import "UserInformstionCell.h"

@implementation UserInformstionCell

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
        _iconUser = [[UIImageView alloc] initWithFrame:CGRectMake(30, 20, 100, 100)];
        [self.contentView addSubview:_iconUser];
        
        _userName = [[UILabel alloc] initWithFrame:CGRectMake(140, 22, 180, 30)];
        _userName.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:_userName];
        
        _userSelected = [[UILabel alloc] initWithFrame:CGRectMake(140, 54, 180, 20)];
        _userSelected.font = [UIFont systemFontOfSize:12];
        _userSelected.text = @"数媒/设计爱好者";
        [self.contentView addSubview:_userSelected];
        
        _userMassge = [[UILabel alloc] initWithFrame:CGRectMake(140, 90, 250, 20)];
        _userMassge.text = @"开心了就笑会，不开心了就过会再笑";
        [self.contentView addSubview:_userMassge];
        
        _heartLogo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _eyeLogo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _shareLogo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _heartLogo.frame = CGRectMake(220, 130, 21, 14);
        _eyeLogo.frame = CGRectMake(280, 130, 21, 14);
        _shareLogo.frame = CGRectMake(160, 130, 21, 14);
        [_heartLogo setImage:[UIImage imageNamed:@"button_zan.png"] forState:UIControlStateNormal];
        [_eyeLogo setImage:[UIImage imageNamed:@"button_guanzhu.png"] forState:UIControlStateNormal];
        [_shareLogo setImage:[UIImage imageNamed:@"img1.png"] forState:UIControlStateNormal];
        _heartLogo.tintColor = [UIColor colorWithRed:0.31 green:0.55 blue:0.78 alpha:1];
        _eyeLogo.tintColor = [UIColor colorWithRed:0.31 green:0.55 blue:0.78 alpha:1];
        _shareLogo.tintColor = [UIColor colorWithRed:0.31 green:0.55 blue:0.78 alpha:1];
        [self.contentView addSubview:_heartLogo];
        [self.contentView addSubview:_eyeLogo];
        [self.contentView addSubview:_shareLogo];
        
        _heartNumber = [[UILabel alloc] initWithFrame:CGRectMake(240, 134, 30, 20)];
        _eyeNumber = [[UILabel alloc] initWithFrame:CGRectMake(300, 134, 30, 20)];
        _shareNumber = [[UILabel alloc] initWithFrame:CGRectMake(180, 134, 30, 20)];
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
