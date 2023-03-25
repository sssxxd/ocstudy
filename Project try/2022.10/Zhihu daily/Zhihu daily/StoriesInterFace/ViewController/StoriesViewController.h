//
//  StoriesViewController.h
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/10/22.
//

#import <UIKit/UIKit.h>
#import "StoriesModel.h"
#import "StoriesInterFace.h"
#import "StorieContentModel.h"
#import "CommentViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface StoriesViewController : UIViewController

@property (nonatomic, strong) StoriesModel* storiesModel;
@property (nonatomic, strong) StoriesInterFace* storiesInterFace;

@property (nonatomic, assign) NSInteger storiesNumber;

@property (nonatomic, strong) UIBarButtonItem* backItem;
@property (nonatomic, strong) UILabel* commentLable;
@property (nonatomic, strong) UIBarButtonItem* commentItem;
@property (nonatomic, strong) UILabel* likeLable;
@property (nonatomic, strong) UIBarButtonItem* likeItem;
@property (nonatomic, strong) UIButton* likeButton;
@property (nonatomic, strong) UIBarButtonItem* collectItem;
@property (nonatomic, strong) UIBarButtonItem* shareItem;
@property (nonatomic, strong) UIBarButtonItem* lineItem;

- (void) initStoriesModel;

@end

NS_ASSUME_NONNULL_END
