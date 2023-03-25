//
//  UserViewController.m
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/11/7.
//

#import "UserViewController.h"
#import "MyCollectViewController.h"

@interface UserViewController ()

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createBackItem];
    
    [self initUserView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) initUserView {
    self.userView = [[UserView alloc] initWithFrame:self.view.bounds];
    [self.userView viewInit];
    
    [self.userView.userIconView setImage:[UIImage imageNamed:@"userIcon.jpeg"]];
    
    self.userView.userName.text = @"瓯海剑";
    
    self.userView.myCollectLabel.text = @"我的收藏";
    
    self.userView.commentCenterLabel.text = @"消息中心";
    
    [self.userView.myCollectButton addTarget:self action:@selector(pressMyCollectButton) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.userView];
}

- (void) pressMyCollectButton {
    MyCollectViewController* viewController = [[MyCollectViewController alloc] init];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void) createBackItem {
    UIBarButtonItem* item =[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fanhui.png"] style:UIBarButtonItemStyleDone target:self action:@selector(pressBack)];
    item.tintColor = [UIColor blackColor];
    
    self.navigationItem.leftBarButtonItem = item;
}

- (void) pressBack {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
