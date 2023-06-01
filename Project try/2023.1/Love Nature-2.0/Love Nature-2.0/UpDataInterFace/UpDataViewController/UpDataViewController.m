//
//  UpDataViewController.m
//  Find
//
//  Created by 孙旭东 on 2023/3/22.
//

#import "UpDataViewController.h"

// 引入框架
#import <Photos/Photos.h>

// 引入视图控制器
#import "UpDataSelectViewController.h"
#import "MapKitViewController.h"

// 引入视图类和视图模型
#import "UpDataView.h"
#import "UpDataModel.h"

// 引入工具类
#import "LNManager.h"

// 全局变量
extern NSString *const UpDataViewaddImageButtonPressed;
extern NSString *const UpDataSelectViewControllerSelectImageOK;
extern NSString *const UpDataViewaddressButtonPressed;

@interface UpDataViewController ()

@property (nonatomic, strong) UpDataView* upDataView;
@property (nonatomic, strong) UpDataModel* upDataModel;
@property (nonatomic, strong) UIBarButtonItem* cancelItem;
@property (nonatomic, strong) UIBarButtonItem* upDataItem;
@property (nonatomic, copy) NSArray* allImageArray;

@end

@implementation UpDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.upDataView];
    self.navigationItem.leftBarButtonItem = self.cancelItem;
    self.navigationItem.rightBarButtonItem = self.upDataItem;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(createUpDataSelectViewController) name:UpDataViewaddImageButtonPressed object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(UpDataSelectViewControllerSelectImage:) name:UpDataSelectViewControllerSelectImageOK object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pressMapKit) name:UpDataViewaddressButtonPressed object:nil];
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - 点击方法

- (void) createUpDataSelectViewController {
    UpDataSelectViewController* viewController = [[UpDataSelectViewController alloc] init];
    
    NSMutableSet* imageSelectedSet = [[NSMutableSet alloc] init];
    for (UIImage* image in self.upDataView.imageArray) {
        [imageSelectedSet addObject:image];
    }
    viewController.imageSelectedSet = imageSelectedSet;
    
    if (self.allImageArray != nil) {
        viewController.imageArray = self.allImageArray;
    }
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void) UpDataSelectViewControllerSelectImage:(NSNotification*)notification {
    NSSet *imageSeletedSet = notification.userInfo[@"imageSelectedSet"];
    
    NSMutableArray* imageArray = [[NSMutableArray alloc] init];
    for (UIImage* image in imageSeletedSet) {
        [imageArray addObject:image];
    }
    
    self.upDataView.imageArray = imageArray;
    self.allImageArray = notification.userInfo[@"allImageArray"];
    
    [self.upDataView layoutImageView];
}

- (void) pressCancelItem {
    self.tabBarController.selectedIndex = 0;
}

- (void) pressUpdDataItem {
    NSString* blogTitle = self.upDataView.titleTextField.text;
    NSString* content = self.upDataView.textTextField.text;
    NSString* location = self.upDataView.addressLabel.text;
    NSArray* pictures = self.upDataView.imageArray;
    
    [[LNManager shareLNManager] postNickName:self.upDataModel.nickName Token:self.upDataModel.token blogTitle:blogTitle Content:content Location:location pictures:pictures succeedBlock:^(UpDataTitleModel * _Nonnull upDataTitleModel) {
        
        UIAlertController* alertController = [UIAlertController alertControllerWithTitle:upDataTitleModel.data message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        
        [alertController addAction:action];
        
        [self presentViewController:alertController animated:YES completion:nil];
    } ErrorBlock:^(NSError * _Nonnull error) {
        NSLog(@"pressUpdDataItem error");
    }];
}

- (void) pressMapKit {
    MapKitViewController* viewController = [[MapKitViewController alloc] init];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - 懒加载

- (UpDataView*) upDataView {
    if (_upDataView == nil) {
        self.upDataView = [[UpDataView alloc] initWithFrame:self.view.frame];
    }
    return _upDataView;
}

- (UIBarButtonItem*) cancelItem {
    if (_cancelItem == nil) {
        self.cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(pressCancelItem)];
        _cancelItem.tintColor = [UIColor blackColor];
    }
    return _cancelItem;
}

- (UIBarButtonItem*) upDataItem {
    if (_upDataItem == nil) {
        UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 35)];
        customView.backgroundColor = [UIColor colorWithRed:0.165f green:0.510f blue:0.895f alpha:1];
        customView.layer.cornerRadius = 8;
        customView.layer.masksToBounds = YES;
        
        UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(0, 0, 60, 35);
        [button setTitle:@"发布" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:18];
        [button addTarget:self action:@selector(pressUpdDataItem) forControlEvents:UIControlEventTouchUpInside];
        
        [customView addSubview:button];
        
        self.upDataItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
    }
    return _upDataItem;
}

- (UpDataModel *)upDataModel {
    if (_upDataModel == nil) {
        self.upDataModel = [[UpDataModel alloc] init];
    }
    return _upDataModel;
}

@end
