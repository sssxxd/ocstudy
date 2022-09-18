//
//  SceneDelegate.m
//  WangYiYun
//
//  Created by 孙旭东 on 2022/7/23.
//

#import "SceneDelegate.h"
#import "FaXianViewController.h"
#import "BoKeViewController.h"
#import "WodeViewController.h"
#import "GuanZhuViewController.h"
#import "YunCunViewController.h"
#import "WangYiYunController.h"

@interface SceneDelegate ()

@property (nonatomic, copy) NSMutableArray* arrayControllers;

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene*)scene];
    // 控制器数组
    _arrayControllers = [[NSMutableArray alloc] init];
    
    [self createUITabBarController];
    
    [self.window makeKeyAndVisible];
    
    [self setUpLaunchScreen];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}

#pragma - 创建UITabBarController并将其作为根视图控制器
- (void) createUITabBarController {
    WangYiYunController* tabBarController = [[WangYiYunController alloc] init];
    
    self.window.rootViewController = tabBarController;
    
    // 创建分页的导航栏
    [self createUINavigationllerOfFaXian];
    [self createUINavigationllerOfBoKe];
    [self createUINavigationllerOfWoDe];
    [self createUINavigationllerOfGuanzhu];
    [self createUINavigationllerYunCun];
    
    tabBarController.viewControllers = _arrayControllers;
    tabBarController.tabBar.translucent = NO;
    tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
    
    tabBarController.tabBar.tintColor = [UIColor redColor];
    tabBarController.selectedIndex = 2;
}

#pragma - 创建分页的导航栏
// 发现页面
- (void) createUINavigationllerOfFaXian {
    // 创建视图控制器
    FaXianViewController* faXianViewController = [[FaXianViewController alloc] init];
    
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:faXianViewController];
    
    navigationController.title = @"发现";
    navigationController.navigationBarHidden = NO;
    navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    
    UITabBarItem* TabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:[UIImage imageNamed:@"faxian.png"] tag:101];
    
    navigationController.tabBarItem = TabBarItem;
    
    [_arrayControllers addObject:navigationController];
}

// 播客页面
- (void) createUINavigationllerOfBoKe {
    BoKeViewController* boKeViewController = [[BoKeViewController alloc] init];
    
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:boKeViewController];
    
    navigationController.title = @"视频";
    
    UITabBarItem* TabBarItem = [[UITabBarItem alloc] initWithTitle:@"视频" image:[UIImage imageNamed:@"shipin.png"] selectedImage:[UIImage imageNamed:@"shipinbofang.png"]];
    
    navigationController.tabBarItem = TabBarItem;
    
    [_arrayControllers addObject:navigationController];
}

// 我的页面
- (void) createUINavigationllerOfWoDe {
    WodeViewController* wodeViewController = [[WodeViewController alloc] init];
    
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:wodeViewController];
    
    UITabBarItem* TabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"wode.png"] selectedImage:[UIImage imageNamed:@"wode-tiancho-2.png"]];
    navigationController.navigationBarHidden = NO;
    navigationController.navigationBar.backgroundColor = [UIColor blackColor];
    
    navigationController.tabBarItem = TabBarItem;
    
    [_arrayControllers addObject:navigationController];
}

// 云村页面
- (void) createUINavigationllerOfGuanzhu {
    GuanZhuViewController* guanZhuViewController = [[GuanZhuViewController alloc] init];
    
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:guanZhuViewController];
    
    navigationController.title = @"云村";
    
    UITabBarItem* TabBarItem = [[UITabBarItem alloc] initWithTitle:@"云村" image:[UIImage imageNamed:@"duorenyonghu.png"] selectedImage:[UIImage imageNamed:@"duorenyonghu2.png"]];
    
    navigationController.tabBarItem = TabBarItem;
    
    [_arrayControllers addObject:navigationController];
}

// 账号页面
- (void) createUINavigationllerYunCun {
    YunCunViewController* yunCunViewController = [[YunCunViewController alloc] init];
    
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:yunCunViewController];
    
    UITabBarItem* TabBarItem = [[UITabBarItem alloc] initWithTitle:@"账号" image:[UIImage imageNamed:@"zhanghao.png"] selectedImage:[UIImage imageNamed:@"zahnghao-tianchong-2.png"]];
    
    navigationController.tabBarItem = TabBarItem;
    
    navigationController.title = @"账号";
    
    [_arrayControllers addObject:navigationController];
}

#pragma - 启动图
- (void) setUpLaunchScreen {
    self.customLaunchImageView = [[UIImageView alloc] initWithFrame:self.window.bounds];
    self.customLaunchImageView.userInteractionEnabled = YES;
    self.customLaunchImageView.backgroundColor = [UIColor redColor];
//    self.customLaunchImageView.image = [self getLaunchImage];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(100, 250, 200, 100)];
    label.text = @"网易云音乐";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:30];
    label.textAlignment = NSTextAlignmentCenter;
    [self.customLaunchImageView addSubview:label];
    
    [self.window addSubview:self.customLaunchImageView];
    [self.window bringSubviewToFront:self.customLaunchImageView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self yourButtonClick];
    });
}

- (void) yourButtonClick {
    if (self.customLaunchImageView) {
        [UIView animateWithDuration:0.3 animations:^{
            self.customLaunchImageView.alpha = 0;
        } completion:^(BOOL finished){
            [self.customLaunchImageView removeFromSuperview];
            self.customLaunchImageView = nil;
        }];
    }
}

- (UIImage*) getLaunchImage {
    UIImage* image = nil;
    CGSize viewSize = [UIScreen mainScreen].bounds.size;
    
    NSArray* imagesDictionary = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary* dict in imagesDictionary) {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, viewSize) && [dict[@"UILaunchImageSize"] isEqual:@"Landscape"]) {
            image = [UIImage imageNamed:dict[@"UILaunchImageSize"]];
        }
    }
    return  image;
}

@end
