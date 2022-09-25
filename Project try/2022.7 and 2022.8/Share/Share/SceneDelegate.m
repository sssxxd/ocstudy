//
//  SceneDelegate.m
//  Share
//
//  Created by 孙旭东 on 2022/7/27.
//

#import "SceneDelegate.h"
#import "KaiJiViewController.h"
#import "FirstViewController.h"
#import "SecondViewCOntroller.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"

@interface SceneDelegate () {
    NSMutableArray* _arrayViewControllers;
}

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene*)scene];
    
//    [self createUITabBarController];
    
    [self.window makeKeyAndVisible];
    
    [self setUPLaunch];
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

#pragma  - 设置启动页面
- (void) setUPLaunch {
    UIView* launchView = [[UIView alloc] init];
    launchView.frame = [UIScreen mainScreen].bounds;
    
    // 背景
    UIImageView* launchImageViewKaiJi = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"newbackground.png"]];
    launchImageViewKaiJi.frame = [UIScreen mainScreen].bounds;
    
    // logo
    UIImageView* kaiJiLogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kaiji_logo.psd"]];
    kaiJiLogo.frame = CGRectMake(120, 250, 150, 150);
    
    // 标题
    UILabel* labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(133, 405, 150, 50)];
    labelTitle.text = @"SHARE";
    labelTitle.font = [UIFont systemFontOfSize:40];
    labelTitle.textColor = [UIColor whiteColor];
    
    [launchView addSubview:launchImageViewKaiJi];
    [launchView addSubview:kaiJiLogo];
    [launchView addSubview:labelTitle];
    
    // 把视图添加到window顶部
    [self.window addSubview:launchView];
    [self.window bringSubviewToFront:launchView];
    
    // 一定时间后移除开机视图，进入登陆界面
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:1.0 animations:^{
            launchView.alpha = 0.1;
            [self createLogonView];
        } completion:^(BOOL finished) {
            [launchView removeFromSuperview];
        }];
    });
}

#pragma - 创建登陆视图
- (void) createLogonView {
    KaiJiViewController* viewController = [[KaiJiViewController alloc] init];
    // 设置代理（登陆用）
    viewController.delegate = self;
    
    self.window.rootViewController = viewController;
}

// 登陆函数
- (void) KaiJiongin {
    // 创建分栏控制器视图并将其作为根视图
    [self createUITabBarController];
}

#pragma - 创建UITabBarController
- (void) createUITabBarController {
    UITabBarController* tabBarController = [[UITabBarController alloc] init];
    _arrayViewControllers = [[NSMutableArray alloc] init];
    
    // 创建视图控制器并添加到数组内
    [self creatFirstViewController];
    [self createSecondViewController];
    [self createThirdViewController];
    [self createFourViewController];
    [self createFiveViewController];
    
    tabBarController.viewControllers = _arrayViewControllers;
    tabBarController.tabBar.translucent = YES;
    tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = tabBarController;
}

// 创建各个视图控制器和导航栏控制器，并将导航栏控制器添加到视图控制器数组内

- (void) creatFirstViewController {
    FirstViewController* firstViewController = [[FirstViewController alloc] init];
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:firstViewController];
    
    UITabBarItem* TabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"56.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"firstbutton_pressed.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    navigationController.tabBarItem = TabBarItem;
    
    [_arrayViewControllers addObject:navigationController];
}

- (void) createSecondViewController {
    SecondViewController* secondViewController = [[SecondViewController alloc] init];
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:secondViewController];
    
    UITabBarItem* TabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"button2_normal.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"button2_pressed.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    navigationController.tabBarItem = TabBarItem;
    
    [_arrayViewControllers addObject:navigationController];
}

- (void) createThirdViewController {
    ThirdViewController* thirdViewController = [[ThirdViewController alloc] init];
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:thirdViewController];
    
    UITabBarItem* TabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"button3_normal.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"button3_pressed.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    navigationController.tabBarItem = TabBarItem;
    
    [_arrayViewControllers addObject:navigationController];
}

- (void) createFourViewController {
    FourViewController* fourViewController = [[FourViewController alloc] init];
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:fourViewController];
    
    UITabBarItem* TabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"button4_normal.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"button4_pressed.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    navigationController.tabBarItem = TabBarItem;
    
    [_arrayViewControllers addObject:navigationController];
}

- (void) createFiveViewController {
    FiveViewController* fiveViewController = [[FiveViewController alloc] init];
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:fiveViewController];
    
    UITabBarItem* TabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"button5_normal.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"button5_pressed.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    navigationController.tabBarItem = TabBarItem;
    
    [_arrayViewControllers addObject:navigationController];
}

@end
