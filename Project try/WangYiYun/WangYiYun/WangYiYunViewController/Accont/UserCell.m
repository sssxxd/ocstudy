//
//  UserCell.m
//  WangYiYun
//
//  Created by 孙旭东 on 2022/7/25.
//

#import "UserCell.h"

@implementation UserCell

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
        _userIcon.frame = CGRectMake(20, 20, 40, 40);
        _userIcon.layer.masksToBounds = YES;
        _userIcon.layer.cornerRadius = 20;
        [self.contentView addSubview:_userIcon];
        
        _userName = [[UILabel alloc] init];
        _userName.frame = CGRectMake(70, 30, 100, 20);
        _userName.font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
        [self.contentView addSubview:_userName];
        
        _yunBei = [[UIView alloc] init];
        _yunBei.frame = CGRectMake(self.bounds.size.width - 30, 30, 60, 20);
        [self createYunBei];
        [self.contentView addSubview:_yunBei];
    }
    return self;
}

- (void) createYunBei {
    UILabel* label = [[UILabel alloc] init];
    UIImageView* yunBeiImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"vip.png"]];
    UIImageView* jiantou = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jinrujiantou.png"]];
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    label.text = @"赚云贝";
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor blackColor];
    label.frame = CGRectMake(20, 0, 50, 20);
    [_yunBei addSubview:label];
    
    yunBeiImage.frame = CGRectMake(3, 3, 15, 15);
    [yunBeiImage.layer setMasksToBounds:YES];
    yunBeiImage.layer.cornerRadius = 15 / 2;
    [_yunBei addSubview:yunBeiImage];
    
    jiantou.frame = CGRectMake(55, 0, 20, 20);
    jiantou.layer.masksToBounds = YES;
    jiantou.layer.cornerRadius = 10;
    [_yunBei addSubview:jiantou];
    
    button.frame = CGRectMake(0, 0, 80, 20);
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 10;
    [button.layer setBorderWidth:0.5];
    [button.layer setBorderColor:[UIColor blackColor].CGColor];
    [_yunBei addSubview:button];
    
    [self createButtonForUserCell];
}

- (void) createButtonForUserCell {
    for (int i = 0; i < 4; i++) {
        UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        UILabel* label = [[UILabel alloc] init];
        
        button.frame = CGRectMake(i * 100 + 20, 90, 40, 40);
        label.frame = CGRectMake(i * 100 + 10, 140, 90, 20);
        
        label.font = [UIFont systemFontOfSize:16];
        
        button.tintColor = [UIColor redColor];
        
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"user0%d", i +  1]] forState:UIControlStateNormal];
        if (i == 0) {
            label.text = @"我的消息";
        } else if (i == 1) {
            label.text = @"我的好友";
        } else if (i == 2) {
            label.text = @"个人主题";
        } else {
            label.text = @"个性装扮";
        }

        
        [self.contentView addSubview:button];
        [self.contentView addSubview:label];
    }
}

@end
