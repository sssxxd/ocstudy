//
//  HoursTableViewCell.m
//  Weather Report
//
//  Created by 孙旭东 on 2022/8/12.
//

#import "HoursTableViewCell.h"

@implementation HoursTableViewCell

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
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150)];
        _scrollView.contentSize = CGSizeMake(1200, 150);
        _scrollView.bounces = YES;
        _scrollView.alwaysBounceVertical = NO;
        _scrollView.scrollEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        
        [self.contentView addSubview:_scrollView];
    }
    return self;
}

- (void) setHoursArray:(NSArray *)hoursArray {
    _hoursArray = hoursArray;
    
    for (int index = 0; index < hoursArray.count; index++) {
        
        NSString* weatherString = [NSString stringWithFormat:@"%@.png", hoursArray[index][@"wea_img"]];
        UIImage* weatherImage = [UIImage imageNamed:weatherString];
        UIImageView* weatherImageView = [[UIImageView alloc] initWithImage:weatherImage];
        weatherImageView.frame = CGRectMake(20 + 100 * index, 40, 80, 60);
        
        UILabel* hour = [[UILabel alloc] initWithFrame:CGRectMake(20 + 100 * index, 10, 80, 20)];
        UILabel* tem = [[UILabel alloc] initWithFrame:CGRectMake(20 + 100 * index, 120, 80, 20)];
        
        hour.textColor = [UIColor whiteColor];
        tem.textColor = [UIColor whiteColor];
        
        hour.textAlignment = NSTextAlignmentCenter;
        tem.textAlignment = NSTextAlignmentCenter;
        
        tem.font = [UIFont systemFontOfSize:18];
        
        hour.text = hoursArray[index][@"hours"];
        tem.text = hoursArray[index][@"tem"];
        
        [_scrollView addSubview:weatherImageView];
        [_scrollView addSubview:hour];
        [_scrollView addSubview:tem];
    }
}

@end
