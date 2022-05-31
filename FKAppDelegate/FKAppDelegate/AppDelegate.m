//
//  AppDelegate.m
//  FKAppDelegate
//
//  Created by 孙旭东 on 2022/5/23.
//

#import "AppDelegate.h"

@interface AppDelegate ()


@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [self.window makeKeyAndOrderFront:self];
}

- (void)applicationWillFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.window = [[NSWindow alloc] initWithContentRect:
            NSMakeRect(300, 300, 320, 200)
            styleMask: (NSWindowStyleMaskTitled |NSWindowStyleMaskMiniaturizable| NSWindowStyleMaskClosable)
            backing: NSBackingStoreBuffered
            defer: NO];
    self.window.title = @"Delegate测试";
    NSTextField* label = [[NSTextField alloc] initWithFrame:NSMakeRect(60, 120, 200, 60)];
    [label setSelectable:YES];
    [label setBezeled:YES];
    [label setDrawsBackground:YES];
    [label setStringValue:@"疯狂iOS讲义是一本很棒的书"];
    NSButton* button = [[NSButton alloc] initWithFrame:NSMakeRect(120, 40, 80, 30)];
    button.title = @"确定";
    [button setBezelStyle:NSBezelStyleRounded];
    [button setBounds:NSMakeRect(120, 40, 80, 30)];
    [self.window.contentView addSubview:label];
    [self.window.contentView addSubview:button];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
