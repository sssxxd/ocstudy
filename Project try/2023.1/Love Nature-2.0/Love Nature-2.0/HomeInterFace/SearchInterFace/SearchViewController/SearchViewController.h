//
//  SearchViewController.h
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/6.
//

#import <UIKit/UIKit.h>

// 引入类
@class KeywordListModel;

NS_ASSUME_NONNULL_BEGIN

@interface SearchViewController : UIViewController

@property (nonatomic, strong) KeywordListModel* keywordListModel;

@end

NS_ASSUME_NONNULL_END
