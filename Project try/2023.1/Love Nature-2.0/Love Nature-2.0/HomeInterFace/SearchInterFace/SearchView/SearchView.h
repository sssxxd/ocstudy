//
//  SearchView.h
//  Find
//
//  Created by 孙旭东 on 2023/3/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchView : UIView

@property (nonatomic, copy) NSArray* searchTitleDataArray;
@property (nonatomic, copy) NSArray* searchKeyListArray;

- (void) subViewReload;
@end

NS_ASSUME_NONNULL_END
