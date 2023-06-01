//
//  ShareCircleViewController.m
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/15.
//

#import "ShareCircleViewController.h"
#import "ShareCircleView.h"

@interface ShareCircleViewController ()

@end

@implementation ShareCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"分享圈";
    
    [self initShareCircleView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) initShareCircleView {
    self.shareCircleView = [[ShareCircleView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:_shareCircleView];
}

@end
