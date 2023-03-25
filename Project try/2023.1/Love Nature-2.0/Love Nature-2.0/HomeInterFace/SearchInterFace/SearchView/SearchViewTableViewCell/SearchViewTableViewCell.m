//
//  SearchViewTableViewCell.m
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/6.
//

#import "SearchViewTableViewCell.h"

// 引入工具类
#import "LNManager.h"

// 引入第三方库
#import "Masonry.h"

// 预定义屏幕宽
#define KSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface SearchViewTableViewCell ()
@property (nonatomic, strong) UIImageView* petImageView;
@end

@implementation SearchViewTableViewCell

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
        self.petImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_petImageView];
        
        self.nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:22];
        _nameLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_nameLabel];
    }
    return self;
}

- (void)layoutSubviews {
    NSString* urlString = [NSString stringWithFormat:@"http://rphxbyqwg.hd-bkt.clouddn.com/%@", _imageString];
    
    [[LNManager shareLNManager] useImageURLString:urlString setImageVIew:_petImageView];
    
    [_petImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(20);
        make.left.mas_offset(20);
        make.size.mas_offset(KSCREEN_WIDTH/6);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(25);
        make.left.mas_equalTo(_petImageView.mas_right).mas_offset(20);
    }];
}

@end
