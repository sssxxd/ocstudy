//
//  LNManager+SetWebImage.m
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/1/31.
//

#import "LNManager+SetWebImage.h"
#import "UIImageView+WebCache.h"


@implementation LNManager (SetWebImage)
- (void) useImageURLString:(NSString *)urlString setImageVIew:(UIImageView *)imageView {
    
    NSString* string = [NSString stringWithFormat:@"http://rsbdaunui.hd-bkt.clouddn.com/%@", urlString];
    
    string = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL* url = [NSURL URLWithString:string];
    
    [imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"userIconPlaceholder.jpg"]];
}
@end
