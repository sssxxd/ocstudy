//
//  HomeModel.m
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/6.
//

#import "HomeModel.h"

@implementation TopRecommendModel

+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end

@implementation TopRecommendDataModel

+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;        
}

@end

@implementation HomeShareAuthorDataModel

+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end

@implementation HomeShareDataModel

+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end

@implementation HomeShareModel

+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end

@implementation HomeModel

- (instancetype) init {
    if (self = [super init]) {
        self.topRecommendModel = [[TopRecommendModel alloc] init];
        self.homeShareModel = [[HomeShareModel alloc] init];
    }
    return self;
}

@end
