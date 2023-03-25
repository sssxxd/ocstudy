//
//  StoriesModel.h
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/10/22.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "StorieContentModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface StoriesModel : NSObject

@property (nonatomic, strong) NSMutableArray* storiesIDArray;

@property (nonatomic, strong) NSMutableSet* storiesLikeSet;
@property (nonatomic, strong) NSMutableSet* storiesCollectSet;

@property (nonatomic, strong) NSMutableDictionary* storiesExtraContentDictionary;

@property (nonatomic, strong) FMDatabase* likeDatabase;
@property (nonatomic, strong) FMDatabase* collectDatabase;

- (void) saveStroiesLikeSet;
- (void) deleteFormLikeDataWithID:(NSString*)ID;

- (void) saveStoriesCollectSet;
- (void) deleteFormCollectDataWithID:(NSString*)ID;

@end

NS_ASSUME_NONNULL_END
