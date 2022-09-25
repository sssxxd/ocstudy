//
//  MassageSheZhiViewController.h
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol MassageArrowSelected <NSObject>

- (void) setArrowLogoSelected:(NSMutableSet*) arrowSelected;

@end

@interface MassageSheZhiViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSMutableArray* arrayData;
@property (nonatomic, strong) NSMutableSet* selectedSet;

@property (nonatomic, strong) id<MassageArrowSelected> delegate;

@end

NS_ASSUME_NONNULL_END
