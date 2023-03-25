//
//  LoginModel.h
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/5.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol dataModel <NSObject>
@end

@interface dataModel : JSONModel

@property (nonatomic, copy) NSString* email;
@property (nonatomic, copy) NSString* nickName;
@property (nonatomic, copy) NSString* icon;
@property (nonatomic, copy) NSString* token;

@end

@interface LoginModel : JSONModel

@property (nonatomic, strong) dataModel* data;
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, copy) NSString* msg;
@property (nonatomic, copy) NSString* err;

@end

NS_ASSUME_NONNULL_END
