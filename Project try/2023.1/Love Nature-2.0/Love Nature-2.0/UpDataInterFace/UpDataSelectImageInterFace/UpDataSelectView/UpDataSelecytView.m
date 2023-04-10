//
//  UpDataSelecytView.m
//  Find
//
//  Created by 孙旭东 on 2023/3/29.
//

#import "UpDataSelecytView.h"

// 引入第三方库
#import "Masonry.h"

// 全局变量
NSString *const UpDataSelecytViewCountMax = @"UpDataSelecytViewCountMax";

@interface UpDataSelecytView ()

@property (nonatomic, strong) UIScrollView* mainScrollView;

@property (nonatomic, assign) NSInteger imageSelectCount;

@end

@implementation UpDataSelecytView

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.imageSelectCount = self.imageSelectedSet.count;
    }
    return self;
}

- (void) layoutImageView {
    [self addSubview:self.mainScrollView];
    
    for (int i = 0; i < self.imageArray.count; i++) {
        UIImage* image = self.imageArray[i];
        CGFloat size = ([UIScreen mainScreen].bounds.size.width - 40) / 3;
        
        UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
        imageView.userInteractionEnabled = YES;
        
        NSInteger indexY = i / 3;
        NSInteger indexX = i % 3;
        [self.mainScrollView addSubview:imageView];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset((size + 10) * indexY);
            make.left.mas_offset(10 + (size + 10) * indexX);
            make.size.mas_offset(size);
        }];
        
        UIButton* selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [selectButton setImage:[UIImage imageNamed:@"hollow-tick.png"] forState:UIControlStateNormal];
        [selectButton setImage:[UIImage imageNamed:@"tick.png"] forState:UIControlStateSelected];
        [selectButton addTarget:self action:@selector(pressSelectButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [imageView addSubview:selectButton];
        
        if ([self.imageSelectedSet containsObject:image]) {
            selectButton.selected = YES;
        } else {
            selectButton.selected = NO;
        }
        
        [selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(0);
            make.right.mas_offset(0);
            make.size.mas_offset(size / 4.2f);
        }];
    }
}

- (void) pressSelectButton:(UIButton*)sender {
    if (self.imageSelectCount < 5) {
        UIImageView* imageView = (UIImageView*)[sender superview];
        
        if (sender.selected == YES) {
            [self.imageSelectedSet removeObject:imageView.image];
            self.imageSelectCount--;
        } else {
            [self.imageSelectedSet addObject:imageView.image];
            self.imageSelectCount++;
        }
        
        sender.selected = !sender.selected;
    } else {
        [[NSNotificationCenter defaultCenter] postNotificationName:UpDataSelecytViewCountMax object:nil];
    }
}

#pragma mark - 懒加载
- (UIScrollView*) mainScrollView {
    if (_mainScrollView == nil) {
        self.mainScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _mainScrollView.showsVerticalScrollIndicator = NO;
        
        CGFloat size = ([UIScreen mainScreen].bounds.size.width - 40) / 3 + 10;
        NSInteger count = 0;
        if (self.imageArray.count % 3 == 0) {
            count = self.imageArray.count / 3;
        } else {
            count = self.imageArray.count / 3 + 1;
        }
        
        _mainScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, size * count);
    }
    return _mainScrollView;
}

@end
