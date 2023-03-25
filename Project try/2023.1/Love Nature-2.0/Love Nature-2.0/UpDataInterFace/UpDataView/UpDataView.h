//
//  UpDataView.h
//  Find
//
//  Created by 孙旭东 on 2023/3/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UpDataView : UIView

@property (nonatomic, strong, readonly) UITextField* titleTextField;
@property (nonatomic, strong, readonly) UITextView* textTextField;
@property (nonatomic, strong, readonly) NSMutableArray* imageArray;

@end

NS_ASSUME_NONNULL_END
