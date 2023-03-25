//
//  UserEditUserInfoIconTableViewCell.m
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/12.
//

#import "UserEditUserInfoIconTableViewCell.h"

// 引入第三方库
#import "Masonry.h"

// 引入工具类
#import "LNManager.h"

// 预定义屏幕款
#define KSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface UserEditUserInfoIconTableViewCell ()

@property (nonatomic, strong) UILabel* titleLabel;

@end

@implementation UserEditUserInfoIconTableViewCell

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
        [self.contentView addSubview:self.titleLabel];

        [self layoutOfMasonry];
    }
     return self;
}

- (void) layoutIfNeeded {
    [super layoutIfNeeded];

}


- (void) layoutOfMasonry {
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(8);
        make.left.mas_offset(20);
    }];
}


#pragma mark - 懒加载
- (UILabel*) titleLabel {
    if (_titleLabel == nil) {
        self.titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:18];
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

@end
