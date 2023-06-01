//
//  SearchViewController.m
//  Find
//
//  Created by 孙旭东 on 2023/3/29.
//

#import "SearchViewController.h"

// 引入模型类和视图类
#import "SearchView.h"
#import "SearchModel.h"

// 引入工具类
#import "LNManager.h"

@interface SearchViewController ()
<UITextFieldDelegate>

@property (nonatomic, strong) SearchView* searchView;
@property (nonatomic, strong) SearchModel* searchModel;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.titleView = self.searchTextField;
    [self createOKItem];
    [self createBackItem];
    [self.view addSubview:self.searchView];
}

#pragma mark - 点击方法

- (void) pressBackItem {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) pressOKItem {
    [self getSearchModelFormURL];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.searchTextField resignFirstResponder];
    return YES;
}

#pragma mark - 网络请求
- (void) getSearchModelFormURL {
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_enter(group);
    [[LNManager shareLNManager] searchKeyword:self.searchTextField.text withPage:1 SearchShareModelBlock:^(SearchShareModel * _Nonnull searchShareModel) {
        
        self.searchModel.searchShareModel = searchShareModel;
        self.searchView.searchTitleDataArray = searchShareModel.data;
        
        dispatch_group_leave(group);
    } errorBlock:^(NSError * _Nonnull error) {
        dispatch_group_leave(group);
    }];
    
    dispatch_group_enter(group);
    [[LNManager shareLNManager] searchKeywork:self.searchTextField.text succeedBlock:^(KeywordListModel * _Nonnull keywordListModel) {
        
        self.searchModel.keywordListModel = keywordListModel;
        self.searchView.searchKeyListArray = keywordListModel.data;
        
        dispatch_group_leave(group);
    } errorBlock:^(NSError * _Nonnull error) {
        NSLog(@"getSearchModelFormURL error");
        dispatch_group_leave(group);
    }];
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        [self.searchView subViewReload];
    });
}

#pragma mark - 懒加载
- (UITextField*) searchTextField {
    if (_searchTextField == nil) {
        self.searchTextField = [[UITextField alloc] init];
        _searchTextField.frame = CGRectMake(0, 0, 303, 31);
        _searchTextField.backgroundColor = [UIColor whiteColor];
        _searchTextField.layer.cornerRadius = 31/2;
        _searchTextField.layer.masksToBounds = YES;
        _searchTextField.layer.borderWidth = 1;
        _searchTextField.layer.borderColor = [UIColor grayColor].CGColor;
        _searchTextField.delegate = self;
        _searchTextField.returnKeyType = UIReturnKeySearch;
        
        UIImageView* sousuoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sousuo-4.png"]];
        sousuoImageView.frame = CGRectMake(12, 0, 26, 26);
        _searchTextField.leftView = sousuoImageView;
        _searchTextField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _searchTextField;
}

- (SearchView*) searchView {
    if (_searchView == nil) {
        self.searchView = [[SearchView alloc] initWithFrame:self.view.frame];
    }
    return _searchView;
}

- (SearchModel*) searchModel {
    if (_searchModel == nil) {
        self.searchModel = [[SearchModel alloc] init];
    }
    return _searchModel;
}

// 设置Item
- (void) createBackItem {
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fanhui.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressBackItem)];
    
    item.tintColor = [UIColor blackColor];
    
    self.navigationItem.leftBarButtonItem = item;
}

- (void) createOKItem {
    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 35)];
    customView.backgroundColor = [UIColor colorWithRed:0.165f green:0.510f blue:0.895f alpha:1];
    customView.layer.cornerRadius = 8;
    customView.layer.masksToBounds = YES;
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, 60, 35);
    [button setTitle:@"搜索" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    [button addTarget:self action:@selector(pressOKItem) forControlEvents:UIControlEventTouchUpInside];
    
    [customView addSubview:button];
    
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithCustomView:customView];
    self.navigationItem.rightBarButtonItem = item;
}

@end
