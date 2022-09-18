//
//  SceneDelegate.m
//  UIWindow
//
//  Created by 孙旭东 on 2022/6/8.
//

#import "SceneDelegate.h"
#import "ViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate

// SceneDelegate.m


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead)
    
    // 初始化window
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene*)scene];
    
    // 设置window位置
    self.window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    // 创建一个视图控制器作为window根视图控制器
    
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    self.window.rootViewController = nav;
    
    // 设置windo背景颜色
    self.window.backgroundColor = [UIColor orangeColor];
    
    // 使window有效并显示到屏幕上
    
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 150, 150)];
    
    view.backgroundColor = [UIColor blueColor];
    
    // 背景视图
    UIView* backView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 240, 360)];
    
    backView.backgroundColor = [UIColor greenColor];
    
    // 将backView作为view的父亲视图
    // 子视图坐标参照父亲视图的坐标
    // 当父亲视图移动时，所有子视图都会移动
    [backView addSubview:view];
    
    [self.window addSubview:backView];
    
    // 每个view都有一个window属性
    // view.window
    
    [self.window makeKeyAndVisible];
    
    // 所以window都指向同一个window
    NSLog(@"%@", self.window);
    
    NSLog(@"%@", view.window);
    
    NSLog(@"%@", backView.window);
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


@end
