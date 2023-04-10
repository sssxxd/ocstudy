//
//  UpDataSelecytView.h
//  Find
//
//  Created by 孙旭东 on 2023/3/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 全局变量
extern NSString *const UpDataSelecytViewCountMax;

@interface UpDataSelecytView : UIView

@property (nonatomic, strong) NSArray* imageArray;
@property (nonatomic, strong) NSMutableSet* imageSelectedSet;

- (void) layoutImageView;
@end

NS_ASSUME_NONNULL_END
