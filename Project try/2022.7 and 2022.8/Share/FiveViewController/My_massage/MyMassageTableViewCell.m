//
//  MyMassageTableViewCell.m
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import "MyMassageTableViewCell.h"

@implementation MyMassageTableViewCell

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
        
        _arrowLogo = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width, 10, 20, 20)];
        [_arrowLogo setImage:[UIImage imageNamed:@"img3.png"]];
        [self.contentView addSubview:_arrowLogo];
        
        _numberOfCrad = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width + 30, 10, 20, 20)];
        _numberOfCrad.textColor = [UIColor blueColor];
        [self.contentView addSubview:_numberOfCrad];
    }
    return self;
}

@end
