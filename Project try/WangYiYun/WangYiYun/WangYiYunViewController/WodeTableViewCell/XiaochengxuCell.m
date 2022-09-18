//
//  XiaochengxuCell.m
//  WangYiYun
//
//  Created by 孙旭东 on 2022/7/25.
//

#import "XiaochengxuCell.h"

@implementation XiaochengxuCell

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
        for (int i = 0; i < 4; i++) {
            UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            UILabel* label = [[UILabel alloc] init];
            
            button.frame = CGRectMake(i * 105 + 20, 20, 40, 40);
            label.frame = CGRectMake(i * 100 + 10, 70, 90, 20);
            
            label.font = [UIFont systemFontOfSize:16];
            
            button.tintColor = [UIColor redColor];
            
            [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"Xiao0%d", i +  1]] forState:UIControlStateNormal];
            if (i == 0) {
                label.text = @"本地音乐";
            } else if (i == 1) {
                label.text = @"我的电台";
            } else if (i == 2) {
                label.text = @"我的收藏";
            } else {
                label.text = @"关于新歌";
            }
            label.textColor = [UIColor whiteColor];

            
            [self.contentView addSubview:button];
            [self.contentView addSubview:label];
        }
    }
    self.backgroundColor = [UIColor blackColor];
    
    return self;
}

@end
