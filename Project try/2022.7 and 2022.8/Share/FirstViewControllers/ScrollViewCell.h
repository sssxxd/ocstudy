//
//  ScrollViewCell.h
//  Share
//
//  Created by 孙旭东 on 2022/7/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScrollViewCell : UITableViewCell <UIScrollViewDelegate>
{
    NSInteger _preOffsetx;
    NSTimer* _timer;
    UIPageControl* _pageControl;
}
@property (nonnull, strong) UIScrollView* scroll;

@end

NS_ASSUME_NONNULL_END
