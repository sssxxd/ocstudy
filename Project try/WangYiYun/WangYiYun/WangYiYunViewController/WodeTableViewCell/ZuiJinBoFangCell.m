//
//  ZuiJinBoFangCell.m
//  WangYiYun
//
//  Created by 孙旭东 on 2022/7/25.
//

#import "ZuiJinBoFangCell.h"

@implementation ZuiJinBoFangCell

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
        _subtitlt = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 100, 20)];
        _subtitlt.text = @"最近播放";
        _subtitlt.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:_subtitlt];
        
        _jiantou = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jinrujiantou.png"]];
        _jiantou.frame = CGRectMake(self.bounds.size.width  + 15, 20, 20, 20);
        [self.contentView addSubview:_jiantou];
        
        _genduo = [[UILabel alloc] init];
        _genduo.frame = CGRectMake(self.bounds.size.width - 10, 20, 60, 20);
        _genduo.text = @"更多";
        _genduo.font = [UIFont systemFontOfSize:15];
        _genduo.textColor = [UIColor grayColor];
        [self.contentView addSubview:_genduo];
        
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.frame = CGRectMake(0, 60, self.bounds.size.width + 100, 100);
        [self.contentView addSubview:_scrollView];
        [self createScroller];
        
        
    }
    return self;
}

- (void) createScroller {
    _scrollView.contentSize = CGSizeMake(780, 100);
    _scrollView.scrollEnabled = YES;
    _scrollView.bounces = YES;
    _scrollView.alwaysBounceHorizontal = YES;
    
    for (int i = 0; i < 3; i++) {
        UIImageView* imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"Zui0%d.jpeg", i + 1]]];
        imageview.frame = CGRectMake(20 + i * 150 + i * 100, 5, 90, 90);
        imageview.layer.masksToBounds = YES;
        imageview.layer.cornerRadius = 10;
        
        UILabel* label = [[UILabel alloc] init];
        label.frame = CGRectMake(120 + i * 150 + i * 100, 30, 150, 20);
        label.font = [UIFont systemFontOfSize:18];
        label.numberOfLines = 0;
        
        UILabel* smallLabel = [[UILabel alloc] init];
        smallLabel.frame = CGRectMake(120 + i * 150 + i * 100, 55, 150, 20);
        smallLabel.font = [UIFont systemFontOfSize:15];
        smallLabel.textColor = [UIColor grayColor];
        
        if ( i == 0) {
            label.text = @"已播放全部歌曲";
            smallLabel.text = @"300首";
        } else if (i == 1) {
            label.text = @"歌单：轻音乐";
            smallLabel.text = @"14首";
        } else {
            label.text = @"歌单：环境音";
            smallLabel.text = @"18首";
        }
        
        UIImageView* bofang = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"24gl-playCircle.png"]];
        bofang.frame = CGRectMake(24, 24, 40, 40);
        
        [imageview addSubview:bofang];
        
        [_scrollView addSubview:smallLabel];
        
        [_scrollView addSubview:label];
        
        [_scrollView addSubview:imageview];
    }
}

@end
