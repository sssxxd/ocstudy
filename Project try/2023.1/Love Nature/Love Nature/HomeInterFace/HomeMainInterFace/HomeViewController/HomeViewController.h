//
//  HomeViewController.h
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/7.
//

#import <UIKit/UIKit.h>
#import "HomeView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : UIViewController
<UISearchBarDelegate>

@property (nonatomic, strong) HomeView* homeView;

@end

NS_ASSUME_NONNULL_END
