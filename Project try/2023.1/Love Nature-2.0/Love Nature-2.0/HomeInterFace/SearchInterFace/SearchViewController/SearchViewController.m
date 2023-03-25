//
//  SearchViewController.m
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/6.
//

#import "SearchViewController.h"

// 引入视图控制器
#import "SearchResultViewController.h"

// 引入模型类和视图类
#import "HomeModel.h"
#import "SearchView.h"

@interface SearchViewController ()
@property (nonatomic, strong) SearchView* searchView;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initSearchView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(searchPet:) name:SearchViewSearchPetInfo object:nil];
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// 初始化视图
- (void) initSearchView {
    self.searchView = [[SearchView alloc] initWithFrame:self.view.bounds];
    _searchView.keywordListModel = _keywordListModel;
    [_searchView reloadTableView];
    
    [self.view addSubview:_searchView];
}

// 搜索某动物
- (void) searchPet:(NSNotification*)notificaation {
    NSString* name = notificaation.userInfo[@"name"];
    
    SearchResultViewController* viewController = [[SearchResultViewController alloc] init];
    viewController.petName = name;
    
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
