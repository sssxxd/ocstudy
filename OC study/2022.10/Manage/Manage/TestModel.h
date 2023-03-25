//
//  TestModel.h
//  Manage
//
//  Created by 孙旭东 on 2022/10/16.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TestModel : JSONModel
@property (nonatomic, assign) int status;
@property (nonatomic, copy) NSString* msg;
@property (nonatomic, copy) NSString* latest;
@end

NS_ASSUME_NONNULL_END
