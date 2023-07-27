//
//  SXPerson.m
//  sandBox
//
//  Created by 孙旭东 on 2023/7/27.
//

#import "SXPerson.h"

@implementation SXPerson
- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeInt:self.age forKey:@"age"];
}

- (id)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        self.name = [coder decodeObjectForKey:@"name"];
        self.age = [coder decodeIntForKey:@"age"];
    }
    return self;
}

+ (BOOL)supportsSecureCoding {
    return YES;
}
@end
