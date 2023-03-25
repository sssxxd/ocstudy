//
//  Calcultor.m
//  CalculatorObject
//
//  Created by 孙旭东 on 2022/9/26.
//

#import "Calcultor.h"

@implementation Calcultor

- (id) init {
    if (self = [super init]) {
        _Num = [[CalcultorStack alloc] init];
        _Oper = [[CalcultorStack alloc] init];
    }
    return self;
}

- (BOOL) inCalculator:(char)ch {
    if (ch == '+' || ch == '*' || ch == '/' || ch == '-' || ch == '(' || ch == ')' || ch == '=') {
        return YES;
    }
    return NO;
}

- (NSInteger) GetLevel:(char)ch {
    if (ch == '=') {
        return 0;
    } else if (ch == '(' || ch == ')') {
        return 1;
    } else if (ch == '+' || ch == '-') {
        return 2;
    } else {
        return 3;
    }
}

- (char) CompareOper1:(char)oper1 AndOper2:(char)oper2 {
    NSInteger operLevel1 = [self GetLevel:oper1];
    NSInteger operLevel2 = [self GetLevel:oper2];
    
    if (operLevel1 > operLevel2) {
        return '>';
    } else if (operLevel1 < operLevel2) {
        return '<';
    } else {
        return '=';
    }
}

- (CGFloat) countNum1:(CGFloat)num1 Num2:(CGFloat)num2 AndOper:(char)oper {
    CGFloat val = 0;
    switch (oper) {
        case '+':
            val = num1 + num2;
            break;
        case '-':
            val = num1 - num2;
            break;
        case '*':
            val = num1 * num2;
            break;;
        case '/':
            val = num1 / num2;
            break;
        default:
            break;
    }
    
    return val;
}

- (CGFloat) Calculat:(NSString *)calculationString {
    char* calculation = (char*)[calculationString UTF8String];
    NSInteger length = calculationString.length;
    char ch;
    CGFloat x1, x2, val;
    char oper;
    
    [_Oper Push:'='];
    
    
    for (int i = 0; i < length; i++) {
        ch = calculation[i];
        
        if (![self inCalculator:ch]) {
            
            val = 0;
            while (![self inCalculator:ch] && i < length) {
                val = val * 10 + (ch - '0');
                ch = calculation[++i];
            }
            i--;
            [_Num Push:val];
        } else {
            
            switch([self CompareOper1:ch AndOper2:[_Oper GetTop]]) {
                case '=':
                    if (ch == ')') {
                        [_Oper Pop];
                        break;
                    } else if (ch == '=') {
                        break;
                    }
                case '<':
                    x1 = [_Num Pop];
                    x2 = [_Num Pop];
                    oper = [_Oper Pop];
                    val = [self countNum1:x2 Num2:x1 AndOper:oper];
                    [_Num Push:val];
                    i--;
                    break;
                case '>':
                    [_Oper Push:ch];
                    break;
                default:
                    break;
            }
        }
    }
    
    return [_Num GetTop];
}

@end
