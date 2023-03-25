//
//  UserEditUserInfoModel.h
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/10.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface EditUserInfoModel : JSONModel
@property (nonatomic, strong) NSString* data;
@property (nonatomic, strong) NSString* code;
@property (nonatomic, strong) NSString* msg;
@property (nonatomic, strong) NSString* err;
@end

@interface UserEditUserInfoModel : JSONModel
@property (nonatomic, strong) EditUserInfoModel* editUserInfoModel;
@end

NS_ASSUME_NONNULL_END
