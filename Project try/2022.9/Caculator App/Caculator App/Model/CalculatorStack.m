//
//  CalculatorStack.m
//  Caculator App
//
//  Created by 孙旭东 on 2022/9/28.
//

#import "CalculatorStack.h"

@implementation CalculatorStack
- (id) init {
    if (self = [super init]) {
        _top = -1;
    }
    return self;
}

- (void) initStack {
    _top = -1;
}

- (void) Push:(CGFloat)element {
    if (_top == 99) {
        return;
    }
    _data[++_top] = element;
}

- (CGFloat) Pop {
    if (_top == -1) {
        return 0;
    }
    return _data[_top--];
}

- (CGFloat) GetTop {
    if (_top == -1) {
        return 0;
    }
    return _data[_top];
}

@end

