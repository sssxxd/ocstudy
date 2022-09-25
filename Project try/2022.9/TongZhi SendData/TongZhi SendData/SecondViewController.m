//
//  SecondViewController.m
//  TongZhi SendData
//
//  Created by 孙旭东 on 2022/9/18.
//


#import "SecondViewController.h"

@interface SecondViewController ()
@property (nonatomic,strong) UITextField *textF;
@property (nonatomic,strong) UIButton *backBtn;


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];

    [self.view addSubview:self.textF];
    [self.view addSubview:self.backBtn];



}

-(UITextField *)textF{

    if (!_textF) {

        _textF = [[UITextField alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 50)];
        _textF.borderStyle = UITextBorderStyleRoundedRect;
        _textF.backgroundColor = [UIColor whiteColor];

    }
    return _textF;
}


-(UIButton *)backBtn{

    if (!_backBtn) {

        _backBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _backBtn.frame = CGRectMake(20, 200, self.view.bounds.size.width-40,40);

        _backBtn.backgroundColor = [UIColor blueColor];
        _backBtn.tintColor = [UIColor whiteColor];
        _backBtn.titleLabel.font = [UIFont systemFontOfSize:25.0];

        [_backBtn setTitle:@"Back" forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(backBtn:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _backBtn;

}


-(void)backBtn:(UIButton *)sender{

//    发送通知
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ChangeValue" object:nil userInfo:@{@"Value":_textF.text}];
    NSLog(@"%@",self.textF.text);
    [self dismissViewControllerAnimated:YES completion:nil];

}


@end

