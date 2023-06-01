//
//  UserModel.m
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/7.
//

#import "UserModel.h"

@implementation UserData

+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end

@implementation UserInfoModel

+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end


@implementation UserModel

+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end
