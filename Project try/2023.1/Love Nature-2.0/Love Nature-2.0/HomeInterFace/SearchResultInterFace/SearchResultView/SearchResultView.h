//
//  SearchResultView.h
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/6.
//

#import <UIKit/UIKit.h>

@class  SearchResultDataModel;

NS_ASSUME_NONNULL_BEGIN

@interface SearchResultView : UIView
@property (nonatomic, strong) SearchResultDataModel* data;

- (void) initSubViews;
@end

NS_ASSUME_NONNULL_END
