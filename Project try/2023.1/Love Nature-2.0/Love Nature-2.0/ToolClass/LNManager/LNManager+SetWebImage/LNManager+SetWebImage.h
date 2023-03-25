//
//  LNManager+SetWebImage.h
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/1/31.
//

#import <Foundation/Foundation.h>
#import "LNManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface LNManager (SetWebImage)

// 设置头像
- (void) useImageURLString:(NSString*)urlString setImageVIew:(UIImageView*)imageView;
@end

NS_ASSUME_NONNULL_END
