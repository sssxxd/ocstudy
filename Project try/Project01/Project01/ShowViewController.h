//
//  ShowViewController.h
//  Project01
//
//  Created by 孙旭东 on 2022/7/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShowViewController : UIViewController <UIScrollViewDelegate>
{
    NSMutableArray* _imageNames;
    NSMutableArray* _imageViews;
    NSTimer* _timer;
}

@end

NS_ASSUME_NONNULL_END
