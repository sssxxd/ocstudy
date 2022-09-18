//
//  ViewController.h
//  MVCsample
//
//  Created by 孙旭东 on 2022/9/11.
//

#import <UIKit/UIKit.h>
#import "VView.h"
#import "MModel.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) VView* vView;

@property (nonatomic, strong) MModel* mModel;

@end

