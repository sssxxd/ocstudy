//
//  CalcultorStack.m
//  CalculatorObject
//
//  Created by 孙旭东 on 2022/9/26.
//

#import "CalcultorStack.h"

@implementation CalcultorStack

- (id) init {
    if (self = [super init]) {
        _top = -1;
    }
    return self;
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
