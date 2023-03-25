//
//  UserEditUserInfoView.h
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class UserInfoDataModel;

@interface UserEditUserInfoView : UIView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UserInfoDataModel* userInfoDataModel;

@end

NS_ASSUME_NONNULL_END
