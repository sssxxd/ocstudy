//
//  SearchViewController.h
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SearchView;

@interface SearchViewController : UIViewController
<UIImagePickerControllerDelegate,
UINavigationControllerDelegate>

@property (nonatomic, strong) SearchView* searchView;

@end

NS_ASSUME_NONNULL_END
