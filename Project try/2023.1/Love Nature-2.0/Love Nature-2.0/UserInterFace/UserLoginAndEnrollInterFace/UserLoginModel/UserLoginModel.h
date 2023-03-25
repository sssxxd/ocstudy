//
//  UserLoginModel.h
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/1.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserEnrollModel : JSONModel
@property (nonatomic, strong) NSString* data;
@property (nonatomic, strong) NSString* code;
@property (nonatomic, strong) NSString* msg;
@property (nonatomic, strong) NSError* err;
@end

@interface UserLoginDataModel : JSONModel
@property (nonatomic, strong) NSString* email;
@property (nonatomic, strong) NSString* nickName;
@property (nonatomic, strong) NSString* token;
@end

@interface UserLoginModel : JSONModel
@property (nonatomic, strong) UserLoginDataModel* data;
@property (nonatomic, strong) NSString* code;
@property (nonatomic, strong) NSString* msg;
@property (nonatomic, strong) NSError* err;
@end

NS_ASSUME_NONNULL_END
