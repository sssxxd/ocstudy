//
//  HomeView.h
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString *const HomeViewTitleCellPressed;

@interface HomeView : UIView

@property (nonatomic, copy) NSArray* HomeTopRecommendDataArray;
@property (nonatomic, copy) NSArray* HomeShareDataArray;

- (void) initView;
- (void) reloadView;
@end

NS_ASSUME_NONNULL_END
