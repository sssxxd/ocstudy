//
//  KeyTitleCollectionViewCell.m
//  Find
//
//  Created by 孙旭东 on 2023/3/29.
//

#import "KeyTitleCollectionViewCell.h"

// 引入模型
#import "SearchModel.h"

// 引入第三方库
#import "Masonry.h"

// 引入工具类
#import "LNManager.h"

@interface KeyTitleCollectionViewCell ()

@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UIImageView* userIconImageView;
@property (nonatomic, strong) UILabel* userNameLabel;
@property (nonatomic, strong) UIImageView* mainImageView;
@property (nonatomic, strong) UIImageView* petLogoImageView;

@end

@implementation KeyTitleCollectionViewCell {
    CGFloat _iconWidth;
}


- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.contentView.layer.cornerRadius = 8;
        self.contentView.layer.masksToBounds = YES;
        
        _iconWidth = frame.size.width / 9;
    }
    return self;
}

- (void) layoutIfNeeded {
    [super layoutIfNeeded];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.userNameLabel];
    [self.contentView addSubview:self.mainImageView];
    [self.contentView addSubview:self.userIconImageView];
    [self.contentView addSubview:self.petLogoImageView];
    
    _mainImageView.layer.cornerRadius = 8;
    _mainImageView.layer.masksToBounds = YES;
    
    _userIconImageView.layer.cornerRadius = _iconWidth / 2;
    _userIconImageView.layer.masksToBounds = YES;
    
    [[LNManager shareLNManager] useImageURLString:_shareDataModel.author.icon setImageVIew:_userIconImageView];
    [[LNManager shareLNManager] useImageURLString:_shareDataModel.pictures[0] setImageVIew:_mainImageView];
    _userNameLabel.text = _shareDataModel.author.nickName;
    _titleLabel.text = _shareDataModel.blogTitle;
    
    [self layoutOfMasonry];
}

// 设置约束
- (void) layoutOfMasonry {

    [_mainImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(4);
        make.width.equalTo(self.contentView.mas_width).mas_offset(-8);
        make.centerX.equalTo(self.contentView);
        make.bottom.mas_offset(-56);
    }];

    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_mainImageView.mas_bottom).mas_offset(5);
        make.left.mas_offset(5);
        make.right.mas_offset(0);
    }];

    [_userIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_offset(-5);
        make.left.mas_offset(5);
        make.size.mas_offset(_iconWidth);
    }];

    [_userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_userIconImageView);
        make.left.mas_equalTo(_userIconImageView.mas_right).mas_offset(5);
        make.height.mas_offset(15);
        make.right.mas_offset(-30);
    }];
    
    [_petLogoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_userIconImageView);
        make.size.mas_offset(_iconWidth*1.2);
        make.right.mas_offset(-6);
    }];
    
}

#pragma mark - 懒加载
- (UILabel*) titleLabel {
    if (_titleLabel == nil) {
        self.titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _titleLabel;
}

- (UIImageView*) userIconImageView {
    if (_userIconImageView == nil) {
        self.userIconImageView = [[UIImageView alloc] init];
    }
    return _userIconImageView;
}

- (UIImageView*) mainImageView {
    if (_mainImageView == nil) {
        self.mainImageView = [[UIImageView alloc] init];
    }
    return _mainImageView;
}

- (UILabel*) userNameLabel {
    if (_userNameLabel == nil) {
        self.userNameLabel = [[UILabel alloc] init];
        _userNameLabel.textColor = [UIColor grayColor];
        _userNameLabel.font = [UIFont systemFontOfSize:13];
    }
    return _userNameLabel;
}

- (UIImageView*) petLogoImageView {
    if (_petLogoImageView == nil) {
        self.petLogoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"petLogo.png"]];
    }
    return _petLogoImageView;
}

@end
