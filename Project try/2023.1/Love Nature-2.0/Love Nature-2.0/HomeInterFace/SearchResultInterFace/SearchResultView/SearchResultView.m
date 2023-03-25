//
//  SearchResultView.m
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/6.
//

#import "SearchResultView.h"

// 引入第三方库
#import "Masonry.h"

// 引入工具类
#import "LNManager.h"

// 引入模型类
#import "SearchResultModel.h"

// 预定义屏幕宽
#define KSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface SearchResultView ()
@property (nonatomic, strong) UIImageView* petImageView;
@property (nonatomic, strong) UILabel* petNameLabel;
@property (nonatomic, strong) UILabel* petIntroductionLabel;
@property (nonatomic, strong) UIScrollView* scrollView;
@end

@implementation SearchResultView

// 绘制UI
- (void) initSubViews {
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.scrollView];
    
    UIView* contentView = [[UIView alloc] init];
    [_scrollView addSubview:contentView];
    
    self.petImageView = [[UIImageView alloc] init];
    [contentView addSubview:_petImageView];
    
    self.petNameLabel = [[UILabel alloc] init];
    _petNameLabel.font = [UIFont systemFontOfSize:25];
    _petNameLabel.textColor = [UIColor blackColor];
    [contentView addSubview:_petNameLabel];
    
    self.petIntroductionLabel = [[UILabel alloc] init];
    _petIntroductionLabel.font = [UIFont systemFontOfSize:18];
    _petIntroductionLabel.textColor = [UIColor blackColor];
    _petIntroductionLabel.numberOfLines = 0;
    [contentView addSubview:_petIntroductionLabel];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(0);
        make.left.mas_offset(0);
        make.right.mas_offset(0);
        make.bottom.mas_offset(0);
    }];
    
    [_petNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(10);
        make.left.mas_offset(20);
        make.right.mas_offset(-20);
    }];
    
    [_petImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_petNameLabel.mas_bottom).mas_offset(20);
        make.centerX.equalTo(self);
        make.size.mas_offset(KSCREEN_WIDTH - 80);
    }];
    
    [_petIntroductionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_petImageView.mas_bottom).mas_offset(40);
        make.left.mas_offset(20);
        make.width.mas_offset(KSCREEN_WIDTH - 40);
        make.bottom.mas_offset(0);
    }];
    
    _petNameLabel.text = _data.name;
    _petIntroductionLabel.text = _data.introduction;
    
    NSString* urlString = [NSString stringWithFormat:@"http://rphxbyqwg.hd-bkt.clouddn.com/%@", _data.image];
    
    [[LNManager shareLNManager] useImageURLString:urlString setImageVIew:_petImageView];
}

- (UIScrollView*) scrollView {
    if (_scrollView == nil) {
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return _scrollView;
}

@end
