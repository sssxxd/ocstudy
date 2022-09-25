//
//  AViewController.m
//  ViewController
//
//  Created by 孙旭东 on 2022/9/18.
//

#import "AViewController.h"

@interface AViewController ()

@end

@implementation AViewController

- (void) loadView {
    [super loadView];

    NSLog(@"AViewController loadView");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100, 100, 100, 50);
    button.center = self.view.center;
    [button setTitle:@"按键" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    NSLog(@"AViewController viewDidLoad");
}

- (void) viewWillAppear:(BOOL)animated {
    NSLog(@"AViewController viewWillAppear");
}

- (void) viewDidAppear:(BOOL)animated {
    NSLog(@"AViewController viewDidAppear");
}

- (void) viewWillDisappear:(BOOL)animated {
    NSLog(@"AViewController viewWillDisappear");
}

- (void) viewDidDisappear:(BOOL)animated {
    NSLog(@"AViewController viewDidDisappear");
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    NSLog(@"AViewController didReceiveMemoryWarning");
}

- (void) press:(UIButton*)sender {
    BViewController* bViewController = [[BViewController alloc] init];
    
    bViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    
    NSLog(@"A->B");
    
    [self presentViewController:bViewController animated:YES completion:nil];
}


@end
