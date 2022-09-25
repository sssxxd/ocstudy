//
//  MassageSheZhiTableViewCell.m
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import "MassageSheZhiTableViewCell.h"

@implementation MassageSheZhiTableViewCell

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
        _cradLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, self.bounds.size.width, 20)];
        [self.contentView addSubview:_cradLabel];
        
        _arrowLogo = [UIButton buttonWithType:UIButtonTypeCustom];
        _arrowLogo.frame = CGRectMake(self.bounds.size.width, 10, 20, 20);
        [_arrowLogo setImage:[UIImage imageNamed:@"my_button_normal.png"] forState:UIControlStateNormal];
        [_arrowLogo setImage:[UIImage imageNamed:@"my_button_pressed.png"] forState:UIControlStateSelected];
        [self.contentView addSubview:_arrowLogo];
        
    }
    return self;
}


@end
