//
//  UserMainViewContentTableViewCell.h
//  Find
//
//  Created by 孙旭东 on 2023/3/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString *const mainScrollOnPetFileNow;
extern NSString *const mainScrollOnCollectNow;
extern NSString *const mainScrollOnLikeNow;
extern NSString *const UserMainViewContentTableViewCellMainTableCanScroll;

@interface UserMainViewContentTableViewCell : UITableViewCell
@property (nonatomic, copy) NSArray* userPetFileContentDataArray;
@property (nonatomic, copy) NSArray* userCollectContentDataArray;
@property (nonatomic, copy) NSArray* userLikeContentDataArray;

- (void) reloadSubViews;
@end

NS_ASSUME_NONNULL_END
