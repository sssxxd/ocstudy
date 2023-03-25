//
//  StorieContentModel.m
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/10/26.
//

#import "StorieContentModel.h"

@implementation StorieContentModel

+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end


@implementation StorieExtraContentModel

+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end
