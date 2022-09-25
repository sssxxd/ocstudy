//
//  SceneDelegate.m
//  StudentSystem
//
//  Created by 孙旭东 on 2022/8/3.
//

#import "SceneDelegate.h"
#import "LoginViewController.h"
#import "MainViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene*)scene];

    LoginViewController* loginViewController = [[LoginViewController alloc] init];
    
//    MainViewController* mainViewController = [[MainViewController alloc] init];
    
    self.window.rootViewController = loginViewController;
    
    [self.window makeKeyAndVisible];
    
    [self createLaunchView];
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



- (void) createLaunchView {
    UIImageView* launchView = [[UIImageView alloc] initWithFrame:self.window.bounds];
    [launchView setImage:[UIImage imageNamed:@"launchImage.jpeg"]];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(110, 200, 200, 60)];
    label.text = @"学生管理系统";
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:28];
    
    [launchView addSubview:label];
    
    [self.window addSubview:launchView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:1.0 animations:^{
            launchView.alpha = 0.1;
            
        } completion:^(BOOL finished) {
            [launchView removeFromSuperview];
        }];
    });
}

@end
