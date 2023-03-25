//
//  CommentViewController.h
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/11/1.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"
#import "CommentView.h"
#import "Manage.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommentViewController : UIViewController

@property (nonatomic, strong) NSMutableDictionary* commentDict;
@property (nonatomic, strong) CommentView* commentView;

@property (nonatomic, assign) NSInteger comments;
@property (nonatomic, assign) NSInteger shortComments;
@property (nonatomic, assign) NSInteger longComments;

@property (nonatomic, assign) BOOL isLong;
@property (nonatomic, assign) BOOL isShort;

@property (nonatomic, copy) NSString* ID;



@end

NS_ASSUME_NONNULL_END
