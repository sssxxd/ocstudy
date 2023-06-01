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
#import "ClassifictaionViewController.h"
#import "KnowledBaseViewController.h"
#import "SweepViewController.h"
#import "TitleViewController.h"


// 引入视图类和模型类
#import "HomeView.h"
#import "HomeModel.h"
#import "TitleView.h"

// 引入工具类
#import "LNManager.h"

// 设置全局变量
extern NSString *const HomeViewKnoledgeBaseButtonPressed;
extern NSString *const HomeViewTitleCellPressed;

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
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initNavSubViews];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(konwledgeBaseOpen) name:HomeViewKnoledgeBaseButtonPressed object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openTitleCell:) name:HomeViewTitleCellPressed object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
    
    [[LNManager shareLNManager] getBlogWithPage:1 Succeed:^(HomeShareModel * _Nonnull homeShareModel) {
        
        self.homeModel.homeShareModel = homeShareModel;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self initHomeView];
            [self.homeView reloadView];
        });
    } errorBlock:^(NSError * _Nonnull error) {
        NSLog(@"getBlog error");
    }];
    
}

// 初始化视图
- (void) initHomeView {
    self.homeView = [[HomeView alloc] initWithFrame:self.view.bounds];
    
    self.homeView.HomeTopRecommendDataArray = (NSArray*)self.homeModel.topRecommendModel.data;
    self.homeView.HomeShareDataArray = self.homeModel.homeShareModel.data;
    
    [self.homeView initView];
    
    [self.view addSubview:self.homeView];
}

#pragma mark - 文章详情
- (void)openTitleCell:(NSNotification *)notification {
    NSNumber* num = notification.userInfo[@"value"];
    NSInteger i = [num integerValue];
    
    TitleViewController* viewController = [[TitleViewController alloc] init];
    viewController.dataModel = self.homeModel.homeShareModel.data[i];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - 扫描
- (void)SweepOpen {
    SweepViewController* viewController = [[SweepViewController alloc] init];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - 知识库
- (void)konwledgeBaseOpen {
    KnowledBaseViewController* viewController = [[KnowledBaseViewController alloc] init];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - 分类
- (void) createClassViewController {
    ClassifictaionViewController* viewController = [[ClassifictaionViewController alloc] init];
    
    [self.navigationController pushViewController:viewController animated:YES];
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

- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
    SearchViewController* viewController = [[SearchViewController alloc] init];
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    return NO;
}

- (void) createSearchViewController {
    [self.searchTextField resignFirstResponder];
    SearchViewController* viewController = [[SearchViewController alloc] init];
    
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
        self.moreItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"gengduomore-1.png"] style:UIBarButtonItemStyleDone target:self action:@selector(createClassViewController)];
        
        _moreItem.tintColor = [UIColor blackColor];
    }
    return _moreItem;
}

- (UIBarButtonItem*) cameraItem {
    if (_cameraItem == nil) {
        self.cameraItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"camera.png"] style:UIBarButtonItemStyleDone target:self action:@selector(SweepOpen)];
        
        _cameraItem.tintColor = [UIColor blackColor];
    }
    return _cameraItem;
}

@end
