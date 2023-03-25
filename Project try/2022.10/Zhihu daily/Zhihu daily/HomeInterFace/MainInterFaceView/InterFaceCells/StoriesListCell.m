//
//  StoriesListCell.m
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/10/18.
//

#import "StoriesListCell.h"
#import "Masonry.h"

#define SCREEN_SIZE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation StoriesListCell

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
        
        self.titleLable = [[UILabel alloc] init];
        self.titleLable.font = [UIFont systemFontOfSize:18];
        self.titleLable.numberOfLines = 2;
        [self.contentView addSubview:self.titleLable];
        
        self.hintLable = [[UILabel alloc] init];
        self.hintLable.font = [UIFont systemFontOfSize:14];
        self.hintLable.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.hintLable];
    }
    return self;
}

- (void) layoutSubviews {
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(20);
        make.size.mas_equalTo(SCREEN_SIZE_WIDTH / 4.5);
    }];
    
    [self.hintLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.bottom.mas_equalTo(-22);
        make.width.mas_equalTo(SCREEN_SIZE_WIDTH * 0.68);
    }];
    
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.bottom.equalTo(self.hintLable).offset(-23);
//        make.top.mas_equalTo(30);
        make.width.mas_equalTo(SCREEN_SIZE_WIDTH * 0.68);
    }];
}

@end
