//
//  HomeViewScrollViewCollectionViewCell.m
//  Find
//
//  Created by 孙旭东 on 2023/3/6.
//

#import "HomeViewScrollViewCollectionViewCell.h"

// 引入模型
#import "HomeModel.h"

// 引入第三方库
#import "Masonry.h"

NSString *const HomeViewKnoledgeBaseButtonPressed = @"HomeViewKnoledgeBaseButtonPressed";

@interface HomeViewScrollViewCollectionViewCell ()
<UIScrollViewDelegate>

@property (nonatomic, assign) CGFloat scrollViewWidth;
@property (nonatomic, assign) CGFloat scrollViewHeight;
@property (nonatomic, assign) CGFloat preOffsetx;
@property (nonatomic, assign) CGFloat buttonsWithe;
@property (nonatomic, assign) CGFloat buttonsSize;

@property (nonatomic, strong) UIScrollView* scrollView;

@property (nonatomic, strong) UIButton* helpButton;
@property (nonatomic, strong) UIButton* communityButton;
@property (nonatomic, strong) UIButton* petFileButton;
@property (nonatomic, strong) UIButton* knowledgeBaseButton;

@property (nonatomic, strong) UILabel* helpLabel;
@property (nonatomic, strong) UILabel* communityLabel;
@property (nonatomic, strong) UILabel* petFileLabel;
@property (nonatomic, strong) UILabel* knowledgeBaseLabel;

@property (nonatomic, strong) UIPageControl* pageController;
@property (nonatomic, weak) NSTimer* timer;

@end

@implementation HomeViewScrollViewCollectionViewCell

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.scrollViewWidth = self.contentView.frame.size.width;
        self.scrollViewHeight = self.contentView.frame.size.height - 100;
        
        self.buttonsWithe = [UIScreen mainScreen].bounds.size.width / 9;
        self.buttonsSize = [UIScreen mainScreen].bounds.size.width / 10;
        
        [self.contentView addSubview:self.scrollView];
        
        [self setMasonry];
    }
    return self;
}

- (void) layoutSubviews {
    [self createScrollView];
}

- (void) createScrollView {
    if (self.timer == nil) {
        self.scrollView.delegate = self;
        self.scrollView.contentSize = CGSizeMake(self.scrollViewWidth * (self.dataArray.count + 2), self.scrollViewHeight);
        NSInteger imageCount = 0;
        
        TopRecommendDataModel* firstTopRecData = [self.dataArray lastObject];
        UIImageView* firstImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:firstTopRecData.imageString]];
        [self createImageView:firstImageView withData:firstTopRecData];
        firstImageView.frame = CGRectMake(imageCount * self.scrollViewWidth, 0, self.scrollViewWidth, self.scrollViewHeight);
        [self.scrollView addSubview:firstImageView];
        imageCount++;
        
        for (; imageCount <= self.dataArray.count; imageCount++) {
            TopRecommendDataModel* data = self.dataArray[imageCount - 1];
            
            UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:data.imageString]];
            [self createImageView:imageView withData:data];
            imageView.frame = CGRectMake(imageCount * self.scrollViewWidth, 0, self.scrollViewWidth, self.scrollViewHeight);
            [self.scrollView addSubview:imageView];
        }
        
        TopRecommendDataModel* lastTopRecData = self.dataArray[0];
        UIImageView* lastImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:lastTopRecData.imageString]];
        [self createImageView:lastImageView withData:lastTopRecData];
        lastImageView.frame = CGRectMake(imageCount * self.scrollViewWidth, 0, self.scrollViewWidth, self.scrollViewHeight);
        [self.scrollView addSubview:lastImageView];
        self.scrollView.contentOffset = CGPointMake(self.scrollViewWidth, 0);
        
        [self.pageController mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_offset(-100);
            make.right.mas_offset(0);
        }];
        
        [self createTimer];
    }
}

// 制作轮播图ImageView
- (void) createImageView:(UIImageView*)imageView withData:(TopRecommendDataModel*)data {
    
    UILabel* titleLabel = [[UILabel alloc] init];
    titleLabel.text = data.title;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.numberOfLines = 2;
    titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:21];
    
    UILabel* authorNameLabel = [[UILabel alloc] init];
    NSString* string = [NSString stringWithFormat:@"作者：%@", data.authorName];
    authorNameLabel.text = string;
    authorNameLabel.textColor = [UIColor whiteColor];
    authorNameLabel.font = [UIFont systemFontOfSize:16];
    
    [imageView addSubview:titleLabel];
    [imageView addSubview:authorNameLabel];
    
    [authorNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(20);
        make.bottom.mas_offset(-10);
        make.width.mas_offset(self.scrollViewWidth - 70);
    }];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(authorNameLabel);
        make.bottom.mas_equalTo(authorNameLabel.mas_top).mas_offset(-4);
        make.width.equalTo(authorNameLabel);
    }];
}

- (void) setMasonry {
    
    [self.helpButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.scrollView.mas_bottom).mas_offset(16);
        make.right.mas_equalTo(self.scrollView.mas_centerX).mas_offset(-(self.buttonsWithe * 1.5 + self.buttonsSize));
        make.size.mas_offset(self.buttonsSize);
    }];
    
    [self.helpLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.helpButton.mas_bottom).mas_offset(4);
        make.centerX.equalTo(self.helpButton);
    }];
    
    [self.communityButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.helpButton);
        make.right.mas_equalTo(self.scrollView.mas_centerX).mas_offset(- (self.buttonsWithe / 2));
        make.size.equalTo(self.helpButton);
    }];
    
    [self.communityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.helpLabel);
        make.centerX.equalTo(self.communityButton);
    }];
    
    [self.petFileButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.helpButton);
        make.left.mas_equalTo(self.scrollView.mas_centerX).mas_offset(self.buttonsWithe / 2);
        make.size.equalTo(self.helpButton);
    }];
    
    [self.petFileLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.helpLabel);
        make.centerX.equalTo(self.petFileButton);
    }];
    
    [self.knowledgeBaseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.helpButton);
        make.left.mas_equalTo(self.scrollView.mas_centerX).mas_offset(self.buttonsWithe * 1.5 + self.buttonsSize);
        make.size.equalTo(self.helpButton);
    }];
    
    [self.knowledgeBaseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.helpLabel);
        make.centerX.equalTo(self.knowledgeBaseButton);
    }];
}
#pragma mark - 点击方法
- (void) knoledgeBasePressed {
    [[NSNotificationCenter defaultCenter] postNotificationName:HomeViewKnoledgeBaseButtonPressed object:nil];
}

#pragma mark - 自动无限轮博设计
- (void) scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    self.preOffsetx = self.scrollView.contentOffset.x;
    
    [self.timer setFireDate:[NSDate distantFuture]];
}

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat leftOffsetx = 0;
    CGFloat rightOffsetx = self.scrollViewWidth * (self.dataArray.count + 1);
    
    if (self.scrollView.contentOffset.x > self.preOffsetx) {
        // 右移
        if (self.scrollView.contentOffset.x >= rightOffsetx) {
            self.scrollView.contentOffset = CGPointMake(self.scrollViewWidth, 0);
            self.pageController.currentPage = 0;
        } else if (self.scrollView.contentOffset.x < rightOffsetx) {
            self.pageController.currentPage = self.scrollView.contentOffset.x / self.scrollViewWidth - 1;
        }
    } else if (self.scrollView.contentOffset.x < rightOffsetx) {
        // 左移
        if (self.scrollView.contentOffset.x <= leftOffsetx) {
            self.scrollView.contentOffset = CGPointMake(self.scrollViewWidth * self.dataArray.count, 0);
            self.pageController.currentPage = self.dataArray.count - 1;
        } else if (self.scrollView.contentOffset.x > leftOffsetx) {
            self.pageController.currentPage = self.scrollView.contentOffset.x / self.scrollViewWidth - 1;
        }
    }
    
    [self.timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:3.0f]];
}

- (void) createTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(pageRight) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void) pageRight {
    CGFloat rightOffsetX = self.scrollViewWidth * (self.dataArray.count + 1);
    CGFloat OffsetX = self.scrollView.contentOffset.x + self.scrollViewWidth;
    
    if (OffsetX >= rightOffsetX) {
        self.scrollView.contentOffset = CGPointMake(0, 0);
        OffsetX = self.scrollViewWidth;
    }
    
    [self.scrollView setContentOffset:CGPointMake(OffsetX, 0) animated:YES];
    self.pageController.currentPage = OffsetX / self.scrollViewWidth - 1;
}

#pragma mark - 懒加载
- (UIScrollView*) scrollView {
    if (_scrollView == nil) {
        self.scrollView = [[UIScrollView alloc] init];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.alwaysBounceHorizontal = NO;
        _scrollView.bounces = NO;
        _scrollView.userInteractionEnabled = YES;
        _scrollView.frame = CGRectMake(0, 10, self.scrollViewWidth, self.scrollViewHeight);

        _scrollView.layer.cornerRadius = 8;
        _scrollView.layer.masksToBounds = YES;
    }
    return _scrollView;
}

- (UIButton*) helpButton {
    if (_helpButton == nil) {
        self.helpButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_helpButton setImage:[UIImage imageNamed:@"fabuqiuzhu.png"] forState:UIControlStateNormal];
        
        [self.contentView addSubview:_helpButton];
    }
    return _helpButton;
}

- (UIButton*) communityButton {
    if (_communityButton == nil) {
        self.communityButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_communityButton setImage:[UIImage imageNamed:@"shequ.png"] forState:UIControlStateNormal];
        
        [self.contentView addSubview:_communityButton];
    }
    return _communityButton;
}

- (UIButton*) petFileButton {
    if (_petFileButton == nil) {
        self.petFileButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_petFileButton setImage:[UIImage imageNamed:@"petFile.png"] forState:UIControlStateNormal];
        
        [self.contentView addSubview:_petFileButton];
    }
    return _petFileButton;
}

- (UIButton*) knowledgeBaseButton {
    if (_knowledgeBaseButton == nil) {
        self.knowledgeBaseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_knowledgeBaseButton setImage:[UIImage imageNamed:@"jurassic_hat.png"] forState:UIControlStateNormal];
        
        [_knowledgeBaseButton addTarget:self action:@selector(knoledgeBasePressed) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:_knowledgeBaseButton];
    }
    return _knowledgeBaseButton;
}

- (UILabel*) helpLabel {
    if (_helpLabel == nil) {
        self.helpLabel = [[UILabel alloc] init];
        _helpLabel.text = @"求 助";
        _helpLabel.textColor = [UIColor blackColor];
        _helpLabel.font = [UIFont systemFontOfSize:17];
        
        [self.contentView addSubview:_helpLabel];
    }
    return _helpLabel;
}

- (UILabel*) communityLabel {
    if (_communityLabel == nil)  {
        self.communityLabel = [[UILabel alloc] init];
        _communityLabel.text = @"社 区";
        _communityLabel.textColor= [UIColor blackColor];
        _communityLabel.font = [UIFont systemFontOfSize:17];
        
        [self.contentView addSubview:_communityLabel];
    }
    return _communityLabel;
}

- (UILabel*) petFileLabel {
    if (_petFileLabel == nil) {
        self.petFileLabel = [[UILabel alloc] init];
        _petFileLabel.text = @"宠物档案";
        _petFileLabel.textColor = [UIColor blackColor];
        _petFileLabel.font = [UIFont systemFontOfSize:17];
        
        [self.contentView addSubview:_petFileLabel];
    }
    return _petFileLabel;
}

- (UILabel*) knowledgeBaseLabel {
    if (_knowledgeBaseLabel == nil) {
        self.knowledgeBaseLabel = [[UILabel alloc] init];
        _knowledgeBaseLabel.text = @"知识库";
        _knowledgeBaseLabel.textColor = [UIColor blackColor];
        _knowledgeBaseLabel.font = [UIFont systemFontOfSize:17];
        
        [self.contentView addSubview:_knowledgeBaseLabel];
    }
    return _knowledgeBaseLabel;
}

- (UIPageControl*) pageController {
    if (_pageController == nil) {
        self.pageController = [[UIPageControl alloc] init];
        _pageController.numberOfPages = self.dataArray.count;
        _pageController.currentPage = 0;
        
        [self.contentView addSubview:_pageController];
    }
    return _pageController;
}

@end
