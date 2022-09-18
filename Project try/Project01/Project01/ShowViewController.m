//
//  ShowViewController.m
//  Project01
//
//  Created by 孙旭东 on 2022/7/21.
//

#import "ShowViewController.h"

@interface ShowViewController ()

@property (nonatomic, weak) UIScreen* myScreen;
@property (nonatomic, weak) UIScrollView* scrollView;

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _imageNames = [[NSMutableArray alloc] init];
    _imageViews = [[NSMutableArray alloc] init];
    
    // 设置分栏按钮风格
    [self createTabBarItem];
    
    // 建立屏幕对象
    self.myScreen = [UIScreen mainScreen];
    // 建立滚动视图
    UIScrollView* scrollView = [[UIScrollView alloc] init];
    self.scrollView = scrollView;
    // 设置视图大小
    scrollView.frame = CGRectMake(0, 0, self.myScreen.bounds.size.width, self.myScreen.bounds.size.height - 83);
    // 设置画布大小
    scrollView.contentSize = CGSizeMake(self.myScreen.bounds.size.width * 3, self.myScreen.bounds.size.height - 83);
    // 按照整页滚动
    scrollView.pagingEnabled = YES;
    // 开启滚动效果
    scrollView.scrollEnabled = YES;
    // 设置代理对象
    scrollView.delegate = self;
    // 取消横向滚动条
    scrollView.showsHorizontalScrollIndicator = NO;
    
    for (int i = 0; i < 3; i++) {
        // 获取图片名字
        NSString* imageName = [NSString stringWithFormat:@"%d.jpeg", i + 1];
        // 将图片名字放入图片数组中
        [_imageNames addObject:imageName];
    }
    
    for (int i = 0; i < 3; i++) {
        // 创建图片视图
        UIImage* image = [UIImage imageNamed:[_imageNames objectAtIndex:i]];
        UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
        // 设置视图位置
        imageView.frame = CGRectMake(self.myScreen.bounds.size.width * i, 0, self.myScreen.bounds.size.width, self.myScreen.bounds.size.height - 83);
        
        [scrollView addSubview:imageView];
        
        [_imageViews addObject:imageView];
    }
    
    scrollView.contentOffset = CGPointMake(self.myScreen.bounds.size.width, 0);
    
    [self.view addSubview:scrollView];
    
    // 建立翻页按钮
    [self createPageButton];
    // 创建定时器
    [self createTimer];
}

#pragma - 分栏按钮
- (void) createTabBarItem {
    // 设置按钮风格
    UITabBarItem* tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:101];
    
    self.tabBarItem = tabBarItem;
}

#pragma - 建立翻页按钮
- (void) createPageButton {
    // 建立按钮
    UIButton* pageButtonRight = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton* pageButtonLeft = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    pageButtonLeft.frame = CGRectMake(0, self.myScreen.bounds.size.height / 2 - 60, 30, 60);
    pageButtonRight.frame = CGRectMake(self.myScreen.bounds.size.width - 30, self.myScreen.bounds.size.height / 2 - 60, 30, 60);
    
    // 添加按钮图标
    [pageButtonLeft setImage:[UIImage imageNamed:@"xiangzuojiantou.png"] forState:UIControlStateNormal];
    [pageButtonRight setImage:[UIImage imageNamed:@"xiangyoujiantou.png"] forState:UIControlStateNormal];
    
    // 添加翻页事件
    [pageButtonLeft addTarget:self action:@selector(pressPageButtonLeft) forControlEvents:UIControlEventTouchUpInside];
    [pageButtonRight addTarget:self action:@selector(pressPageButtonRight) forControlEvents:UIControlEventTouchUpInside];
    
    // 按下按钮暂停计时器
    [pageButtonLeft addTarget:self action:@selector(stopTimer) forControlEvents:UIControlEventTouchDown];
    [pageButtonRight addTarget:self action:@selector(stopTimer) forControlEvents:UIControlEventTouchDown];
    
    
    [self.view addSubview:pageButtonLeft];
    [self.view addSubview:pageButtonRight];
}

// 向左翻页
- (void) pressPageButtonLeft {
    // 将最后一个元素移动到第一个
    id lastObject = [_imageNames.lastObject mutableCopy];
    
    [_imageNames removeLastObject];
    
    [_imageNames insertObject:lastObject atIndex:0];
    
    // 更新视图
    [self insertImageToImageView];
    // 重制偏移量
    self.scrollView.contentOffset = CGPointMake(self.myScreen.bounds.size.width * 2, 0);
    // 移动视图
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x - self.myScreen.bounds.size.width, 0) animated:YES];
    _timer.fireDate = [NSDate dateWithTimeIntervalSinceNow:2.0f];
}

// 向右翻页
- (void) pressPageButtonRight {
    // 将第一个元素移动到最后一个
    id firstObject = [_imageNames.firstObject mutableCopy];
    
    [_imageNames removeObjectAtIndex:0];
    
    [_imageNames addObject:firstObject];
    
    // 更新视图
    [self insertImageToImageView];
    // 重制偏移量
    self.scrollView.contentOffset = CGPointMake(0, 0);
    // 移动视图
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x + self.myScreen.bounds.size.width, 0) animated:YES];
    _timer.fireDate = [NSDate dateWithTimeIntervalSinceNow:2.0f];
}

// 按下时暂停计时器
- (void) stopTimer {
    _timer.fireDate = [NSDate distantFuture];
}

#pragma - 更新图片

- (void) insertImageToImageView {
    [_imageViews enumerateObjectsUsingBlock:^(UIImageView* _Nonnull imageView, NSUInteger idx, BOOL* _Nonnull stop) {
        imageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForAuxiliaryExecutable:_imageNames[idx]]];
    }];
}

#pragma - 手势翻页

- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.scrollView.contentOffset.x <= 0) {
        id lastObject = [_imageNames.lastObject mutableCopy];
        
        [_imageNames removeLastObject];
        
        [_imageNames insertObject:lastObject atIndex:0];
        
    } else if (self.scrollView.contentOffset.x >= 2 * self.myScreen.bounds.size.width) {
        id firstObject = [_imageNames.firstObject mutableCopy];
        
        [_imageNames removeObjectAtIndex:0];
        
        [_imageNames addObject:firstObject];
        
    } else {
        return;
    }
    [self insertImageToImageView];
    
    self.scrollView.contentOffset = CGPointMake(self.myScreen.bounds.size.width, 0);
}

#pragma - 定时器

// 创建定时器
- (void) createTimer {
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(pressPageButtonRight) userInfo:nil repeats:YES];
}

- (void) scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    // 暂停timer
    _timer.fireDate = [NSDate distantFuture];
}

- (void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    // 启动timer
    _timer.fireDate = [NSDate dateWithTimeIntervalSinceNow:2.0f];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view co
 @end
 ntroller.
}
*/

@end
