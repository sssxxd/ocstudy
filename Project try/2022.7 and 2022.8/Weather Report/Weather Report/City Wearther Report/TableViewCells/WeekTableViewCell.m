//
//  WeekTableViewCell.m
//  Weather Report
//
//  Created by 孙旭东 on 2022/8/12.
//

#import "WeekTableViewCell.h"

@implementation WeekTableViewCell

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
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300)];
        _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 360);
        _scrollView.bounces = YES;
        _scrollView.alwaysBounceVertical = YES;
        _scrollView.alwaysBounceHorizontal = NO;
        _scrollView.scrollEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        
        [self.contentView addSubview:_scrollView];
    }
    return self;
}

- (void) setDataArry:(NSArray *)dataArry {
    _dataArry = dataArry;
    
    for (int index = 0; index < dataArry.count; index++) {
        UILabel* week = [[UILabel alloc] initWithFrame:CGRectMake(20, 10 + 50 * index, 100, 40)];
        UILabel* tem1 = [[UILabel alloc] initWithFrame:CGRectMake(320, 10 + 50 * index, 40, 20)];
        UILabel* tem2 = [[UILabel alloc] initWithFrame:CGRectMake(360, 10 + 50 * index, 40, 20)];
        
        week.font = [UIFont systemFontOfSize:25];
        tem1.font = [UIFont systemFontOfSize:20];
        tem2.font = [UIFont systemFontOfSize:20];
        
        week.textColor = [UIColor whiteColor];
        tem1.textColor = [UIColor whiteColor];
        tem2.textColor = [UIColor grayColor];
        
        week.text = dataArry[index][@"week"];
        tem1.text = dataArry[index][@"tem1"];
        tem2.text = dataArry[index][@"tem2"];

        NSString* weatherString = [NSString stringWithFormat:@"%@.png", dataArry[index][@"wea_img"]];
        UIImage* weatherImage = [UIImage imageNamed:weatherString];
        UIImageView* weatherImageView = [[UIImageView alloc] initWithImage:weatherImage];
        weatherImageView.frame = CGRectMake(190, 10 + 50 * index, 40, 20);
        
        [_scrollView addSubview:week];
        [_scrollView addSubview:tem1];
        [_scrollView addSubview:tem2];
        [_scrollView addSubview:weatherImageView];
    }
}

@end
