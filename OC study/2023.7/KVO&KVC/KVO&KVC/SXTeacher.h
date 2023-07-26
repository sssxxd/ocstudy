//
//  SXTeacher.h
//  KVO&KVC
//
//  Created by 孙旭东 on 2023/7/25.
//

#import <Foundation/Foundation.h>
#import "SXStudent.h"

NS_ASSUME_NONNULL_BEGIN

@interface SXTeacher : NSObject
@property (nonatomic, strong) SXStudent *student1;
//@property (nonatomic, strong) SXStudent *student2;
//- (void)demo;
//- (void)demo2;
//- (void)demo3;

//- (void)demoSetValueForKeyAndValueForKey;
//- (void)demoSetValueForKeyPathAndValueForKeyPath;
@end

NS_ASSUME_NONNULL_END
