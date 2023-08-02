//
//  main.m
//  Copy&MutableCopy
//
//  Created by 孙旭东 on 2023/7/26.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        NSArray *array = [NSArray arrayWithObjects:@"a", @"b", @"c", nil];
//        NSSet *allowedClasses = [NSSet setWithObjects:[NSArray class], [NSString class], nil];
//        NSError * __autoreleasing * error = NULL;
//
////        NSString *docu = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
////        NSString *path = [docu stringByAppendingPathComponent:@"array.data"];
//
//        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:error];
//        NSArray *deepArray = (NSArray *)[NSKeyedUnarchiver unarchivedObjectOfClasses:allowedClasses fromData:data error:error];
//
//        NSLog(@"%@", array);
//        NSLog(@"%@", deepArray);
//
//        NSLog(@"array[0]->%p", array[0]);
//        NSLog(@"deeparray[0]->%p", deepArray[0]);
//
//        NSArray* array = [NSArray arrayWithObjects:[NSMutableString stringWithString:@"frist"], [NSString stringWithFormat:@"b"], @"c",  nil];
//                NSArray* deepCopyArray = [[NSArray alloc] initWithArray:array copyItems:YES];
//                NSArray* trueDeepCopyArray = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:array]];
//
//         NSLog(@"array = %p", array);
//                NSLog(@"deepCopyArray = %p", deepCopyArray);
//                NSLog(@"trueDeepCopyArray = %p", trueDeepCopyArray);
//
//                NSLog(@"array = %@", array);
//                NSLog(@"deepCopyArray = %@", deepCopyArray);
//                NSLog(@"trueDeepCopyArray = %@", trueDeepCopyArray);
//
//                NSLog(@"array[1] = %p", array[1]);
//                NSLog(@" deepCopyArray[1] = %p", deepCopyArray[1]);
//                NSLog(@"trueDeepCopyArray[1] = %p", trueDeepCopyArray[1]);
//
        

        //全局队列
        dispatch_queue_t globQueue = dispatch_get_global_queue(0, 0);
        __block int a = 0;
        while (a < 100) {
            dispatch_async(globQueue, ^{
    //            NSLog(@"内部： %d  - %@",a,[NSThread currentThread]);
                a++;
            });
        };
        NSLog(@"外部打印_____ %d",a);

    }
    return 0;
}
