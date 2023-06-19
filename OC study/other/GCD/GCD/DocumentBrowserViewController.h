//
//  DocumentBrowserViewController.h
//  GCD
//
//  Created by 孙旭东 on 2023/4/23.
//

#import <UIKit/UIKit.h>

@interface DocumentBrowserViewController : UIDocumentBrowserViewController

- (void)presentDocumentAtURL:(NSURL *)documentURL;

@end
