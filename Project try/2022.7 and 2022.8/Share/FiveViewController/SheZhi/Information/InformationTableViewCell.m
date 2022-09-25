//
//  InformationTableViewCell.m
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import "InformationTableViewCell.h"

@implementation InformationTableViewCell

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
        _crad = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 50, 20)];
        [self.contentView addSubview:_crad];
        
        _cradTitle = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, 180, 20)];
        [self.contentView addSubview:_cradTitle];
    }
    return self;
}

@end
