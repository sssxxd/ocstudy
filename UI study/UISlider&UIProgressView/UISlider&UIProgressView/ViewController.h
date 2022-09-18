//
//  ViewController.h
//  UISlider&UIProgressView
//
//  Created by 孙旭东 on 2022/7/18.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    // 进度条对象
    // 一般用来表示下载或视频播放进度
    UIProgressView* _progressView;
    
    // 用来进行调整音乐音量
    UISlider* _slider;
}

// 定义一个进度条属性
@property (retain, nonatomic) UIProgressView* pView;
// 定义一个滑动条属性
@property (retain, nonatomic) UISlider* slider;

@end

