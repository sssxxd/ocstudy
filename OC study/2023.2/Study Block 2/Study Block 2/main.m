//
//  main.m
//  Study Block 2
//
//  Created by 孙旭东 on 2023/3/15.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int val = 0;
        
        void (^blk)(void) = ^{printf("%d", val);};
        
        blk();
    }
    return 0;
}
