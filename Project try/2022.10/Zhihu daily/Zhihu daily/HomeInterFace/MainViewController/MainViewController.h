//
//  MainViewController.h
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/10/16.
//

#import <UIKit/UIKit.h>
#import "InterFaceView.h"
#import "NowStoriesModel.h"
#import "Manage.h"
#import "LastStoriesModel.h"
#import "StoriesViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController
<UINavigationControllerDelegate>

@property (nonatomic, strong) InterFaceView* interFaceView;
@property (nonatomic, strong) NowStoriesModel* nowStoriesModel;
@property (nonatomic, strong) NSMutableArray* lastStoriesModelArray;

@property (nonatomic, strong) Manage* manage;

@property (nonatomic, strong) NSMutableArray* imageViewArray;

@end

NS_ASSUME_NONNULL_END
