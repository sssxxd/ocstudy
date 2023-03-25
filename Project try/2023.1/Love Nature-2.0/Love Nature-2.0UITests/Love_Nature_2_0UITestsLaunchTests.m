//
//  Love_Nature_2_0UITestsLaunchTests.m
//  Love Nature-2.0UITests
//
//  Created by 孙旭东 on 2023/1/15.
//

#import <XCTest/XCTest.h>

@interface Love_Nature_2_0UITestsLaunchTests : XCTestCase

@end

@implementation Love_Nature_2_0UITestsLaunchTests

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
