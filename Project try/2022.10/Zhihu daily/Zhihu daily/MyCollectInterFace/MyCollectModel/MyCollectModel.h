//
//  MyCollectModel.h
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/11/7.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyCollectModel : NSObject

@property (nonatomic, strong) NSMutableSet* collectSet;

@property (nonatomic, strong) NSMutableArray* collectTitle;
@property (nonatomic, strong) NSMutableArray* collectImagePath;

@property (nonatomic, strong) FMDatabase* collectDatabase;

- (void) reloadModel;

@end

NS_ASSUME_NONNULL_END
