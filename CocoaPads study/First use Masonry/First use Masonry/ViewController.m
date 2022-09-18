//
//  ViewController.m
//  First use Masonry
//
//  Created by 孙旭东 on 2022/9/4.
//

#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#define WeakSelf(weakSelf) __weak __typeof(&*self)weakSelf = self;
#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
}

// 绘制一个红色的View
- (void) setRedView:(UIView *)redView {
    
    WeakSelf(weakSelf);
    
    self.redView = [[UIView alloc] init];
    self.redView.backgroundColor = [UIColor redColor];
    
    // 在设置Autolayout之前，要将view添加到self.view上
    [self.view addSubview:self.redView];
    
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(weakSelf.view);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
}

@end
