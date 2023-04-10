//
//  UserMainView.h
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/1/31.
//

#import <UIKit/UIKit.h>

@class  UserInfoDataModel;
NS_ASSUME_NONNULL_BEGIN

// 设置全局变量
extern NSString *const messageOfToLogin;

extern NSString *const UserMainViewPressPetFile;
extern NSString *const UserMainViewPressCollect;
extern NSString *const UserMainViewPressLike;
extern NSString *const UserMainViewSetIsSunCellScroll;

@interface UserMainView : UIView
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UserInfoDataModel* userInfoDataModel;
@property (nonatomic, copy) NSArray* userPetFileContentDataArray;
@property (nonatomic, copy) NSArray* userCollectContentDataArray;
@property (nonatomic, copy) NSArray* userLikeContentDataArray;

- (void) reloadTableView;
@end

NS_ASSUME_NONNULL_END
