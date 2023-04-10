//
//  UpDataSelectViewController.m
//  Find
//
//  Created by 孙旭东 on 2023/3/29.
//

#import "UpDataSelectViewController.h"

// 引入视图类
#import "UpDataSelecytView.h"

// 引入框架
#import <Photos/Photos.h>

// 全局变量
extern NSString *const UpDataSelecytViewCountMax;

NSString *const UpDataSelectViewControllerSelectImageOK = @"UpDataSelectViewControllerSelectImageOK";


@interface UpDataSelectViewController ()

@property (nonatomic, strong) NSArray<PHAsset*>* assets;

@property (nonatomic, strong) UpDataSelecytView* upDataSelectView;

@end

@implementation UpDataSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createBackItem];
    [self createOKItem];
    
    if (self.imageArray == nil) {
        dispatch_group_t group = dispatch_group_create();
        
        dispatch_group_enter(group);
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            switch (status) {
                case PHAuthorizationStatusAuthorized:
                    // 用户已授权，可以访问相册或照片库数据
                    // 在此添加相关操作代码
                    self.assets = [self getAllAssetInPhotoAblumWithAscending:YES];
                    self.imageArray = [self analysisAssets:self.assets];
                    dispatch_group_leave(group);
                    break;
                case PHAuthorizationStatusDenied:
                case PHAuthorizationStatusRestricted:
                    // 用户已拒绝或受限制，无法访问相册或照片库数据
                    // 在此添加相关操作代码
                    dispatch_group_leave(group);
                    break;
                case PHAuthorizationStatusNotDetermined:
                    // 用户尚未做出选择，可以继续请求授权
                    // 在此添加相关操作代码
                    dispatch_group_leave(group);
                    break;
                default:
                    dispatch_group_leave(group);
                    break;
            }
        }];
        
        
        dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                self.upDataSelectView.imageArray = self.imageArray;
                self.upDataSelectView.imageSelectedSet = self.imageSelectedSet;
                [self.view addSubview:self.upDataSelectView];
                [self.upDataSelectView layoutImageView];
            });
        });
    } else {
        self.upDataSelectView.imageArray = self.imageArray;
        self.upDataSelectView.imageSelectedSet = self.imageSelectedSet;
        [self.view addSubview:self.upDataSelectView];
        [self.upDataSelectView layoutImageView];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(imageCountMax) name:UpDataSelecytViewCountMax object:nil];
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSArray<PHAsset *> *) getAllAssetInPhotoAblumWithAscending:(BOOL)ascending {
    NSMutableArray<PHAsset*>* assets = [[NSMutableArray alloc] init];
    
    PHFetchOptions* option = [[PHFetchOptions alloc] init];
    
    option.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:ascending]];
    
    PHFetchResult* result = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:option];
    
    [result  enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        PHAsset* asset = (PHAsset*)obj;

        [assets addObject:asset];
    }];
    
    return assets;
}

- (NSArray*) analysisAssets:(NSArray<PHAsset*>*)assets {
    NSMutableArray * imageArray = [[NSMutableArray alloc] init];
    
    PHImageRequestOptions* option = [[PHImageRequestOptions alloc] init];
    
    option.resizeMode = PHImageRequestOptionsResizeModeFast;
    option.networkAccessAllowed = YES;
    
    CGFloat size = ([UIScreen mainScreen].bounds.size.width - 40) / 3;
    
    for (PHAsset* asset in assets) {
        [[PHCachingImageManager defaultManager] requestImageForAsset:asset targetSize:CGSizeMake(size, size) contentMode:PHImageContentModeAspectFill options:option resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
            
            [imageArray addObject:result];
        }];
    }
    return imageArray;
}


- (void) pressBackItem {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) pressOKItem {
    self.imageSelectedSet = self.upDataSelectView.imageSelectedSet;
    [[NSNotificationCenter defaultCenter] postNotificationName:UpDataSelectViewControllerSelectImageOK object:nil userInfo:@{@"imageSelectedSet":self.imageSelectedSet,@"allImageArray":self.imageArray}];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) imageCountMax {
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"最多选择5张照片" message:nil preferredStyle:UIAlertControllerStyleAlert];
     
     [self presentViewController:alertController animated:YES completion:nil];
     
     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [UIView animateWithDuration:1.0 animations:^{
             alertController.view.alpha = 0.3;
         } completion:^(BOOL finished) {
             [alertController dismissViewControllerAnimated:YES completion:nil];
         }];
     });
}

#pragma mark - 懒加载
// 设置Item
- (void) createBackItem {
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fanhui.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressBackItem)];
    
    item.tintColor = [UIColor blackColor];
    
    self.navigationItem.leftBarButtonItem = item;
}

- (void) createOKItem {
    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 35)];
    customView.backgroundColor = [UIColor colorWithRed:0.165f green:0.510f blue:0.895f alpha:1];
    customView.layer.cornerRadius = 8;
    customView.layer.masksToBounds = YES;
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, 60, 35);
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    [button addTarget:self action:@selector(pressOKItem) forControlEvents:UIControlEventTouchUpInside];
    
    [customView addSubview:button];
    
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithCustomView:customView];
    self.navigationItem.rightBarButtonItem = item;
}

- (UpDataSelecytView*) upDataSelectView {
    if (_upDataSelectView == nil) {
        self.upDataSelectView = [[UpDataSelecytView alloc] initWithFrame:self.view.frame];
    }
    return _upDataSelectView;
}

@end
