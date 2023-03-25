//
//  CalculatorStack.h
//  Caculator App
//
//  Created by 孙旭东 on 2022/9/28.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define MAXSIZE 100

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorStack : NSObject
{
    CGFloat _data[MAXSIZE];
    NSInteger _top;
}

- (void) Push:(CGFloat)element;
- (CGFloat) Pop;
- (CGFloat) GetTop;
- (void) initStack;

@end

NS_ASSUME_NONNULL_END
