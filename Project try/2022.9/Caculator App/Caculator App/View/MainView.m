//
//  MainView.m
//  Caculator App
//
//  Created by 孙旭东 on 2022/9/26.
//

#import "MainView.h"
#import "Masonry.h"

#define SIZE 85

#define CalculationWidth 375

@implementation MainView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void) initView {
    self.backgroundColor = [UIColor blackColor];
    
    [self creatOperArray];
    self.buttonArray = [[NSMutableArray alloc] init];
    
    self.calculation = [[UITextField alloc] init];
    self.calculation.backgroundColor = [UIColor blackColor];
    self.calculation.textColor = [UIColor whiteColor];
    self.calculation.textAlignment = NSTextAlignmentRight;
    self.calculation.font = [UIFont systemFontOfSize:60];
    
    self.calculation.userInteractionEnabled = NO;
    
    [self addSubview:self.calculation];
    
    [self.calculation mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-600);
        make.width.equalTo(@CalculationWidth);
    }];
    
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            button.titleLabel.font = [UIFont systemFontOfSize:42];
            button.layer.cornerRadius = SIZE / 2;
            
            [self addSubview:button];
            
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self).offset(-(70 + (SIZE + 15) * (i + 1)));
                make.left.equalTo(self).offset(3 + (SIZE + 15) * j);
                make.size.equalTo(@SIZE);
            }];
            
            if (i == 3 && j < 3) {
                button.backgroundColor = [UIColor grayColor];
                [button setTitle:self.operArray[i + j + 1] forState:UIControlStateNormal];
                [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                button.tag = 100 + j;
                if (j == 0) {

                    _ACButton = button;
                } else {

                    [self.buttonArray addObject:button];
                }
            } else if (j == 3) {
                button.backgroundColor = [UIColor colorWithRed:251.0f / 255.0f green:151.0f / 255.0f blue:15.0f / 255.0f alpha:1];
                [button setTitle:self.operArray[i] forState:UIControlStateNormal];
                [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                button.tag = 200 + i;

                [self.buttonArray addObject:button];
            } else {
                button.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
                NSString* title = [NSString stringWithFormat:@"%d", j + 3 * i + 1];
                [button setTitle:title forState:UIControlStateNormal];
                [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                button.tag = 300 + i * 3 + j;

                [self.buttonArray addObject:button];
            }
        }
    }
    
    for (int i = 0; i < 3; i++) {
        UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.titleLabel.font = [UIFont systemFontOfSize:42];
        button.layer.cornerRadius = SIZE / 2;
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [self addSubview:button];
        
        if (i == 0) {
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self).offset(-70);
                make.left.equalTo(self).offset(0);
                make.width.equalTo(@(SIZE * 2 + 15));
                make.height.equalTo(@SIZE);
            }];
            [button setTitle:@"0          " forState:UIControlStateNormal];
            button.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
            button.tag = 310;

            [self.buttonArray addObject:button];
        } else {
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self).offset(-70);
                make.left.equalTo(self).offset(200 + (SIZE + 15) * (i - 1));
                make.size.equalTo(@SIZE);
            }];
            if (i == 1) {
                [button setTitle:@"." forState:UIControlStateNormal];
                button.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
                button.tag = 311;

                self.pointButton = button;
            } else {
                [button setTitle:@"=" forState:UIControlStateNormal];
                button.backgroundColor = [UIColor colorWithRed:251.0f / 255.0f green:151.0f / 255.0f blue:15.0f / 255.0f alpha:1];
                button.tag = 400;

                _equalButton = button;
            }
        }
    }
}

- (void) creatOperArray {
    NSArray* array = [[NSArray alloc] initWithObjects:@"+", @"-", @"×", @"÷", @"AC", @"(", @")", nil];
    
    self.operArray = array;
}

@end
