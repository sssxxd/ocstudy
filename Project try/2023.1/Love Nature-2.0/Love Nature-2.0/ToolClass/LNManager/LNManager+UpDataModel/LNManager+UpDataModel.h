//
//  LNManager+UpDataModel.h
//  Find
//
//  Created by 孙旭东 on 2023/4/11.
//

#import "LNManager.h"

NS_ASSUME_NONNULL_BEGIN
@class UpDataTitleModel;

typedef void (^UpDataTitleModelBlock)(UpDataTitleModel * _Nonnull upDataTitleModel);

@interface LNManager (UpDataModel)

- (void) postNickName:(NSString *)nickName Token:(NSString *)token blogTitle:(NSString*)blogTitle Content:(NSString *)content Location:(NSString *)location pictures:(NSArray *) pictures succeedBlock:(UpDataTitleModelBlock)succeedBlock ErrorBlock:(ErrorBlock)errorBlock;

@end

NS_ASSUME_NONNULL_END
