//
//  CalculatorModel.m
//  Caculator App
//
//  Created by 孙旭东 on 2022/9/28.
//

#import "CalculatorModel.h"

int  cmp[7][7]  = {
        { 2, 2, 1, 1, 1, 2, 2 },
        { 2, 2, 1, 1, 1, 2, 2 },
        { 2, 2, 2, 2, 1, 2, 2 },
        { 2, 2, 2, 2, 1, 2, 2 },
        { 1, 1, 1, 1, 1, 3, 0 },
        { 2, 2, 2, 2, 0, 2, 2 },
        { 1, 1, 1, 1, 1, 0, 3 }  };

char op[7] = {'+', '-', '*', '/', '(', ')', '='};

@implementation CalculatorModel

- (id) init {
    if (self = [super init]) {
        _Num = [[CalculatorStack alloc] init];
        _Oper = [[CalculatorStack alloc] init];
    }
    return self;
}

- (BOOL) inCalculator:(char)ch {
    if (ch == '+' || ch == '*' || ch == '/' || ch == '-' || ch == '(' || ch == ')' || ch == '=') {
        return YES;
    }
    return NO;
}

- (char) CompareOper1:(char)oper1 AndOper2:(char)oper2 {
    int m = 0, n = 0, i, ans;
    for(i = 0; i < 7; i++) {
        if(oper1 == op[i]) {
            m = i;
        }
        if(oper2 == op[i]) {
            n = i;
        }
    }
    ans = cmp[m][n];
    switch (ans) {
        case 2:
            return (char)('<');
        case 1:
            return (char)('>');
        case 3:
            return (char)('=');
        default:
            return 0;
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

+ (CGFloat) TenCapital:(int)x {
    int val = 1;
    for (int i = 0; i < x; i++) {
        val *= 10;
    }
    return val;
}

- (void) Calculat:(NSString *)calculationString {
    
    [_Oper initStack];
    [_Num initStack];
    
    char* calculation = (char*)[calculationString UTF8String];
    NSInteger length = calculationString.length;
    char ch;
    CGFloat x1, x2, val;
    char oper;
    int BracFlage = 0;
    int flage = 0;
    
    [_Oper Push:'='];
    
    for (int i = 0; i < length; i++) {
        ch = calculation[i];
        
        if (![self inCalculator:ch]) {
            val = 0;
            while (![self inCalculator:ch] && i < length) {
                val = val * 10 + (ch - '0');
                ch = calculation[++i];
                if (ch == '.') {
                    ch = calculation[++i];
                    int j = 1;
                    while (![self inCalculator:ch] && i < length) {
                        CGFloat f = (CGFloat)(ch - '0');
                        val = val + f / [CalculatorModel TenCapital:j];
                        j++;
                        ch = calculation[++i];
                    }
                }
            }
            i--;
            if (flage== 0) {
                [_Num Push:val];
            } else {
                [_Num Push:-val];
                flage = 0;
            }
        } else {
            if (BracFlage == 0 || (ch != '-' && ch != '+')) {
                switch([self CompareOper1:[_Oper GetTop] AndOper2:ch]) {
                    case '>':
                        [_Oper Push:ch];
                        break;
                    case '=':
                        [_Oper Pop];
                        break;
                    case '<':
                        oper = [_Oper Pop];
                        x2 = [_Num Pop];
                        x1 = [_Num Pop];
                        if (oper == '/' && x2 == 0) {
                            [[NSNotificationCenter defaultCenter] postNotificationName:@"error" object:nil];
                            return;
                        }
                        val = [self countNum1:x1 Num2:x2 AndOper:oper];
                        [_Num Push:val];
                        i--;
                        break;
                    default:
                        break;
                }
            }
            if (BracFlage == 1 && ch == '-') {
                flage = 1;
            }
            if (BracFlage == 1 && ch == ')') {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"error" object:nil];
                return;
            }
        }
        BracFlage = 0;
        if (ch == '(') {
            BracFlage = 1;
        }
    }
    [self CGFloatToNSString:[_Num Pop]];
}

- (void) CGFloatToNSString:(CGFloat)answer {
    NSMutableString* answerString = [NSMutableString stringWithFormat:@"%lf", answer];
    if (![answerString isEqualToString:@"0"]) {
        for (NSInteger i = answerString.length - 1; i >= 0; i--) {
            NSString* s = [answerString substringWithRange:NSMakeRange(i, 1)];
            if ([s isEqualToString:@"0"]) {
                [answerString deleteCharactersInRange:NSMakeRange(i, 1)];
            } else if ([s isEqualToString:@"."]) {
                [answerString deleteCharactersInRange:NSMakeRange(i, 1)];
                break;
            } else {
                break;;
            }
        }
    }
    
    NSDictionary* answerDict = [NSDictionary dictionaryWithObject:answerString forKey:@"Value"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"answer" object:nil userInfo:answerDict];
}

@end

