//
//  ViewController.h
//  dengdaitishiqi
//
//  Created by 孙旭东 on 2022/7/18.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    // 定义一个警告对话框视图对象
    UIAlertController* _alertController;
    // 等待指示器对象
    // 下载或加载比较大的文件时，可以显示此空间，表示处于等待状态
    UIActivityIndicatorView* _activityIndicator;
}

@property (retain, nonatomic) UIAlertController* alertController;
@property (retain, nonatomic) UIActivityIndicatorView* activityIndicator;

@end

