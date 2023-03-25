//
//  main.m
//  CalculatorObject
//
//  Created by 孙旭东 on 2022/9/26.
//

#import <Foundation/Foundation.h>
#import "Calcultor.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Calcultor* calcultor = [[Calcultor alloc] init];
        
        CGFloat nas = [calcultor Calculat:@"9*(9)="];
        
        NSLog(@"%lf", nas);
    }
    return 0;
}
