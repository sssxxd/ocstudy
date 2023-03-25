//
//  TestModel.m
//  TestModel study
//
//  Created by 孙旭东 on 2022/10/9.
//

#import "TestModel.h"

@implementation StoriesModel
+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

@implementation Top_StoriesModel
+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

@implementation TestModel
+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end
