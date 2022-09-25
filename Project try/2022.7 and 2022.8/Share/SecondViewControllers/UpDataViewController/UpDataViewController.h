//
//  UpDataViewController.h
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import <UIKit/UIKit.h>
#import "PictureWallViewController.h"

NS_ASSUME_NONNULL_BEGIN

static NSInteger _count = 0;
static UIImage* imagePicture = nil;

@interface UpDataViewController : UIViewController
<UpDataPicture, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIImageView* picture;
@property (nonatomic, strong) UILabel* pictureNumber;
@property (nonatomic, strong) UILabel* buttonShow;
@property (nonatomic, strong) NSMutableArray* buttonsForSelect;
@property (nonatomic, strong) NSString* buttonTitle;
@property (nonatomic, strong) NSNumber* number;
@property (nonatomic) BOOL selected;
@property (nonatomic, strong) UIButton* selectButton;

@property (nonatomic, strong) UITableView* tableView;

@property (nonatomic, strong) PictureWallViewController* pictureWallViewController;

@end

NS_ASSUME_NONNULL_END
