//
//  ViewController.m
//  UITableViewCell
//
//  Created by 孙旭东 on 2022/7/20.
//

#import "ViewController.h"
#import "messageFrame.h"
#import "MessageCell.h"

@interface ViewController ()

@property (nonatomic, weak) messageFrame* messagerFrame;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITableView* tableView = [[UITableView alloc] init];
    
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellStr = @"cell";
    
    MessageCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellStr];
    
    if (cell == nil) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    }
    
    /* 传递数据给cell */
    
    return cell;
}

@end


