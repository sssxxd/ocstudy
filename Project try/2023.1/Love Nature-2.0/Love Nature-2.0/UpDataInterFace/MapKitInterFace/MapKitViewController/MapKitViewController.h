//
//  MapKitViewController.h
//  Find
//
//  Created by 孙旭东 on 2023/4/7.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString *const MapKitViewControllerOkItemPressed;

@interface MapKitViewController : UIViewController
<MKMapViewDelegate, CLLocationManagerDelegate>
@property (strong, nonatomic) MKMapView *mapView;
@property (nonatomic, strong) CLLocationManager *manager;

@end

NS_ASSUME_NONNULL_END
