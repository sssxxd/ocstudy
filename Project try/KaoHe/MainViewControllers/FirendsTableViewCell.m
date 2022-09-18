//
//  FirendsTableViewCell.m
//  KaoHe
//
//  Created by 孙旭东 on 2022/8/5.
//

#import "FirendsTableViewCell.h"

@implementation FirendsTableViewCell

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
        _userIcon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
        
        _userName = [[UILabel alloc] initWithFrame:CGRectMake(70, 10, 100, 20)];
        _userName.textColor = [UIColor blueColor];
        
        _sharePicture = [[UIImageView alloc] initWithFrame:CGRectMake(70, 65, 100, 200)];
        
        [self.contentView addSubview:_userIcon];
        [self.contentView addSubview:_userName];
        [self.contentView addSubview:_sharePicture];
        
    }
    return self;
}

@end
