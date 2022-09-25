//
//  ScrollViewCell.m
//  Share
//
//  Created by 孙旭东 on 2022/7/29.
//

#import "ScrollViewCell.h"

@implementation ScrollViewCell

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
        _scroll = [[UIScrollView alloc] init];
        _scroll.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 170);
        _scroll.scrollEnabled = YES;
        _scroll.pagingEnabled = YES;
        _scroll.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 6, 170);
        _scroll.showsHorizontalScrollIndicator = NO;
        _scroll.delegate = self;
        
        // 添加第一张视图
        UIImageView* imageViewFirst = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 170)];
        [imageViewFirst setImage:[UIImage imageNamed:[NSString stringWithFormat:@"main_img4.png"]]];
        
        [_scroll addSubview:imageViewFirst];
        
        // 添加中间的视图
        for (int i = 0; i < 4; i++) {
            UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * (i + 1), 0, [UIScreen mainScreen].bounds.size.width, 170)];
            [imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"main_img%d.png", i + 1]]];
            
            [_scroll addSubview:imageView];
        }
        
        // 添加最后一张视图
        UIImageView* imageViewLast = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * 5, 0, [UIScreen mainScreen].bounds.size.width, 170)];
        [imageViewLast setImage:[UIImage imageNamed:[NSString stringWithFormat:@"main_img1.png"]]];
        
        
        [_scroll addSubview:imageViewLast];
        
        _scroll.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width, 0);
        
        [self.contentView addSubview:_scroll];
        
        // 添加分页控制器
        [self createPageController];
        
        // 创建计时器
        [self createTimer];

    }
    return  self;
}

#pragma - 滚动事件
- (void) scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    // 记录偏移量
    _preOffsetx = _scroll.contentOffset.x;
    // 暂停计时器
    [_timer setFireDate:[NSDate distantFuture]];
}

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 左右边界
    CGFloat leftEdgeOffetX = 0;
    CGFloat rightEdgeOffsetX = [UIScreen mainScreen].bounds.size.width * 5;
    if (_scroll.contentOffset.x < _preOffsetx) {
        // 左移
        if (_scroll.contentOffset.x > leftEdgeOffetX) {
            _pageControl.currentPage = (_scroll.contentOffset.x / [UIScreen mainScreen].bounds.size.width) - 1;
        }
        // 设置其切换到最后一页
        if (_scroll.contentOffset.x <= leftEdgeOffetX) {
            _scroll.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width * 4, 0);
            _pageControl.currentPage = 3;
        }
    } else if (_scroll.contentOffset.x > _preOffsetx) {
        // 右移
        if (_scroll.contentOffset.x < rightEdgeOffsetX) {
            _pageControl.currentPage = (_scroll.contentOffset.x / [UIScreen mainScreen].bounds.size.width) - 1;
        }
        // 设置其切换到第一页
        if (_scroll.contentOffset.x >= rightEdgeOffsetX) {
            _scroll.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width, 0);
            _pageControl.currentPage = 0;
        }
    }
    [_timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:2.0f]];
}

#pragma - 计时器
// 创建计时器
- (void) createTimer {
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(pageRight) userInfo:nil repeats:YES];
}

// 翻页函数
- (void) pageRight {
    CGFloat offsetX = _scroll.contentOffset.x + CGRectGetWidth([UIScreen mainScreen].bounds);
    
    CGFloat edgeOffsetX = [UIScreen mainScreen].bounds.size.width * (4 + 1);
    
    // 从多余页向右滑，设置为第一页
    if (offsetX > edgeOffsetX) {
        [_scroll setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width, 0)];
        
        offsetX = [UIScreen mainScreen].bounds.size.width * 2;
    }
    
    [_scroll setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    if (offsetX < edgeOffsetX) {
        _pageControl.currentPage = offsetX / [UIScreen mainScreen].bounds.size.width - 1;
    } else if (offsetX == edgeOffsetX) {
        _pageControl.currentPage = 0;
    }
}

#pragma - 分页控制器
- (void) createPageController {
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(113, 150, 100, 20)];
    // 设置页码数量
    _pageControl.numberOfPages = 4;
    
    _pageControl.currentPage = 0;
    
    [self.contentView addSubview:_pageControl];
}


@end
