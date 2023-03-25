//
//  LNManager+UserLoginModel.h
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/3.
//

#import "LNManager.h"

// 引入模型类
@class UserEnrollModel;
@class UserLoginModel;

typedef void (^UserEnrollModelBlock)(UserEnrollModel * _Nonnull userEnrollModel);
typedef void (^UserLoginModelBlock)(UserLoginModel * _Nonnull userLoginModel);

NS_ASSUME_NONNULL_BEGIN

@interface LNManager (UserLoginModel)

- (void) postEmail:(NSString*)emailString getVerCodeSucceedBlock:(UserEnrollModelBlock)succeedBlock errorBlock:(ErrorBlock)errorBlock;

- (void) postEmail:(NSString*)email password:(NSString*)password code:(NSString*)code enrollUserSucceedBlock:(UserEnrollModelBlock)succeedBlock errorBlock:(ErrorBlock)errorBlock;

- (void) postEmail:(NSString*)email password:(NSString*)password loginUserSucceedBlock:(UserLoginModelBlock)succeedBlock errorBlock:(ErrorBlock)errorBlock;

- (void) postEmail:(NSString*)email code:(NSString*)code loginUserSucceedBlock:(UserLoginModelBlock)succeedBlock errorBlock:(ErrorBlock)errorBlock;

- (void) postNickName:(NSString*)nickName token:(NSString*)token exitUserSucceedBlock:(UserEnrollModelBlock)succeedBlock errorBlock:(ErrorBlock)errorBlock;

@end

NS_ASSUME_NONNULL_END
