//
//  ShopMallView.m
//  Find
//
//  Created by 孙旭东 on 2023/4/7.
//

#import "ShopMallView.h"

// 引入第三方库
#import "Masonry.h"

@implementation ShopMallView

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        CGFloat width = (self.frame.size.width - 175) / 4;
        CGFloat labelHeight = width / 3;
        
        for (int i = 0; i < 8; i++) {
            UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"shop%d", i + 1]] forState:UIControlStateNormal];
            [self addSubview:button];
            
            int indX = i % 4;
            int indY = i / 4;
            
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_offset(140 + (50 +width + labelHeight) * indY);
                make.left.mas_offset(33 + (33 + width) * indX);
                make.size.mas_offset(width);
            }];
            
            UILabel* label = [[UILabel alloc] init];
            label.font = [UIFont systemFontOfSize:16];
            label.textColor = [UIColor blackColor];
            label.textAlignment = NSTextAlignmentCenter;
            
            [self addSubview:label];
            
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(button.mas_bottom).mas_offset(10);
                make.centerX.equalTo(button);
                make.height.mas_offset(labelHeight);
            }];
            
            if (i == 0) {
                label.text = @"宠物用品";
            } else if (i == 1) {
                label.text = @"宠物玩具";
            } else if (i == 2) {
                label.text = @"宠物饲料";
            } else if (i == 3) {
                label.text = @"宠物背包";
            } else if (i == 4) {
                label.text = @"植物种子";
            } else if (i == 5) {
                label.text = @"植物肥料";
            } else if (i == 6) {
                label.text = @"宠物药品";
            } else {
                label.text = @"洗浴用品";
            }
        }
        
        UIImageView* imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shopping1.jpeg"]];
        [self addSubview:imageView1];
        
        CGFloat imageWidth = ([UIScreen mainScreen].bounds.size.width - 30) / 2;
        
        [imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(400);
            make.left.mas_offset(10);
            make.height.mas_offset(270);
            make.width.mas_offset(imageWidth);
        }];
        
        UIImageView* imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shopping3.jpeg"]];
        [self addSubview:imageView2];
        
        [imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(400);
            make.right.mas_offset(-10);
            make.height.mas_offset(160);
            make.width.mas_offset(imageWidth);
        }];
        
        UIImageView* imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shopping4.jpeg"]];
        [self addSubview:imageView3];
        
        [imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(imageView2.mas_bottom).mas_offset(10);
            make.right.mas_offset(-10);
            make.height.mas_offset(160);
            make.width.mas_offset(imageWidth);
        }];
        
        UIImageView* imageView4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shopping5.jpeg"]];
        [self addSubview:imageView4];
        
        [imageView4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(imageView1.mas_bottom).mas_offset(10);
            make.left.mas_offset(10);
            make.width.mas_offset(imageWidth);
            make.bottom.equalTo(imageView3);
        }];
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

@end
