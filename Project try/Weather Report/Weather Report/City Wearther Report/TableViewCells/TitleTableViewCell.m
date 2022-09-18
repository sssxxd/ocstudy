//
//  TitleTableViewCell.m
//  Weather Report
//
//  Created by 孙旭东 on 2022/8/12.
//

#import "TitleTableViewCell.h"

@implementation TitleTableViewCell

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

        _cityName = [[UILabel alloc] initWithFrame:CGRectMake(125, 30, 150, 60)];
        _weather = [[UILabel alloc] initWithFrame:CGRectMake(160, 85, 80, 30)];
        _tem = [[UILabel alloc] initWithFrame:CGRectMake(100, 130, 200, 100)];
        _week = [[UILabel alloc] initWithFrame:CGRectMake(20, 280, 80, 30)];
        _day = [[UILabel alloc] initWithFrame:CGRectMake(120, 290, 60, 20)];
        _tem1 = [[UILabel alloc] initWithFrame:CGRectMake(300, 290, 40, 20)];
        _tem2 = [[UILabel alloc] initWithFrame:CGRectMake(350, 290, 40, 20)];
        
        _cityName.textAlignment = NSTextAlignmentCenter;
        _weather.textAlignment = NSTextAlignmentCenter;
        _tem.textAlignment = NSTextAlignmentCenter;
        
        _cityName.font = [UIFont systemFontOfSize:40];
        _tem.font = [UIFont systemFontOfSize:80];
        _week.font = [UIFont systemFontOfSize:25];
        _day.font = [UIFont systemFontOfSize:18];
        _week.font = [UIFont systemFontOfSize:18];
        _tem1.font = [UIFont systemFontOfSize:18];
        _tem2.font = [UIFont systemFontOfSize:18];
        
        _cityName.textColor = [UIColor whiteColor];
        _weather.textColor = [UIColor whiteColor];
        _tem.textColor = [UIColor whiteColor];
        _week.textColor = [UIColor whiteColor];
        _day.textColor = [UIColor whiteColor];
        _tem1.textColor = [UIColor whiteColor];
        _tem2.textColor = [UIColor grayColor];
        
        [self.contentView addSubview:_cityName];
        [self.contentView addSubview:_weather];
        [self.contentView addSubview:_tem];
        [self.contentView addSubview:_week];
        [self.contentView addSubview:_day];
        [self.contentView addSubview:_tem1];
        [self.contentView addSubview:_tem2];
        
    }
    return self;
}

- (void) setDictionary:(NSDictionary *)dictionary {
    _dictionary = dictionary;
    
    NSDictionary* data = _dictionary[@"data"][0];
    
    _cityName.text = _dictionary[@"city"];
    _weather.text = data[@"wea_day"];
    _tem.text = data[@"tem"];
    _week.text = data[@"week"];
    _day.text = @"今天";
    _tem1.text = data[@"tem1"];
    _tem2.text = data[@"tem2"];
}

@end
