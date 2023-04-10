//
//  CalassificationTableViewCell.m
//  Find
//
//  Created by 孙旭东 on 2023/3/29.
//

#import "CalassificationTableViewCell.h"

// 引入第三方库
#import "Masonry.h"

@interface CalassificationTableViewCell ()

@property (nonatomic, strong) UIButton* overButton;
@property (nonatomic, strong) UIButton* addButton;
@property (nonatomic, strong) NSMutableArray* buttonArray;
@property (nonatomic, assign) NSInteger buttonNumber;

@property (nonatomic, assign) CGFloat buttonWidth;
@property (nonatomic, assign) CGFloat buttonHeigth;

@end

@implementation CalassificationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        self.buttonNumber = 9;
        // 初始化按钮尺寸
        self.buttonWidth = [UIScreen mainScreen].bounds.size.width / 5.6;
        self.buttonHeigth = [UIScreen mainScreen].bounds.size.width / 11;
        
        [self.overButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(20);
            make.top.mas_offset(15);
            make.width.mas_offset(self.buttonWidth);
            make.height.mas_offset(self.buttonHeigth);
        }];

        [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(15);
            make.right.mas_offset(-20);
            make.size.mas_offset(self.buttonHeigth);
        }];

        for (int i = 0; i < self.buttonNumber; i++) {
            UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            button.backgroundColor = [UIColor clearColor];
            button.layer.cornerRadius = 8;
            button.layer.masksToBounds = YES;
            button.layer.borderColor = [UIColor blackColor].CGColor;
            button.layer.borderWidth = 0.5;
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            int index = i % 3;
            int jndex = i / 3;
            
            if (index % 3 == 0) {
                [button setTitle:@"狗" forState:UIControlStateNormal];
            } else if (index % 3 == 1) {
                [button setTitle:@"猫" forState:UIControlStateNormal];
            } else {
                [button setTitle:@"仓鼠" forState:UIControlStateNormal];
            }
            
            [self.contentView addSubview:button];

            if (i == self.buttonNumber - 1) {

                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_offset(15 + (self.buttonHeigth + 15) * (jndex + 1));
                    make.left.mas_equalTo(self.overButton.mas_right).mas_offset((self.buttonWidth + 20) * index);
                    make.height.mas_offset(self.buttonHeigth);
                    make.width.mas_offset(self.buttonWidth);
                    make.bottom.mas_offset(-15);
                }];
            } else {

                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_offset(15 + (self.buttonHeigth + 15) * (jndex + 1));
                    make.left.mas_equalTo(self.overButton.mas_right).mas_offset((self.buttonWidth + 20) * index);
                    make.size.equalTo(self.overButton);
                }];
            }
            
            [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return self;
}

- (void) layoutSubviews {
    [self.overButton setTitle:self.overButtonTitleString forState:UIControlStateNormal];
}

- (void) pressButton:(UIButton*)sender {
    if ([sender.backgroundColor isEqual:[UIColor clearColor]]) {
        sender.backgroundColor = [UIColor colorWithRed:0.165f green:0.510f blue:0.895f alpha:1];
    } else {
        sender.backgroundColor = [UIColor clearColor];
    }
}

#pragma mark - 懒加载
- (UIButton*) overButton {
    if (_overButton == nil) {
        self.overButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_overButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _overButton.backgroundColor = [UIColor colorWithRed:0.165f green:0.510f blue:0.895f alpha:1];
        _overButton.layer.cornerRadius = 8;
        _overButton.layer.masksToBounds = YES;
        
        [self.contentView addSubview:_overButton];
    }
    return _overButton;
}

- (UIButton*) addButton {
    if (_addButton == nil) {
        self.addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addButton setImage:[UIImage imageNamed:@"add-2.png"] forState:UIControlStateNormal];
        
        [self.contentView addSubview:_addButton];
    }
    return _addButton;
}

- (NSMutableArray*) buttonArray {
    if (_buttonArray == nil) {
        self.buttonArray = [[NSMutableArray alloc] init];
    }
    return _buttonArray;
}

@end
