//
//  SXPerson.h
//  sandBox
//
//  Created by 孙旭东 on 2023/7/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SXPerson : NSObject <NSSecureCoding>
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) int age;
@end

NS_ASSUME_NONNULL_END
