//
//  MessageCell.h
//  UITableViewCell
//
//  Created by 孙旭东 on 2022/7/20.
//

#import <UIKit/UIKit.h>
#import "messageFrame.h"

NS_ASSUME_NONNULL_BEGIN

@interface MessageCell : UITableViewCell

// 基本数据
@property (nonatomic, weak) UILabel* userName;
@property (nonatomic, weak) UILabel* message;
@property (nonatomic, weak) UIImageView* iconView;

// 模型数据
@property (nonatomic, weak) messageFrame* messageFrame;
@end

NS_ASSUME_NONNULL_END
