//
//  UpDataModel.h
//  Find
//
//  Created by 孙旭东 on 2023/3/22.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UpDataTitleDataModel <NSObject>
@end

@interface UpDataTitleModel : JSONModel
@property (nonatomic, copy) NSString* data;
@property (nonatomic, copy) NSString* code;
@property (nonatomic, copy) NSString* msg;
@end


@interface UpDataModel : NSObject

@property (nonatomic, copy) NSString* nickName;
@property (nonatomic, copy) NSString* token;

@end

NS_ASSUME_NONNULL_END
