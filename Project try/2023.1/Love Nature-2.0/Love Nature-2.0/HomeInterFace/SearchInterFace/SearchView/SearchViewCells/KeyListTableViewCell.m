//
//  KeyListTableViewCell.m
//  Find
//
//  Created by 孙旭东 on 2023/3/29.
//

#import "KeyListTableViewCell.h"

// 引入第三方库
#import "Masonry.h"

// 引入模型类
#import "SearchModel.h"

// 引入工具类
#import "LNManager.h"

@interface KeyListTableViewCell ()

@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UIImageView* mainImageView;
@property (nonatomic, strong) UIView* detailsView;

@property (nonatomic, assign) CGFloat mainImageViewWitdth;
@end

@implementation KeyListTableViewCell

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
        self.mainImageViewWitdth = [UIScreen mainScreen].bounds.size.width / 5;
        
        [self.mainImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(20);
            make.centerY.equalTo(self.contentView);
            make.size.mas_offset(self.mainImageViewWitdth);
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mainImageView).mas_offset(20);
            make.top.equalTo(self.mainImageView);
            make.right.mas_offset(-20);
        }];
        
        [self layoutIfNeeded];
    }
    return self;
}

- (void) layoutIfNeeded {
    [super layoutIfNeeded];
    
    [[LNManager shareLNManager] useImageURLString:self.dataModel.image setImageVIew:self.mainImageView];
    
    self.titleLabel.text = self.dataModel.name;
}

#pragma mark - 懒加载
- (UILabel*) titleLabel {
    if (_titleLabel == nil) {
        self.titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:18];
        
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UIImageView*) mainImageView {
    if (_mainImageView == nil) {
        self.mainImageView = [[UIImageView alloc] init];
        
        [self.contentView addSubview:_mainImageView];
    }
    return _mainImageView;
}

- (UIView*) detailsView {
    if (_detailsView == nil) {
        self.detailsView = [[UIView alloc] init];
        
        [self.contentView addSubview:_detailsView];
    }
    return _detailsView;
}

@end
