//
//  MyInformationCell.m
//  Project01
//
//  Created by 孙旭东 on 2022/7/21.
//

#import "MyInformationCell.h"

@implementation MyInformationCell

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
        // 建立子控件
        UIImageView* iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        iconView.frame = CGRectMake(25, 5, 60, 60);
        iconView.backgroundColor = [UIColor redColor];
        // 设置圆角
        [iconView.layer setMasksToBounds:YES];
        [iconView.layer setCornerRadius:10];
        _iconView = iconView;
        
        UILabel* userName = [[UILabel alloc] init];
        [self.contentView addSubview:userName];
        userName.frame = CGRectMake(95, 5, 200, 25);
        userName.font = [UIFont systemFontOfSize:20];
        _userName = userName;
        
        UILabel* accont = [[UILabel alloc] init];
        [self.contentView addSubview:accont];
        accont.frame = CGRectMake(95, 60, 100, 20);
        accont.font = [UIFont systemFontOfSize:15];
        accont.textColor = [UIColor grayColor];
        _accont = accont;
        
        UILabel* cueAccontCard = [[UILabel alloc] init];
        [self.contentView addSubview:cueAccontCard];
        cueAccontCard.frame = CGRectMake(95, 40, 100, 20);
        cueAccontCard.font = [UIFont systemFontOfSize:15];
        cueAccontCard.text = @"微信号：";
        cueAccontCard.textColor = [UIColor grayColor];
        _cueAccontCard = cueAccontCard;
        
        UIView* userState = [[UIView alloc] init];
        [self.contentView addSubview:userState];
        userState.frame = CGRectMake(95, 100, 60, 25);
        // 设置圆角
        [userState.layer setMasksToBounds:YES];
        [userState.layer setCornerRadius:10];
//        userState.backgroundColor = [UIColor redColor];
        _userState = userState;
        
        UIView* userFriendsState = [[UIView alloc] init];
        [self.contentView addSubview:userFriendsState];
        userFriendsState.frame = CGRectMake(160, 100, 250, 25);
        // 设置圆角
        [userFriendsState.layer setMasksToBounds:YES];
        [userFriendsState.layer setCornerRadius:10];
        _userFriendsState = userFriendsState;
        
        UIImageView* RQCode = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"RQ.png"]];
        [self.contentView addSubview:RQCode];
        RQCode.frame = CGRectMake(self.bounds.size.width + 10, self.bounds.size.height + 10, 20, 20);
        _QRCode = RQCode;
        
        UIButton* cradArrow = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.contentView addSubview:cradArrow];
        cradArrow.frame = CGRectMake(self.bounds.size.width + 30, self.bounds.size.height + 10, 20, 20);
        [cradArrow setImage:[UIImage imageNamed:@"jinrujiantou.png"] forState:UIControlStateNormal];
        _cradArrow = cradArrow;
        
    }
    
    return self;
}

#pragma - 创建用户状态
- (void) createUserStateButton {
    // 创建图片视图
    UIImage* image = [UIImage imageNamed:@"jiahao.png"];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
    // 设置图片视图
    imageView.frame = CGRectMake(3, 3, _userState.bounds.size.height - 7, _userState.bounds.size.height - 7);
    // 加入视图
    [_userState addSubview:imageView];
    
    // 创建label
    UILabel* state = [[UILabel alloc] initWithFrame:CGRectMake(_userState.bounds.size.height, 0, _userState.bounds.size.width - _userState.bounds.size.height, _userState.bounds.size.height)];
    state.text = @"状态";
    state.font = [UIFont systemFontOfSize:15];
    state.textColor = [UIColor grayColor];
    [_userState addSubview:state];
    
    // 创建按钮
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = _userState.bounds;
    // 设置圆角
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:_userState.bounds.size.height / 2];
    // 边框颜色
    [button.layer setBorderWidth:1.0];
    [button.layer setBorderColor:[UIColor grayColor].CGColor];
    
    [_userState addSubview:button];
}

- (void) createUserFriendsStateButtonWithNumberOfFriends:(NSInteger)numberOfFriends {
    // 计算宽度
    NSInteger width = numberOfFriends * 15 + 3;
    // 创建视图，添加用户朋友头像
    for (int i = 0; i < numberOfFriends; i++) {
        UIImage* image = [UIImage imageNamed:[NSString stringWithFormat:@"friend0%d.jpeg", i + 1]];
        UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(3 + i * 15, 3, 18, 18);
        // 圆角化
        [imageView.layer setMasksToBounds:YES];
        [imageView.layer setCornerRadius:9];
        [_userFriendsState addSubview:imageView];
    }
    
    // 设置label
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(width + 6, 3, 80, 18)];
    label.text = [NSString stringWithFormat:@"等%ld个朋友", numberOfFriends];
    label.textColor = [UIColor grayColor];
    [_userFriendsState addSubview:label];
    
    // 设置圆角ann
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, width + 89, 25);
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:25 / 2];
    // 设置边框
    [button.layer setBorderWidth:1.0];
    [button.layer setBorderColor:[UIColor grayColor].CGColor];
    
    [_userFriendsState addSubview:button];
    
}

@end
