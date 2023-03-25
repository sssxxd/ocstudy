//
//  LNManager+UserMainModel.h
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/1.
//

#import "LNManager.h"

NS_ASSUME_NONNULL_BEGIN

// 引入Model类
@class UserInfoModel;

typedef void (^UserInfoModelBlock)(UserInfoModel * _Nonnull userInfoModel);

@interface LNManager (UserMainModel)
- (void) getUserInfoWithNickName:(NSString*)nickName AndToken:(NSString*)token UserInfoModelBlock:(UserInfoModelBlock)succeedBlock ErrorBlack:(ErrorBlock)errorBlock;
@end

NS_ASSUME_NONNULL_END
