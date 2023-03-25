//
//  MainView.h
//  Caculator App
//
//  Created by 孙旭东 on 2022/9/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainView : UIView

@property (nonatomic, strong) NSArray* operArray;
@property (nonatomic, strong) NSMutableArray* buttonArray;

@property (nonatomic, strong) UITextField* calculation;

@property (nonatomic, strong) UIButton* ACButton;
@property (nonatomic, strong) UIButton* equalButton;
@property (nonatomic, strong) UIButton* pointButton;

- (void) initView;

@end

NS_ASSUME_NONNULL_END
