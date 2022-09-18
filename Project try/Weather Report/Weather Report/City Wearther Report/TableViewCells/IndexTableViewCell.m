//
//  IndexTableViewCell.m
//  Weather Report
//
//  Created by 孙旭东 on 2022/8/12.
//

#import "IndexTableViewCell.h"

@implementation IndexTableViewCell

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
        _titleFirst = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 80, 20)];
        _titleSecond = [[UILabel alloc] initWithFrame:CGRectMake(250, 10, 80, 20)];
        _dataFirst = [[UILabel alloc] initWithFrame:CGRectMake(20, 35, 100, 80)];
        _dataSecond = [[UILabel alloc] initWithFrame:CGRectMake(250, 35, 100, 80)];
        
        _titleFirst.font = [UIFont systemFontOfSize:18];
        _titleSecond.font = [UIFont systemFontOfSize:18];
        _dataFirst.font = [UIFont systemFontOfSize:30];
        _dataSecond.font = [UIFont systemFontOfSize:30];
        
        _titleFirst.textColor = [UIColor grayColor];
        _titleSecond.textColor = [UIColor grayColor];
        _dataFirst.textColor = [UIColor whiteColor];
        _dataSecond.textColor = [UIColor whiteColor];
        
        [self.contentView addSubview:_titleFirst];
        [self.contentView addSubview:_titleSecond];
        [self.contentView addSubview:_dataFirst];
        [self.contentView addSubview:_dataSecond];
    }
    return self;
}

@end
