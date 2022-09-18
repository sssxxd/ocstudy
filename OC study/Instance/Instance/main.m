//
//  main.m
//  Instance
//
//  Created by 孙旭东 on 2022/9/18.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

int main (void) {
    @autoreleasepool {
        Singleton* p1 = [Singleton shareInstance];
        Singleton* p2 = [[Singleton alloc] init];
        
        NSLog(@"%d", p1 == p2);
    }
}

