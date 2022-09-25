//
//  MYTextField.m
//  Share
//
//  Created by 孙旭东 on 2022/7/28.
//

#import "MYTextField.h"

@implementation MYTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line.png"]];
        _logo.frame = CGRectMake(45, 8, 2, 33);
        [self addSubview:_logo];
    }
    return self;
}

- (void) setMyLeftView:(UIImageView *)myLeftView {
    _myLeftView = myLeftView;
    [self addSubview:_myLeftView];
}

- (CGRect) editingRectForBounds:(CGRect)bounds {
    CGRect inset = CGRectMake(bounds.origin.x + 45, bounds.origin.y, bounds.size.width, bounds.size.height);
    return inset;
}

- (CGRect) textRectForBounds:(CGRect)bounds {
    CGRect inset = CGRectMake(bounds.origin.x + 45, bounds.origin.y, bounds.size.width, bounds.size.height);
    return inset;
}

@end
