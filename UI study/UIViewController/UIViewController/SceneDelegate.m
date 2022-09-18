//
//  SceneDelegate.m
//  UIViewController
//
//  Created by 孙旭东 on 2022/6/8.
//

#import "SceneDelegate.h"
#import "ViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    // 创建一个window对象
    // 属于SceneDelegate属性
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene*)scene];
    
    // UIScreen：表示屏幕的信息
    // mainScreen：获得主屏幕信息
    // bounds当前手机屏幕大小
    self.window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    // 创建视图控制器对象
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    
    // 对窗口根视图控制器进行赋值操作
    // 整个UIKit框架中只有一个根视图控制器，属于window属性
    // 视图控制器用于管理界面，和处理界面的逻辑类对象
    // 程序启动前必须对根视图控制器赋值
    self.window.rootViewController = nav;
    
    // 将window作为主视图并且显示出来
    [self.window makeKeyAndVisible];
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
