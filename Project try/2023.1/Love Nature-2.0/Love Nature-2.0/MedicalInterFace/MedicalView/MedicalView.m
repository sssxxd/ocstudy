//
//  MedicalView.m
//  Find
//
//  Created by 孙旭东 on 2023/4/12.
//

#import "MedicalView.h"

@interface MedicalView ()

@property (nonatomic, strong) UIImageView* backView;



@end

@implementation MedicalView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.backView];
    }
    return self;
}

- (void) drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
        // 颜色空间
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        
        // 创建颜色数组
    CGFloat compoents[12] = {
            0.439f, 0.521f, 0.714f, 1,
            0.530f, 0.655f, 0.851f, 1,
            0.97f, 0.97f, 0.97f, 1
    };
        
        // 渐变位置(0~1)，数组元素个数不小于颜色数
    CGFloat locations[3] = {0, 0.4, 0.8};
        
        // 创建梯度上下文
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, compoents, locations, 3);
        
    CGContextDrawLinearGradient(ctx, gradient, CGPointMake(self.frame.size.width/2, 0), CGPointMake(self.frame.size.width/2, self.frame.size.height/2.5), kCGGradientDrawsAfterEndLocation);
        
        // 释放颜色空间
    CGColorSpaceRelease(colorSpace);
}

#pragma mark - 懒加载
- (UIImageView*) backView {
    if (_backView == nil) {
        self.backView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Medical.png"]];
        _backView.frame = CGRectMake(0, 100, self.frame.size.width, self.frame.size.height - 180);
    }
    return _backView;
}


@end
