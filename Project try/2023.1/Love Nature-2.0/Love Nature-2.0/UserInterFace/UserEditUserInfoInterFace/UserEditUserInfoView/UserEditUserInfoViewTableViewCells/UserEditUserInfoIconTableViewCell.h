//
//  UserEditUserInfoIconTableViewCell.h
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

NS_ENUM(NSUInteger, UserEditUserInfoIconTableViewCellKind) {
    UserEditUserInfoIconTableViewCellKindNickName = 0,
    UserEditUserInfoIconTableViewCellKindintroduction,
    UserEditUserInfoIconTableViewCellKindSex,
    UserEditUserInfoIconTableViewCellKindaddress,
};

@interface UserEditUserInfoIconTableViewCell : UITableViewCell

@end

NS_ASSUME_NONNULL_END
