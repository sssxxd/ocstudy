//
//  ViewController.h
//  NSNotification
//
//  Created by 孙旭东 on 2023/7/27.
//

#import <UIKit/UIKit.h>
#import "MyViewController.h"


@interface ViewController : UIViewController <MyViewControllerDelegate>

@property (nonatomic, strong) MyViewController *myView;

@end

