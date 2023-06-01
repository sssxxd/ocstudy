//
//  ShopMallViewController.m
//  Find
//
//  Created by 孙旭东 on 2023/4/7.
//

#import "ShopMallViewController.h"

#import "ShopMallView.h"

// 引入第三方库
#import "Masonry.h"

@interface ShopMallViewController ()
<UITextFieldDelegate>

@property (nonatomic, strong) UITextField* searchTextField;

@end

@implementation ShopMallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = self.searchTextField;
    
    ShopMallView* shopMallView = [[ShopMallView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:shopMallView];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.searchTextField resignFirstResponder];
    return YES;
}

#pragma mark - 懒加载
- (UITextField*) searchTextField {
    if (_searchTextField == nil) {
        self.searchTextField = [[UITextField alloc] init];
        _searchTextField.frame = CGRectMake(0, 0, 303, 31);
        _searchTextField.backgroundColor = [UIColor whiteColor];
        _searchTextField.layer.cornerRadius = 31/2;
        _searchTextField.layer.masksToBounds = YES;
        _searchTextField.layer.borderWidth = 1;
        _searchTextField.layer.borderColor = [UIColor grayColor].CGColor;
        _searchTextField.delegate = self;
        _searchTextField.returnKeyType = UIReturnKeySearch;
        
        UIImageView* sousuoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sousuo-4.png"]];
        sousuoImageView.frame = CGRectMake(12, 0, 26, 26);
        _searchTextField.leftView = sousuoImageView;
        _searchTextField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _searchTextField;
}



@end
