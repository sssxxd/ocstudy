//
//  LNManager+HomeModel.h
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/6.
//

#import "LNManager.h"

// 引入类
@class KeywordListModel;
@class SearchResultModel;

// 设置块
typedef void (^KeywordListModelBlock)(KeywordListModel * _Nonnull keywordListModel);
typedef void (^SearchResultModelBlock)(SearchResultModel * _Nonnull searchResultModel);

NS_ASSUME_NONNULL_BEGIN

@interface LNManager (HomeModel)

- (void) searchKeywork:(NSString*)keyword succeedBlock:(KeywordListModelBlock)succeedBlock errorBlock:(ErrorBlock)errorBlock;

- (void) postPetName:(NSString*)name getPetInfoSucceedBlock:(SearchResultModelBlock)succeedBlock erorBlock:(ErrorBlock)errorBlock;
@end

NS_ASSUME_NONNULL_END
