//
//  StoriesUnlimitedViewController.m
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/11/6.
//

#import "StoriesUnlimitedViewController.h"
#import "StoriesUnlimitedRightInterFace.h"

#define SCREEN_SIZE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE_WIDTH [UIScreen mainScreen].bounds.size.width

@interface StoriesUnlimitedViewController ()

@end

@implementation StoriesUnlimitedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (self.storiesInterFace.nowStoriesNumber == self.storiesInterFace.numberOfStories) {
        self.storiesInterFace.scrollView.contentSize = CGSizeMake(SCREEN_SIZE_WIDTH * (self.storiesInterFace.numberOfStories + 1), 0);
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(upDataToStoriesUnlimitedRight:) name:@"upDataRight-Two" object:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void) upDataToStoriesUnlimitedRight:(NSNotification*)notification {
    for (NSString* ID in notification.userInfo[@"value"]) {
        [self.storiesModel.storiesIDArray addObject:ID];
    }
    
    self.storiesInterFace.numberOfStories = [self.storiesModel.storiesIDArray count];
    self.storiesInterFace.nowStoriesNumber = self.storiesNumber;
    
    StoriesUnlimitedRightInterFace* interFaceView = (StoriesUnlimitedRightInterFace*)self.storiesInterFace;
    
    [interFaceView upDataRightWebView];
}


- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
