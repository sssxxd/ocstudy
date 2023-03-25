//
//  StorieContentModel.h
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/10/26.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface StorieContentModel : JSONModel

@property (nonatomic, copy) NSArray* css;
@property (nonatomic, copy) NSArray* js;
@property (nonatomic, copy) NSString* share_url;

@end

@interface StorieExtraContentModel : JSONModel

@property (nonatomic, assign) NSInteger long_comments;
@property (nonatomic, assign) NSInteger popularity;
@property (nonatomic, assign) NSInteger short_comments;
@property (nonatomic, assign) NSInteger comments;

@end

NS_ASSUME_NONNULL_END
