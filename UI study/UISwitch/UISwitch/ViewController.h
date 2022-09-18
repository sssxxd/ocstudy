//
//  ViewController.h
//  UISwitch
//
//  Created by 孙旭东 on 2022/6/11.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    // 定义一个开关控件
    // 可以进行状态改变
    // 开和关 两种状态可以切换
    // 所以UIKit框架中的控价均以UI开头
    // 苹果官方控件都定义在UIKit框架里
    UISwitch* _mySwitch;
}
@property (retain, nonatomic) UISwitch* mySwitch;

@end

