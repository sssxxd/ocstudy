//
//  ShowCitysViewController.h
//  Weather Report
//
//  Created by 孙旭东 on 2022/8/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShowCitysViewController : UIViewController
<
UIScrollViewDelegate
>

@property (nonatomic, strong) UIPageControl* pageControl;
@property (nonatomic, strong) UIScrollView* scrollView;

@property (nonatomic, strong) NSArray* cityIDArray;
@property (nonatomic, strong) NSMutableArray* showCityViews;

@property (nonatomic) NSInteger pageNow;

@property (nonatomic) CGFloat offectX;

@end

NS_ASSUME_NONNULL_END
