//
//  TitleView.m
//  Find
//
//  Created by 孙旭东 on 2023/4/13.
//

#import "TitleView.h"

// 引入模型类
#import "HomeModel.h"

#import "Masonry.h"
#import "LNManager.h"

@interface TitleView ()
@property (nonatomic, strong) UIScrollView* scrollView;
@property (nonatomic, strong) UIView* backView;;
@end

@implementation TitleView {
    CGFloat _scrollViewWidth;
}

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        _scrollViewWidth = [UIScreen mainScreen].bounds.size.width;
    }
    return self;
}

- (void)layoutView {
    [self addSubview:self.scrollView];
    [self addSubview:self.backView];
    
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_offset(-60);
        make.left.mas_offset(0);
        make.right.mas_offset(0);
        make.top.mas_equalTo(self.scrollView.mas_bottom).mas_offset(0);
    }];
}

#pragma mark - 懒加载
- (UIScrollView *)scrollView {
    if (_scrollView == nil) {
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 90, _scrollViewWidth, _scrollViewWidth)];
        _scrollView.contentSize = CGSizeMake(_scrollViewWidth * self.dataModel.pictures.count, _scrollViewWidth);
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.bounces = NO;
        _scrollView.alwaysBounceVertical = NO;
        for (int i = 0; i < self.dataModel.pictures.count; i++) {
            UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(_scrollViewWidth * i, 0, _scrollViewWidth, _scrollViewWidth)];
            [[LNManager shareLNManager] useImageURLString:self.dataModel.pictures[i] setImageVIew:imageView];
            [_scrollView addSubview:imageView];
        }
    }
    return _scrollView;
}

- (UIView *)backView {
    if (_backView == nil) {
        self.backView = [[UIView alloc] init];
        
        UILabel* titleLabel = [[UILabel alloc] init];
        titleLabel.text = self.dataModel.blogTitle;
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.font = [UIFont systemFontOfSize:20];
        
        [_backView addSubview:titleLabel];
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(60);
            make.right.mas_offset(-20);
            make.left.mas_offset(20);
        }];
        
        UILabel* contentLabel = [[UILabel alloc] init];
        contentLabel.text = self.dataModel.content;
        contentLabel.textColor = [UIColor blackColor];
        contentLabel.font = [UIFont systemFontOfSize:18];
        
        [_backView addSubview:contentLabel];
        
        [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(titleLabel.mas_bottom).mas_offset(10);
            make.right.mas_offset(-20);
            make.left.mas_offset(20);
        }];
        
        [_backView addSubview:contentLabel];
    }
    return _backView;
}

@end
