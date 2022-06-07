//
//  FKUser.h
//  oc.programme
//
//  Created by 孙旭东 on 2022/6/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FKUser : NSObject
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* pass;
- (id) initWithName:(NSString*) aName pass:(NSString*) aPass;
- (void) say:(NSString*) content;
@end

NS_ASSUME_NONNULL_END
