//
//  UserMainViewUserInfoTableViewCell.h
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/1/31.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, UserMainViewUserInfoTableViewCellSex) {
    UserMainViewUserInfoTableViewCellBoy = 0,
    UserMainViewUserInfoTableViewCellGirl,
    UserMainViewUserInfoTableViewCellNone,
};

NS_ASSUME_NONNULL_BEGIN

extern NSString *const UserMainViewUserInfoTableViewCellEditUserInfo;

extern NSString *const UserMainViewUserInfoTableViewCellUpDataIcon;

extern NSString *const UserMainViewUserInfoTableViewCellSetting;

@interface UserMainViewUserInfoTableViewCell : UITableViewCell
// UILabel
@property (nonatomic, strong) UILabel* userNickNameLabel;
@property (nonatomic, strong) UILabel* userIntroductionLanel;

// 部分个人信息
@property (nonatomic, strong) NSString* userIconURLString;
@property (nonatomic, strong) NSString* userFolloweeString;
@property (nonatomic, strong) NSString* userFansString;
@property (nonatomic, strong) NSString* userNotesNumberString;

// 根据性别状态加载性别UI的方法
- (void) setUserMainViewUserInfoTableViewCellSex:(UserMainViewUserInfoTableViewCellSex)sex;
// 登陆后刷新用户信息
- (void) setUserInfoWithData;
@end

NS_ASSUME_NONNULL_END
