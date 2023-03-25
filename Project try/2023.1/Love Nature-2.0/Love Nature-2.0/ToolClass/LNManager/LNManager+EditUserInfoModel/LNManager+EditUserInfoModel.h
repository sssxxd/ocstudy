//
//  LNManager+EditUserInfoModel.h
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/10.
//

#import "LNManager.h"

NS_ASSUME_NONNULL_BEGIN

@class EditUserInfoModel;

typedef void (^EditUserInfoModelBlock)(EditUserInfoModel * _Nonnull editUserInfoModel);

@interface LNManager (EditUserInfoModel)

- (void) postUserIconImage:(UIImage*)image withNickName:(NSString*)nickName token:(NSString*)token SucceedBlock:(EditUserInfoModelBlock)succeedBlock errorBlock:(ErrorBlock)errorBlock;

@end

NS_ASSUME_NONNULL_END
