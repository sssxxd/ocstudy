//
//  IconCell.m
//  WangYiYun
//
//  Created by 孙旭东 on 2022/7/25.
//

#import "IconCell.h"

@implementation IconCell

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
        _userIcon = [[UIImageView alloc] init];
        _userIcon.frame = CGRectMake(10, 10, 60, 60);
        _userIcon.layer.masksToBounds = YES;
        _userIcon.layer.cornerRadius = 30;
        [self.contentView addSubview:_userIcon];
        
        _isVIP = [[UILabel alloc] init];
        _isVIP.frame = CGRectMake(self.bounds.size.width - 60, 20, 90, 20);
        _isVIP.text = @"开通黑胶VIP";
        _isVIP.textColor = [UIColor grayColor];
        _isVIP.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_isVIP];
        
        _jiantou = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jinrujiantou.png"]];
        _jiantou.frame = CGRectMake(self.bounds.size.width + 15, 20, 20, 20);
        [self.contentView addSubview:_jiantou];
        
        _putLv = [[UILabel alloc] init];
        _putLv.backgroundColor = [UIColor grayColor];
        _putLv.frame = CGRectMake(150, 60, 30, 20);
        _putLv.alpha = 0.5;
        _putLv.layer.masksToBounds = YES;
        _putLv.layer.cornerRadius = 10;
        _putLv.font = [UIFont systemFontOfSize:15];
        _putLv.textColor = [UIColor whiteColor];
        _putLv.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_putLv];
        
        _userName = [[UILabel alloc] init];
        _userName.frame = CGRectMake(80, 15, 100, 30);
        _userName.text = @"王小明";
        _userName.font = [UIFont systemFontOfSize:20];
        _userName.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_userName];
        
        _heiJiao = [[UILabel alloc] init];
        _heiJiao.backgroundColor = [UIColor grayColor];
        _heiJiao.frame = CGRectMake(80, 60, 60, 20);
        _heiJiao.alpha = 0.5;
        _heiJiao.layer.masksToBounds = YES;
        _heiJiao.layer.cornerRadius = 10;
        _heiJiao.text = @"黑胶VIP";
        _heiJiao.font = [UIFont systemFontOfSize:15];
        _heiJiao.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_heiJiao];
        }
    self.backgroundColor = [UIColor blackColor];
    
    return self;
}

- (void) setPutLvWithLV:(NSInteger)Lv {
    _putLv.text = [NSString stringWithFormat:@"Lv%ld", Lv];
}

@end
