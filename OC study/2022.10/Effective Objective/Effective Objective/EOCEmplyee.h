//
//  EOCEmplyee.h
//  Effective Objective
//
//  Created by 孙旭东 on 2023/1/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, EOCEmplyeeType) {
    EOCEmplyeeTypeDeveloper,
    EOCEmplyeeTypeDesigner,
    EOCEmplyeeTypeFinance,
};

@interface EOCEmplyee : NSObject
@property (nonatomic, copy) NSString* name;
@property (nonatomic, assign) NSUInteger salary;

// Helper for creating Employee
+ (EOCEmplyee*)employeeWithType:(EOCEmplyeeType)type;

// Make Employees do their respective day's work
- (void)doADaysWork;

@end

@interface EOCEmplyeeDeveloper : EOCEmplyee
@end

NS_ASSUME_NONNULL_END
