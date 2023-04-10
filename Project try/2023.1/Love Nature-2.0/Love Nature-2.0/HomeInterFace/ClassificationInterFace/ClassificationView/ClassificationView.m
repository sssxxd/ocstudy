//
//  ClassificationView.m
//  Find
//
//  Created by 孙旭东 on 2023/3/29.
//

#import "ClassificationView.h"

// 引入Cell
#import "CalassificationTableViewCell.h"

// 全局变量
static NSString *const CalassificationTableViewCellName = @"CalassificationTableViewCell";

@interface ClassificationView ()
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView* tableView;

@end

@implementation ClassificationView

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.tableView];
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
#pragma mark - 代理方法
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CalassificationTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:CalassificationTableViewCellName forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.overButtonTitleString = @"推荐";
    } else {
        cell.overButtonTitleString = @"动物";
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

#pragma mark - 懒加载
- (UITableView*) tableView {
    if (_tableView == nil) {
        self.tableView = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.estimatedRowHeight = 500;
        
        [_tableView registerClass:[CalassificationTableViewCell class] forCellReuseIdentifier:CalassificationTableViewCellName];
    }
    return _tableView;
}

@end
