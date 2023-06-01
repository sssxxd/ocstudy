//
//  EnrollModel.h
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/6.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface EnrollModel : JSONModel

@property (nonatomic, copy) NSString* data;
@property (nonatomic, copy) NSString* code;
@property (nonatomic, copy) NSString* msg;
@property (nonatomic, copy) NSString* err;

@end

NS_ASSUME_NONNULL_END
