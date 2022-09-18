//
//  SelectedPictureViewController.m
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import "SelectedPictureViewController.h"

@interface SelectedPictureViewController ()

@end

@implementation SelectedPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"图片展示";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView* imageView = [[UIImageView alloc] initWithImage:self.image];
    imageView.frame = CGRectMake(90, 300, 200, 200);
    
    [self.view addSubview:imageView];
    
    [self createUpDataItem];
}

#pragma - 上传Item
- (void) createUpDataItem {
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithTitle:@"上传" style:UIBarButtonItemStylePlain target:self action:@selector(pressUpData)];
    
    [item setTintColor:[UIColor whiteColor]];
    
    self.navigationItem.rightBarButtonItem = item;
}

- (void) pressUpData {
    [self.delegate setImageTag:self.imageTag];
    
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
