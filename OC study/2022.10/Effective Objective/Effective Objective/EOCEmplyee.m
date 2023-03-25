//
//  EOCEmplyee.m
//  Effective Objective
//
//  Created by 孙旭东 on 2023/1/14.
//

#import "EOCEmplyee.h"

@implementation EOCEmplyee

+ (EOCEmplyee*)employeeWithType:(EOCEmplyeeType)type {
//    switch (type) {
//        case EOCEmplyeeTypeDeveloper:
//            return [EOCEmplyeeDeveloper new];
//            break;
//        case EOCEmplyeeTypeDesigner:
//            return [EOCEmplyeeDesigner new];
//            break;
//        case EOCEmplyeeTypeFinance:
//            return [EOCEmplyeeFinance new];
//            break;
//    }
    return nil;
}

- (void)doADaysWork {
    // Subclasses implement this.
}

@end

@implementation EOCEmplyeeDeveloper

- (void)doADaysWork {
    // ......
}

@end
