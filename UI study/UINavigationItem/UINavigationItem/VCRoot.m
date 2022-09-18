//
//  VCRoot.m
//  UINavigationItem
//
//  Created by 孙旭东 on 2022/7/19.
//

#import "VCRoot.h"
#import "VCSecond.h"

@implementation VCRoot

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    
    // 导航栏的标题文字
    self.title = @"根视图";
    
    // 导航元素项目标题
    self.navigationItem.title = @"TiTle";
    
    // 创建一个导航栏左侧按钮
    UIBarButtonItem* leftButton = [[UIBarButtonItem alloc] initWithTitle:@"next" style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    
    // 将导航栏左侧按钮赋值
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pressRight)];
    
    self.navigationItem.rightBarButtonItem = rightButton;
    
    // 将任何事件添加到导航栏的方法
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 50, 40)];
    label.text = @"test";
    
    label.textAlignment = NSTextAlignmentCenter;
    
    UIBarButtonItem* item03 = [[UIBarButtonItem alloc] initWithCustomView:label];
    
    NSArray* arrayBtn = [NSArray arrayWithObjects:rightButton, item03, nil];
    
    self.navigationItem.rightBarButtonItems = arrayBtn;
    
    
    UINavigationBarAppearance* appearance = [[UINavigationBarAppearance alloc] init];
    // 添加背景颜色
    appearance.backgroundColor = [UIColor redColor];
    appearance.shadowImage = [[UIImage alloc] init];
    appearance.shadowColor = nil;
    
    self.navigationController.navigationBar.standardAppearance = appearance;
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
}
 
- (void) pressLeft {
    VCSecond* vcSecond = [[VCSecond alloc] init];
    
    [self.navigationController pushViewController:vcSecond animated:YES];
}

- (void) pressRight {
    NSLog(@"youce");
}
 
@end
