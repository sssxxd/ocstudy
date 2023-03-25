//
//  UserMainModel.h
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/1/31.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UserContentDataModel <NSObject>
@end

@interface UserContentDataModel : JSONModel
@property (nonatomic, copy) NSString* mainImage;
@property (nonatomic, copy) NSString* userIcon;
@property (nonatomic, copy) NSString* userName;
@property (nonatomic, copy) NSString* title;
@end

@interface UserContentModel : JSONModel
@property (nonatomic, copy) NSArray<UserContentDataModel>* data;
@property (nonatomic, copy) NSString* code;
@property (nonatomic, copy) NSString* msg;
@property (nonatomic, strong) NSError* err;
@end


@interface UserInfoDataModel : JSONModel
@property (nonatomic, strong) NSString* email;
@property (nonatomic, strong) NSString* nickName;
@property (nonatomic, strong) NSString* icon;
@property (nonatomic, strong) NSString* address;
@property (nonatomic, strong) NSString* introduction;
@property (nonatomic, assign) NSUInteger sex;
@property (nonatomic, strong) NSString* followee;
@property (nonatomic, strong) NSString* fans;
@property (nonatomic, strong) NSString* notesNumber;
@end

@interface UserInfoModel : JSONModel
@property (nonatomic, strong) UserInfoDataModel* data;
@property (nonatomic, strong) NSString* code;
@property (nonatomic, strong) NSString* msg;
@property (nonatomic, strong) NSError* err;
@end

@interface UserMainModel : NSObject
@property (nonatomic, strong) UserInfoModel* userInfoModel;
@property (nonatomic, strong) UserContentModel* userPetFileContentModel;
@property (nonatomic, strong) UserContentModel* userCollectContentModel;
@property (nonatomic, strong) UserContentModel* userLikeContentModel;

@property (nonatomic, strong) NSString* nickName;
@property (nonatomic, strong) NSString* token;

- (void) saveUserInfoNickName:(NSString*)nickName token:(NSString*)token icon:(NSString*)icon;
@end

NS_ASSUME_NONNULL_END
