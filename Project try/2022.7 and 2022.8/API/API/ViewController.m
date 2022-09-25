//
//  ViewController.m
//  API
//
//  Created by 孙旭东 on 2022/8/10.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

// 重写getter方法
- (UIView*) backgrandView {
    // 判断该视图是否已经存在，若没有，则实例化
    if (_backgrandView == nil) {
        _backgrandView = [[UIImageView alloc] init];
        _backgrandView.frame = self.view.bounds;
        
        // 添加img图片
        UIImage* backgrandImage = [UIImage imageNamed:@"backgrand.jpeg"];
        [_backgrandView setImage:backgrandImage];
        
        [self.view addSubview:_backgrandView];
    }
    return _backgrandView;
}


@end
