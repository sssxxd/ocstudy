//
//  UserMainViewUserInfoTableViewCell.m
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/1/31.
//

#import "UserMainViewUserInfoTableViewCell.h"

// 引入第三方库
#import "Masonry.h"

// 引入工具类
#import "LNManager.h"

// 预定义屏幕宽
#define KSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

NSString *const UserMainViewUserInfoTableViewCellEditUserInfo = @"UserMainViewUserInfoTableViewCellEditUserInfo";

NSString *const UserMainViewUserInfoTableViewCellUpDataIcon = @"UserMainViewUserInfoTableViewCellUpDataIcon";

NSString *const UserMainViewUserInfoTableViewCellSetting = @"UserMainViewUserInfoTableViewCellSetting";

@interface UserMainViewUserInfoTableViewCell ()

@property (nonatomic, strong) UIImageView* userIconImageView;
@property (nonatomic, strong) UILabel* userFolloweeLabel;
@property (nonatomic, strong) UILabel* userFolloweeNumberLabel;
@property (nonatomic, strong) UILabel* userFansLabel;
@property (nonatomic, strong) UILabel* userFansNumberLabel;
@property (nonatomic, strong) UILabel* userNotesNumberLabel;
@property (nonatomic, strong) UILabel* userNotesNumberNumberLabel;
@property (nonatomic, strong) UIImageView* userSexIconImageView;

@property (nonatomic, strong) UIButton* upIconButtton;
@property (nonatomic, strong) UIButton* editUserInfoButton;
@property (nonatomic, strong) UIButton* setButton;

@end

@implementation UserMainViewUserInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// 初始化
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor clearColor];
        
        self.userIconImageView = [[UIImageView alloc] init];
        _userIconImageView.userInteractionEnabled = YES;
        [self.contentView addSubview:_userIconImageView];
        
        self.userIntroductionLanel = [[UILabel alloc] init];
        _userIntroductionLanel.textColor = [UIColor blackColor];
        _userIntroductionLanel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_userIntroductionLanel];
        
        self.userNickNameLabel = [[UILabel alloc] init];
        _userNickNameLabel.textColor = [UIColor blackColor];
        _userNickNameLabel.font = [UIFont systemFontOfSize:22];
        [self.contentView addSubview:_userNickNameLabel];
        
        self.userFolloweeLabel = [[UILabel alloc] init];
        _userFolloweeLabel.textColor = [UIColor blackColor];
        _userFolloweeLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_userFolloweeLabel];
        
        self.userFolloweeNumberLabel = [[UILabel alloc] init];
        _userFolloweeNumberLabel.textColor = [UIColor blackColor];
        _userFolloweeNumberLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_userFolloweeNumberLabel];
        
        self.userFansLabel = [[UILabel alloc] init];
        _userFansLabel.textColor = [UIColor blackColor];
        _userFansLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_userFansLabel];
        
        self.userFansNumberLabel = [[UILabel alloc] init];
        _userFansNumberLabel.textColor = [UIColor blackColor];
        _userFansNumberLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_userFansNumberLabel];
        
        self.userNotesNumberLabel = [[UILabel alloc] init];
        _userNotesNumberLabel.textColor = [UIColor blackColor];
        _userNotesNumberLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_userNotesNumberLabel];
        
        self.userNotesNumberNumberLabel = [[UILabel alloc] init];
        _userNotesNumberNumberLabel.textColor = [UIColor blackColor];
        _userNotesNumberNumberLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_userNotesNumberNumberLabel];
        
        self.userSexIconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_userSexIconImageView];
        
        self.editUserInfoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_editUserInfoButton setTitle:@"编辑资料" forState:UIControlStateNormal];
        [_editUserInfoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _editUserInfoButton.layer.cornerRadius = 11;
        _editUserInfoButton.layer.masksToBounds = YES;
        _editUserInfoButton.layer.borderColor = [UIColor blackColor].CGColor;
        _editUserInfoButton.layer.borderWidth = 1;
        [_editUserInfoButton addTarget:self action:@selector(pressEditUserInfoButton) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_editUserInfoButton];
        
        self.upIconButtton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.upIconButtton setImage:[UIImage imageNamed:@"add.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.upIconButtton];
        [self.upIconButtton addTarget:self action:@selector(pressUserIcon) forControlEvents:UIControlEventTouchUpInside];
        
        self.setButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.setButton setImage:[UIImage imageNamed:@"setting.png"] forState:UIControlStateNormal];
        [self.setButton addTarget:self action:@selector(pressSettingButton) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.setButton];
    }
    return self;
}

// 设置UI
- (void) layoutSubviews {
    // 用户头像
    CGFloat iconWidth = KSCREEN_WIDTH / 4.0f;
    
    [_userIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(0);
        make.left.mas_offset(20);
        make.height.mas_offset(iconWidth);
        make.width.mas_offset(iconWidth);
    }];
    _userIconImageView.layer.cornerRadius = iconWidth / 2;
    _userIconImageView.layer.masksToBounds = YES;
    
    [self.upIconButtton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.and.right.equalTo(self.userIconImageView);
        make.size.mas_offset(iconWidth/3.2f);
    }];
    
    // 用户昵称
    [_userNickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(30);
        make.left.mas_equalTo(_userIconImageView.mas_right).mas_offset(5);
    }];
    
    // 用户简介
    [_userIntroductionLanel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_userNickNameLabel.mas_bottom).mas_offset(13);
        make.left.equalTo(self.userNickNameLabel).mas_offset(5);
    }];
    
    // 用户关注
    [_userFolloweeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_offset(-10);
        make.left.mas_offset(22);
    }];
    
    [self.userFolloweeNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.userFolloweeLabel.mas_top).mas_offset(-2);
        make.centerX.equalTo(self.userFolloweeLabel);
    }];
    
    // 用户粉丝
    [_userFansLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_offset(-10);
        make.left.mas_equalTo(_userFolloweeLabel.mas_right).mas_offset(18);
    }];
    
    [self.userFansNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.userFansLabel.mas_top).mas_offset(-2);
        make.centerX.equalTo(self.userFansLabel);
    }];
    
    // 用户点赞
    [_userNotesNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_offset(-10);
        make.left.mas_equalTo(_userFansLabel.mas_right).mas_offset(18);
    }];
    
    [self.userNotesNumberNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.userNotesNumberLabel.mas_top).mas_offset(-2);
        make.centerX.equalTo(self.userNotesNumberLabel);
    }];
    
    // 用户性别
    [_userSexIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.userIconImageView.mas_bottom).mas_offset(12);
        make.left.mas_offset(22);
        make.size.mas_offset(20);
    }];
    
    [self.setButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.userFolloweeLabel);
        make.right.mas_offset(-20);
        make.size.mas_offset(iconWidth/3.2f);
    }];
    
    [self.editUserInfoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.userFolloweeLabel);
        make.right.mas_equalTo(self.setButton.mas_left).mas_offset(-16);
        make.height.equalTo(self.setButton);
        make.width.mas_offset(100);
    }];
}

// 登陆后刷新用户信息
- (void) setUserInfoWithData {

    [[LNManager shareLNManager] useImageURLString:_userIconURLString setImageVIew:_userIconImageView];

    _userFolloweeNumberLabel.text = [NSString stringWithFormat:@"%@", _userFolloweeString];
    _userFolloweeLabel.text = @"关注";
    
    _userFansNumberLabel.text = [NSString stringWithFormat:@"%@", _userFansString];
    _userFansLabel.text = @"粉丝";
    
    _userNotesNumberNumberLabel.text = [NSString stringWithFormat:@"%@", _userNotesNumberString];
    _userNotesNumberLabel.text = @"点赞量";
}

// 设置性别
- (void) setUserMainViewUserInfoTableViewCellSex:(UserMainViewUserInfoTableViewCellSex)sex {
    switch (sex) {
        case UserMainViewUserInfoTableViewCellNone:
        case UserMainViewUserInfoTableViewCellBoy:
            _userSexIconImageView.image = [UIImage imageNamed:@"nan.png"];
            break;
        case UserMainViewUserInfoTableViewCellGirl:
            _userSexIconImageView.image = [UIImage imageNamed:@"nv.png"];
            break;
    }
}

// 编辑个人信息方法
- (void) pressEditUserInfoButton {
    [[NSNotificationCenter defaultCenter] postNotificationName:UserMainViewUserInfoTableViewCellEditUserInfo object:nil];
}

// 换头像
- (void) pressUserIcon {
    if (_userIconURLString) {
        [[NSNotificationCenter defaultCenter] postNotificationName:UserMainViewUserInfoTableViewCellUpDataIcon object:nil];
    }
}

- (void) pressSettingButton {
    [[NSNotificationCenter defaultCenter] postNotificationName:UserMainViewUserInfoTableViewCellSetting object:nil];
}

@end
