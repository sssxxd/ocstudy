//
//  InformationViewController.m
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import "InformationViewController.h"
#import "UserIconTableViewCell.h"
#import "InformationTableViewCell.h"
#import "SexTableViewCell.h"

@interface InformationViewController ()

@end

@implementation InformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createTableView];
    
    [self createBarButtonItem];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) createTableView {
    _tableVIew = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableVIew.delegate = self;
    _tableVIew.dataSource = self;
    
    [_tableVIew reloadData];
    
    [self.view addSubview:_tableVIew];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 100;
    } else {
        return 60;
    }
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        NSString* cellName = @"IconCell";
        
        UserIconTableViewCell* cell = [_tableVIew dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[UserIconTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        [cell.icon setImage:[UIImage imageNamed:@"icon_img12.jpeg"]];
        
        return cell;
    } else if (indexPath.row == 1) {
        NSString* cellName = @"InformationCell";
        
        InformationTableViewCell* cell = [_tableVIew dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[InformationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        cell.crad.text = @"昵称";
        cell.cradTitle.text = @"share小白";
        
        return cell;
    } else if (indexPath.row == 2) {
        NSString* cellName = @"InformationCell";
        
        InformationTableViewCell* cell = [_tableVIew dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[InformationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        cell.crad.text = @"签名";
        cell.cradTitle.text = @"开心了就笑";
        
        return cell;
    } else if (indexPath.row == 3) {
        NSString* cellName = @"SexCell";
        
        SexTableViewCell* cell = [_tableVIew dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[SexTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        return cell;
    } else {
        NSString* cellName = @"InformationCell";
        
        InformationTableViewCell* cell = [_tableVIew dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[InformationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        cell.crad.text = @"邮箱";
        cell.cradTitle.text = @"333####@qq.com";
        
        return cell;
    }
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableVIew deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma - 导航栏按钮设计
- (void) createBarButtonItem {
    UIBarButtonItem* itemImage = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_img.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressBack)];
    
    [itemImage setTintColor:[UIColor whiteColor]];
    
    self.navigationItem.leftBarButtonItem = itemImage;
    
    
}

- (void) pressBack {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
