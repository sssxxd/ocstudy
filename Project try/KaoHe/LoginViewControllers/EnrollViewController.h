//
//  EnrollViewController.h
//  KaoHe
//
//  Created by 孙旭东 on 2022/8/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SendAccontToLoginViewController <NSObject>

- (void) sendAccontData:(NSMutableArray*)accontData;
- (void) sendPasswordData:(NSMutableArray*)passwordData;

@end

@interface EnrollViewController : UIViewController

@property (nonatomic, strong) UITextField* userAccont;
@property (nonatomic, strong) UITextField* userPassword;
@property (nonatomic, strong) UIButton* enrollButton;

@property (nonatomic, strong) NSMutableArray* accontData;
@property (nonatomic, strong) NSMutableArray* passwordData;

@property (nonatomic, strong) id<SendAccontToLoginViewController> delegate;

@end

NS_ASSUME_NONNULL_END
