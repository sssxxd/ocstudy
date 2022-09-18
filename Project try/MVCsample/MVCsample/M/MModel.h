//
//  MModel.h
//  MVCsample
//
//  Created by 孙旭东 on 2022/9/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MModel : NSObject

// 储存view的颜色数据
@property (nonatomic, strong) NSString* colorString;

- (void) red;
- (void) blue;

@end

NS_ASSUME_NONNULL_END
