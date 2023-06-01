//
//  UpDataView.m
//  Find
//
//  Created by 孙旭东 on 2023/3/22.
//

#import "UpDataView.h"

// 引入第三方库
#import "Masonry.h"

// 全局变量
NSString *const UpDataViewaddImageButtonPressed = @"UpDataViewaddImageButtonPressed";
NSString *const UpDataViewaddressButtonPressed = @"UpDataViewaddressButtonPressed";


extern NSString *const MapKitViewControllerOkItemPressed;

@interface UpDataView ()
<UITextViewDelegate>

@property (nonatomic, strong, readwrite) UITextField* titleTextField;
@property (nonatomic, strong, readwrite) UITextView* textTextField;
@property (nonatomic, strong) UIButton* addImageButton;
@property (nonatomic, strong) UIButton* topicButton;
@property (nonatomic, strong) UIButton* userButton;
@property (nonatomic, strong) UIView* addressButtonView;
@property (nonatomic, strong) NSMutableArray* imageViewArray;

@end

@implementation UpDataView

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self.addImageButton addTarget:self action:@selector(pressAddImageButton) forControlEvents:UIControlEventTouchUpInside];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLocation:) name:MapKitViewControllerOkItemPressed object:nil];
        
        [self layoutIfNeeded];
    }
    return self;
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textTextField resignFirstResponder];
    [self.titleTextField resignFirstResponder];
}

- (void) changeLocation:(NSNotification *)notification {
    NSString* loaction = [NSString stringWithFormat:@"%@%@", notification.userInfo[@"title"], notification.userInfo[@"subtitle"]];
    self.addressLabel.text = loaction;
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
    
    CGFloat size = ([UIScreen mainScreen].bounds.size.width - 40) / 3;
    
    for (int i = 0; i < self.imageArray.count; i++) {
        UIImage* image = self.imageArray[i];
        CGFloat size = ([UIScreen mainScreen].bounds.size.width - 40) / 3;
        
        UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
        imageView.userInteractionEnabled = YES;
        
        NSInteger indexY = i / 3;
        NSInteger indexX = i % 3;
        [self addSubview:imageView];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.textTextField.mas_bottom).mas_offset((size + 10) * indexY);
            make.left.mas_offset(10 + (size + 10) * indexX);
            make.size.mas_offset(size);
        }];
        
        [self.imageViewArray addObject:imageView];
    }
    
    NSInteger count = self.imageArray.count;
    NSInteger indexY = count / 3;
    NSInteger indexX = count % 3;
    [self.addImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.textTextField.mas_bottom).mas_offset((size + 10) * indexY);
        make.left.mas_offset(10 + (size + 10) * indexX);
        make.size.mas_offset(size);
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

- (void) layoutImageView {
    for (UIImageView* imageView in self.imageViewArray) {
        [imageView removeFromSuperview];
    }
    self.imageViewArray = nil;
    
    CGFloat size = ([UIScreen mainScreen].bounds.size.width - 40) / 3;
    
    for (int i = 0; i < self.imageArray.count; i++) {
        UIImage* image = self.imageArray[i];
        CGFloat size = ([UIScreen mainScreen].bounds.size.width - 40) / 3;
        
        UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
        imageView.userInteractionEnabled = YES;
        
        NSInteger indexY = i / 3;
        NSInteger indexX = i % 3;
        [self addSubview:imageView];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.textTextField.mas_bottom).mas_offset((size + 10) * indexY);
            make.left.mas_offset(10 + (size + 10) * indexX);
            make.size.mas_offset(size);
        }];
        
        [self.imageViewArray addObject:imageView];
    }
    
    NSInteger count = self.imageArray.count;
    NSInteger indexY = count / 3;
    NSInteger indexX = count % 3;
    [self.addImageButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.textTextField.mas_bottom).mas_offset((size + 10) * indexY);
        make.left.mas_offset(10 + (size + 10) * indexX);
        make.size.mas_offset(size);
    }];
}

#pragma mark - 点击方法
- (void) pressAddImageButton {
    [[NSNotificationCenter defaultCenter] postNotificationName:UpDataViewaddImageButtonPressed object:nil];
}

- (void) pressAdressButton {
    [[NSNotificationCenter defaultCenter] postNotificationName:UpDataViewaddressButtonPressed object:nil];
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
        
        CGFloat size = ([UIScreen mainScreen].bounds.size.width - 40) / 3;
        [addImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_addImageButton);
            make.size.mas_offset(size*0.4);
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
        self.addressLabel = addressLabel;
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
        
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressAdressButton)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        
        _addressButtonView.userInteractionEnabled = YES;
        [_addressButtonView addGestureRecognizer:tap];
    }
    return _addressButtonView;
}

- (NSMutableArray*) imageViewArray {
    if (_imageViewArray == nil) {
        self.imageViewArray = [[NSMutableArray alloc] init];
    }
    return _imageViewArray;
}

@end
