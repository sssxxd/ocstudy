//
//  SexTableViewCell.m
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import "SexTableViewCell.h"

@implementation SexTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _sex = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 40, 20)];
        _sex.text = @"性别";
        [self.contentView addSubview:_sex];
        
        _buttonBoy = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonGirl = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonBoy.frame = CGRectMake(100, 20, 20, 20);
        _buttonGirl.frame = CGRectMake(150, 20, 20, 20);
        _buttonBoy.tag = 501;
        _buttonGirl.tag = 502;
        [_buttonBoy setImage:[UIImage imageNamed:@"girl_button.png"] forState:UIControlStateNormal];
        [_buttonGirl setImage:[UIImage imageNamed:@"girl_button.png"] forState:UIControlStateNormal];
        [_buttonGirl setImage:[UIImage imageNamed:@"boy_button.png"] forState:UIControlStateSelected];
        [_buttonBoy setImage:[UIImage imageNamed:@"boy_button.png"] forState:UIControlStateSelected];
        _buttonBoy.selected = YES;
        _buttonGirl.selected = NO;
        [_buttonBoy setTintColor:[UIColor colorWithRed:0.31 green:0.47 blue:0.78 alpha:1]];
        [_buttonGirl setTintColor:[UIColor colorWithRed:0.31 green:0.47 blue:0.78 alpha:1]];
        [_buttonBoy addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonGirl addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:_buttonBoy];
        [self.contentView addSubview:_buttonGirl];
        
        _boy = [[UILabel alloc] initWithFrame:CGRectMake(125, 20, 20, 20)];
        _boy.text = @"男";
        [self addSubview:_boy];
        
        _girl = [[UILabel alloc] initWithFrame:CGRectMake(170, 20, 20, 20)];
        _girl.text = @"女";
        [self addSubview:_girl];
    }
    return self;
}

- (void) pressButton:(UIButton*)sender {
    for (int i = 1; i <= 2; i++) {
        UIButton* button = (UIButton*)[[sender superview] viewWithTag:500 + i];
        button.selected = NO;
    }
    sender.selected = YES;
}

@end
