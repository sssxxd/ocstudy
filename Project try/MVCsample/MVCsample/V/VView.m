//
//  VView.m
//  MVCsample
//
//  Created by 孙旭东 on 2022/9/11.
//

#import "VView.h"

@implementation VView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void) viewInit {
    // 创建按钮
    self.redButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.blueButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    self.redButton.frame = CGRectMake(50, 150, 300, 50);
    self.blueButton.frame = CGRectMake(50, 230, 300, 50);
    
    [self.redButton setTitle:@"red" forState:UIControlStateNormal];
    [self.blueButton setTitle:@"blue" forState:UIControlStateNormal];
    
    [self.redButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.blueButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self addSubview:self.redButton];
    [self addSubview:self.blueButton];
    
}

@end
