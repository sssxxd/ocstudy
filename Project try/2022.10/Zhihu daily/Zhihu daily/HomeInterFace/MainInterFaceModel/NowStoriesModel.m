//
//  NowStoriesModel.m
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/10/17.
//

#import "NowStoriesModel.h"

@implementation NowStoriesModel

+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;;
}

@end

@implementation Stories

+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end

@implementation Top_Stories

+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end
