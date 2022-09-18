//
//  SelectTableViewCell.m
//  Weather Report
//
//  Created by 孙旭东 on 2022/8/11.
//

#import "SelectTableViewCell.h"

@implementation SelectTableViewCell

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
        _backImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 120)];
        [self.contentView addSubview:_backImage];
        
        _time = [[UILabel alloc] initWithFrame:CGRectMake(30, 20, 60, 20)];
        _time.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:_time];
        
        _cityName = [[UILabel alloc] initWithFrame:CGRectMake(30, 50, 200, 50)];
        _cityName.font = [UIFont systemFontOfSize:30];
        [self.contentView addSubview:_cityName];
        
        _tem = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width - 30, 20, 60, 60)];
        _tem.font = [UIFont systemFontOfSize:45];
        [self.contentView addSubview:_tem];
    }
    return self;
}

- (void) setCityID:(NSString *)cityID {
    _cityID = cityID;
    
    NSString* urlString = [NSString stringWithFormat:@"https://v0.yiketianqi.com/api?appid=17628316&appsecret=QrgKcZ8B&version=v62&cityid=%@&unescape=1", cityID];
    
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL* url = [NSURL URLWithString:urlString];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    NSURLSession* session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionTask* dataTask = [session dataTaskWithRequest:request];
    
    [dataTask resume];
}

- (void) URLSession:(NSURLSession*)session dataTask:(nonnull NSURLSessionDataTask *)dataTask didReceiveResponse:(nonnull NSURLResponse *)response completionHandler:(nonnull void (^)(NSURLSessionResponseDisposition))completionHandler {
    
    if (self.data == nil) {
        self.data = [[NSMutableData alloc] init];
    } else {
        self.data.length = 0;
    }
    
    completionHandler(NSURLSessionResponseAllow);
}

- (void) URLSession:(NSURLSession*)session dataTask:(nonnull NSURLSessionDataTask *)dataTask didReceiveData:(nonnull NSData *)data {
    
    [self.data appendData:data];
}

- (void) URLSession:(NSURLSession*)session task:(nonnull NSURLSessionTask *)task didCompleteWithError:(nullable NSError *)error {
    
    if (error == nil) {
        // 解析数据
        NSDictionary* Dictionary = [NSJSONSerialization JSONObjectWithData:self.data options:kNilOptions error:nil];
        
        // 传入数据
        self.time.text = Dictionary[@"update_time"];
        self.cityName.text = Dictionary[@"city"];
        self.tem.text = Dictionary[@"tem"];
        
        // 处理背景图片
        NSString* weatherString = [NSString stringWithFormat:@"%@_img.jpeg", Dictionary[@"wea_img"]];
        UIImage* weatherImage = [UIImage imageNamed:weatherString];
        [self.backImage setImage:weatherImage];
    }
}

@end
