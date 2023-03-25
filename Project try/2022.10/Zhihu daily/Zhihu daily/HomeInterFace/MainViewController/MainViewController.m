//
//  MainViewController.m
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/10/16.
//

#import "MainViewController.h"
#import "StoriesUnlimitedViewController.h"
#import "DateTool.h"
#import "Masonry.h"
#import "JSONModel.h"
#import "StoriesInterFace.h"
#import "StoriesUnlimitedRightInterFace.h"
#import "UserViewController.h"

#define SCREEN_SIZE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE_WIDTH [UIScreen mainScreen].bounds.size.width

#define USERICON_SIZE (SCREEN_SIZE_HEIGHT/25)

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUserIconBarButtonItem];
    [self createNavigationTitle];
    
    self.navigationController.delegate = self;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.interFaceView = [[InterFaceView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.interFaceView];
    [self.interFaceView viewInit];
    
    
    self.manage = [Manage sharedManage];
    
    [self.manage getNowStoriesData:^(NowStoriesModel * _Nonnull nowStoriesModel) {
        self.nowStoriesModel = nowStoriesModel;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self createTopImages];
            
            [self sendStoriserToView:self.nowStoriesModel];
            
            self.interFaceView.imageViewArray = self.imageViewArray;
            
            [self getLastStoriesWithDate:self.nowStoriesModel.date];
            
            [self createNavigationDate];
            
        });
    } error:^(NSError * _Nonnull error) {
        NSLog(@"getNowStoriesData error");
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadLastStories) name:@"loadLastStories" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getTopStoriesNotification:) name:@"top_storie" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(upDataByStoriesUnlimitedRight) name:@"upDataRight" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pressStoriesCell:) name:@"pressStoriesCell" object:nil];
}

- (void) pressStoriesCell:(NSNotification*)notification {
    NSNumber* numberObject = notification.userInfo[@"value"];
    NSInteger number = [numberObject integerValue];
    
    [self pushStoriesUnlimitedViewControllerWhithNumber:number];
}

- (void) upDataByStoriesUnlimitedRight {
    LastStoriesModel* lastStoriesModel = [self.lastStoriesModelArray lastObject];
    NSString* lastDate1 = lastStoriesModel.date;
    
    
    [self getLastStoriesWithDate:lastDate1];
}

- (void) getTopStoriesNotification:(NSNotification*)notification {
    NSDictionary* dict = notification.userInfo;
    NSInteger number = [dict[@"Value"] integerValue];
    
    Top_Stories* top_stories = self.nowStoriesModel.top_stories[number];
    
    [self pushTopStoriesViewControllerWhithID:top_stories.id andNumber:number];
}

- (void) loadLastStories {
    LastStoriesModel* lastStoriesModel = [self.lastStoriesModelArray lastObject];
    NSString* lastDate1 = lastStoriesModel.date;
    NSString* lastDate2 = [DateTool dateMinusOneWhithTimeString:lastDate1];
    NSString* lastDate3 = [DateTool dateMinusOneWhithTimeString:lastDate2];
    
    [self.manage getLastTime:lastDate1 StoriesData:^(LastStoriesModel * _Nonnull lastStoriesModel) {
        [self.lastStoriesModelArray addObject:lastStoriesModel];
        [self sendStoriserToView:lastStoriesModel];
        
        [self.manage getLastTime:lastDate2 StoriesData:^(LastStoriesModel * _Nonnull lastStoriesModel) {
            [self.lastStoriesModelArray addObject:lastStoriesModel];
            [self sendStoriserToView:lastStoriesModel];
            
            [self.manage getLastTime:lastDate3 StoriesData:^(LastStoriesModel * _Nonnull lastStoriesModel) {
                [self.lastStoriesModelArray addObject:lastStoriesModel];
                [self sendStoriserToView:lastStoriesModel];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.interFaceView viewInit];
                });
            } error:^(NSError * _Nonnull error) {
                NSLog(@"getLastModel error");
            }];
        } error:^(NSError * _Nonnull error) {
            NSLog(@"getLastModel error");
        }];
    } error:^(NSError * _Nonnull error) {
        NSLog(@"getLastModel error");
    }];
}


- (void) getLastStoriesWithDate:(NSString*)lastDate {
    [self.manage getLastTime:lastDate StoriesData:^(LastStoriesModel * _Nonnull lastStoriesModel) {
        if (self.lastStoriesModelArray == nil) {
            self.lastStoriesModelArray = [[NSMutableArray alloc] init];
        }
        [self.lastStoriesModelArray addObject:lastStoriesModel];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self sendStoriserToView:lastStoriesModel];
            [self.interFaceView viewInit];
            
            NSMutableArray* array = [[NSMutableArray alloc] init];
            for (Stories* stories in lastStoriesModel.stories) {
                [array addObject:stories.id];
            }
            [[NSNotificationCenter defaultCenter] postNotificationName:@"upDataRight-Two" object:nil userInfo:@{@"value":array}];
        });
    } error:^(NSError * _Nonnull error) {
        NSLog(@"getLastModel error");
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) createTopImages {
    self.imageViewArray = [[NSMutableArray alloc] init];
    NSMutableArray* topTitleArray = [[NSMutableArray alloc] init];
    NSMutableArray* topUserNameArray = [[NSMutableArray alloc] init];
    
    UIImageView* firstImageView = [[UIImageView alloc] init];
    Top_Stories* top_storie = self.nowStoriesModel.top_stories[4];
    [Manage setImage:firstImageView WithString:top_storie.image];
    [self.imageViewArray addObject:firstImageView];
    
    for (Top_Stories* top_storie in self.nowStoriesModel.top_stories) {
        UIImageView* imageView = [[UIImageView alloc] init];
        
        [Manage setImage:imageView WithString:top_storie.image];
        
        [self.imageViewArray addObject:imageView];
        
        [topTitleArray addObject:top_storie.title];
        [topUserNameArray addObject:top_storie.hint];
    }
    
    UIImageView* lastImageView = [[UIImageView alloc] init];
    top_storie = self.nowStoriesModel.top_stories[0];
    [Manage setImage:lastImageView WithString:top_storie.image];
    [self.imageViewArray addObject:lastImageView];
    
    self.interFaceView.topTitleArray = topTitleArray;
    self.interFaceView.topUserNameArray = topUserNameArray;
    
}

- (void) createUserIconBarButtonItem {
    UIView* contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, USERICON_SIZE, USERICON_SIZE)];
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = contentView.bounds;
    [button setImage:[[UIImage imageNamed:@"userIcon.jpeg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [button setImage:[[UIImage imageNamed:@"userIcon.jpeg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(pushMyInterFaceViewController) forControlEvents:UIControlEventTouchUpInside];
    button.layer.cornerRadius = USERICON_SIZE / 2;
    button.layer.masksToBounds = YES;
    [contentView addSubview:button];
    
    UIBarButtonItem* userIconItem = [[UIBarButtonItem alloc] initWithCustomView:contentView];
    self.navigationItem.rightBarButtonItem = userIconItem;
}

- (void) pushMyInterFaceViewController {
    UserViewController* viewController = [[UserViewController alloc] init];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void) createNavigationTitle {
    UILabel* titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE_WIDTH / 2, USERICON_SIZE)];
    titleLable.font = [UIFont systemFontOfSize:28];
    titleLable.textColor = [UIColor blackColor];
    titleLable.textAlignment = NSTextAlignmentLeft;
    titleLable.text = @"知乎日报";
    
    self.navigationItem.titleView = titleLable;
}

- (void) createNavigationDate {
    UIView* contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE_WIDTH / 5, USERICON_SIZE)];
    UILabel* monthLabel = [[UILabel alloc] init];
    monthLabel.font = [UIFont systemFontOfSize:12];
    monthLabel.textColor = [UIColor blackColor];
    
    [contentView addSubview:monthLabel];
    
    [monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.bottom.mas_equalTo(15);
    }];
    
    UILabel* dayLabel = [[UILabel alloc] init];
    dayLabel.font = [UIFont systemFontOfSize:25];
    dayLabel.textColor = [UIColor blackColor];
    
    [contentView addSubview:dayLabel];
    
    [dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.bottom.equalTo(monthLabel).offset(-12);
    }];
    
    monthLabel.text = [DateTool getMonthWithTimeString:self.nowStoriesModel.date];
    dayLabel.text = [DateTool getDayWithTimeString:self.nowStoriesModel.date];
    
    UIView* line = [[UIView alloc] initWithFrame:CGRectMake(60, -24, 1, USERICON_SIZE + 2)];
    line.backgroundColor = [UIColor grayColor];
    
    [contentView addSubview:line];
    
    UIBarButtonItem* dateItem = [[UIBarButtonItem alloc] initWithCustomView:contentView];
    
    self.navigationItem.leftBarButtonItem = dateItem;
}

- (void) sendStoriserToView:(JSONModel*) StoriesModel {
    if (self.interFaceView.stories == nil) {
        self.interFaceView.stories = [[NSMutableArray alloc] init];
    }
    if (self.interFaceView.lastDateArray == nil) {
        self.interFaceView.lastDateArray = [[NSMutableArray alloc] init];
    }
    NSDictionary* dict = [StoriesModel toDictionary];
    
    [self.interFaceView.lastDateArray addObject:dict[@"date"]];
    
    [self.interFaceView.stories addObject:dict[@"stories"]];
}

- (void) pushTopStoriesViewControllerWhithID:(NSString*)id andNumber:(NSInteger)number {
    
    StoriesViewController* storiesViewController = [[StoriesViewController alloc] init];
    
    [storiesViewController initStoriesModel];
    
    storiesViewController.storiesModel.storiesIDArray = [[NSMutableArray alloc] init];
    
    for (Top_Stories* stories in self.nowStoriesModel.top_stories) {
        [storiesViewController.storiesModel.storiesIDArray addObject:stories.id];
    }
    
    storiesViewController.storiesNumber = number + 1;
    storiesViewController.storiesInterFace = [[StoriesInterFace alloc] initWithFrame:self.view.bounds];
    
    [self.navigationController pushViewController:storiesViewController animated:YES];
}

- (void) pushStoriesUnlimitedViewControllerWhithNumber:(NSInteger)number {
    StoriesUnlimitedViewController* storiesViewController = [[StoriesUnlimitedViewController alloc] init];
    
    [storiesViewController initStoriesModel];
    
    storiesViewController.storiesModel.storiesIDArray = [[NSMutableArray alloc] init];
    
    for (Stories* stories in self.nowStoriesModel.stories) {
        [storiesViewController.storiesModel.storiesIDArray addObject:stories.id];
    }
    
    for (LastStoriesModel* storiesModel in self.lastStoriesModelArray) {
        for (Stories* stories in storiesModel.stories) {
            [storiesViewController.storiesModel.storiesIDArray addObject:stories.id];
        }
    }
    
    storiesViewController.storiesNumber = number + 1;
    storiesViewController.storiesInterFace = [[StoriesUnlimitedRightInterFace alloc] initWithFrame:self.view.bounds];
    
    [self.navigationController pushViewController:storiesViewController animated:YES];
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    BOOL isStoriesViewController = [viewController isKindOfClass:[StoriesViewController class]];
    
    [self.navigationController setNavigationBarHidden:isStoriesViewController];
}

@end
