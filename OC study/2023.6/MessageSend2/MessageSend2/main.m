//
//  main.m
//  MessageSend2
//
//  Created by 孙旭东 on 2023/6/10.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* person = [[Person alloc] init];
        [person func1];
    }
    return 0;
}
