//
//  messageFrame.h
//  UITableViewCell
//
//  Created by 孙旭东 on 2022/7/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface messageFrame : NSObject

@property (nonatomic) CGRect userNameFrame;
@property (nonatomic) CGRect messageFrame;
@property (nonatomic) CGRect iconViewFrame;

@property (nonatomic) NSInteger cellHeight;

@end

NS_ASSUME_NONNULL_END
