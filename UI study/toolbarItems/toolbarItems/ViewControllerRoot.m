//
//  ViewControllerRoot.m
//  toolbarItems
//
//  Created by 孙旭东 on 2022/7/19.
//

#import "ViewControllerRoot.h"
#import "ViewControllerSecond.h"

@interface ViewControllerRoot ()

@end

@implementation ViewControllerRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.title = @"根视图";
    
    
    // 实现工具栏对象
    self.navigationController.toolbarHidden = NO;
    
    self.navigationController.toolbar.translucent = NO;
    
    UIBarButtonItem* button01 = [[UIBarButtonItem alloc] initWithTitle:@"01" style:UIBarButtonItemStyleDone target:self action:@selector(pressNext)];
    
    UIBarButtonItem* button02 = [[UIBarButtonItem alloc] initWithTitle:@"02" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    UIBarButtonItem* buttonF02 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    NSArray* array = [NSArray arrayWithObjects:button01, buttonF02, button02, nil];
    
    self.toolbarItems = array;
}

- (void) pressNext {
    ViewControllerSecond* viewControllerSecond = [[ViewControllerSecond alloc] init];
    
    [self.navigationController pushViewController:viewControllerSecond animated:YES];
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
