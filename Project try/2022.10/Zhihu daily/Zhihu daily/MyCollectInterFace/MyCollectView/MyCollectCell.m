//
//  MyCollectCell.m
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/11/7.
//

#import "MyCollectCell.h"
#import "Masonry.h"

#define SCREEN_SIZE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE_WIDTH [UIScreen mainScreen].bounds.size.width


@implementation MyCollectCell

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
        self.titleView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.titleView];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = [UIFont systemFontOfSize:18];
        self.titleLabel.numberOfLines = 2;
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

- (void) layoutSubviews {
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(SCREEN_SIZE_WIDTH / 4.5);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(self.titleView.mas_left).offset(-20);
        make.centerY.mas_equalTo(0);
    }];
}

@end
