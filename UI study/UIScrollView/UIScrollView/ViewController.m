//
//  ViewController.m
//  UIScrollView
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
    
    // 定义并创建一个滚动视图
    // 可以对视图内容进行滚屏查看
    UIScrollView* scrollView = [[UIScrollView alloc] init];
    
    // 设置视图位置
    scrollView.frame = CGRectMake(0, 0, 320, 560);
    
    // 是否按照整页滚动视图
    scrollView.pagingEnabled = YES;
    // 是否可以开启滚动效果
    scrollView.scrollEnabled = YES;
    // 设置画布大小，画布显示在滚动视图内部，一般要大于frame的大小
    scrollView.contentSize = CGSizeMake(320 * 2, 560);
    // 是否可以边缘弹动效果
    scrollView.bounces = YES;
    // 开启纵向弹动
    scrollView.alwaysBounceVertical = YES;
    // 开启横向弹动
    scrollView.alwaysBounceHorizontal = YES;
    // 是否显示纵向滚动条
    scrollView.showsVerticalScrollIndicator = YES;
    // 是否显示横向滚动条
    scrollView.showsHorizontalScrollIndicator = YES;
    
    scrollView.backgroundColor = [UIColor yellowColor];
    
    for (int i = 0; i < 3; i++) {
        NSString* stringName = [NSString stringWithFormat:@"%d.jpeg", i + 1];
        
        UIImage* image = [UIImage imageNamed:stringName];
        
        UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
        
        imageView.frame = CGRectMake(320 * i, 0, 320, 560);
        
        [scrollView addSubview:imageView];
    }
    
    [self.view addSubview:scrollView];
}


@end
