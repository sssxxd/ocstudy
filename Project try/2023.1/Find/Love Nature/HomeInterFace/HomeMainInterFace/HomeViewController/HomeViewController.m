//
//  HomeViewController.m
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/7.
//

#import "HomeViewController.h"
#import "SearchViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页";
    
    [self initHomeView];
    
    [self craeteSearchBar];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma - 初始化视图
- (void) initHomeView {
    self.homeView = [[HomeView alloc] initWithFrame:self.view.bounds];
    self.homeView.backgroundColor = [UIColor whiteColor];
    
    [self.homeView.photographButton addTarget:self action:@selector(pressPhotographButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.homeView];
}

#pragma - 搜索栏
- (void) craeteSearchBar {
    UISearchBar* searchBar = [[UISearchBar alloc] init];
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 90, 390, 40)];
    searchBar.showsCancelButton = YES;
    searchBar.placeholder = @"搜索";
    searchBar.showsCancelButton = NO;
    searchBar.delegate = self;
    searchBar.keyboardType = UIKeyboardTypeDefault;
    
    self.navigationItem.titleView = searchBar;
}

#pragma - 按钮事件
- (void) pressPhotographButton {
    SearchViewController* viewController = [[SearchViewController alloc] init];
    
    viewController.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:viewController animated:NO completion:nil];
}

@end
