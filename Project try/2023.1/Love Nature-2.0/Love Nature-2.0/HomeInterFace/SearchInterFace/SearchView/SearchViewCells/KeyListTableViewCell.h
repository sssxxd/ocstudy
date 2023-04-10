//
//  KeyListTableViewCell.h
//  Find
//
//  Created by 孙旭东 on 2023/3/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class KeywordListDataModel;

@interface KeyListTableViewCell : UITableViewCell

@property (nonatomic, strong) KeywordListDataModel* dataModel;

@end

NS_ASSUME_NONNULL_END
