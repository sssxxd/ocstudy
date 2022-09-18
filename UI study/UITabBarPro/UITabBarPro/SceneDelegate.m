//
//  SceneDelegate.m
//  UITabBarPro
//
//  Created by 孙旭东 on 2022/7/20.
//

#import "SceneDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene*)scene];
    
    [self.window makeKeyAndVisible];
    
    ViewController01 * VC01 = [[ViewController01 alloc] init];
    ViewController02 * VC02 = [[ViewController02 alloc] init];
    ViewController03 * VC03 = [[ViewController03 alloc] init];
    
    VC01.view.backgroundColor = [UIColor blueColor];
    VC02.view.backgroundColor = [UIColor yellowColor];
    VC03.view.backgroundColor = [UIColor orangeColor];
    
    VC01.title = @"00001";
    VC02.title = @"00002";
    VC03.title = @"00003";
    
    UITabBarController* tabBarController = [[UITabBarController alloc] init];
    
    NSArray* array = [NSArray arrayWithObjects:VC01, VC02, VC03, nil];
    
    tabBarController.viewControllers = array;
    
    tabBarController.view.tintColor = [UIColor blackColor];
    
    self.window.rootViewController = tabBarController;
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
