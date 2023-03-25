//
//  Calcultor.h
//  CalculatorObject
//
//  Created by 孙旭东 on 2022/9/26.
//

#import <Foundation/Foundation.h>
#import "CalcultorStack.h"

NS_ASSUME_NONNULL_BEGIN

@interface Calcultor : NSObject
{
    CalcultorStack* _Num;
    CalcultorStack* _Oper;
}
- (CGFloat) Calculat:(NSString*)calculationString;
@end

NS_ASSUME_NONNULL_END
