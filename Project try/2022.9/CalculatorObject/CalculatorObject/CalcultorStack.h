//
//  CalcultorStack.h
//  CalculatorObject
//
//  Created by 孙旭东 on 2022/9/26.
//

#import <Foundation/Foundation.h>

#define MAXSIZE 100

NS_ASSUME_NONNULL_BEGIN

@interface CalcultorStack : NSObject
{
    CGFloat _data[MAXSIZE];
    NSInteger _top;
}

- (void) Push:(CGFloat)element;
- (CGFloat) Pop;
- (CGFloat) GetTop;

@end

NS_ASSUME_NONNULL_END
