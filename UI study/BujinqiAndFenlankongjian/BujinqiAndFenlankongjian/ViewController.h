//
//  ViewController.h
//  BujinqiAndFenlankongjian
//
//  Created by 孙旭东 on 2022/7/18.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    // 定义步进器对象
    // 按照一定数值来调整某个数据
    UIStepper* _stepper;
    
    // 定义分栏控制器对象
    UISegmentedControl* _segControl;
}

@property (retain, nonatomic) UIStepper* stepper;
@property (retain, nonatomic) UISegmentedControl* segControl;

@end

