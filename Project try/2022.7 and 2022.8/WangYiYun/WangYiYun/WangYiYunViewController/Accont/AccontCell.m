//
//  AccontCell.m
//  WangYiYun
//
//  Created by 孙旭东 on 2022/7/25.
//

#import "AccontCell.h"

@implementation AccontCell

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
        // 建立子控件
        UIImageView* iconCrad = [[UIImageView alloc] init];
        [self.contentView addSubview:iconCrad];
        iconCrad.frame = CGRectMake(5, 15, 30, 30);
        _iconCard = iconCrad;
        
        UILabel* cradName = [[UILabel alloc] init];
        [self.contentView addSubview:cradName];
        cradName.frame = CGRectMake(45, 15, 200, 30);
        _cradName = cradName;
        
        UIButton* cradArrow = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.contentView addSubview:cradArrow];
        cradArrow.frame = CGRectMake(self.bounds.size.width + 30, 19, 20, 20);
        [cradArrow setImage:[UIImage imageNamed:@"jinrujiantou.png"] forState:UIControlStateNormal];
        cradArrow.tintColor = [UIColor blackColor];
        _cradArrow = cradArrow;
    }
    
    return self;
}

@end
