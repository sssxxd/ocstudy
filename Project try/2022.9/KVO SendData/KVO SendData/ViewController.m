//
//  ViewController.m
//  KVO SendData
//
//  Created by 孙旭东 on 2022/8/5.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 20)];
    _label.text = @"safhijsdkfnv";
    [self.view addSubview:_label];
    
    _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button.backgroundColor = [UIColor redColor];
    _button.frame = CGRectMake(0, 0, 100, 100);
    [_button addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
}

- (void) add:(UIButton*)button {
    _mynewView = [[NewViewController alloc] init];
    _mynewView.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [_mynewView addObserver:self forKeyPath:@"content" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self presentViewController:_mynewView animated:YES completion:nil];
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqual:@"content"]) {
        id value = [change valueForKey:@"new"];
        _label.text = value;
    }
}

- (void) dealloc {
    [_mynewView removeObserver:self forKeyPath:@"content"];
}
@end
