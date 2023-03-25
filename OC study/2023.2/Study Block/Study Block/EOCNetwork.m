//
//  EOCNetwork.m
//  Study Block
//
//  Created by 孙旭东 on 2023/2/4.
//

#import "EOCNetwork.h"

@implementation EOCNetwork

- (id) initWithURL:(NSString *)string {
    self = [super init];
    return self;
}

- (void) start {
    [self.delegate network:self didFinishWithData:nil];
}

@end
