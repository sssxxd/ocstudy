//
//  UpDataViewController.m
//  Find
//
//  Created by 孙旭东 on 2023/3/22.
//

#import "UpDataViewController.h"

// 引入视图类和视图模型
#import "UpDataView.h"
#import "UpDataModel.h"

@interface UpDataViewController ()

@property (nonatomic, strong) UpDataView* upDataView;
@property (nonatomic, strong) UIBarButtonItem* cancelItem;
@property (nonatomic, strong) UIBarButtonItem* upDataItem;

@end

@implementation UpDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.upDataView];
    self.navigationItem.leftBarButtonItem = self.cancelItem;
    self.navigationItem.rightBarButtonItem = self.upDataItem;
}

#pragma mark - 点击方法
- (void) pressCancelItem {
    self.tabBarController.selectedIndex = 0;
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
    }
    return _cancelItem;
}

- (UIBarButtonItem*) upDataItem {
    if (_upDataItem == nil) {
        self.upDataItem = [[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStyleDone target:self action:nil];
    }
    return _upDataItem;
}

@end
