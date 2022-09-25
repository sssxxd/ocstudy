//
//  Student.h
//  KVC
//
//  Created by 孙旭东 on 2022/9/25.
//

#import <Foundation/Foundation.h>

@class Course;
NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject
{
    NSString* name;
    Course* course;
    NSInteger point;
    NSArray* otherStudents;
}
@end

NS_ASSUME_NONNULL_END
