//
//  ShareCricleCollectionViewCell.m
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/15.
//

#import "ShareCricleCollectionViewCell.h"

#import "Masonry.h"

@implementation ShareCricleCollectionViewCell

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.shareImageView = [[UIImageView alloc] init];
        _shareImageView.layer.cornerRadius = 5;
        _shareImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_shareImageView];
        
        self.shareUserIconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_shareUserIconImageView];
        
        self.shareTitleLabel = [[UILabel alloc] init];
        _shareTitleLabel.textColor = [UIColor blackColor];
        _shareTitleLabel.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:_shareTitleLabel];
        
        self.shareUserNameLabel = [[UILabel alloc] init];
        _shareUserNameLabel.textColor = [UIColor grayColor];
        _shareUserNameLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_shareUserNameLabel];
        
    }
    return self;
}

- (void) layoutSubviews {
    [_shareImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(5);
        make.width.equalTo(self.contentView);
        make.bottom.mas_offset(-60);
    }];
    
    [_shareTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_shareImageView.mas_bottom).mas_offset(5);
        make.left.mas_offset(10);
        make.right.mas_offset(-10);
        make.bottom.mas_offset(-30);
    }];
    
    [_shareUserIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_shareTitleLabel.mas_bottom).mas_offset(5);
        make.left.mas_offset(10);
        make.bottom.mas_offset(-5);
        make.width.mas_offset(20);
    }];
    _shareUserIconImageView.layer.cornerRadius = 10;
    _shareUserIconImageView.layer.masksToBounds = YES;
    
    [_shareUserNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_shareUserIconImageView.mas_right).mas_offset(5);
        make.right.mas_offset(-90);
        make.top.mas_equalTo(_shareTitleLabel.mas_bottom).mas_offset(10);
    }];
    
    _shareImageView.image = [UIImage imageNamed:@"molihua.jpeg"];
    _shareTitleLabel.text = @"加载出错了";
    _shareUserNameLabel.text = @"???";
    _shareUserIconImageView.image = [UIImage imageNamed:@"placeholderImage.jpg"];
}

@end
