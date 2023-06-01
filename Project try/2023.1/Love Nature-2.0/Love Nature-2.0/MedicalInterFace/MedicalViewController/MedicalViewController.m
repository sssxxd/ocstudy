//
//  MedicalViewController.m
//  Find
//
//  Created by 孙旭东 on 2023/4/12.
//

#import "MedicalViewController.h"

#import "MedicalView.h"

@interface MedicalViewController ()
<UITextFieldDelegate>

@property (nonatomic, strong) UITextField* searchTextField;
@property (nonatomic, strong) MedicalView* medicalView;

@end

@implementation MedicalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.titleView = self.searchTextField;
    [self.view addSubview:self.medicalView];
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

- (MedicalView *)medicalView {
    if (_medicalView == nil) {
        self.medicalView = [[MedicalView alloc] initWithFrame:self.view.frame];
    }
    return _medicalView;
}

@end
