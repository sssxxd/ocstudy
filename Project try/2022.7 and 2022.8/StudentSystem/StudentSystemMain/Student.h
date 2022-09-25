//
//  Student.h
//  StudentSystem
//
//  Created by 孙旭东 on 2022/8/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property (nonatomic, copy) NSString* studentName;
@property (nonatomic, copy) NSString* studentClass;
@property (nonatomic, copy) NSString* studentNumber;

- (NSComparisonResult)compareStudent:(Student*)student;

@end

NS_ASSUME_NONNULL_END
