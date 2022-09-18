//
//  WodeYinYueCell.m
//  WangYiYun
//
//  Created by 孙旭东 on 2022/7/25.
//

#import "WodeYinYueCell.h"

@implementation WodeYinYueCell

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
        _subtitlt.text = @"我的音乐";
        _subtitlt.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:_subtitlt];
        
        _jiantou = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jinrujiantou.png"]];
        _jiantou.frame = CGRectMake(self.bounds.size.width  + 15, 20, 20, 20);
        [self.contentView addSubview:_jiantou];
        
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.frame = CGRectMake(20, 60, self.bounds.size.width + 120, 200);
        [self.contentView addSubview:_scrollView];
        [self creatScrollView];
    }
    return self;
}

- (void) creatScrollView {
    _scrollView.contentSize = CGSizeMake(720, 200);
    _scrollView.scrollEnabled = YES;
    _scrollView.bounces = YES;
    _scrollView.alwaysBounceHorizontal = YES;
    
    for (int i = 0; i < 4; i++) {
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"P%d.jpeg", i + 1]]];
        
        UIView* view = [[UIView alloc] init];
        
        UILabel* label = [[UILabel alloc] init];
        label.frame = CGRectMake(30, 40, 90, 60);
        label.font = [UIFont systemFontOfSize:18];
        label.textColor = [UIColor whiteColor];
        label.numberOfLines = 0;
        
        if (i == 0) {
            label.text = @"我最喜欢的音乐";
        } else if (i == 1) {
            label.text = @"听点二次元";
        } else if (i == 2) {
            label.text = @"原神赛高";
        } else {
            label.text = @"重炮专辑";
        }
        
        view.frame = CGRectMake(170 * i, 0, 140, 180);
        view.backgroundColor = [UIColor blackColor];
        view.alpha  = 0.6;
        view.layer.masksToBounds = YES;
        view.layer.cornerRadius = 10;
        
        imageView.frame = CGRectMake(170 * i, 0, 140, 180);
        imageView.backgroundColor = [UIColor grayColor];
        imageView.alpha = 0.2;
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 10;
        
        [view addSubview:label];
        
        [_scrollView addSubview:view];

        [_scrollView addSubview:imageView];
    }
}

@end
