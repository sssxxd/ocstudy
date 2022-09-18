//
//  VCSecond.m
//  UINavigationItem
//
//  Created by 孙旭东 on 2022/7/19.
//

#import "VCSecond.h"
#import "VCThrid.h"

@implementation VCSecond

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    
    UIBarButtonItem* ButtonNext = [[UIBarButtonItem alloc] initWithTitle:@"第三极" style:UIBarButtonItemStyleDone target:self action:@selector(pressNext)];
    
    self.navigationItem.rightBarButtonItem = ButtonNext;
}

- (void) pressNext {
    VCThrid* next = [[VCThrid alloc] init];
    
    [self.navigationController pushViewController:next animated:YES];
}

@end
