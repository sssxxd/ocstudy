//
//  MainViewController.h
//  Caculator App
//
//  Created by 孙旭东 on 2022/9/26.
//

#import <UIKit/UIKit.h>
#import "MainView.h"
#import "CalculatorModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController

@property (nonatomic, strong) MainView* mainView;

@property (nonatomic, strong) CalculatorModel* model;

@property (nonatomic, assign) NSInteger rightBracLimit;
@property (nonatomic, assign) BOOL lefBracLimit;
@property (nonatomic, assign) BOOL OperLimit;
@property (nonatomic, assign) BOOL NumLimit;
@property (nonatomic, assign) BOOL pointLimitByNum;
@property (nonatomic, assign) BOOL pointLimitByOper;
@property (nonatomic, assign) BOOL OperLimitJJ;

@end

NS_ASSUME_NONNULL_END
