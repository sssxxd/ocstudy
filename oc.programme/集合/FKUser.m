//
//  FKUser.m
//  oc.programme
//
//  Created by 孙旭东 on 2022/6/5.
//

#import "FKUser.h"

@implementation FKUser
- (id) initWithName:(NSString *)aName pass:(NSString *)aPass {
    if (self = [super init]) {
        self.name = aName;
        self.pass = aPass;
    }
    return self;
}
- (void) say:(NSString *)content {
    NSLog(@"%@", content);
}
- (BOOL) isEqual:(id) other {
    if (self == other) {
        return YES;
    } else if ([other class] == FKUser.class) {
        FKUser* target = (FKUser*)other;
        return  [self.name isEqualToString:target.name] && [self.pass isEqualToString:target.pass];
    }
    return NO;
}
- (NSString*) description {
    return [NSString stringWithFormat:@"<FKUser[name=%@, pass=%@]>", self.name, self.pass];
}
@end
