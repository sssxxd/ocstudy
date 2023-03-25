//
//  MyCollectContentModel.h
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/11/7.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyCollectContentModel : JSONModel

@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* image;

@end

NS_ASSUME_NONNULL_END
