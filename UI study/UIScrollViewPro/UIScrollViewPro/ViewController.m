//
//  ViewController.m
//  UIScrollViewPro
//
//  Created by 孙旭东 on 2022/7/19.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _scrollView = [[UIScrollView alloc] init];
    
    _scrollView.frame = CGRectMake(10, 50, 300, 400);
    
    // 取消弹动效果
    _scrollView.bounces = NO;
    
    // 是否允许通过点击屏幕让滚动视图响应事件
    // _scrollView.userInteractionEnabled = NO;
    
    _scrollView.contentSize = CGSizeMake(300, 400 * 3);
    
    for (int i = 0; i < 3; i++) {
        NSString* stringImageNamed = [NSString stringWithFormat:@"%d.jpeg", i + 1];
        UIImage* image = [UIImage imageNamed:stringImageNamed];
        
        UIImageView* imagedView = [[UIImageView alloc] initWithImage:image];
        imagedView.frame = CGRectMake(0, 400 * i, 300, 400);
        
        [_scrollView addSubview:imagedView];
    }
    [self.view addSubview:_scrollView];
    
    // 滚动视图画布的移动位置，偏移位置
    // 决定画布显示的最终图像结果
    _scrollView.contentOffset = CGPointMake(0, 0);
    
    // 将当前视图控制器作为代理对象
    _scrollView.delegate = self;
}

// 当滚动视图移动时，只要offset坐标发生变化都会调用此函数
//- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"y = %f", scrollView.contentOffset.y);
//}

// 当滚动视图结束拖动时调用此函数
- (void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"Did");
}

// 当滚动视图即将结束拖动时调用此函数
- (void) scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSLog(@"Will e dra");
}


- (void) scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"W B Dra");
}

// 视图即将减速时
- (void) scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    NSLog(@"will b d");
}

// 视图结束减速时
- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"did e d");
}

@end
