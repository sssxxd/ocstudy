//
//  SelectedPictureViewController.h
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SelectedPicture <NSObject>

- (void) setImageTag:(NSUInteger)imageTag;

@end

@interface SelectedPictureViewController : UIViewController

@property (nonatomic, retain) UIImage* image;
@property (nonatomic) NSUInteger imageTag;
@property (nonatomic, strong) id<SelectedPicture> delegate;

@end

NS_ASSUME_NONNULL_END
