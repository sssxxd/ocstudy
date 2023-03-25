//
//  UpDataView.m
//  Find
//
//  Created by 孙旭东 on 2023/3/22.
//

#import "UpDataView.h"

// 引入第三方库
#import "Masonry.h"

@interface UpDataView ()
<UITextViewDelegate>

@property (nonatomic, strong, readwrite) UITextField* titleTextField;
@property (nonatomic, strong, readwrite) UITextView* textTextField;
@property (nonatomic, strong, readwrite) NSMutableArray* imageArray;
@property (nonatomic, strong) UIButton* addImageButton;
@property (nonatomic, strong) UIButton* topicButton;
@property (nonatomic, strong) UIButton* userButton;
@property (nonatomic, strong) UIView* addressButtonView;
@end

@implementation UpDataView

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self layoutIfNeeded];
    }
    return self;
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.titleTextField resignFirstResponder];
    [self.textTextField resignFirstResponder];
}

- (void) textViewDidBeginEditing:(UITextView *)textView {
    if ([self.textTextField.text isEqualToString:@"添加正文"]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }
}

- (void) layoutIfNeeded {
    [super layoutIfNeeded];
    [self.titleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(80);
        make.right.mas_offset(-20);
        make.left.mas_offset(20);
        make.height.mas_offset(50);
    }];
    
    UIView* lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor grayColor];
    [self addSubview:lineView];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleTextField.mas_bottom).mas_offset(1);
        make.height.mas_offset(1);
        make.width.equalTo(self.titleTextField);
        make.left.equalTo(self.titleTextField);
    }];
    
    CGFloat ScreenWidth = [UIScreen mainScreen].bounds.size.width;
    [self.textTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleTextField.mas_bottom).mas_offset(10);
        make.left.right.equalTo(self.titleTextField);
        make.height.mas_offset(ScreenWidth*0.46f);
    }];
    
    [self.addImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.textTextField.mas_bottom);
        make.left.equalTo(self.textTextField);
        make.size.mas_offset(ScreenWidth/3.2f);
    }];
    
    [self.topicButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.addImageButton.mas_bottom).mas_offset(30);
        make.left.mas_offset(20);
        make.height.mas_offset(40);
        make.width.mas_offset(90);
    }];
    
    [self.userButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.addImageButton.mas_bottom).mas_offset(30);
        make.left.mas_equalTo(self.topicButton.mas_right).mas_offset(20);
        make.width.mas_offset(90);
        make.height.mas_offset(40);
    }];
    
    [self.addressButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topicButton.mas_bottom).mas_offset(20);
        make.left.mas_offset(20);
        make.right.mas_offset(-20);
        make.height.mas_offset(50);
    }];
}

#pragma mark - 懒加载
- (UITextField*) titleTextField {
    if (_titleTextField == nil) {
        self.titleTextField = [[UITextField alloc] init];
        _titleTextField.placeholder = @"填写标题会有更多赞～";
        _titleTextField.textColor = [UIColor blackColor];
        _titleTextField.backgroundColor = [UIColor whiteColor];
        _titleTextField.keyboardType = UIKeyboardTypeDefault;
        
        [self addSubview:_titleTextField];
    }
    return _titleTextField;
}

- (UITextView*) textTextField {
    if (_textTextField == nil) {
        self.textTextField = [[UITextView alloc] init];
        _textTextField.text = @"添加正文";
        _textTextField.textColor = [UIColor grayColor];
        _textTextField.font = [UIFont systemFontOfSize:18];
        _textTextField.backgroundColor = [UIColor whiteColor];
        _textTextField.keyboardType = UIKeyboardTypeDefault;
        _textTextField.delegate = self;
        [self addSubview:_textTextField];
    }
    return _textTextField;
}

- (NSMutableArray*) imageArray {
    if (_imageArray == nil) {
        self.imageArray = [[NSMutableArray alloc] init];
    }
    return _imageArray;
}

- (UIButton*) addImageButton {
    if (_addImageButton == nil) {
        self.addImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _addImageButton.backgroundColor = [UIColor colorWithRed:0.9f green:0.9f blue:0.9f alpha:1];
        _addImageButton.layer.borderColor = [UIColor blueColor].CGColor;
        _addImageButton.layer.borderWidth = 2;
        
        UIImageView* addImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"add-bold.png"]];
        [_addImageButton addSubview:addImage];
        
        [addImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_offset(40);
            make.right.bottom.mas_offset(-40);
        }];
        
        [self addSubview:_addImageButton];
    }
    return _addImageButton;
}

- (UIButton*) topicButton {
    if (_topicButton == nil) {
        self.topicButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_topicButton setTitle:@"#话题" forState:UIControlStateNormal];
        [_topicButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _topicButton.backgroundColor = [UIColor colorWithRed:0.9f green:0.9f blue:0.9f alpha:1];
        
        [self addSubview:_topicButton];
    }
    return _topicButton;
}

- (UIButton*) userButton {
    if (_userButton == nil) {
        self.userButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_userButton setTitle:@"@用户" forState:UIControlStateNormal];
        [_userButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _userButton.backgroundColor = [UIColor colorWithRed:0.9f green:0.9f blue:0.9f alpha:1];
        
        [self addSubview:_userButton];
    }
    return _userButton;
}

- (UIView*) addressButtonView {
    if (_addressButtonView == nil) {
        self.addressButtonView = [[UIView alloc] init];
        
        UIImageView* addressLogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"addresss.png"]];
        UILabel* addressLabel = [[UILabel alloc] init];
        addressLabel.text = @"添加地址";
        addressLabel.textColor = [UIColor blackColor];
        UIImageView* addressArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow-right-bold"]];
        
        [_addressButtonView addSubview:addressLogo];
        [_addressButtonView addSubview:addressLabel];
        [_addressButtonView addSubview:addressArrow];
        
        [addressLogo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_addressButtonView);
            make.left.mas_offset(20);
            make.size.mas_offset(30);
        }];
        
        [addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_addressButtonView);
            make.left.mas_equalTo(addressLogo.mas_right).mas_offset(8);
            make.height.mas_offset(30);
        }];
        
        [addressArrow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_addressButtonView);
            make.right.mas_offset(-20);
            make.size.mas_offset(30);
        }];
        
        UIView* topLine = [[UIView alloc] init];
        UIView* bottomLine = [[UIView alloc] init];
        
        topLine.backgroundColor = [UIColor grayColor];
        bottomLine.backgroundColor = [UIColor grayColor];
        
        [_addressButtonView addSubview:topLine];
        [_addressButtonView addSubview:bottomLine];
        
        [topLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(0);
            make.height.mas_offset(1);
            make.width.equalTo(_addressButtonView);
            make.left.mas_offset(0);
        }];
        
        [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_offset(-1);
            make.height.mas_offset(1);
            make.width.equalTo(_addressButtonView);
            make.left.mas_offset(0);
        }];
        
        [self addSubview:_addressButtonView];
    }
    return _addressButtonView;
}

@end
