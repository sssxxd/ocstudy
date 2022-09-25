//
//  BViewController.m
//  ViewController
//
//  Created by 孙旭东 on 2022/9/18.
//

#import "BViewController.h"

@interface BViewController ()

@end

@implementation BViewController

- (void) loadView {
    [super loadView];
    
    NSLog(@"BViewController loadView");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];

    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100, 100, 100, 50);
    button.center = self.view.center;
    [button setTitle:@"按键" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    NSLog(@"BViewController viewDidLoad");
}

- (void) viewWillAppear:(BOOL)animated {
    NSLog(@"BViewController viewWillAppear");
}

- (void) viewDidAppear:(BOOL)animated {
    NSLog(@"BViewController viewDidAppear");
}

- (void) viewWillDisappear:(BOOL)animated {
    NSLog(@"BViewController viewWillDisappear");
}

- (void) viewDidDisappear:(BOOL)animated {
    NSLog(@"BViewController viewDidDisappear");
}

- (void) press:(UIButton*)sender {
    NSLog(@"B->A");

    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
