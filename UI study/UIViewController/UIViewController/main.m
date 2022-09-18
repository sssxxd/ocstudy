//
//  main.m
//  UIViewController
//
//  Created by 孙旭东 on 2022/6/8.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

// 整个App程序入口函数
int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    // 自动内存释放池
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    // UIApplicationMain UIKit框架结构启动函数
    // 参数一： argc，启动时带有参数的个数
    // 参数二： argv，参数列表
    // 参数三： 要求传入一个主框架类类名，如果参数为nil系统会自动用默认的框架类为主框架类类名
    // 参数四： 主框架的代理对象
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
