//
//  HJCAnnotion.m
//  Find
//
//  Created by 孙旭东 on 2023/4/7.
//

#import "HJCAnnotion.h"

@implementation HJCAnnotion
- (CLLocationCoordinate2D) coordinate {
    CLLocationCoordinate2D center;
    center.latitude = 34.155739f;
    center.longitude = 108.905731f;
    return center;
}
- (NSString*)title {
    return @"西安邮电大学";
}
- (NSString*)suntitke {
    return @"长安校区西区";
}
@end
