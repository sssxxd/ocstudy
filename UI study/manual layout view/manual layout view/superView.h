//
//  superView.h
//  manual layout view
//
//  Created by 孙旭东 on 2022/7/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface superView : UIView {
    UIView* _view01;
    UIView* _view02;
    UIView* _view03;
    UIView* _view04;
    UIView* _view05;
}

- (void) createSubViews;

@end

NS_ASSUME_NONNULL_END
