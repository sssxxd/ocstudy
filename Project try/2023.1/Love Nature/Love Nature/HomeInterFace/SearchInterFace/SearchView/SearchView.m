//
//  SearchView.m
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/15.
//

#import "SearchView.h"

#import "Masonry.h"

@implementation SearchView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.photographImageView = [[UIImageView alloc] init];
        _photographImageView.backgroundColor = [UIColor clearColor];
        [self addSubview:_photographImageView];
        
        [_photographImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.height.mas_offset(200);
            make.width.mas_offset(200);
        }];
        
        self.photographButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_photographButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_photographButton setTitle:@"选择相册" forState:UIControlStateNormal];
        _photographButton.titleLabel.font = [UIFont systemFontOfSize:20];
        
        [self addSubview:_photographButton];
        
        [_photographButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.bottom.mas_offset(-100);
        }];
        
        self.backButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _backButton.tintColor = [UIColor whiteColor];
        [_backButton setImage:[UIImage imageNamed:@"guanbi.png"] forState:UIControlStateNormal];
        
        [self addSubview:_backButton];
        
        [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(80);
            make.left.mas_offset(40);
        }];
    }
    return self;
}
@end
