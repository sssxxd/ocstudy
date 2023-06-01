//
//  KnowledBaseViewController.m
//  Find
//
//  Created by 孙旭东 on 2023/4/12.
//

#import "KnowledBaseViewController.h"

#import "KonwledgeBaseView.h"

@interface KnowledBaseViewController ()
<UITextFieldDelegate>

@property (nonatomic, strong) UITextField* searchTextField;
@property (nonatomic, strong) KonwledgeBaseView* konwledgeBaseView;
@end

@implementation KnowledBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.titleView = self.searchTextField;
    [self createBackItem];
    
    [self.view addSubview:self.konwledgeBaseView];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.searchTextField resignFirstResponder];
    return YES;
}

#pragma mark - 懒加载
- (UITextField *)searchTextField {
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

- (KonwledgeBaseView *)konwledgeBaseView {
    if (_konwledgeBaseView == nil) {
        self.konwledgeBaseView = [[KonwledgeBaseView alloc] initWithFrame:self.view.frame];
    }
    return _konwledgeBaseView;
}

// 设置Item
- (void) createBackItem {
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fanhui.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressBackItem)];
    
    item.tintColor = [UIColor blackColor];
    
    self.navigationItem.leftBarButtonItem = item;
}

- (void) pressBackItem {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
