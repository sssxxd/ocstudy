//
//  ViewController.h
//  KVO SendData
//
//  Created by 孙旭东 on 2022/8/5.
//

#import <UIKit/UIKit.h>
#import "NewViewController.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) UILabel* label;
@property (nonatomic, strong) UIButton* button;

@property (nonatomic, strong) NewViewController* mynewView;

@end

