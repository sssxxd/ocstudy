//
//  FirstShowViewController.m
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import "FirstShowViewController.h"
#import "FirstShowTableViewCell.h"
#import "FirstShowUserTableViewCell.h"

@interface FirstShowViewController ()

@end

@implementation FirstShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 80) style:UITableViewStylePlain];
    
    _tableView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height * 3);
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView reloadData];
    [self.view addSubview:_tableView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 100;
    } else {
        return 500 * 2;
    }
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        NSString* cellName = @"userIconCell";
        
        FirstShowUserTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[FirstShowUserTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        cell.eyeNumber.text = @"55";
        cell.shareNumber.text = @"68";
        cell.heartNumber.text = [NSString stringWithFormat:@"%ld", 101 + _selected];
        
        [cell.heartLogo addTarget:self action:@selector(pressHeartLogo) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    } else {
        NSString* cellName = @"show";
        
        FirstShowTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[FirstShowTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        return cell;
    }
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void) pressHeartLogo {
    self.selected = !self.selected;
    
    [self.delegate sendSelected:self.selected];
    
    [_tableView reloadData];
}

@end
