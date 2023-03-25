//
//  UserView.m
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/11/7.
//

#import "UserView.h"
#import "Masonry.h"

#define SCREEN_SIZE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE_WIDTH [UIScreen mainScreen].bounds.size.width

#define USERICON_SIZE (SCREEN_SIZE_WIDTH/4)

@implementation UserView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void) viewInit {
    self.backgroundColor = [UIColor whiteColor];
    
    self.userIconView = [[UIImageView alloc] init];
    self.userIconView.layer.masksToBounds = YES;
    self.userIconView.layer.cornerRadius = USERICON_SIZE / 2;
    
    [self addSubview:self.userIconView];
    
    [self.userIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(USERICON_SIZE);
        make.top.mas_equalTo(100);
        make.centerX.equalTo(self);
    }];
    
    self.userName = [[UILabel alloc] init];
    self.userName.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
    self.userName.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:self.userName];
    
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.userIconView.mas_bottom).offset(20);
        make.centerX.equalTo(self);
    }];
    
    self.myCollectLabel = [[UILabel alloc] init];
    self.myCollectLabel.font = [UIFont systemFontOfSize:20];
    
    [self addSubview:self.myCollectLabel];
    
    [self.myCollectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.userName.mas_bottom).offset(30);
        make.height.mas_equalTo(80);
        make.left.mas_equalTo(20);
    }];
    
    self.commentCenterLabel = [[UILabel alloc] init];
    self.commentCenterLabel.font = [UIFont systemFontOfSize:20];
    
    [self addSubview:self.commentCenterLabel];
    
    [self.commentCenterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.myCollectLabel.mas_bottom);
        make.left.mas_equalTo(20);
        make.size.equalTo(self.myCollectLabel);
    }];
    
    UIImageView* arrowMyCollect = [[UIImageView alloc] init];
    [arrowMyCollect setImage:[UIImage imageNamed:@"jinrujiantouxiao-2.png"]];
    
    [self addSubview:arrowMyCollect];
    
    [arrowMyCollect mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-35);
        make.centerY.equalTo(self.myCollectLabel);
    }];
    
    UIImageView* arrowCommentCenter = [[UIImageView alloc] init];
    [arrowCommentCenter setImage:[UIImage imageNamed:@"jinrujiantouxiao-2.png"]];
    
    [self addSubview:arrowCommentCenter];
    
    [arrowCommentCenter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-35);
        make.centerY.equalTo(self.commentCenterLabel);
    }];
    
    self.myCollectButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.myCollectButton.layer.masksToBounds = YES;
    self.myCollectButton.layer.borderWidth = 0.2;
    self.myCollectButton.layer.borderColor = [UIColor grayColor].CGColor;
    
    [self addSubview:self.myCollectButton];
    
    [self.myCollectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.userName.mas_bottom).offset(30);
        make.height.mas_equalTo(80);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
}

@end
