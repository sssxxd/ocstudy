//
//  FirendsQuanViewController.m
//  KaoHe
//
//  Created by 孙旭东 on 2022/8/5.
//

#import "FirendsQuanViewController.h"

@interface FirendsQuanViewController ()

@end

@implementation FirendsQuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"朋友圈";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UINavigationBarAppearance* appearance = [[UINavigationBarAppearance alloc] init];
    appearance.backgroundColor = [UIColor whiteColor];
    appearance.backgroundImage = [[UIImage alloc] init];
    
    self.navigationController.navigationBar.standardAppearance = appearance;
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    
    [self creatBackItem];
    
    [self createTableView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) creatBackItem {
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fanhui.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressBack)];
    
    self.navigationItem.leftBarButtonItem = item;
}

- (void) pressBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) createTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView reloadData];
    
    [self.view addSubview:_tableView];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 11;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 240;
    } else if (indexPath.row % 2) {
        return 270;
    } else {
        return 70;
    }
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        NSString* cellName = @"HeadViewCell";
        
        HeadViewTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[HeadViewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        
        cell.userName.text = @"王哈哈";
        [cell.userIcon setImage:[UIImage imageNamed:@"userIcon.jpeg"]];
        [cell.backImageView setImage:[UIImage imageNamed:@"backImage.jpeg"]];
        
        return cell;
    } else if (indexPath.row % 2) {
        NSString* cellName = @"FirendsFirstCell";
        
        FirendsTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[FirendsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        
        cell.userName.text = @"小明";
        [cell.userIcon setImage:[UIImage imageNamed:@"first_list_img1.jpeg"]];
        [cell.sharePicture setImage:[UIImage imageNamed:@"first_list_img2.jpeg"]];
        
        return  cell;
    } else {
        NSString* cellName = @"FirendsSecondCell";
        
        FirendsSecondTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[FirendsSecondTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        cell.userName.text = @"小米";
        [cell.userIcon setImage:[UIImage imageNamed:@"first_list_img3.jpeg"]];
        cell.shareTitle.text = @"今天也要元气满满！";
        
        return  cell;
    }
}

@end
