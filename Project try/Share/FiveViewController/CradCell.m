//
//  CradCell.m
//  Share
//
//  Created by 孙旭东 on 2022/7/31.
//

#import "CradCell.h"

@implementation CradCell

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
        iconCrad.frame = CGRectMake(8, 12, 20, 20);
        _iconCard = iconCrad;
        
        UILabel* cradName = [[UILabel alloc] init];
        [self.contentView addSubview:cradName];
        cradName.frame = CGRectMake(45, 8, 200, 30);
        _cradName = cradName;
        
        UIButton* cradArrow = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.contentView addSubview:cradArrow];
        cradArrow.frame = CGRectMake(self.bounds.size.width + 30, self.bounds.size.height - 30, 20, 20);
        [cradArrow setImage:[UIImage imageNamed:@"img3.png"] forState:UIControlStateNormal];
        _cradArrow = cradArrow;
    }
    
    return self;
}


@end
