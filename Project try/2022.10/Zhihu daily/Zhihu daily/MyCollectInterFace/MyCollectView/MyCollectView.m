//
//  MyCollectView.m
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/11/7.
//

#import "MyCollectView.h"
#import "MyCollectCell.h"
#import "Manage.h"


#define SCREEN_SIZE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation MyCollectView

- (void) ViewInit {
    self.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerClass:[MyCollectCell class] forCellReuseIdentifier:@"myCollectCell"];
    
    [self addSubview:self.tableView];
}

- (void) viewReload {
    [self.tableView reloadData];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return SCREEN_SIZE_HEIGHT / 7;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.titleArray count];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellName = @"myCollectCell";
    
    MyCollectCell* cell = [self.tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath];
    
    cell.titleLabel.text = self.titleArray[indexPath.row];
    [Manage setImage:cell.titleView WithString:self.imagePathArray[indexPath.row]];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger number = indexPath.row;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pressCollectCell" object:nil userInfo:@{@"value":[NSNumber numberWithInteger:number]}];
}

@end
