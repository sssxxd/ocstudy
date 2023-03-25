//
//  EGClass.m
//  Study Block
//
//  Created by 孙旭东 on 2023/2/3.
//

#import "EGClass.h"

@implementation EGClass

- (void) add:(AddBlock)addBlock {
    addBlock(2, 3);
}


- (void) startWithCompletHandler:(EOCCompletionHandler)completion {
    NSLog(@"sfafdsa");
}

- (void) fechFooData {
    NSString* url = @"vcdsvdsfvb";
    _foo = [[EOCNetwork alloc] initWithURL:url];
    _foo.delegate = self;
    [_foo start];
}

- (void) fechBarData {
    NSString* url = @"vcdsvdsfvb";
    _bar = [[EOCNetwork alloc] initWithURL:url];
    _bar.delegate = self;
    [_bar start];
}

- (void) network:(EOCNetwork *)network didFinishWithData:(NSData *)data {
    if (_foo == network) {
        NSLog(@"_foo");
    } else if (_bar == network) {
        NSLog(@"_bar");
    }
    // etc.
}

@end
