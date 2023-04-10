//
//  HJCAnnotion.h
//  Find
//
//  Created by 孙旭东 on 2023/4/7.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface HJCAnnotion : NSObject
<MKAnnotation>

//位置(必选)
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
//标题（可选）
@property (nonatomic, copy) NSString *title;
//子标题（可选）
@property (nonatomic, copy) NSString *subtitle;

@end

NS_ASSUME_NONNULL_END
