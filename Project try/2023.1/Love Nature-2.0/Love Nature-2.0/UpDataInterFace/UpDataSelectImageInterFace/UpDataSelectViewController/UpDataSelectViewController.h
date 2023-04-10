//
//  UpDataSelectViewController.h
//  Find
//
//  Created by 孙旭东 on 2023/3/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 全局变量
extern NSString *const UpDataSelectViewControllerSelectImageOK;

@interface UpDataSelectViewController : UIViewController

@property (nonatomic, strong) NSMutableSet* imageSelectedSet;
@property (nonatomic, strong) NSArray* imageArray;

@end

NS_ASSUME_NONNULL_END
