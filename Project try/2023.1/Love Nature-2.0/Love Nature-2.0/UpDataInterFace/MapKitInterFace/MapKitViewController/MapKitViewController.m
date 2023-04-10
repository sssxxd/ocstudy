//
//  MapKitViewController.m
//  Find
//
//  Created by 孙旭东 on 2023/4/7.
//

#import "MapKitViewController.h"
#import "HJCAnnotion.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface MapKitViewController ()

@end

@implementation MapKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self mapView];
    [self manager];
    //请求允许访问位置
    [self.manager requestAlwaysAuthorization];
    [self.manager startUpdatingLocation];
    [self createBackItem];
    // Do any additional setup after loading the view.
}

#pragma mark Manager
//懒加载位置管理器
- (CLLocationManager *)manager
{
    if (_manager == nil) {
        _manager = [[CLLocationManager alloc] init];
        _manager.delegate = self;
        
        [_manager startUpdatingLocation];
    }
    return _manager;
}
//经纬度
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
//    CLLocation *location = locations.lastObject;
//    NSLog(@"Latitude: %f, Longitude: %f", location.coordinate.latitude, location.coordinate.longitude);
}

// 获取方向信息
- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    CLLocationDirection heading = newHeading.trueHeading;
    NSLog(@"%f", heading);
}


#pragma mark MapView
- (MKMapView *)mapView {
    if (!_mapView) {
        //当前地图跟踪模式
        CLLocationCoordinate2D center;
        center.latitude = 34.155739f;
        center.longitude = 108.905731f;
        MKCoordinateSpan span;
        span.latitudeDelta = 0.2;
        span.longitudeDelta = 0.2;
        MKCoordinateRegion region = {center, span};
        
        
        
        self.mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
        self.mapView.showsBuildings = YES;
        self.mapView.showsCompass = YES;
        self.mapView.showsScale = YES;
        self.mapView.showsTraffic = YES;
        [self.view addSubview:self.mapView];
        self.mapView.delegate = self;
        //self.mapView.showsUserLocation = YES;
        self.mapView.userTrackingMode = MKUserTrackingModeFollowWithHeading;
        [self.mapView setRegion:region];
        
        HJCAnnotion* ann1 = [[HJCAnnotion alloc ] init];
        [self.mapView addAnnotation:ann1];
        //创建手势
        //UITapGestureRecognizer *top = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addMyAnootation:)];
        //   加入地图上
        //[self.mapView addGestureRecognizer:top];
    }
    return _mapView;
}
//更新位置的时候，会触发
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"");
    //当前的坐标，反编码
    CLGeocoder *geo = [[CLGeocoder alloc] init];
    [geo reverseGeocodeLocation:userLocation.location completionHandler:^(NSArray *placemarks, NSError *error) {
        //取出标记
        CLPlacemark *pm = [placemarks lastObject];
        //赋值
        userLocation.title = pm.name;
    }];
 
}

// 设置Item
- (void) createBackItem {
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fanhui.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressBackItem)];
    
    item.tintColor = [UIColor blackColor];
    
    self.navigationItem.leftBarButtonItem = item;
}

- (void) pressBackItem {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
