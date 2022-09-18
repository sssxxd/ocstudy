//
//  First_use_MasonryUITestsLaunchTests.m
//  First use MasonryUITests
//
//  Created by 孙旭东 on 2022/9/4.
//

#import <XCTest/XCTest.h>

@interface First_use_MasonryUITestsLaunchTests : XCTestCase

@end

@implementation First_use_MasonryUITestsLaunchTests

+ (BOOL)runsForEachTargetApplicationUIConfiguration {
    return YES;
}

- (void)setUp {
    self.continueAfterFailure = NO;
}

- (void)testLaunch {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    // Insert steps here to perform after app launch but before taking a screenshot,
    // such as logging into a test account or navigating somewhere in the app

    XCTAttachment *attachment = [XCTAttachment attachmentWithScreenshot:XCUIScreen.mainScreen.screenshot];
    attachment.name = @"Launch Screen";
    attachment.lifetime = XCTAttachmentLifetimeKeepAlways;
    [self addAttachment:attachment];
}

@end
