//
//  SearchResultModel.h
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/6.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchResultDataModel : JSONModel
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* image;
@property (nonatomic, copy) NSString* introduction;
//@property (nonatomic, copy) NSArray* picture;
@end

@interface SearchResultModel : JSONModel
@property (nonatomic, strong) SearchResultDataModel* data;
@property (nonatomic, copy) NSString* code;
@property (nonatomic, copy) NSString* msg;
@end

NS_ASSUME_NONNULL_END
