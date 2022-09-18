//
//  PictureWallViewController.h
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import <UIKit/UIKit.h>
#import "SelectedPictureViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UpDataPicture <NSObject>

- (void) setUpPictureImageTag:(NSUInteger)imageTag Count:(NSInteger)count;

@end

@interface PictureWallViewController : UIViewController

@property (nonatomic, strong) id<UpDataPicture> delegate;
@property (nonatomic) NSInteger count;
@property (nonatomic) NSMutableArray* arrayImage;

@end

NS_ASSUME_NONNULL_END
