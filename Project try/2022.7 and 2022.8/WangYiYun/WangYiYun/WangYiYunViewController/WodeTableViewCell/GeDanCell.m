//
//  GeDanCell.m
//  WangYiYun
//
//  Created by 孙旭东 on 2022/7/25.
//

#import "GeDanCell.h"

@implementation GeDanCell

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
        _buttonCreate = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_buttonCreate setTitle:@"创建歌单" forState:UIControlStateNormal];
        _buttonCreate.frame = CGRectMake(110, 20, 80, 25);
        _buttonCreate.tintColor = [UIColor blackColor];
        [_buttonCreate addTarget:self action:@selector(pressCreate) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_buttonCreate];
        
        _buttonShouCang = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_buttonShouCang setTitle:@"收藏歌单" forState:UIControlStateNormal];
        _buttonShouCang.frame = CGRectMake(20, 20, 80, 25);
        _buttonShouCang.tintColor = [UIColor blackColor];
        [_buttonShouCang addTarget:self action:@selector(pressShouCang) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_buttonShouCang];
        
        _buttonGeShou = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_buttonGeShou setTitle:@"歌手歌单" forState:UIControlStateNormal];
        _buttonGeShou.frame = CGRectMake(200, 20, 80, 25);
        _buttonGeShou.tintColor = [UIColor blackColor];
        [_buttonGeShou addTarget:self action:@selector(pressGeShou) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_buttonGeShou];
        
        _jiantou = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jinrujiantou.png"]];
        _jiantou.frame = CGRectMake(self.bounds.size.width  + 15, 22, 20, 20);
        [self.contentView addSubview:_jiantou];
        
        _addView = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_addView setImage:[UIImage imageNamed:@"jiahao.png"] forState:UIControlStateNormal];
        _addView.frame = CGRectMake(self.bounds.size.width, 22, 20, 20);
        _addView.tintColor = [UIColor blackColor];
        [self.contentView addSubview:_addView];
        
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.frame = CGRectMake(0, 55, self.bounds.size.width + 100, 250);
        [self createScrollView];
        [self.contentView addSubview:_scrollView];
    }
    return self;
}

- (void) createScrollView {
    _scrollView.contentSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width + 20) * 3, 250);
    _scrollView.bounces = YES;
    // 是否按照整页滚动视图
    _scrollView.pagingEnabled = YES;
    // 是否可以开启滚动效果
    _scrollView.scrollEnabled = YES;
    _scrollView.alwaysBounceHorizontal = YES;
    _scrollView.showsHorizontalScrollIndicator = YES;
    
    for (int i = 0; i < 3; i++) {
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width + 15) * i, 0, [UIScreen mainScreen].bounds.size.width + 15, 250)];
        for (int j = 0; j < 3; j++) {
            NSString* imageName = [NSString stringWithFormat:@"GeDan%d %d.jpeg", i, j];
            if (imageName != nil) {
                UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
                imageView.frame = CGRectMake((20) + 180 * (j % 2), 100 * (j / 2), 90, 90);
                [view addSubview:imageView];
                imageView.layer.masksToBounds = YES;
                imageView.layer.cornerRadius = 10;
                
                UILabel* GeDanName = [[UILabel alloc] initWithFrame:CGRectMake(120 + 180 * (j % 2), 15 + 100 * (j / 2), 90, 40)];
                [view addSubview:GeDanName];
                GeDanName.font = [UIFont systemFontOfSize:18];
                GeDanName.numberOfLines = 0;
                
                UILabel* smallLabel = [[UILabel alloc] init];
                smallLabel.frame = CGRectMake(120 + 180 * (j % 2), 55 + 100 * (j / 2), 90, 20);
                [view addSubview:smallLabel];
                smallLabel.font = [UIFont systemFontOfSize:15];
                smallLabel.textColor = [UIColor grayColor];
                
                if (i == 0) {
                    if (j == 0) {
                        GeDanName.text = @"奥特曼";
                        smallLabel.text = @"98首";
                    } else if (j == 1) {
                        GeDanName.text = @"轻音乐";
                        smallLabel.text = @"14首";
                    } else {
                        GeDanName.text = @"环境音";
                        smallLabel.text = @"18首";
                    }
                } else if (i == 1) {
                    if (j == 0) {
                        GeDanName.text = @"原神";
                        smallLabel.text = @"28首";
                    } else if (j == 1) {
                        GeDanName.text = @"洛天依";
                        smallLabel.text = @"104首";
                    } else {
                        GeDanName.text = @"少女歌剧";
                        smallLabel.text = @"12首";
                    }
                } else {
                    if (j == 0) {
                        GeDanName.text = @"八爷";
                        smallLabel.text = @"88首";
                    } else if (j == 1) {
                        GeDanName.text = @"周杰伦";
                        smallLabel.text = @"228首";
                    } else {
                        
                    }
                }
            }
        }
        [_scrollView addSubview:view];
    }
}

- (void) pressCreate {
    [_scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width, 0) animated:YES];
}

- (void) pressShouCang {
    [_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}

- (void) pressGeShou {
    [_scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width * 2 + 20, 0) animated:YES];
}

@end
