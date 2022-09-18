//
//  superView.m
//  manual layout view
//
//  Created by 孙旭东 on 2022/7/19.
//

#import "superView.h"

@implementation superView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void) createSubViews {
    _view01 = [[UIView alloc] init];
    _view01.frame = CGRectMake(0, 0, 40, 40);
    
    _view02 = [[UIView alloc] init];
    _view02.frame = CGRectMake(self.bounds.size.width - 40, 0, 40, 40);
    
    _view03 = [[UIView alloc] init];
    _view03.frame = CGRectMake(self.bounds.size.width - 40, self.bounds.size.height -40, 40, 40);
    
    _view04 = [[UIView alloc] init];
    _view04.frame = CGRectMake(0, self.bounds.size.height - 40, 40, 40);
    
    _view05 = [[UIView alloc] init];
    _view05.frame = CGRectMake(0, self.bounds.size.height / 2 - 20, self.bounds.size.width, 40);
    
    _view01.backgroundColor = [UIColor orangeColor];
    _view02.backgroundColor = [UIColor orangeColor];
    _view03.backgroundColor = [UIColor orangeColor];
    _view04.backgroundColor = [UIColor orangeColor];
    _view05.backgroundColor = [UIColor orangeColor];
    
    [self addSubview:_view01];
    [self addSubview:_view02];
    [self addSubview:_view03];
    [self addSubview:_view04];
    [self addSubview:_view05];
}

// 需要重新布局时调用此函数
- (void) layoutSubviews {
    NSLog(@"llll");
}

@end
