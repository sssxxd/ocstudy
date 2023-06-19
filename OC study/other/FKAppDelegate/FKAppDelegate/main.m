//
//  main.m
//  FKAppDelegate
//
//  Created by 孙旭东 on 2022/5/23.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        AppDelegate* delegate = [[AppDelegate alloc] init];
        [NSApplication sharedApplication];
        [NSApp setDelegate:delegate];
    }
    return NSApplicationMain(argc, (const char **)argv);
}
