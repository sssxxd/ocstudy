//
//  LNManager.h
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/1/31.
//

#ifndef LNManager_h
#define LNManager_h

#import <UIKit/UIKit.h>

typedef void (^ErrorBlock)(NSError * _Nonnull error);

@interface LNManager : NSObject
+ (instancetype _Nullable ) shareLNManager;
@end

#pragma once
// 分类
#import "LNManager+SetWebImage/LNManager+SetWebImage.h"
#import "LNManager+UserMainModel/LNManager+UserMainModel.h"
#import "LNManager+UserLoginModel/LNManager+UserLoginModel.h"
#import "LNManager+HomeModel/LNManager+HomeModel.h"
#import "LNManager+EditUserInfoModel/LNManager+EditUserInfoModel.h"
#import "LNManager+UpDataModel/LNManager+UpDataModel.h"
// 引入第三方库
#import "AFNetworking.h"

#endif /* LNManager_h */
