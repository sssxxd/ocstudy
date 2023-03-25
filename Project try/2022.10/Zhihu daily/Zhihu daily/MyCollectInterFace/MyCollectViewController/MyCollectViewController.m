//
//  MyCollectViewController.m
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/11/7.
//

#import "MyCollectViewController.h"
#import "StoriesViewController.h"
#import "Manage.h"

@interface MyCollectViewController ()

@end

@implementation MyCollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的收藏";
    [self createBackItem];
    
    self.myCollectModel = [[MyCollectModel alloc] init];
    self.myCollectView = [[MyCollectView alloc] initWithFrame:self.view.bounds];
    
    [self.myCollectView ViewInit];
    
    [self.view addSubview:self.myCollectView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pressCollectCell:) name:@"pressCollectCell" object:nil];
}

- (void) viewWillAppear:(BOOL)animated {
    [self.myCollectModel reloadModel];
    dispatch_group_t group = dispatch_group_create();
    
    for (NSString* ID in self.myCollectModel.collectSet) {
        dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
        dispatch_group_enter(group);
        [[Manage sharedManage] getCollectConentWithID:ID CollectData:^(MyCollectContentModel * _Nonnull myCollectContenModel) {
            [self.myCollectModel.collectTitle addObject:myCollectContenModel.title];
            [self.myCollectModel.collectImagePath addObject:myCollectContenModel.image];
            dispatch_group_leave(group);
        } error:^(NSError * _Nonnull error) {
            NSLog(@"get Collect error");
            dispatch_group_leave(group);
        }];
    }
    
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            self.myCollectView.titleArray = self.myCollectModel.collectTitle;
            self.myCollectView.imagePathArray = self.myCollectModel.collectImagePath;
            
            [self.myCollectView viewReload];
        });
    });
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) pressCollectCell:(NSNotification*)notification {
    NSNumber* numberObject = notification.userInfo[@"value"];
    NSInteger number = [numberObject integerValue];
    
    StoriesViewController* viewController = [[StoriesViewController alloc] init];
    
    [viewController initStoriesModel];
    
    viewController.storiesModel.storiesIDArray = [[NSMutableArray alloc] init];
    
    for (NSString* ID in self.myCollectModel.collectSet) {
        NSLog(@"%@", ID);
        [viewController.storiesModel.storiesIDArray addObject:ID];
    }
    
    viewController.storiesNumber = number + 1;
    viewController.storiesInterFace = [[StoriesInterFace alloc] initWithFrame:self.view.bounds];
    
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
