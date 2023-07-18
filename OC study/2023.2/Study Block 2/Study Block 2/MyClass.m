//
//  Class.m
//  Study Block 2
//
//  Created by 孙旭东 on 2023/7/15.
//

#import "MyClass.h"

@implementation MyClass

- (void)exampleMethod {
//    int a = 10;
//    NSLog(@"aPointer = %p", &a);
//    int b = 10;
//    NSLog(@"bPointer = %p", &b);
//    char s[] = "asc";
//    NSLog(@"sPointer = %p", s);
//
    NSString *string = [NSString stringWithFormat:@"gg"];
    
    NSLog(@"stingPointer = %p", string);
    
    self.myString = string;
    
    NSLog(@"myStingPointer = %p", self.myString);
}

@end
