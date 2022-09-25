//
//  FourTableViewCell.m
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import "FourTableViewCell.h"

@implementation FourTableViewCell

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
        _picture = [[UIImageView alloc] init];
        _picture.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150);
        [self.contentView addSubview:_picture];
        
        _imageTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 155, [UIScreen mainScreen].bounds.size.width, 20)];
        _imageTitle.textColor = [UIColor blackColor];
        [self.contentView addSubview:_imageTitle];
    }
    return  self;
}

@end
