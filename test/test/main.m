//
//  main.m
//  test
//
//  Created by 孙旭东 on 2022/5/23.
//

#import <Foundation/Foundation.h>
#import "FKPerson.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        FKPerson* person = [[FKPerson alloc] init];
//        person->_age = 1;
        person.age = 1;
//        NSLog(@"%d",person._age);
    }
    return 0;
}
