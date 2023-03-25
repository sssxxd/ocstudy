//
//  StoriesUnlimitedRightInterFace.m
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/11/6.
//

#import "StoriesUnlimitedRightInterFace.h"

@implementation StoriesUnlimitedRightInterFace

#define SCREEN_SIZE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE_WIDTH [UIScreen mainScreen].bounds.size.width

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (self.scrollView.contentOffset.x == SCREEN_SIZE_WIDTH * self.numberOfStories) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"upDataRight" object:nil];
        return;
    }
    NSInteger number = self.scrollView.contentOffset.x / SCREEN_SIZE_WIDTH;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"scrollViewDidEndDecelerating" object:nil userInfo:@{@"value":[NSNumber numberWithInteger:number]}];
    
    if (self.scrollView.contentOffset.x == SCREEN_SIZE_WIDTH * (self.numberOfStories - 1)) {
        self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width + SCREEN_SIZE_WIDTH, 0);
    }
}

//- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
//    if (self.scrollView.contentOffset.x > SCREEN_SIZE_WIDTH * (self.numberOfStories - 1)) {
//        self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width + 6 * SCREEN_SIZE_WIDTH, 0);
//
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"upDataRight" object:nil];
//    }
//}

- (void) upDataRightWebView {
    self.scrollView.contentSize = CGSizeMake(SCREEN_SIZE_WIDTH * self.numberOfStories, 0);
    
    NSInteger number = self.scrollView.contentOffset.x / SCREEN_SIZE_WIDTH;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"scrollViewDidEndDecelerating" object:nil userInfo:@{@"value":[NSNumber numberWithInteger:number]}];
    
    if (self.scrollView.contentOffset.x == SCREEN_SIZE_WIDTH * (self.numberOfStories - 1)) {
        self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width + SCREEN_SIZE_WIDTH, 0);
    }
}

@end
