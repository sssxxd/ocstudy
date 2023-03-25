//
//  HomeViewController.m
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/6.
//

#import "HomeViewController.h"

// 引入CollectionView自定义类别
#import "ConllectionView+homeView.h"

// 引入第三方库
#import "Masonry.h"

// 引入视图控制器
#import "SearchViewController.h"

// 引入视图类和模型类
#import "HomeView.h"
#import "HomeModel.h"

// 引入工具类
#import "LNManager.h"

@interface HomeViewController ()
<UITextFieldDelegate>
@property (nonatomic, strong) HomeView* homeView;
@property (nonatomic, strong) HomeModel* homeModel;

@property (nonatomic, strong) UITextField* searchTextField;
@property (nonatomic, strong) UIBarButtonItem* moreItem;
@property (nonatomic, strong) UIBarButtonItem* cameraItem;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initHomeModel];
    [self initHomeView];
    
    [self initNavSubViews];
}

// 初始化模组
- (void) initHomeModel {
    self.homeModel = [[HomeModel alloc] init];
    
    NSMutableArray* array = [[NSMutableArray alloc] init];
    for (int i = 0; i < 4; i++) {
        TopRecommendDataModel* data = [[TopRecommendDataModel alloc] init];
        if (i == 0) {
            data.title = @"看看我家的小可爱";
            data.authorName = @"铲屎官1";
            data.imageString = @"HomeTopRe1.jpg";
        } else if (i == 1) {
            data.title = @"叫我女王大人";
            data.authorName = @"铲屎官2";
            data.imageString = @"HomeTopRe2.jpeg";
        } else if (i == 2) {
            data.title = @"狼蛛真的很可爱";
            data.authorName = @"铲屎官3";
            data.imageString = @"HomeTopRe3.jpg";
        } else {
            data.title = @"水仙真的有一种不应在此界的美";
            data.authorName = @"铲屎官4";
            data.imageString = @"HomeTopRe4.jpeg";
        }
        [array addObject:data];
    }
    self.homeModel.topRecommendModel.data = (NSArray<TopRecommendDataModel>*)array;
    
    NSMutableArray* array2 = [[NSMutableArray alloc] init];
    for (int i = 0; i < 12; i++) {
        HomeShareDataModel* data = [[HomeShareDataModel alloc] init];
        data.userName = @"铲屎官";
        data.title = @"狸花猫，猫界中的战斗猫！";
        data.mainImage = @"lihuamao.jpg";
        data.userIcon = @"userIcon.jpeg";
        
        [array2 addObject:data];
    }
    self.homeModel.homeShareModel.data = (NSArray<HomeShareDataModel>*)array2;
}

// 初始化视图
- (void) initHomeView {
    self.homeView = [[HomeView alloc] initWithFrame:self.view.bounds];
    
    self.homeView.HomeTopRecommendDataArray = (NSArray*)self.homeModel.topRecommendModel.data;
    self.homeView.HomeShareDataArray = (NSArray*)self.homeModel.homeShareModel.data;
    
    [self.homeView initView];
    
    [self.view addSubview:self.homeView];
}

#pragma mark - 搜索功能

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.searchTextField resignFirstResponder];
}

- (void) initNavSubViews {
    self.navigationItem.titleView = self.searchTextField;
    self.navigationItem.leftBarButtonItem = self.moreItem;
    self.navigationItem.rightBarButtonItem = self.cameraItem;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [[LNManager shareLNManager] searchKeywork:self.searchTextField.text succeedBlock:^(KeywordListModel * _Nonnull keywordListModel) {
        
        self.homeModel.keywordListModel = keywordListModel;

        dispatch_async(dispatch_get_main_queue(), ^{
            [self createSearchViewController];
        });
    } errorBlock:^(NSError * _Nonnull error) {
        NSLog(@"searchKeyList error");
    }];
    
    [self.searchTextField resignFirstResponder];
    return YES;
}

- (void) createSearchViewController {
    SearchViewController* viewController = [[SearchViewController alloc] init];
    
    viewController.keywordListModel = _homeModel.keywordListModel;
    
    [self.navigationController pushViewController:viewController animated:YES];
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

- (UIBarButtonItem*) moreItem {
    if (_moreItem == nil) {
        self.moreItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"gengduomore-1.png"] style:UIBarButtonItemStyleDone target:self action:nil];
        
        _moreItem.tintColor = [UIColor blackColor];
    }
    return _moreItem;
}

- (UIBarButtonItem*) cameraItem {
    if (_cameraItem == nil) {
        self.cameraItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"camera.png"] style:UIBarButtonItemStyleDone target:self action:nil];
        
        _cameraItem.tintColor = [UIColor blackColor];
    }
    return _cameraItem;
}

@end
