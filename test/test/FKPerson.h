//
//  FKPerson.h
//  test
//
//  Created by 孙旭东 on 2022/5/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FKPerson : NSObject {
    @public
    int _age;
}
- (int) age;
- (void) setAge: (int) age;
@end

NS_ASSUME_NONNULL_END
