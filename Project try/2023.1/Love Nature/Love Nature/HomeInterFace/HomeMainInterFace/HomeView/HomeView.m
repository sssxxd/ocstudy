//
//  HomeView.m
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/7.
//

#import "HomeView.h"
#import "Masonry.h"

@implementation HomeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self createPhotographbutton];
    }
    return self;
}

- (void) createPhotographbutton {
    self.photographButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_photographButton setImage:[UIImage imageNamed:@"photograph.jpeg"] forState:UIControlStateNormal];
    _photographButton.layer.cornerRadius = 10;
    _photographButton.layer.masksToBounds = YES;
    
    [self addSubview:_photographButton];
    
    [_photographButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(110);
        make.left.mas_offset(20);
        make.right.mas_offset(-20);
        make.height.mas_offset(300);
    }];
}

@end
