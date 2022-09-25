//
//  ShowCitysViewController.m
//  Weather Report
//
//  Created by 孙旭东 on 2022/8/12.
//

#import "ShowCitysViewController.h"
#import "ShowCity.h"

@interface ShowCitysViewController ()

@end

@implementation ShowCitysViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 设置背景图
    UIImage* image = [UIImage imageNamed:@"cityWeatherReportBack.jpeg"];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = self.view.bounds;
    [self.view addSubview:imageView];
    
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * _cityIDArray.count, self.view.bounds.size.height);
    _scrollView.bounces = NO;
    _scrollView.scrollEnabled = YES;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
    [self createShoewCityView];
    
    [self createItem];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma - 工具栏添加按钮
- (void) createItem {
    self.navigationController.toolbarHidden = NO;
    
    self.navigationController.toolbar.translucent = NO;
    
//    UIToolbarAppearance* appearance = [[UIToolbarAppearance alloc] init];
//    appearance.backgroundColor = [UIColor clearColor];
//    appearance.shadowImage = [[UIImage alloc] init];
//
//    self.navigationController.toolbar.standardAppearance = appearance;
//    self.navigationController.toolbar.scrollEdgeAppearance = appearance;
    
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"liebiao2.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressBack)];

    [item setTintColor:[UIColor grayColor]];
    
    UIBarButtonItem* itemSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace primaryAction:nil];
    
    itemSpace.width = 400;

    NSArray* arrayOfItems = [NSArray arrayWithObjects:itemSpace, item, nil];

    self.toolbarItems = arrayOfItems;
}

- (void) pressBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma - 创建展示视图
- (void) createShoewCityView {
    _showCityViews = [[NSMutableArray alloc] init];
    
    for (int index = 0; index < _cityIDArray.count; index++) {
        ShowCity* showCityView = [[ShowCity alloc] initWithFrame:CGRectMake(self.view.bounds.size.width * index, 0, self.view.bounds.size.width, self.view.bounds.size.height - 80)];
        showCityView.cityID = _cityIDArray[index];

        [_showCityViews addObject:showCityView];

        [_scrollView addSubview:showCityView];
    }
    
    _scrollView.contentOffset = CGPointMake(self.view.bounds.size.width * _pageNow, 0);
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(40, 773, 300, 30)];
    _pageControl.numberOfPages = _cityIDArray.count;
    _pageControl.hidesForSinglePage = NO;
    _pageControl.currentPage = _pageNow;
    
    [self.view addSubview:_pageControl];
}

- (void) scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _offectX = _scrollView.contentOffset.x;
}

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (_offectX != _scrollView.contentOffset.x) {
        _pageControl.currentPage = _scrollView.contentOffset.x / self.view.bounds.size.width;
    }
}

@end
