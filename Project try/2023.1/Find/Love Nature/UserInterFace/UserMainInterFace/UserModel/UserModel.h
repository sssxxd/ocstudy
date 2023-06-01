//
//  UserModel.h
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/7.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UserData <NSObject>
@end

@protocol UserInfoModel <NSObject>
@end

@interface UserData : JSONModel
@property (nonatomic, strong) NSString* email;
@property (nonatomic, strong) NSString* nickName;
@property (nonatomic, strong) NSString* icon;
@property (nonatomic, strong) NSString* introduction;
@property (nonatomic, strong) NSString* sex;
@property (nonatomic, strong) NSString* followee;
@property (nonatomic, strong) NSString* fans;
@property (nonatomic, strong) NSString* notesNumber;
@property (nonatomic, strong) NSString* notes;
@end

@interface UserInfoModel : JSONModel
@property (nonatomic, strong) UserData* data;
@property (nonatomic, strong) NSString* msg;
@property (nonatomic, strong) NSError* err;
@end

@interface UserModel : JSONModel
@property (nonatomic, strong) UserInfoModel* userInfoModel;
@property (nonatomic, strong) NSString* nickName;
@property (nonatomic, strong) NSString* token;
@end

NS_ASSUME_NONNULL_END
