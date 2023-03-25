//
//  StoriesViewController.m
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/10/22.
//

#import "StoriesViewController.h"

#define SCREEN_SIZE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE_WIDTH [UIScreen mainScreen].bounds.size.width

@interface StoriesViewController ()

@end

@implementation StoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.storiesInterFace = [[StoriesInterFace alloc] initWithFrame:self.view.bounds];
    [self initStoriesInterface];
    
    self.navigationController.toolbarHidden = NO;
    
    [self.navigationController.toolbar setBarStyle:UIBarStyleDefault];
    self.navigationController.toolbar.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.toolbar.translucent = NO;
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(leftScrollingWithPage:) name:@"leftScrolling" object:nil];
//
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(rightScrollingWithPage:) name:@"rightScrolling" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scrollNext:) name:@"scrollViewDidEndDecelerating" object:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) initStoriesInterface {
    
    self.storiesInterFace.numberOfStories = [self.storiesModel.storiesIDArray count];
    self.storiesInterFace.nowStoriesNumber = self.storiesNumber;
    
    [self.storiesInterFace ViewInit];
    
    [[Manage sharedManage] getWebWithID:self.storiesModel.storiesIDArray[self.storiesNumber - 1] StorieContentData:^(StorieContentModel * _Nonnull storieContentModel) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.storiesInterFace setNextWebImageWithString:storieContentModel.share_url andNumber:self.storiesNumber - 1];
        });
    } error:^(NSError * _Nonnull error) {
        NSLog(@"getCSS error");
    }];
    
    [[Manage sharedManage] getExtraContentWithID:self.storiesModel.storiesIDArray[self.storiesNumber - 1] StorieExtraContentData:^(StorieExtraContentModel * _Nonnull storieExtraContentModel) {
        
        [self.storiesModel.storiesExtraContentDictionary setObject:storieExtraContentModel forKey:self.storiesModel.storiesIDArray[self.storiesNumber - 1]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self initToolBar];
        });
        
    } error:^(NSError * _Nonnull error) {
        NSLog(@"get extraContent error");
    }];
    
    [self.view addSubview:self.storiesInterFace];
}

- (void) initStoriesModel {
    if (self.storiesModel == nil) {
        self.storiesModel = [[StoriesModel alloc] init];
    }
}

//- (void) leftScrollingWithPage:(NSNotification*)notification {
//    NSDictionary* dict = notification.userInfo;
//    NSNumber* pageNumber = dict[@"value"];
//    NSInteger page = [pageNumber integerValue] + 1;
//
//    [[Manage sharedManage] getWebWithID:_storiesModel.storiesIDArray[page] StorieContentData:^(StorieContentModel * _Nonnull storieContentModel) {
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self->_storiesInterFace setNextWebImageWithString:storieContentModel.share_url andNumber:page];
//        });
//    } error:^(NSError * _Nonnull error) {
//        NSLog(@"getNextWebView error");
//    }];
//}
//
//- (void) rightScrollingWithPage:(NSNotification*)notification {
//    NSDictionary* dict = notification.userInfo;
//    NSNumber* pageNumber = dict[@"value"];
//    NSInteger page = [pageNumber integerValue];
//
//    [[Manage sharedManage] getWebWithID:_storiesModel.storiesIDArray[page] StorieContentData:^(StorieContentModel * _Nonnull storieContentModel) {
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self->_storiesInterFace setNextWebImageWithString:storieContentModel.share_url andNumber:page];
//        });
//    } error:^(NSError * _Nonnull error) {
//        NSLog(@"getNextWebView error");
//    }];
//}

- (void) scrollNext:(NSNotification*)notification {
    NSDictionary* dict = notification.userInfo;
    NSNumber* number = dict[@"value"];
    self.storiesNumber = [number integerValue] + 1;
    if ([self.storiesInterFace.nowWebViewSet containsObject:number]) {
        [self initToolBar];
        return;
    }
    [[Manage sharedManage] getExtraContentWithID:self.storiesModel.storiesIDArray[self.storiesNumber - 1] StorieExtraContentData:^(StorieExtraContentModel * _Nonnull storieExtraContentModel) {
        
        [self.storiesModel.storiesExtraContentDictionary setObject:storieExtraContentModel forKey:self.storiesModel.storiesIDArray[self.storiesNumber - 1]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self initToolBar];
        });
    } error:^(NSError * _Nonnull error) {
        NSLog(@"get ExtraContent error");
    }];
    [[Manage sharedManage] getWebWithID:self.storiesModel.storiesIDArray[[number integerValue]] StorieContentData:^(StorieContentModel * _Nonnull storieContentModel) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.storiesInterFace setNextWebImageWithString:storieContentModel.share_url andNumber:[number integerValue]];
        });
    } error:^(NSError * _Nonnull error) {
        NSLog(@"getNextWeb error");
    }];
}

- (void) dealloc {
    for (WKWebView* webView in self.storiesInterFace.nowWebViewArray) {
        [webView stopLoading];
        webView.navigationDelegate = nil;
        webView.UIDelegate = nil;
//        [self.storiesInterFace.nowWebViewArray removeObject:webView];
    }
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) initToolBar {
    StorieExtraContentModel* storieEctraContentModel = self.storiesModel.storiesExtraContentDictionary[self.storiesModel.storiesIDArray[self.storiesNumber - 1]];
    
    if (self.backItem == nil) {
        self.backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fanhui.png"] style:UIBarButtonItemStyleDone target:self action:@selector(pressBack)];
        self.backItem.tintColor = [UIColor blackColor];
        
        UIView* lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 44)];
        lineView.backgroundColor = [UIColor grayColor];
        self.lineItem = [[UIBarButtonItem alloc] initWithCustomView:lineView];
        
        UIBarButtonItem* spaceItem1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
//        _commentItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"pinglun.png"] style:UIBarButtonItemStyleDone target:self action:@selector(pressComment)];
//        _commentItem.tintColor = [UIColor blackColor];
        
        UIBarButtonItem* spaceItem2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
//        _likeItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"like.png"] style:UIBarButtonItemStyleDone target:self action:@selector(pressLike)];
//        _likeItem.tintColor = [UIColor blackColor];
        
        UIBarButtonItem* spaceItem3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        self.collectItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"xingxing.png"] style:UIBarButtonItemStyleDone target:self action:@selector(pressCollect)];
        self.collectItem.tintColor = [UIColor blackColor];
        
        UIBarButtonItem* spaceItem4 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        self.shareItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fenxiang.png"] style:UIBarButtonItemStyleDone target:self action:@selector(pressShare)];
        self.shareItem.tintColor = [UIColor blackColor];
        
        UIView* contentView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        UIButton* button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button1 setImage:[UIImage imageNamed:@"pinglun.png"] forState:UIControlStateNormal];
        [button1 addTarget:self action:@selector(pressComment) forControlEvents:UIControlEventTouchUpInside];
        button1.frame = CGRectMake(0, 0, 50, 50);
        [contentView1 addSubview:button1];
        
        self.commentLable = [[UILabel alloc] initWithFrame:CGRectMake(37, 0, 35, 25)];
        self.commentLable.font = [UIFont systemFontOfSize:14];
        self.commentLable.text = @"0";
        [contentView1 addSubview:self.commentLable];
        
        self.commentItem = [[UIBarButtonItem alloc] initWithCustomView:contentView1];
        
        UIView* contentView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        UIButton* button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button2 setImage:[UIImage imageNamed:@"like.png"] forState:UIControlStateNormal];
        [button2 addTarget:self action:@selector(pressLike:) forControlEvents:UIControlEventTouchUpInside];
        button2.frame = CGRectMake(0, 0, 50, 50);
        [contentView2 addSubview:button2];
        
        self.likeButton = button2;
        
        self.likeLable = [[UILabel alloc] initWithFrame:CGRectMake(37, 0, 35, 25)];
        self.likeLable.font = [UIFont systemFontOfSize:14];
        self.likeLable.text  = @"0";
        [contentView2 addSubview:self.likeLable];
        
        self.likeItem = [[UIBarButtonItem alloc] initWithCustomView:contentView2];
        
        NSArray* array = [NSArray arrayWithObjects:self.backItem, self.lineItem, spaceItem1, self.commentItem, spaceItem2, self.likeItem, spaceItem3, self.collectItem, spaceItem4, self.shareItem, nil];
        self.toolbarItems = array;
    }
    if ([self.storiesModel.storiesLikeSet containsObject:self.storiesModel.storiesIDArray[self.storiesNumber - 1]]) {
        [self.likeButton setImage:[[UIImage imageNamed:@"liked.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
        self.likeButton.tintColor = [UIColor colorWithRed:0.074f green:0.588f blue:0.945f alpha:1];
        self.likeLable.text = [NSString stringWithFormat:@"%ld", storieEctraContentModel.popularity + 1];
    } else {
        [self.likeButton setImage:[[UIImage imageNamed:@"like.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
        self.likeButton.tintColor = [UIColor blackColor];
        self.likeLable.text = [NSString stringWithFormat:@"%ld", storieEctraContentModel.popularity];
    }
    if ([self.storiesModel.storiesCollectSet containsObject:self.storiesModel.storiesIDArray[self.storiesNumber - 1]]) {
        [self.collectItem setImage:[UIImage imageNamed:@"shoucang.png"]];
        self.collectItem.tintColor = [UIColor colorWithRed:0.074f green:0.588f blue:0.945f alpha:1];
    } else {
        [self.collectItem setImage:[UIImage imageNamed:@"xingxing.png"]];
        self.collectItem.tintColor = [UIColor blackColor];
    }
    
    self.commentLable.text = [NSString stringWithFormat:@"%ld", storieEctraContentModel.comments];
}

- (void) pressBack {
//    [self.storiesInterFace.scrollView removeFromSuperview];
    self.navigationController.toolbarHidden = YES;
    
    self.navigationController.toolbar.translucent = YES;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) pressComment {
    StorieExtraContentModel* storieEctraContentModel = self.storiesModel.storiesExtraContentDictionary[self.storiesModel.storiesIDArray[self.storiesNumber - 1]];
    CommentViewController* commentViewController = [[CommentViewController alloc] init];
    
    commentViewController.isLong = (0 != storieEctraContentModel.long_comments);
    commentViewController.isShort = (0 != storieEctraContentModel.short_comments);
    commentViewController.comments = storieEctraContentModel.comments;
    
    commentViewController.ID = self.storiesModel.storiesIDArray[self.storiesNumber - 1];
    
    self.navigationController.toolbarHidden = YES;
    
    self.navigationController.toolbar.translucent = YES;
    
    [self.navigationController pushViewController:commentViewController animated:YES];
}

- (void) pressLike:(UIButton*)sender {
    if ([self.storiesModel.storiesLikeSet containsObject:self.storiesModel.storiesIDArray[self.storiesNumber - 1]]) {
        [self.storiesModel.storiesLikeSet removeObject:self.storiesModel.storiesIDArray[self.storiesNumber - 1]];
        [sender setImage:[[UIImage imageNamed:@"like.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
        sender.tintColor = [UIColor blackColor];
        [self.storiesModel deleteFormLikeDataWithID:self.storiesModel.storiesIDArray[self.storiesNumber - 1]];
        
        NSInteger number = [self.likeLable.text integerValue];
        
        self.likeLable.text = [NSString stringWithFormat:@"%ld", number - 1];
    } else {
        [sender setImage:[[UIImage imageNamed:@"liked.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
        [self.storiesModel.storiesLikeSet addObject:self.storiesModel.storiesIDArray[self.storiesNumber - 1]];
        [sender setTintColor:[UIColor colorWithRed:0.074f green:0.588f blue:0.945f alpha:1]];
        [self.storiesModel saveStroiesLikeSet];
        
        NSInteger number = [self.likeLable.text integerValue];
        
        self.likeLable.text = [NSString stringWithFormat:@"%ld", number + 1];
    }
}

- (void) pressCollect {
    if ([self.storiesModel.storiesCollectSet containsObject:self.storiesModel.storiesIDArray[self.storiesNumber - 1]]) {
        [self.storiesModel.storiesCollectSet removeObject:self.storiesModel.storiesIDArray[self.storiesNumber - 1]];
        [self.collectItem setImage:[UIImage imageNamed:@"xingxing.png"]];
        self.collectItem.tintColor = [UIColor blackColor];
        [self.storiesModel deleteFormCollectDataWithID:self.storiesModel.storiesIDArray[self.storiesNumber - 1]];
    } else {
        [self.storiesModel.storiesCollectSet addObject:self.storiesModel.storiesIDArray[self.storiesNumber - 1]];
        [self.collectItem setImage:[UIImage imageNamed:@"shoucang.png"]];
        self.collectItem.tintColor = [UIColor colorWithRed:0.074f green:0.588f blue:0.945f alpha:1];
        [self.storiesModel saveStoriesCollectSet];
    }
}

- (void) pressShare {
    NSLog(@"SHARE");
}


@end
