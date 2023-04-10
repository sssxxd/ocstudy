//
//  ShopMallViewController.m
//  Find
//
//  Created by 孙旭东 on 2023/4/7.
//

#import "ShopMallViewController.h"

#import "ShopMallView.h"

// 引入第三方库
#import "Masonry.h"

@interface ShopMallViewController ()

@end

@implementation ShopMallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISearchBar* searchBar = [[UISearchBar alloc] init];
    self.navigationItem.titleView = searchBar;
    
    ShopMallView* shopMallView = [[ShopMallView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:shopMallView];
}



@end
