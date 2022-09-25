//
//  KVCObject.h
//  KVC
//
//  Created by 孙旭东 on 2022/9/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KVCObject : NSObject
@property (nonatomic,assign) BOOL isShow;

@property (nonatomic,copy) NSString * name;

@property (nonatomic,copy) NSArray* textArray;

- (void)printProtroty;
@end

NS_ASSUME_NONNULL_END
