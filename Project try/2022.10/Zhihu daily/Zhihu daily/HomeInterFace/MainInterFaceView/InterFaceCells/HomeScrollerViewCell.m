//
//  HomeScrollerViewCell.m
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/10/17.
//

#import "HomeScrollerViewCell.h"
#import "Masonry.h"

#define SCREEN_SIZE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation HomeScrollerViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _scrollerView = [[UIScrollView alloc] init];
        _scrollerView.pagingEnabled = YES;
        _scrollerView.delegate = self;
        
        [self.contentView addSubview:_scrollerView];
        
        
        _pageController = [[UIPageControl alloc] init];
        _pageController.numberOfPages = 5;
        
        [self.contentView addSubview:_pageController];
        
        [self createTimer];
        
    }
    return self;
}

- (void)layoutSubviews {
    self.scrollerView.frame = CGRectMake(0, 0, SCREEN_SIZE_WIDTH, SCREEN_SIZE_WIDTH);
    self.scrollerView.contentSize = CGSizeMake(SCREEN_SIZE_WIDTH * 7, SCREEN_SIZE_WIDTH);
    self.scrollerView.showsHorizontalScrollIndicator = NO;
    self.scrollerView.bounces = NO;
    self.scrollerView.alwaysBounceHorizontal = NO;
    self.scrollerView.userInteractionEnabled = YES;
    self.pageController.currentPage = 0;
    for (int i = 0; i < 7; i++) {
        UIImageView* imageView = self.imageViewArray[i];
        imageView.frame = CGRectMake(SCREEN_SIZE_WIDTH * i, 0, SCREEN_SIZE_WIDTH, SCREEN_SIZE_WIDTH);
        [self.scrollerView addSubview:imageView];
        
//        UIView* labelBackView = [[UIView alloc] init];
//        labelBackView.backgroundColor = [UIColor grayColor];
//        labelBackView.alpha = 0.8;
//
//        [imageView addSubview:labelBackView];
        
        UILabel* titleLabel = [[UILabel alloc] init];
        titleLabel.font = [UIFont systemFontOfSize:25];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.numberOfLines = 0;
        
        [imageView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(30);
            make.bottom.mas_equalTo(-60);
            make.width.mas_equalTo(SCREEN_SIZE_WIDTH - 60);
        }];
        
        if (i > 0 && i < 6) {
            titleLabel.text = self.titleArray[i - 1];
        } else if (i == 0) {
            titleLabel.text = self.titleArray[4];
        } else if (i == 6) {
            titleLabel.text = self.titleArray[0];
        }
        
        UILabel* userNameLabel = [[UILabel alloc] init];
        userNameLabel.font = [UIFont systemFontOfSize:16];
        userNameLabel.textColor = [UIColor colorWithWhite:1 alpha:0.7];
        userNameLabel.numberOfLines = 0;
        
        [imageView addSubview:userNameLabel];
        
        [userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(30);
            make.bottom.mas_equalTo(-30);
            make.width.mas_equalTo(SCREEN_SIZE_WIDTH - 60);
        }];
        
        if (i > 0 && i < 6) {
            userNameLabel.text = self.userNameArray[i - 1];
        } else if (i == 0) {
            userNameLabel.text = self.userNameArray[4];
        } else if (i == 6) {
            userNameLabel.text = self.userNameArray[0];
        }
        
//        [labelBackView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.mas_equalTo(0);
//            make.left.mas_equalTo(0);
//            make.right.mas_equalTo(0);
//            make.top.equalTo(titleLabel);
//        }];
        
        imageView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressTap:)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        [imageView addGestureRecognizer:tap];
    }
  
    self.scrollerView.contentOffset = CGPointMake(SCREEN_SIZE_WIDTH, 0);
    
    [self.pageController mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(20);
        make.bottom.mas_equalTo(-10);
    }];
    
}

- (void) pressTap:(UITapGestureRecognizer*)tap {
    NSNumber* number = [NSNumber numberWithInteger:self.pageController.currentPage];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"top_storie" object:nil userInfo:@{@"Value":number}];
}

#pragma 自动无限轮播设计

- (void) scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    self.preOffsetx = self.scrollerView.contentOffset.x;
    
    [self.timer setFireDate:[NSDate distantFuture]];
}

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat leftOffsetx = 0;
    CGFloat rightOffsetx = SCREEN_SIZE_WIDTH * 6;
    
    if (self.scrollerView.contentOffset.x > self.preOffsetx) {
        // 右移
        if (self.scrollerView.contentOffset.x >= rightOffsetx) {
            self.scrollerView.contentOffset = CGPointMake(SCREEN_SIZE_WIDTH, 0);
            self.pageController.currentPage = 0;
        }
        
        if (self.scrollerView.contentOffset.x < rightOffsetx) {
            self.pageController.currentPage = self.scrollerView.contentOffset.x / SCREEN_SIZE_WIDTH - 1;
        }
        
    } else if (self.scrollerView.contentOffset.x < self.preOffsetx) {
        // 左移
        if (self.scrollerView.contentOffset.x <= leftOffsetx) {
            self.scrollerView.contentOffset = CGPointMake(SCREEN_SIZE_WIDTH * 5, 0);
            self.pageController.currentPage = 4;
        }
        if (self.scrollerView.contentOffset.x > leftOffsetx) {
            self.pageController.currentPage = self.scrollerView.contentOffset.x / SCREEN_SIZE_WIDTH - 1;
        }
    }
    
    [self.timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:3.0f]];
}


- (void) createTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(pageRight) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void) pageRight {
    CGFloat rightOffsetx = SCREEN_SIZE_WIDTH * 6;
    CGFloat OffsetX = self.scrollerView.contentOffset.x + SCREEN_SIZE_WIDTH;
    
    if (OffsetX >= rightOffsetx) {
        self.scrollerView.contentOffset = CGPointMake(0, 0);
        OffsetX = SCREEN_SIZE_WIDTH;
    }
    
    [self.scrollerView setContentOffset:CGPointMake(OffsetX , 0) animated:YES];
    if (OffsetX < rightOffsetx) {
        self.pageController.currentPage = OffsetX / SCREEN_SIZE_WIDTH - 1;
    } else if (OffsetX == rightOffsetx) {
        self.pageController.currentPage = 0;
    }
}


@end
