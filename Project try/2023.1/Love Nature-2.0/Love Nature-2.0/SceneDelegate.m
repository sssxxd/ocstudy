//
//  SceneDelegate.m
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/1/15.
//

#import "SceneDelegate.h"

// 引入各视图控制器
#import "UserMainViewController.h"
#import "HomeViewController.h"
#import "UpDataViewController.h"
#import "ShopMallViewController.h"
#import "MedicalViewController.h"

// 引入第三方库
#import "Masonry.h"

@interface SceneDelegate ()
@property (nonatomic, strong) NSMutableArray* navViewControllerArray;

@property (nonatomic, strong) UITabBarController* tabBarController;

// 开机画面
@property (nonatomic, strong) UIView* launchView;
@property (nonatomic, strong) UIImageView* AppLogoImageView;
@property (nonatomic, strong) UILabel* AppTitleLabel;
@property (nonatomic, strong) UILabel* AppIntroductionLabel;
@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
   
    
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene*)scene];
    
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

#pragma mark - 创建开机动画
- (void) setUPLaunch {
    [self.window addSubview:self.launchView];
    [self.window bringSubviewToFront:self.launchView];
    
    [self.launchView addSubview:self.AppTitleLabel]; 
    [self.launchView addSubview:self.AppIntroductionLabel];
    [self.launchView addSubview:self.AppLogoImageView];
    
    [self layoutLaunchViewSubViews];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self createTabBarController];
        [self.launchView removeFromSuperview];
    });
}

// 设置约束
- (void) layoutLaunchViewSubViews {
    CGFloat LogoViewWidth = [UIScreen mainScreen].bounds.size.width - 18;
    CGFloat LogoViewHeigth = LogoViewWidth - 100;
    
    [self.AppLogoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(149);
        make.centerX.equalTo(self.launchView);
        make.width.mas_offset(LogoViewWidth);
        make.height.mas_offset(LogoViewHeigth);
    }];
    
    [self.AppTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.AppLogoImageView.mas_bottom).mas_offset(0);
        make.centerX.equalTo(self.AppLogoImageView);
    }];
    
    [self.AppIntroductionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_offset(-70);
        make.centerX.equalTo(self.AppLogoImageView);
    }];
}

#pragma mark - 创建视图控制器
- (void) createTabBarController {
    self.navViewControllerArray = [NSMutableArray array];
    
    [self createHomeViewController];
    [self createShopMallViewController];
    [self createUpDataViewController];
    [self createMedicalViewController];
    [self createUserMainViewController];
    
    self.tabBarController = [[UITabBarController alloc] init];
    _tabBarController.viewControllers = _navViewControllerArray;
    
    self.window.rootViewController = _tabBarController;
}

- (void) createUserMainViewController {
    UserMainViewController* viewController = [[UserMainViewController alloc] init];
    
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    UITabBarItem* item = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"wode.png"] tag:101];
    
    nav.tabBarItem = item;
    [_navViewControllerArray addObject:nav];
}

- (void) createHomeViewController {
    HomeViewController* viewController = [[HomeViewController alloc] init];
    
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    UITabBarItem* item = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"shouye.png"] tag:101];
    
    nav.tabBarItem = item;
    [_navViewControllerArray addObject:nav];
}

- (void) createUpDataViewController {
    UpDataViewController* viewController = [[UpDataViewController alloc] init];
    
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    UITabBarItem* item = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"add-2.png"] tag:101];
    
    nav.tabBarItem = item;
    [_navViewControllerArray addObject:nav];
}

- (void) createShopMallViewController {
    ShopMallViewController* viewController = [[ShopMallViewController alloc] init];
    
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    UITabBarItem* item = [[UITabBarItem alloc] initWithTitle:@"商场" image:[UIImage imageNamed:@"shopping-2.png"] tag:101];
    
    nav.tabBarItem = item;
    [_navViewControllerArray addObject:nav];
}

- (void) createMedicalViewController {
    MedicalViewController* viewController = [[MedicalViewController alloc] init];
    
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    UITabBarItem* item = [[UITabBarItem alloc] initWithTitle:@"在线医疗" image:[UIImage imageNamed:@"cloud.png"] tag:101];
    
    nav.tabBarItem = item;
    [_navViewControllerArray addObject:nav];
}

#pragma mark - 懒加载
- (UIView*) launchView {
    if (_launchView == nil) {
        self.launchView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _launchView.backgroundColor = [UIColor whiteColor];
    }
    return _launchView;
}

- (UIImageView*) AppLogoImageView {
    if (_AppLogoImageView == nil) {
        self.AppLogoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WechatIMG710.png"]];
    }
    return _AppLogoImageView;
}

- (UILabel*) AppTitleLabel {
    if (_AppTitleLabel == nil) {
        self.AppTitleLabel = [[UILabel alloc] init];
        _AppTitleLabel.text = @"Find";
        _AppTitleLabel.font = [UIFont fontWithName:@"Georgia-BoldItalic" size:36];
        _AppTitleLabel.textColor = [UIColor blackColor];
    }
    return _AppTitleLabel;
}

- (UILabel*) AppIntroductionLabel {
    if (_AppIntroductionLabel == nil) {
        self.AppIntroductionLabel = [[UILabel alloc] init];
        _AppIntroductionLabel.text = @"Find from nature...";
        _AppIntroductionLabel.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:22];
        _AppIntroductionLabel.textColor = [UIColor blackColor];
    }
    return _AppIntroductionLabel;
}

@end
