//
//  ClassifictaionViewController.m
//  Find
//
//  Created by 孙旭东 on 2023/3/29.
//

#import "ClassifictaionViewController.h"

// 引入视图类
#import "ClassificationView.h"

@interface ClassifictaionViewController ()

@property (nonatomic, strong) ClassificationView* classificationView;

@end

@implementation ClassifictaionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.classificationView];
    [self createBackItem];
}

#pragma mark - 懒加载

// 设置Item
- (void) createBackItem {
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fanhui.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressBackItem)];
    
    item.tintColor = [UIColor blackColor];
    
    self.navigationItem.leftBarButtonItem = item;
}

- (void) pressBackItem {
    [self.navigationController popViewControllerAnimated:YES];
}

- (ClassificationView*) classificationView {
    if (_classificationView == nil) {
        self.classificationView = [[ClassificationView alloc] initWithFrame:self.view.bounds];
    }
    return _classificationView;
}

@end
