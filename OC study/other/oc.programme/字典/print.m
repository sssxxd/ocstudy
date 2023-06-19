//
//  print.m
//  oc.programme
//
//  Created by 孙旭东 on 2022/6/12.
//

#import <Foundation/Foundation.h>

//@interface NSDictionary (print)
//
//- (void) print;
//
//@end
//
//@implementation NSDictionary (print)
//
//- (void) print {
//    NSMutableString* result = [NSMutableString stringWithString:@"{"];
//    for (id key in self) {
//        [result appendString:[key description]];
//        [result appendString:@"="];
//        [result appendString:[self[key] description]];
//        [result appendString:@", "];
//    }
//    NSUInteger len = [result length];
//    [result deleteCharactersInRange:NSMakeRange(len - 2, 2)];
//    [result appendString:@"}"];
//    NSLog(@"%@", result);
//}
//@end

//int main(void) {
//    @autoreleasepool {
//        NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:@"Objective-c", @"one", @"Rudy", @"two", @"Python", @"three", nil];
//        // 打印dict集合所有元素
//        [dict print];
//        NSArray* keyArr = [dict keysSortedByValueUsingComparator:
//                    ^(id value1, id value2) {
//            if ([value1 length] > [value2 length]) {
//                return NSOrderedDescending;
//            }
//            if ([value1 length] < [value2 length]) {
//                return NSOrderedAscending;
//            }
//            return NSOrderedSame;
//        }];
//        NSLog(@"%@", keyArr);
//    }
//}
//

//int main(void) {
//    @autoreleasepool {
//        NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:
//                              [NSNumber numberWithInt:89], @"Rudy",
//                              [NSNumber numberWithInt:69], @"Objective-C",
//                              [NSNumber numberWithInt:75], @"Python",
//                              [NSNumber numberWithInt:109], @"Perl", nil];
//        // 打印dict集合的所有元素
//        [dict print];
//        // 对NSDictionary的所有key进行过滤
//        NSSet* keySet = [dict keysOfEntriesPassingTest:
//                          ^(id key, id value, BOOL* stop) {
//            // 当value的值大于80时才返回YES
//            return (BOOL)([value intValue] > 60);
//        }];
//        NSLog(@"%@", keySet);
//    }
//}
