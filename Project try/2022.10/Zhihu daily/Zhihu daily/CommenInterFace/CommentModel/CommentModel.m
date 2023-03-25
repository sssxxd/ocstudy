//
//  CommentModel.m
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/11/1.
//

#import "CommentModel.h"
@implementation Reply_To

+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end


@implementation Comments

+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end

@implementation CommentModel

+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end

