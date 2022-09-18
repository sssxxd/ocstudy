//
//  ViewControllerRoot.m
//  picture wall
//
//  Created by 孙旭东 on 2022/7/20.
//

#import "ViewControllerRoot.h"

@interface ViewControllerRoot ()

@end

@implementation ViewControllerRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"照片墙";
    
    self.navigationController.navigationBar.translucent = YES;
    
    UIScrollView* scrollView = [[UIScrollView alloc] init];
    
    scrollView.frame = CGRectMake(10, 10, 300, 480);
    
    scrollView.contentSize = CGSizeMake(300, 480 * 1.5);
    
    
    // 打开交互事件
    scrollView.userInteractionEnabled = YES;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
