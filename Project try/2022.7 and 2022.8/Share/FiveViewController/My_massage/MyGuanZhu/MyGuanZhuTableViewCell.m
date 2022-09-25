//
//  MyGuanZhuTableViewCell.m
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import "MyGuanZhuTableViewCell.h"

@implementation MyGuanZhuTableViewCell

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
        
        _firendsIcon = [[UIImageView alloc] initWithFrame:CGRectMake(30, 10, 80, 80)];
        [self.contentView addSubview:_firendsIcon];
        
        _friendName = [[UILabel alloc] initWithFrame:CGRectMake(130, 40, 100, 20)];
        [self.contentView addSubview:_friendName];
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(self.bounds.size.width - 20, 35, 60, 30);
        _button.layer.masksToBounds = YES;
        _button.layer.cornerRadius = 15;
        [_button setBackgroundImage:[UIImage imageNamed:@"guanzhu_normal.png"] forState:UIControlStateNormal];
        [_button setImage:[UIImage imageNamed:@"guanzhu_pressed.png"] forState:UIControlStateSelected];
//        [_button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button];
        
    }
    return self;
}

//- (void) pressButton:(UIButton*)sender {
//    buttonSelected[_cellTag] = !buttonSelected[_cellTag];
//    sender.selected = buttonSelected[_cellTag];
//}

@end
