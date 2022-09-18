//
//  PictureWallViewController.m
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import "PictureWallViewController.h"
#import "SelectedPictureViewController.h"

@interface PictureWallViewController ()

@end

@implementation PictureWallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _count = 0;
    
    self.title = @"照片墙";
    
    self.view.backgroundColor = [UIColor  whiteColor];
    
    _arrayImage = [[NSMutableArray alloc] init];
    
    [self createPictureWall];
    
    [self createNavigationBarItem];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma - 创建照片墙
- (void) createPictureWall {
    UIScrollView* scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height * 1.2);
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.userInteractionEnabled = YES;
    
    for (int i = 0; i < 35; i++) {
        NSString* imageName = [NSString stringWithFormat:@"icon_img%d.jpeg", i + 1];
        UIImage* image = [UIImage imageNamed:imageName];
        UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
        
        UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(65, 0, 20, 20);
        [button setImage:[UIImage imageNamed:@"weixuanzhong.png"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"xuanzhong.png"] forState:UIControlStateSelected];
        button.tag = 220 + i;
        [imageView addSubview:button];
        
        
        imageView.frame = CGRectMake(10 + (i % 4) * 95, 10 + (i / 4) * 95, 85, 85);
        
        imageView.backgroundColor = [UIColor grayColor];
        
        imageView.tag = 210 + i;
        
        [scrollView addSubview:imageView];
        
        imageView.userInteractionEnabled = YES;
        
        // 创建点击手势
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressTap:)];
        
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        
        [imageView addGestureRecognizer:tap];
    }
    [self.view addSubview:scrollView];
}

- (void) pressTap:(UITapGestureRecognizer*)tap {
    UIImageView* imageView = (UIImageView*)tap.view;

//    SelectedPictureViewController* viewController = [[SelectedPictureViewController alloc] init];
//    viewController.image = imageView.image;
//    viewController.imageTag = imageView.tag;
//    viewController.delegate = self;
//
//    [self.navigationController pushViewController:viewController animated:YES];
    
    UIButton* button = [imageView viewWithTag:imageView.tag + 10];
    if (button.selected == NO) {
        button.selected = YES;
        [_arrayImage addObject:imageView];
        _count++;
    } else {
        button.selected = NO;
        [_arrayImage removeObject:imageView];
        _count--;
    }
    
}

- (void) createNavigationBarItem {
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithTitle:@"上传" style:UIBarButtonItemStylePlain target:self action:@selector(pressItem)];
    
    [item setTintColor:[UIColor whiteColor]];
    
    self.navigationItem.rightBarButtonItem = item;
}

- (void) pressItem {
    UIImageView* imageView = (UIImageView*)[_arrayImage lastObject];
    
    [self.delegate setUpPictureImageTag:imageView.tag Count:_count];
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
