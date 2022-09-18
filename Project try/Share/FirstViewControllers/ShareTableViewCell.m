//
//  ShareTableViewCell.m
//  Share
//
//  Created by 孙旭东 on 2022/7/29.
//

#import "ShareTableViewCell.h"

@implementation ShareTableViewCell

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
        _listImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 150)];
        [self.contentView addSubview:_listImageView];
        
        _shareTitle = [[UILabel alloc] initWithFrame:CGRectMake(210, 0, 180, 60)];
        _shareTitle.font = [UIFont systemFontOfSize:20];
        _shareTitle.numberOfLines = 0;
        [self.contentView addSubview:_shareTitle];
        
        _shareByWho = [[UILabel alloc] initWithFrame:CGRectMake(210, 50, 180, 20)];
        [self.contentView addSubview:_shareByWho];
        
        _shareTime = [[UILabel alloc] initWithFrame:CGRectMake(210, 95, 180, 20)];
        [self.contentView addSubview:_shareTime];
        
        _heartLogo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _eyeLogo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _shareLogo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _heartLogo.frame = CGRectMake(210, 130, 21, 14);
        _eyeLogo.frame = CGRectMake(270, 130, 21, 14);
        _shareLogo.frame = CGRectMake(330, 130, 21, 14);
        [_heartLogo setImage:[UIImage imageNamed:@"button_zan.png"] forState:UIControlStateNormal];
        [_eyeLogo setImage:[UIImage imageNamed:@"button_guanzhu.png"] forState:UIControlStateNormal];
        [_shareLogo setImage:[UIImage imageNamed:@"button_share.png"] forState:UIControlStateNormal];
        _heartLogo.tintColor = [UIColor colorWithRed:0.31 green:0.55 blue:0.78 alpha:1];
        _eyeLogo.tintColor = [UIColor colorWithRed:0.31 green:0.55 blue:0.78 alpha:1];
        _shareLogo.tintColor = [UIColor colorWithRed:0.31 green:0.55 blue:0.78 alpha:1];
        [self.contentView addSubview:_heartLogo];
        [self.contentView addSubview:_eyeLogo];
        [self.contentView addSubview:_shareLogo];
        
        _heartNumber = [[UILabel alloc] initWithFrame:CGRectMake(230, 134, 30, 20)];
        _eyeNumber = [[UILabel alloc] initWithFrame:CGRectMake(290, 134, 30, 20)];
        _shareNumber = [[UILabel alloc] initWithFrame:CGRectMake(350, 134, 30, 20)];
        _heartNumber.font = [UIFont systemFontOfSize:12];
        _eyeNumber.font = [UIFont systemFontOfSize:12];
        _shareNumber.font = [UIFont systemFontOfSize:12];
        _heartNumber.textColor = [UIColor colorWithRed:0.31 green:0.55 blue:0.78 alpha:1];
        _eyeNumber.textColor = [UIColor colorWithRed:0.31 green:0.55 blue:0.78 alpha:1];
        _shareNumber.textColor = [UIColor colorWithRed:0.31 green:0.55 blue:0.78 alpha:1];
        [self.contentView addSubview:_heartNumber];
        [self.contentView addSubview:_eyeNumber];
        [self.contentView addSubview:_shareNumber];
        
        _cradLabel = [[UILabel alloc] initWithFrame:CGRectMake(210, 75, 180, 20)];
        [self.contentView addSubview:_cradLabel];
    }
    return self;
}

@end
