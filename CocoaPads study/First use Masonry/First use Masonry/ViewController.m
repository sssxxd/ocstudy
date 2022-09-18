//
//  ViewController.m
//  First use Masonry
//
//  Created by 孙旭东 on 2022/9/4.
//

#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#define WeakSelf(weakSelf) __weak __typeof(&*self)weakSelf = self;
#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self setRedView:_redView];
//
//    [self setGrayViewEdgeInsetToRedView];
//
//    [self setTwoViewInGrayView];
//
//    [self setMutiplierAndConstant];
//
//    [self setViewWithKey];
    
    [self useShorthand];
}

// 绘制一个红色的View
- (void) setRedView:(UIView *)redView {
    
    WeakSelf(weakSelf);
    
    self.redView = [[UIView alloc] init];
    self.redView.backgroundColor = [UIColor redColor];
    
    // 在设置Autolayout之前，要将view添加到self.view上
    [self.view addSubview:self.redView];
    
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(weakSelf.view);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
}

//在红色的View中绘制一个灰色的View
- (void)setGrayViewEdgeInsetToRedView
{
    WeakSelf(weakSelf);
 
    self.grayView = [[UIView alloc] init];
    self.grayView.backgroundColor = [UIColor grayColor];
    [self.redView addSubview:self.grayView];
 
    [self.grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        //可以使用符合属性设置
        // make.edges.equalTo(weakSelf.redView).with.insets(UIEdgeInsetsMake(20, 20, 20, 20));
 
        //上述代码也可以拆分为：
        //可以使用with对同一条约束设置参数
        //        make.top.equalTo(weakSelf.redView).with.offset(20);
        //        make.left.equalTo(weakSelf.redView).with.offset(20);
        //        make.bottom.equalTo(weakSelf.redView).with.offset(-20);
        //        make.right.equalTo(weakSelf.redView).with.offset(-20);
 
        // 也可以去掉with
        make.top.equalTo(weakSelf.redView).offset(20);
        make.left.equalTo(weakSelf.redView).offset(20);
        make.bottom.equalTo(weakSelf.redView).offset(-20);
        make.right.equalTo(weakSelf.redView).offset(-20);
    }];
}

//在灰色View里面绘制两个等宽等间距的View,设置左右边距、相互之间边距为15
- (void)setTwoViewInGrayView
{
    WeakSelf(weakSelf);
    UIView *subView1 = [[UIView alloc] init];
    UIView *subView2 = [[UIView alloc] init];
 
    subView1.backgroundColor = [UIColor orangeColor];
    subView2.backgroundColor = [UIColor blueColor];
 
    [self.grayView addSubview:subView1];
    [self.grayView addSubview:subView2];
 
    [subView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.grayView.mas_centerY);
        make.left.equalTo(weakSelf.grayView.mas_left).with.offset(15);
        make.right.equalTo(subView2.mas_left).with.offset(-15);
        //设置subView1的高度为grayView高度的0.5.
        make.height.equalTo(weakSelf.grayView).multipliedBy(0.5);
        make.width.equalTo(subView2.mas_width);
    }];
 
    [subView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.grayView.mas_centerY);
        make.left.equalTo(subView1.mas_right).with.offset(15);
        make.right.equalTo(weakSelf.grayView.mas_right).offset(-15);
        make.height.equalTo(weakSelf.grayView).multipliedBy(0.5);
        make.width.equalTo(subView1.mas_width);
    }];
 
    //以上的两个约束还有如下简化的写法
    [subView1 mas_remakeConstraints:^(MASConstraintMaker *make) {
        //设置subView1的centerY属性，如果后面的grayView的参数也是centerY的话，就可以省略
        make.centerY.equalTo(weakSelf.grayView);
        //因为默认也是想要和grayView的左边距对齐，所以可以省略mas_left;
        make.left.equalTo(weakSelf.grayView).with.offset(15);
        //下面的mas_left不能省略，因为前面的参数是right,当前后参数不一致时，不能省略后面的参数
        make.right.equalTo(subView2.mas_left).with.offset(-15);
        make.height.equalTo(weakSelf.grayView).multipliedBy(0.5);
        //可以省略下面subView2的width参数
        make.width.equalTo(subView2);
    }];
 
    [subView2 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.grayView);
        make.left.equalTo(subView1.mas_right).with.offset(15);
        make.right.equalTo(weakSelf.grayView).offset(-15);
        make.height.equalTo(weakSelf.grayView).multipliedBy(0.5);
        make.width.equalTo(subView1);
    }];
}

- (void)setMutiplierAndConstant
{
    WeakSelf(weakSelf);
    UIView *yellowView = [[UIView alloc] init];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowView];
 
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(weakSelf.view.mas_width).offset(-10).multipliedBy(0.5);//根据公式，这里的-10就是constant.
        make.height.equalTo(weakSelf.view.mas_height).multipliedBy(0.2).offset(0);
        make.top.equalTo(weakSelf.redView.mas_bottom).multipliedBy(1).offset(0);
        make.left.equalTo(weakSelf.view.mas_left).multipliedBy(1).offset(10);
    }];
}


- (void)setViewWithKey
{
    UIView *firstView = [[UIView alloc] init];
    firstView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:firstView];
 
    //这里使用mas_key参数
    self.view.mas_key = @"self.view";
    firstView.mas_key = @"firstView";
 
    //写一个冲突的约束
    [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.left.offset(10);
        make.right.offset(-10);
    }];
}


- (void)useShorthand
{
    UIView *firstView = [[UIView alloc] init];
    firstView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:firstView];
 
    self.view.mas_key = @"self.view";
    firstView.mas_key = @"firstView";
 
    //写一个冲突的约束
    [firstView makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(100, 100));
        make.left.offset(10);
        make.right.offset(-10);
    }];
 
}




@end
