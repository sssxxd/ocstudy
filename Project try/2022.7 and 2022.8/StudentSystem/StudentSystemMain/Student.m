//
//  Student.m
//  StudentSystem
//
//  Created by 孙旭东 on 2022/8/8.
//

#import "Student.h"

@implementation Student

- (NSComparisonResult)compareStudent:(Student *)student {
    NSInteger numberFirst = [student.studentNumber integerValue];
    NSInteger numberSecond = [self.studentNumber integerValue];
    
    NSComparisonResult result = [[NSNumber numberWithInteger:numberFirst] compare:[NSNumber numberWithInteger:numberSecond]];
    
    return result;
}

@end
