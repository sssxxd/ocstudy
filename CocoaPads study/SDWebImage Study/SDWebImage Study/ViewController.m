//
//  ViewController.m
//  SDWebImage Study
//
//  Created by 孙旭东 on 2022/10/16.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _imageView = [[UIImageView alloc] init];
    [self.view addSubview:_imageView];
    
    NSString* string = [NSString stringWithFormat:@"https://news-at.zhihu.com/api/4/news/latest"];
    string = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL* url = [NSURL URLWithString:string];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        self.dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        NSLog(@"%@", self.dict[@"stories"][0][@"images"][0]);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString* imageString = [NSString stringWithFormat:@"%@", self.dict[@"stories"][0][@"images"][0]];
            imageString = [imageString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
            NSURL* urlImage = [NSURL URLWithString:imageString];
        
            [self.imageView sd_setImageWithURL:urlImage];
            
            self.imageView.frame = CGRectMake(100, 100, 100, 100);
            
        });
    }];
    [dataTask resume];
}


@end
