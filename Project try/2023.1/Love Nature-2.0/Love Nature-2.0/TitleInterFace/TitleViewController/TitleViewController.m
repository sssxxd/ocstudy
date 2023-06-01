//
//  TitleViewController.m
//  Find
//
//  Created by 孙旭东 on 2023/4/13.
//

#import "TitleViewController.h"

// 引入视图类
#import "TitleView.h"
#import "HomeModel.h"

#import "Masonry.h"
#import "LNManager.h"

@interface TitleViewController ()
@property (nonatomic, strong, readwrite) TitleView* titlleView;

@end

@implementation TitleViewController {
    CGFloat _itemWith;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.titlleView];
    self.titlleView.dataModel = self.dataModel;
    [self.titlleView layoutView];
    [self rightNavItem];
}

- (void)viewWillAppear:(BOOL)animated {

}

- (void)backButtonPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 懒加载
- (TitleView *)titlleView {
    if (_titlleView == nil) {
        self.titlleView = [[TitleView alloc] initWithFrame:self.view.frame];
    }
    return _titlleView;
}

- (void)rightNavItem {
    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    customView.userInteractionEnabled = YES;
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"fanhui.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:button];
    
    _itemWith = [UIScreen mainScreen].bounds.size.width / 10;
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(0);
        make.top.mas_offset(-20);
        make.size.mas_offset(_itemWith);
    }];
    
    UIImageView* iconImageView = [[UIImageView alloc] init];
    [[LNManager shareLNManager] useImageURLString:self.dataModel.author.icon setImageVIew:iconImageView];
    iconImageView.layer.masksToBounds = YES;
    iconImageView.layer.cornerRadius = _itemWith/2;
    [customView addSubview:iconImageView];
    
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(button.mas_right).mas_offset(10);
        make.top.equalTo(button);
        make.size.equalTo(button);
    }];
    
    UILabel* nameLabel = [[UILabel alloc] init];
    nameLabel.text = self.dataModel.author.nickName;
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.font = [UIFont systemFontOfSize:20];
    [customView addSubview:nameLabel];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(button).mas_offset(5);
        make.left.mas_equalTo(iconImageView.mas_right).mas_offset(10);
    }];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
}

@end
