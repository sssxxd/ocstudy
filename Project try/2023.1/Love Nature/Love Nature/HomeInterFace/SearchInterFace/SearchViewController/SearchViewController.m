//
//  SearchViewController.m
//  Love Nature
//
//  Created by 孙旭东 on 2023/1/15.
//

#import "SearchViewController.h"
#import "SearchView.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initSearchView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma - 初始化视图
- (void) initSearchView {
    self.searchView = [[SearchView alloc] initWithFrame:self.view.bounds];
    
    [self.searchView.backButton addTarget:self action:@selector(pressBackButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.searchView.photographButton addTarget:self action:@selector(pressPhotographButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_searchView];
}

#pragma - 按钮事件

- (void) pressBackButton {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (IBAction) pressPhotographButton:(id)sender {
    UIImagePickerController* pickerController = [[UIImagePickerController alloc] init];
    pickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    pickerController.delegate = self;
    [self presentViewController:pickerController animated:YES completion:nil];
}


- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    NSString* mediaType = info[@"UIImagePickerControllerMediaType"];
    if ([mediaType isEqualToString:@"public.image"]) {
        UIImage* image = [info objectForKey:UIImagePickerControllerOriginalImage];
        self.searchView.photographImageView.image = image;
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
