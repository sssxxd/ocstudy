//
//  SceneDelegate.h
//  WangYiYun
//
//  Created by 孙旭东 on 2022/7/23.
//

#import <UIKit/UIKit.h>

@interface SceneDelegate : UIResponder <UIWindowSceneDelegate>
{
    UISwitch* _switchNight;
}

@property (strong, nonatomic) UIWindow * window;
@property (nonatomic, strong) UIImageView* customLaunchImageView;

@end

