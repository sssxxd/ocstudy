//
//  TitleViewController.h
//  Find
//
//  Created by 孙旭东 on 2023/4/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class TitleView;
@class HomeShareDataModel;

@interface TitleViewController : UIViewController
@property (nonatomic, strong, readonly) TitleView* titlleView;
@property (nonatomic, strong) HomeShareDataModel* dataModel;
@end

NS_ASSUME_NONNULL_END
