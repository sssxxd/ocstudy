//
//  MyCollectViewController.h
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/11/7.
//

#import <UIKit/UIKit.h>
#import "MyCollectView.h"
#import "MyCollectModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface MyCollectViewController : UIViewController

@property (nonatomic, strong) MyCollectView* myCollectView;
@property (nonatomic, strong) MyCollectModel* myCollectModel;

@end

NS_ASSUME_NONNULL_END
