//
//  EnrollViewController.h
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/6.
//

#import <UIKit/UIKit.h>
#import "EnrollView.h"

NS_ASSUME_NONNULL_BEGIN

@interface EnrollViewController : UIViewController

@property (nonatomic, strong) EnrollView* enrollView;

// timer
@property (nonatomic, strong) NSTimer* timer;
@property (nonatomic, assign) NSInteger seconds;

@end

NS_ASSUME_NONNULL_END
