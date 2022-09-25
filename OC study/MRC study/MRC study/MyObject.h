//
//  MyObject.h
//  MRC study
//
//  Created by 孙旭东 on 2022/9/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyObject : NSObject

@property (nonatomic, retain) NSString* str;

+ (id) allocObject;

+ (id) object;

@end

NS_ASSUME_NONNULL_END
