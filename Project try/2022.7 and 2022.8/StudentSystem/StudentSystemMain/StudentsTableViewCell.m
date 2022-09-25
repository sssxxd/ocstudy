//
//  StudentsTableViewCell.m
//  StudentSystem
//
//  Created by 孙旭东 on 2022/8/4.
//

#import "StudentsTableViewCell.h"

@implementation StudentsTableViewCell

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
        _studentName = [[UILabel alloc] initWithFrame:CGRectMake(30, 20, 100, 20)];
        _studentClass = [[UILabel alloc] initWithFrame:CGRectMake(150, 20, 100, 20)];
        _studentNumber = [[UILabel alloc] initWithFrame:CGRectMake(300, 20, 100, 20)];
        
        [self.contentView addSubview:_studentName];
        [self.contentView addSubview:_studentClass];
        [self.contentView addSubview:_studentNumber];
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

@end
