//
//  ViewController.m
//  Use ImagePickerController
//
//  Created by 孙旭东 on 2022/11/30.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.showImage = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 200, 200)];
    [self.view addSubview:self.showImage];
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(60, 500, 200, 20);
    [self.view addSubview:button];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(browse:) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction) browse:(id)sender {
    UIImagePickerController* pickerController = [[UIImagePickerController alloc] init];
    pickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    pickerController.delegate = self;
    [self presentViewController:pickerController animated:YES completion:nil];
    
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    NSLog(@"%@", info);
    NSString* mediaType = info[@"UIImagePickerControllerMediaType"];
    if ([mediaType isEqualToString:@"public.image"]) {
        UIImage* image = [info objectForKey:UIImagePickerControllerOriginalImage];
        self.showImage.image = image;
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

//- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
//    NSLog(@"已保存");
//}

@end
