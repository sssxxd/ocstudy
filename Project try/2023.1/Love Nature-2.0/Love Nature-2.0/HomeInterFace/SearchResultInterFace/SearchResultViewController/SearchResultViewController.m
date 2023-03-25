//
//  SearchResultViewController.m
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/6.
//

#import "SearchResultViewController.h"

// 引入视图类和模型类
#import "SearchResultView.h"
#import "SearchResultModel.h"

// 引入工具类
#import "LNManager.h"

@interface SearchResultViewController ()
@property (nonatomic, strong) SearchResultView* searchResultView;
@property (nonatomic, strong) SearchResultModel* searchResultModel;
@end

@implementation SearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self getSearchResultModel];
}

// 初始化模型
- (void) getSearchResultModel {
    [[LNManager shareLNManager] postPetName:_petName getPetInfoSucceedBlock:^(SearchResultModel * _Nonnull searchResultModel) {
        
        self.searchResultModel = searchResultModel;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self initSearchResultView];
        });
    } erorBlock:^(NSError * _Nonnull error) {
        NSLog(@"getPetInfo error");
    }];
}

// 初始化视图
- (void) initSearchResultView {
    self.searchResultView = [[SearchResultView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_searchResultView];
    _searchResultView.data = _searchResultModel.data;
    
    [_searchResultView initSubViews];
}

@end
