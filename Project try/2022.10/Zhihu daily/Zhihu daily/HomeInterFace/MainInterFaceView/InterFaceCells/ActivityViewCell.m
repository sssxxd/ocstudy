//
//  ActivityViewCell.m
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/10/19.
//

#import "ActivityViewCell.h"
#import "Masonry.h"

@implementation ActivityViewCell

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
        self.activityView = [[UIActivityIndicatorView alloc] init];
        
        [self.contentView addSubview:self.activityView];
    }
    return self;
}

- (void) layoutSubviews  {
    self.activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleLarge;
    
    [self.activityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
}

@end
