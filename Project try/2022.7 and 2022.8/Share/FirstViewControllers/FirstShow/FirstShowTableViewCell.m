//
//  FirstShowTableViewCell.m
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import "FirstShowTableViewCell.h"

@implementation FirstShowTableViewCell

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
        _showTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 20)];
        _showTitle.text = @"多希望列车能把我带到有你的城市";
        [self.contentView addSubview:_showTitle];
        
        for (int i = 0; i < 5; i++) {
            UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"works_img%d.png", i]]];
            
            imageView.frame = CGRectMake(5, 40 + 210 * (i - 1), self.bounds.size.width + 60, 200);
            
            [self.contentView addSubview:imageView];
        }
    }
    return self;
}

@end
