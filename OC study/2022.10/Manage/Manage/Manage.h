//
//  Manage.h
//  Manage
//
//  Created by 孙旭东 on 2022/10/16.
//

#import <Foundation/Foundation.h>
#import "TestModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^TestSucceedBlock)(TestModel * _Nonnull mainViewNowModel);

typedef void (^ErrorBlock)(NSError * _Nonnull error);

@interface Manage : NSObject

+ (instancetype) sharedManage;

- (void) NetWorkTestWithData:(TestSucceedBlock)succeedBlock error:(ErrorBlock)erroBlock;

@end

NS_ASSUME_NONNULL_END
