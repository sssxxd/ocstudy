//
//  CalculatorModel.h
//  Caculator App
//
//  Created by 孙旭东 on 2022/9/28.
//

#import <Foundation/Foundation.h>
#import "CalculatorStack.h"

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorModel : NSObject
{
    CalculatorStack* _Num;
    CalculatorStack* _Oper;
}
- (void) Calculat:(NSString*)calculationString;
@end

NS_ASSUME_NONNULL_END
