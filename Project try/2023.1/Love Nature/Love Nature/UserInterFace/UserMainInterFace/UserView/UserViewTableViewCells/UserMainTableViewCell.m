//
//  UserMainTableViewCell.m
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/8.
//

#import "UserMainTableViewCell.h"
#import "Masonry.h"

@implementation UserMainTableViewCell

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
        self.userIcon = [[UIImageView alloc] init];
        [self.contentView addSubview:self.userIcon];
        
        self.userNameLabel = [[UILabel alloc] init];
        self.userNameLabel.font = [UIFont systemFontOfSize:20];
        self.userNameLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:self.userNameLabel];
        
        self.userAttentionLabel = [[UILabel alloc] init];
        self.userAttentionLabel.font = [UIFont systemFontOfSize:15];
        self.userAttentionLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:self.userAttentionLabel];
        
        self.userSignatureLabel = [[UILabel alloc] init];
        self.userSignatureLabel.font = [UIFont systemFontOfSize:15];
        self.userSignatureLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:self.userSignatureLabel];
        
        self.userSex = [[UIImageView alloc] init];
        [self.contentView addSubview:self.userSex];
        
        self.userFansLable = [[UILabel alloc] init];
        self.userFansLable.font = [UIFont systemFontOfSize:15];
        self.userFansLable.textColor = [UIColor blackColor];
        [self.contentView addSubview:self.userFansLable];
        
    }
    return self;
}

- (void) layoutSubviews {
    
    self.userIcon.layer.cornerRadius = 35;
    self.userIcon.layer.masksToBounds = YES;
    self.userIcon.userInteractionEnabled = YES;
    
    [self.userIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(10);
        make.left.mas_offset(10);
        make.height.mas_offset(70);
        make.width.mas_offset(70);
    }];
    
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(15);
        make.left.mas_equalTo(self.userIcon.mas_right).mas_offset(20);
    }];
    
    [self.userSignatureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.userIcon.mas_bottom).mas_offset(10);
        make.left.mas_offset(10);
    }];
    
    [self.userAttentionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_offset(-5);
        make.left.mas_offset(10);
    }];
    
    [self.userFansLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_offset(-5);
        make.left.mas_offset(100);
    }];
    
    self.userSignatureLabel.text = @"diuvbssfbdnvjudnsuodis";
}

@end
