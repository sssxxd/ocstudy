//
//  HomeScrollerViewCell.h
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/10/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeScrollerViewCell : UITableViewCell
<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView* scrollerView;

@property (nonatomic, strong) NSMutableArray* imageViewArray;
@property (nonatomic, strong) NSMutableArray* titleArray;
@property (nonatomic, strong) NSMutableArray* userNameArray;

@property (nonatomic, strong) UIPageControl* pageController;

@property (nonatomic, assign) CGFloat preOffsetx;

@property (nonatomic, strong) NSTimer* timer;

@end

NS_ASSUME_NONNULL_END
