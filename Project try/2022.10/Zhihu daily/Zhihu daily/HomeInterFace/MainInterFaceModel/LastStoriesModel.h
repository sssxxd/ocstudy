//
//  LastStoriesModel.h
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/10/19.
//

#import "JSONModel.h"
#import "NowStoriesModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LastStoriesModel : JSONModel

@property (nonatomic, copy) NSString* date;
@property (nonatomic, copy) NSArray<Stories>* stories;

@end

NS_ASSUME_NONNULL_END
