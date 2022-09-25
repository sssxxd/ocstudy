//
//  ViewController.m
//  TongZhi SendData
//
//  Created by 孙旭东 on 2022/9/18.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UITextField *textField;
@property (nonatomic,strong) UIButton *nextBtn;


@end


@implementation ViewController
-(UITextField *)textField{

    if (!_textField) {
        _textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 50)];
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.backgroundColor = [UIColor whiteColor];

    }
    return _textField;
}

-(UIButton *)nextBtn{

    if (!_nextBtn) {

        _nextBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _nextBtn.frame = CGRectMake(20, 200, self.view.bounds.size.width - 40, 44);

        _nextBtn.backgroundColor = [UIColor blueColor];
        _nextBtn.titleLabel.font = [UIFont systemFontOfSize:25.0];
        _nextBtn.tintColor = [UIColor whiteColor];

        [_nextBtn setTitle:@"Next" forState:UIControlStateNormal];
        [_nextBtn addTarget:self action:@selector(nextBtn:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _nextBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    /**
     通知传值(逆向传值 --> 第二个界面传值到第一个界面)
     s
     1、注册通知

     2、通知中心发送一条消息通知，其中name前后一定要一样

     3、实现通知中心内部的方法，并实现传值

     4、消息发送完，要移除掉。（页面将要消失的时候）
     */
    self.navigationItem.title = @"通知传值";
    self.view.backgroundColor = [UIColor yellowColor];

    [self.view addSubview:self.textField];
    [self.view addSubview:self.nextBtn];


//    注册监听者
    /**
     *  addObserver 注册监听者,一般都是控制器本身去监听一个通知
     *
     *  selector 当监听到通知的时候执行的方法
     *
     *  name 通知的名字,要和发送的通知的对象的名字一致
     */
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(ChangeTextFText:) name:@"ChangeValue" object:nil];


}


-(void)ChangeTextFText:(NSNotification *)notification{

    NSDictionary *dict = notification.userInfo;
    NSLog(@"dict = %@",dict);
    _textField.text = dict[@"Value"];

}


-(void)nextBtn:(UIButton *)sender{
    SecondViewController *secondVC = [[SecondViewController alloc]init];
    [self presentViewController:secondVC animated:YES completion:nil];



}

//移除通知
-(void)dealloc{

    [[NSNotificationCenter defaultCenter]removeObserver:self];

}

@end

