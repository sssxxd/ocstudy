//
//  MainViewController.m
//  Caculator App
//
//  Created by 孙旭东 on 2022/9/26.
//

#import "MainViewController.h"

#define MAXSIZE 100

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createView];
    
    [self createModel];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) createView {
    self.mainView = [[MainView alloc] initWithFrame:self.view.bounds];
    
    [self.mainView initView];
    
    [self.view addSubview:self.mainView];
    
    // 设置按钮初始限制状态
    _rightBracLimit = 0;
    _lefBracLimit = YES;
    _NumLimit = YES;
    _OperLimit = NO;
    _pointLimitByNum = NO;
    _pointLimitByOper = YES;
    _OperLimitJJ = YES;
    
    for (UIButton* button in self.mainView.buttonArray) {
        [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self.mainView.ACButton addTarget:self action:@selector(pressAcButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.mainView.equalButton addTarget:self action:@selector(pressEqualButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.mainView.pointButton addTarget:self action:@selector(pressPiontButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) pressButton:(UIButton*)sender {
    if (sender.tag / 100 == 1) {
        [self pressBracButton:sender];
    } else if (sender.tag / 100 == 2) {
        [self pressOperButton:sender];
    } else if (sender.tag / 100 == 3) {
        [self pressNumberButton:sender];
    }
}

// 处理括号
- (void) pressBracButton:(UIButton*)sender {
    if (sender.tag == 101) {
        if (_lefBracLimit) {
            NSString* oldCalculation = self.mainView.calculation.text;
            NSString* newChar = sender.titleLabel.text;
            NSString* newCalculation = [NSString stringWithFormat:@"%@%@", oldCalculation, newChar];
            
            self.mainView.calculation.text = newCalculation;
            
            if (_rightBracLimit < 0) {
                _rightBracLimit = -_rightBracLimit;
            }
            _rightBracLimit++;
            _OperLimit = NO;
            _NumLimit = YES;
            _OperLimitJJ = YES;
            
            _pointLimitByNum = NO;
            _pointLimitByOper = YES;
        }
    } else {
        if (_rightBracLimit > 0) {
            NSString* oldCalculation = self.mainView.calculation.text;
            NSString* newChar = sender.titleLabel.text;
            NSString* newCalculation = [NSString stringWithFormat:@"%@%@", oldCalculation, newChar];
            
            self.mainView.calculation.text = newCalculation;
            
            _rightBracLimit = _rightBracLimit - 1;
            
            _lefBracLimit = NO;
            _NumLimit = NO;
            _OperLimit = YES;
            
            _pointLimitByNum = NO;
            _pointLimitByOper = YES;
            _OperLimitJJ = YES;
        }
    }
}

- (void) pressOperButton:(UIButton*)sender {
    if (sender.tag > 201) {
        [self pressOperButtonCC:sender];
    } else {
        [self pressOperButtonJJ:sender];
    }
}

// C:乘 C:除
- (void) pressOperButtonCC:(UIButton*)sender {
    if (_OperLimit) {
        NSString* oldCalculation = self.mainView.calculation.text;
        NSString* newChar = sender.titleLabel.text;
        NSString* newCalculation = [NSString stringWithFormat:@"%@%@", oldCalculation, newChar];
        
        self.mainView.calculation.text = newCalculation;
        
        _OperLimit = NO;
        _OperLimitJJ = NO;
        _NumLimit = YES;
        _lefBracLimit = YES;
        if (_rightBracLimit > 0) {
            _rightBracLimit = -_rightBracLimit;
        }
        _pointLimitByOper = YES;
        _pointLimitByNum = NO;
    }
}

// J:加 J:减
- (void) pressOperButtonJJ:(UIButton*)sender {
    if (_OperLimitJJ) {
        NSString* oldCalculation = self.mainView.calculation.text;
        NSString* newChar = sender.titleLabel.text;
        NSString* newCalculation = [NSString stringWithFormat:@"%@%@", oldCalculation, newChar];
        
        self.mainView.calculation.text = newCalculation;
        
        _OperLimit = NO;
        _OperLimitJJ = NO;
        _NumLimit = YES;
        _lefBracLimit = YES;
        if (_rightBracLimit > 0) {
            _rightBracLimit = -_rightBracLimit;
        }
        _pointLimitByOper = YES;
        _pointLimitByNum = NO;
    }
}

- (void) pressNumberButton:(UIButton*)sender {
    if (self.NumLimit) {
        NSString* oldCalculation = self.mainView.calculation.text;
        NSString* newChar = sender.titleLabel.text;
        NSString* newCalculation = nil;
        if ([newChar isEqual:@"0          "]) {
            newCalculation = [NSString stringWithFormat:@"%@0", oldCalculation];
        } else {
            newCalculation = [NSString stringWithFormat:@"%@%@", oldCalculation, newChar];
        }
        
        self.mainView.calculation.text = newCalculation;
        
        _lefBracLimit = NO;
        if (_rightBracLimit < 0) {
            _rightBracLimit = -_rightBracLimit;
        }
        _OperLimit = YES;
        _OperLimitJJ = YES;
        if (_pointLimitByOper) {
            _pointLimitByNum = YES;
        }
    }
}

- (void) pressPiontButton:(UIButton*)sender {
    if (_pointLimitByNum && _pointLimitByOper) {
        NSString* oldCalculation = self.mainView.calculation.text;
        NSString* newChar = sender.titleLabel.text;
        NSString* newCalculation = [NSString stringWithFormat:@"%@%@", oldCalculation, newChar];
        
        self.mainView.calculation.text = newCalculation;
        
        _OperLimit = NO;
        _NumLimit = YES;
        _lefBracLimit = NO;
        if (_rightBracLimit > 0) {
            _rightBracLimit = -_rightBracLimit;
        }
        _pointLimitByNum = NO;
        _pointLimitByOper = NO;
        _OperLimitJJ = NO;
    }
}

- (void) pressAcButton:(UIButton*)sender {
    self.mainView.calculation.text = nil;
    
    // 设置按钮初始限制状态
    _rightBracLimit = 0;
    _lefBracLimit = YES;
    _NumLimit = YES;
    _OperLimit = NO;
    _pointLimitByNum = NO;
    _pointLimitByOper = YES;
    _OperLimitJJ = YES;
}

- (void) pressEqualButton:(UIButton*)sender {
    
    NSString* oldCalculation = self.mainView.calculation.text;
    NSString* newChar = sender.titleLabel.text;
    NSMutableString* newCalculation = [NSMutableString stringWithFormat:@"%@%@", oldCalculation, newChar];
    
    for (int i = 0; i < oldCalculation.length; i++) {
        NSString* s = [oldCalculation substringWithRange:NSMakeRange(i, 1)];
        
        if ([s isEqualToString:@"÷"]) {
            [newCalculation replaceCharactersInRange:NSMakeRange(i, 1) withString:@"/"];
        } else if ([s isEqualToString:@"×"]) {
            [newCalculation replaceCharactersInRange:NSMakeRange(i, 1) withString:@"*"];
        }
    }
    
    if ([self isCalculationTrue:newCalculation]) {
        [self.model Calculat:newCalculation];
    } else {
        self.mainView.calculation.text = @"error";
    }
    
    // 设置按钮初始限制状态
    _rightBracLimit = 0;
    _lefBracLimit = NO;
    _NumLimit = YES;
    _OperLimit = YES;
    _pointLimitByNum = NO;
    _pointLimitByOper = YES;
    _OperLimitJJ = YES;
}

- (BOOL) isCalculationTrue:(NSString*)calculation {
    if ([calculation containsString:@"e"]) {
        return NO;
    } else if ([calculation containsString:@"r"]) {
        return NO;
    } else if ([calculation containsString:@"o"]) {
        return NO;
    } else if (_rightBracLimit) {
        return NO;
    } else {
        NSInteger index = calculation.length - 2;
        NSString* s = [calculation substringWithRange:NSMakeRange(index, 1)];
        
        if ([s isEqualToString:@"+"]) {
            return NO;
        } else if ([s isEqualToString:@"-"]) {
            return NO;
        } else if ([s isEqualToString:@"*"]) {
            return NO;
        } else if ([s isEqualToString:@"/"]) {
            return NO;
        } else {
            return YES;
        }
    }
}

- (void) createModel {
    self.model = [[CalculatorModel alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(upAnswer:) name:@"answer" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(upError) name:@"error" object:nil];
}

- (void) upAnswer:(NSNotification*)notification {
    NSDictionary* answer = notification.userInfo;
    
    
    self.mainView.calculation.text = answer[@"Value"];
}

- (void) upError {
    self.mainView.calculation.text = @"error";
}

@end
