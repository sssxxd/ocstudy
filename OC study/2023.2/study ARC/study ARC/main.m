//
//  main.m
//  study ARC
//
//  Created by 孙旭东 on 2023/3/27.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *obj = [[NSObject alloc] init];
        [obj retainCount];
    }
    return 0;
}
