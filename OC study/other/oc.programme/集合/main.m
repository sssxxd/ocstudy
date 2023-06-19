//
//  main.m
//  oc.programme
//
//  Created by 孙旭东 on 2022/6/1.
//

#import "FKUser.h"

//int main(void) {
//    @autoreleasepool {
//        NSArray* array = [NSArray arrayWithObjects:@"iOS", @"Android", @"Ajax", @"XML", @"struts 2.x", nil];
//        NSLog(@"%@", [array objectAtIndex:0]);
//        NSLog(@"%@", [array objectAtIndex:1]);
//        NSLog(@"%@", [array lastObject]);
//        NSArray* arr1 = [array objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(2, 3)]];
//        NSLog(@"%@", arr1);
//        NSLog(@"Android:%ld", [array indexOfObject:@"Android"]);
//        NSLog(@"Android in 2~5:%ld", [array indexOfObject:@"Android"inRange:NSMakeRange(2, 3)]);
//        array = [array arrayByAddingObject:@"小孙"];
//        array = [array arrayByAddingObjectsFromArray:[NSArray arrayWithObjects:@"bao", @"dai", nil]];
//        for (int i = 0; i < array.count; i++) {
//            NSLog(@"%@", array[i]);
//        }
//    }
//}


//int main(void) {
//    @autoreleasepool {
//
//    }
//}

int main(void) {
    @autoreleasepool {
        NSArray* arr = [NSArray arrayWithObjects:@"sun", @"li", @"wang", nil];
        // 获取数组枚举器
        NSEnumerator* en = [arr objectEnumerator];
        id object = nil;
        // 依次枚举
        while (object = [en nextObject]) {
            NSLog(@"%@", object);
        }
    }
}
