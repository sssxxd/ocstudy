//
//  SecondViewController.m
//  Share
//
//  Created by 孙旭东 on 2022/7/29.
//

#import "SecondViewController.h"
#import "SearchView/SearchView.h"
#import "UpDataViewController/UpDataViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.97 alpha:1];

    // 设置导航栏
    UINavigationBarAppearance *appperance = [[UINavigationBarAppearance alloc]init];
            //添加背景色
    appperance.backgroundColor = [UIColor colorWithRed:0.31 green:0.47 blue:0.78 alpha:1];
    appperance.shadowImage = [[UIImage alloc]init];
    appperance.shadowColor = nil;
    
    self.title = @"搜索";
    self.navigationController.title = nil;
    [appperance setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]}];

     
    self.navigationController.navigationBar.standardAppearance = appperance;
    self.navigationController.navigationBar.scrollEdgeAppearance = appperance;
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    // 上传
    [self createNavigationItem];
    // 搜索栏
    [self createSearchBar];
    // 标签
    [self createLabelImage];
    // 按钮
    [self createFirstButtons];
    [self createSecondButtons];
    [self createThridButtons];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma - 上传
- (void) createNavigationItem {
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"img2.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressUpData)];
    
//    item.tintColor = [UIColor colorWithRed:0.31 green:0.47 blue:0.78 alpha:1];
    
    self.navigationItem.rightBarButtonItem = item;
}

- (void) pressUpData {
    UpDataViewController* viewController = [[UpDataViewController alloc] init];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma - 设置按钮
// 第一组
- (void) createFirstButtons {
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 2; j++) {
            UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            button.backgroundColor = [UIColor whiteColor];
            button.layer.masksToBounds = YES;
            button.layer.cornerRadius = 5;
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            [button setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:0.31 green:0.47 blue:0.78 alpha:1]] forState:UIControlStateSelected];
            button.frame = CGRectMake(20 + 90 * i, 180 + 30 * j, 80, 20);
            [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
            
            if (i == 0) {
                if (j == 0) {
                    [button setTitle:@"平面设计" forState:UIControlStateNormal];
                } else {
                    [button setTitle:@"虚拟与设计" forState:UIControlStateNormal];
                }
            } else if (i == 1) {
                if (j == 0) {
                    [button setTitle:@"网页设计" forState:UIControlStateNormal];
                } else {
                    [button setTitle:@"影视" forState:UIControlStateNormal];
                }
            } else if (i == 2) {
                if (j == 0) {
                    [button setTitle:@"UI/icon" forState:UIControlStateNormal];
                } else {
                    [button setTitle:@"摄影" forState:UIControlStateNormal];
                }
            } else if (i == 3) {
                if (j == 0) {
                    [button setTitle:@"插画/手绘" forState:UIControlStateNormal];
                } else {
                    [button setTitle:@"其他" forState:UIControlStateNormal];
                }
            }
            [self.view addSubview:button];
        }
    }
}

// 第二组
- (void) createSecondButtons {
    for (int i = 0; i < 4; i++) {
        UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.backgroundColor = [UIColor whiteColor];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 5;
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [button setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:0.31 green:0.47 blue:0.78 alpha:1]] forState:UIControlStateSelected];
        button.frame = CGRectMake(20 + 90 * i, 280, 80, 20);
        [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == 0) {
            [button setTitle:@"人气最高" forState:UIControlStateNormal];
        } else if (i == 1) {
            [button setTitle:@"收藏最多" forState:UIControlStateNormal];
        } else if (i == 2) {
            [button setTitle:@"评论最多" forState:UIControlStateNormal];
        } else {
            [button setTitle:@"编辑精选" forState:UIControlStateNormal];
        }
        
        [self.view addSubview:button];
    }
}

// 第三组
- (void) createThridButtons {
    for (int i = 0; i < 4; i++) {
        UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.backgroundColor = [UIColor whiteColor];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 5;
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [button setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:0.31 green:0.47 blue:0.78 alpha:1]] forState:UIControlStateSelected];
        button.frame = CGRectMake(20 + 90 * i, 350, 80, 20);
        [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == 0) {
            [button setTitle:@"30分钟前" forState:UIControlStateNormal];
        } else if (i == 1) {
            [button setTitle:@"1小时前" forState:UIControlStateNormal];
        } else if (i == 2) {
            [button setTitle:@"1月前" forState:UIControlStateNormal];
        } else {
            [button setTitle:@"1年前" forState:UIControlStateNormal];
        }
        
        [self.view addSubview:button];
    }
}

// 点击事件
- (void) pressButton:(UIButton*)sender {
    UIButton* button = (UIButton*)sender;
    button.selected = !button.selected;
}

// 颜色转变为背景图片
- (UIImage*) imageWithColor:(UIColor*)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();

        CGContextSetFillColorWithColor(context, [color CGColor]);
        CGContextFillRect(context, rect);

        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();

        return  image;
}

// 标签
- (void) createLabelImage {
    for (int i = 0; i < 3; i++) {
        UIView* backView = [[UIView alloc] init];
        backView.backgroundColor = [UIColor colorWithRed:0.31 green:0.47 blue:0.78 alpha:1];
        
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_button.png"]];
        imageView.frame = CGRectMake(0, 0, 15, 15);
        [backView addSubview:imageView];
        
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 40, 20)];
        label.textColor = [UIColor whiteColor];
        [backView addSubview:label];
        
        if (i == 0) {
            backView.frame = CGRectMake(10, 150, 60, 20);
            label.text = @"分类";
        } else if (i == 1) {
            backView.frame = CGRectMake(10, 250, 60, 20);
            label.text = @"推荐";
        } else {
            backView.frame = CGRectMake(10, 320, 60, 20);
            label.text = @"时间";
        }
        
        [self.view addSubview:backView];
    }
}

#pragma - 搜索栏
- (void) createSearchBar {
    _search = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 90, 390, 40)];
    _search.showsCancelButton = YES;
    _search.placeholder = @"搜索";
    _search.showsCancelButton = NO;
    _search.delegate = self;
    _search.keyboardType = UIKeyboardTypeDefault;
    
    [self.view addSubview:_search];
}
// 点击空白处放下键盘
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.search resignFirstResponder];
}

// 搜索栏事件
// 点击搜索按钮时回调
- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.search resignFirstResponder];
    
    if ([searchBar.text  isEqual:@"大白"]) {
        SearchView* viewController = [[SearchView alloc] init];
        
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

@end
