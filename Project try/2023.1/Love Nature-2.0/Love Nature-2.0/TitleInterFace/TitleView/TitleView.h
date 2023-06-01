//
//  TitleView.h
//  Find
//
//  Created by 孙旭东 on 2023/4/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class HomeShareDataModel;

@interface TitleView : UIView
@property (nonatomic, strong) HomeShareDataModel* dataModel;

- (void)layoutView;
@end

NS_ASSUME_NONNULL_END
