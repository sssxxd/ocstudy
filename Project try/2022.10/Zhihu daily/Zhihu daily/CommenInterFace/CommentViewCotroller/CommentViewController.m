//
//  CommentViewController.m
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/11/1.
//

#import "CommentViewController.h"

@interface CommentViewController ()

@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = [NSString stringWithFormat:@"%ld条评论", self.comments];
    self.commentDict = [[NSMutableDictionary alloc] init];
    
    self.commentView = [[CommentView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.commentView];
    [self.commentView ViewInit];
    
    [self getComment];
    
    [self createBackItem];
}

- (void) getComment {
    dispatch_group_t group = dispatch_group_create();
    
    if (self.isLong) {
        dispatch_group_enter(group);
        [[Manage sharedManage] getLongCommentWithID:self.ID CommentData:^(CommentModel * _Nonnull commentModel) {
            NSDictionary* dict = [commentModel toDictionary];
            [self.commentDict setObject:dict[@"comments"] forKey:@"long"];
            self.isLong = YES;
            dispatch_group_leave(group);
        } error:^(NSError * _Nonnull error) {
            NSLog(@"get longComment error");
            dispatch_group_leave(group);
        }];
    }
    
    if (self.isShort) {
        dispatch_group_enter(group);
        [[Manage sharedManage] getShortCommentWithID:self.ID CommentData:^(CommentModel * _Nonnull commentModel) {
            NSDictionary* dict = [commentModel toDictionary];
            [self.commentDict setObject:dict[@"comments"] forKey:@"short"];
            self.isShort = YES;
            dispatch_group_leave(group);
        } error:^(NSError * _Nonnull error) {
            NSLog(@"get shortComment error");
            dispatch_group_leave(group);
        }];
    }
    
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            self.commentView.commentDict = self.commentDict;
            [self.commentView viewReload];
        });
    });
}

- (void) createBackItem {
    UIBarButtonItem* item =[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fanhui.png"] style:UIBarButtonItemStyleDone target:self action:@selector(pressBack)];
    item.tintColor = [UIColor blackColor];
    
    self.navigationItem.leftBarButtonItem = item;
}

- (void) pressBack {
    self.navigationController.toolbarHidden = NO;
    
    [self.navigationController.toolbar setBarStyle:UIBarStyleDefault];
    self.navigationController.toolbar.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.toolbar.translucent = NO;
    
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
