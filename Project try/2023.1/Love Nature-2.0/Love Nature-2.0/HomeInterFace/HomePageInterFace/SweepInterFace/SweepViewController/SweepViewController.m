//
//  SweepViewController.m
//  Find
//
//  Created by 孙旭东 on 2023/4/12.
//

#import "SweepViewController.h"

#define kDeviceVersion [[UIDevice currentDevice].systemVersion floatValue]

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kNavbarHeight ((kDeviceVersion>=7.0)? 64 :44 )

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define kSCREEN_MAX_LENGTH (MAX(kScreenWidth, kScreenHeight))
#define kSCREEN_MIN_LENGTH (MIN(kScreenWidth, kScreenHeight))

#define IS_IPHONE4 (IS_IPHONE && kSCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE5 (IS_IPHONE && kSCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE6 (IS_IPHONE && kSCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE6P (IS_IPHONE && kSCREEN_MAX_LENGTH == 736.0)

@import AVFoundation;

@interface SweepViewController ()
<AVCaptureMetadataOutputObjectsDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate> {
    UILabel * introLab;
    BOOL isLightOn;
    UIButton *mineQRCode;
    UIButton *theLightBtn;
    BOOL hasTheVC;
    BOOL isFirst;
    BOOL upOrdown;
    int num;
    AVCaptureVideoPreviewLayer *preView;
    AVCaptureDevice *captureDevice;
    NSTimer * timer;
}

@property (nonatomic,strong) AVCaptureSession *session;
@property (nonatomic,weak) AVCaptureMetadataOutput *output;
@property (nonatomic,retain) UIImageView *lineIV;


@end

@implementation SweepViewController

-(void)initUI{
    isFirst=YES;
    upOrdown = NO;
    num =0;
}
- (void)startSessionRightNow:(NSNotification*)notification {
    [self creatTimer];
    [_session startRunning];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if(isFirst)
    {
        [self creatTimer];
        [_session startRunning];
    }
    isFirst=NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self deleteTimer];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"startSession" object:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

#pragma mark - 删除timer
- (void)deleteTimer
{
    if (timer) {
        [timer invalidate];
        timer=nil;
    }
}
#pragma mark - 创建timer
- (void)creatTimer
{
    if (!timer) {
        timer=[NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(animation) userInfo:nil repeats:YES];
    }
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(startSessionRightNow:) name:@"startSession" object:nil];
    if (!isFirst) {
        [self creatTimer];
        [_session startRunning];
    }
}
- (void)viewDidLoad {
    self.navigationItem.title = @"扫一扫";
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    [super viewDidLoad];
    
    [self initUI];
    [self setupDevice];
    [self createBackItem];
}
-(void)setupDevice{
//    //1.初始化捕捉设备（AVCaptureDevice），类型为AVMediaTypeVideo
//    captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
//
//    NSError *error;
//    //2.用captureDevice创建输入流input
//    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
////    if (!input) {
////        NSLog(@"%@", [error localizedDescription]);
////        return ;
////    }
//
//    //创建会话
//    _session = [[AVCaptureSession alloc] init];
//    [_session setSessionPreset:AVCaptureSessionPresetHigh];
//
//    if ([_session canAddInput:input]) {
//        [_session addInput:input];
//    }
//
//    //预览视图
//    preView = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_session];
//    //设置预览图层填充方式
//    [preView setVideoGravity:AVLayerVideoGravityResizeAspectFill];
//    [preView setFrame:self.view.layer.bounds];
//
//    [self.view.layer addSublayer:preView];
//
//
//    //输出
//    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
//    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
//    if ([_session canAddOutput:output]) {
//        [_session addOutput:output];
//    }
//    self.output = output;
//    //设置扫描范围
//    output.rectOfInterest = CGRectMake(0.25,(kScreenWidth - self.view.layer.bounds.size.width * 0.7)/2/self.view.layer.bounds.size.width,  self.view.layer.bounds.size.width * 0.7/self.view.layer.bounds.size.height,(self.view.layer.bounds.size.width * 0.7)/self.view.layer.bounds.size.width);
//
//    NSArray *arrTypes = output.availableMetadataObjectTypes;
//    NSLog(@"%@",arrTypes);
//
//    if ([_output.availableMetadataObjectTypes containsObject:AVMetadataObjectTypeQRCode] || [_output.availableMetadataObjectTypes containsObject:AVMetadataObjectTypeCode128Code]) {
//        _output.metadataObjectTypes = @[AVMetadataObjectTypeQRCode];
//        // [_session startRunning];
//    } else {
//        [_session stopRunning];
//        //        rightButton.enabled = NO;
//        UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"抱歉!" message:@"相机权限被拒绝，请前往设置-隐私-相机启用此应用的相机权限。" preferredStyle:UIAlertControllerStyleAlert];
//
//        UIAlertAction* action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
//
//        [alertController addAction:action];
//
////        return;
//    }
    UIView *drawView = [[UIView alloc]initWithFrame:self.view.bounds];
    drawView.backgroundColor = [UIColor blackColor];
    drawView.alpha = 0.5;
    [self.view addSubview:drawView];
    //选定一块区域,设置不同的透明度
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0,  self.view.bounds.size.width,  self.view.bounds.size.height)];
    [path appendPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake((kScreenWidth - self.view.layer.bounds.size.width * 0.7)/2, self.view.layer.bounds.size.height * 0.25, self.view.layer.bounds.size.width * 0.7,self.view.layer.bounds.size.width * 0.7) cornerRadius:0] bezierPathByReversingPath]];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    [drawView.layer setMask:shapeLayer];
    UIImageView *codeFrame = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth - self.view.layer.bounds.size.width * 0.7)/2, self.view.layer.bounds.size.height * 0.25,  self.view.layer.bounds.size.width * 0.7, self.view.layer.bounds.size.width * 0.7)];
    codeFrame.contentMode = UIViewContentModeScaleAspectFit;
    //NSString *name = [@"Resource.bundle" stringByAppendingPathComponent:@"codeframe"];
    
    [codeFrame setImage:[UIImage imageNamed:@"codeframe.png"]];
    [self.view addSubview:codeFrame];
    
    introLab = [[UILabel alloc] initWithFrame:CGRectMake(preView.frame.origin.x, preView.frame.origin.y + preView.frame.size.height, preView.frame.size.width, 40)];
    introLab.numberOfLines = 1;
    introLab.textAlignment = NSTextAlignmentCenter;
    introLab.textColor = [UIColor whiteColor];
    introLab.adjustsFontSizeToFitWidth = YES;
    introLab.text = @"将二维码/条码放入框内，即可自动扫描";
    [self.view addSubview:introLab];
    
    //我的二维码按钮
    mineQRCode = [UIButton buttonWithType:UIButtonTypeCustom];
    mineQRCode.frame = CGRectMake(self.view.frame.size.width / 2 - 100 / 2, introLab.frame.origin.y+introLab.frame.size.height - 5, 100, introLab.frame.size.height);
    [mineQRCode setTitle:@"我的二维码" forState:UIControlStateNormal];
    [mineQRCode setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [mineQRCode addTarget:self action:@selector(showTheQRCodeOfMine:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mineQRCode];
    mineQRCode.hidden = YES;
    
    //theLightBtn
    theLightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    theLightBtn.frame = CGRectMake(self.view.frame.size.width / 2 - 100 / 2, mineQRCode.frame.origin.y + mineQRCode.frame.size.height + 20, 100, introLab.frame.size.height);
    
    [theLightBtn setImage:[UIImage imageNamed:@"light.png"] forState:UIControlStateNormal];
    [theLightBtn setImage:[UIImage imageNamed:@"lighton.png"] forState:UIControlStateSelected];
    [theLightBtn addTarget:self action:@selector(lightOnOrOff:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:theLightBtn];
    
    if (![captureDevice isTorchAvailable]) {
        theLightBtn.hidden = YES;
    }
    // Start
    _lineIV = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth - self.view.layer.bounds.size.width * 0.7)/2,self.view.layer.bounds.size.height * 0.25 , self.view.layer.bounds.size.width * 0.7, 5)];
    //NSString *lineName = [@"Resource.bundle" stringByAppendingPathComponent:@"line"];
    
    _lineIV.image = [UIImage imageNamed:@"line.png"];
    [self.view addSubview:_lineIV];
    
    
    //开始扫描
    [_session startRunning];
}
//手电筒🔦的开和关
- (void)lightOnOrOff:(UIButton *)sender {
    sender.selected = !sender.selected;
    isLightOn = 1 - isLightOn;
    if (isLightOn) {
        [self turnOnLed:YES];
    }
    else {
        [self turnOffLed:YES];
    }
}

//打开手电筒
- (void) turnOnLed:(bool)update {
    [captureDevice lockForConfiguration:nil];
    [captureDevice setTorchMode:AVCaptureTorchModeOn];
    [captureDevice unlockForConfiguration];
}
//关闭手电筒
- (void) turnOffLed:(bool)update {
    [captureDevice lockForConfiguration:nil];
    [captureDevice setTorchMode: AVCaptureTorchModeOff];
    [captureDevice unlockForConfiguration];
}
- (void)showTheQRCodeOfMine:(UIButton *)sender {
    NSLog(@"showTheQRCodeOfMine");
}
- (void)animation {
    
    if (upOrdown == NO) {
        num ++;
        _lineIV.frame = CGRectMake((kScreenWidth - self.view.layer.bounds.size.width * 0.7)/2,self.view.layer.bounds.size.height * 0.25+ 2 * num, self.view.layer.bounds.size.width * 0.7, 5);
        if (IS_IPHONE5||IS_IPHONE4) {
            NSLog(@"%f",(int)self.view.frame.size.width*.7);
            if (2 * num == (int)(self.view.layer.bounds.size.width *.7)) {
                upOrdown = YES;
            }else if (2 * num == (int)(self.view.layer.bounds.size.width *.7)-1){
                
                upOrdown = YES;
                
            }
        }
        else {
            
            NSLog(@"%f",(int)self.view.frame.size.width*.7-3);
            NSLog(@"%d",2 * num);
            if (2 * num == (int)(self.view.frame.size.width*.7)) {
                upOrdown = YES;
            }if (2 * num == (int)(self.view.layer.bounds.size.width *.7)-1){
                
                upOrdown = YES;
                
            }
            
        }
    }
    else {
        num --;
        _lineIV.frame = CGRectMake((kScreenWidth - self.view.layer.bounds.size.width * 0.7)/2, self.view.layer.bounds.size.height * 0.25 + 2 * num, self.view.layer.bounds.size.width * 0.7, 5);
        
        if (num == 0) {
            upOrdown = NO;
        }
    }
}

#pragma mark - AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    //判断是否有数据
    if (metadataObjects != nil && [metadataObjects count] > 0) {
        
        AVMetadataMachineReadableCodeObject *metadataObj = [metadataObjects objectAtIndex:0];
        //判断回传的数据类型
        if ([[metadataObj type] isEqualToString:AVMetadataObjectTypeQRCode]) {
            
            NSLog(@"stringValue = %@",metadataObj.stringValue);
            [self checkQRcode:metadataObj.stringValue];
        }
    }
    [_session stopRunning];
    [self performSelector:@selector(startReading) withObject:nil afterDelay:0.5];
}

-(void)startReading{
    [_session startRunning];
}
-(void)stopReading{
    [_session stopRunning];
}
/**
 * 判断二维码
 */
- (void)checkQRcode:(NSString *)str{
    
    if (str.length == 0) {
        
        UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"找不到二维码" message:@"导入的图片里并没有找到二维码" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        
        [alertController addAction:action];
        return;
    }
    
    if ([str hasPrefix:@"http"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str] options:nil completionHandler:nil];
    }else{
        
        [_session stopRunning];
        
        [self KeepoutView:str];
        //弹出一个view显示二维码内容
        NSLog(@"%@",str);
    }
    
}
/**
 * 将二维码图片转化为字符
 */
- (NSString *)stringFromFileImage:(UIImage *)img{
    int exifOrientation;
    switch (img.imageOrientation) {
        case UIImageOrientationUp:
            exifOrientation = 1;
            break;
        case UIImageOrientationDown:
            exifOrientation = 3;
            break;
        case UIImageOrientationLeft:
            exifOrientation = 8;
            break;
        case UIImageOrientationRight:
            exifOrientation = 6;
            break;
        case UIImageOrientationUpMirrored:
            exifOrientation = 2;
            break;
        case UIImageOrientationDownMirrored:
            exifOrientation = 4;
            break;
        case UIImageOrientationLeftMirrored:
            exifOrientation = 5;
            break;
        case UIImageOrientationRightMirrored:
            exifOrientation = 7;
            break;
        default:
            break;
    }
    
    NSDictionary *detectorOptions = @{ CIDetectorAccuracy : CIDetectorAccuracyHigh }; // TODO: read doc for more tuneups
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:detectorOptions];
    
    NSArray *features = [detector featuresInImage:[CIImage imageWithCGImage:img.CGImage]];
    
    CIQRCodeFeature * qrStr  = (CIQRCodeFeature *)features.firstObject;
    //只返回第一个扫描到的二维码
    return qrStr.messageString;
}

- (void)KeepoutView:(NSString*)orcodeStr{
    //做扫描成功之后的逻辑处理
    UIView *outView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    outView.backgroundColor = [UIColor whiteColor];
    UIWindow *wind = [UIApplication sharedApplication].keyWindow;
    [self.view addSubview:outView];
    
}

-(void)dealloc{
    NSLog(@"%@ dealloc",NSStringFromClass(self.class));
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
