//
//  InterFaceView.m
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/10/16.
//

#import "InterFaceView.h"
#import "HomeScrollerViewCell.h"
#import "StoriesListCell.h"
#import "ActivityViewCell.h"
#import "DateTool.h"
#import "Masonry.h"

#define SCREEN_SIZE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation InterFaceView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void) viewInit {
    if (self.tableView == nil) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        self.tableView.backgroundColor = [UIColor whiteColor];
        
        [self.tableView registerClass:[StoriesListCell class] forCellReuseIdentifier:@"Stories"];
        [self addSubview:self.tableView];
    }
    
    self.isLoading = NO;
    
    [self.tableView reloadData];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 && indexPath.section == 0) {
        return SCREEN_SIZE_WIDTH;
    } else if (indexPath.section == self.stories.count && indexPath.row == [self.stories[indexPath.section - 1] count]) {
        return SCREEN_SIZE_HEIGHT / 10;
    }
    return SCREEN_SIZE_HEIGHT / 7;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    if (_topTitleArray == nil) {
        return 0;
    }
    return self.stories.count + 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == self.stories.count) {
        return [self.stories[section - 1] count] + 1;
    } else {
        return [self.stories[section - 1] count];
    }
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        NSString* cellName = @"HomeScrollerViewCell";
        
        HomeScrollerViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[HomeScrollerViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        cell.imageViewArray = self.imageViewArray;
        cell.titleArray = self.topTitleArray;
        cell.userNameArray = self.topUserNameArray;
        return cell;
    } else if (indexPath.section == self.stories.count && indexPath.row == [self.stories[indexPath.section - 1] count]) {
        NSString* cellName = @"ActivityView";
        
        ActivityViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell = [[ActivityViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        
        if (self.isLoading) {
            [cell.activityView startAnimating];
        } else {
            if (cell.activityView.animating) {
                [cell.activityView stopAnimating];
            }
        }
        
        return cell;
    } else {
        NSString* cellName = @"Stories";
        
        StoriesListCell* cell = [self.tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath];
        
        if (indexPath.row < [self.stories[indexPath.section -1] count]) {
            cell.titleLable.text = self.stories[indexPath.section - 1][indexPath.row][@"title"];
            cell.hintLable.text = self.stories[indexPath.section - 1][indexPath.row][@"hint"];
            
            [Manage setImage:cell.titleView WithString:self.stories[indexPath.section - 1][indexPath.row][@"images"][0]];
        } else {
            NSLog(@"%ld %ld", indexPath.section, indexPath.row);
            cell.titleLable.text = @"终于被我抓到了吧";
        }
        
        return cell;
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    } else if (section == 1) {
        return 5;
    }
    return 35;
}

- (UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* view = [[UITableViewHeaderFooterView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE_WIDTH, 0)];
    return view;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (UIView*) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE_WIDTH, 0)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == self.stories.count && indexPath.row == [self.stories[indexPath.section - 1] count]) {
        return;
    }
    if (indexPath.section != 0) {
        NSInteger number = 0;
        for (NSInteger i = 0; i < indexPath.section - 1; i++) {
            number += [self.stories[i] count];
        }
        
        number += indexPath.row;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"pressStoriesCell" object:nil userInfo:@{@"value":[NSNumber numberWithInteger:number]}];
    }
}

- (void) tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    if (section > 1) {
        UITableViewHeaderFooterView* header = (UITableViewHeaderFooterView*)view;
        header.textLabel.font = [UIFont systemFontOfSize:16];

        UIView* lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor grayColor];

        [header.contentView addSubview:lineView];

        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.left.mas_equalTo(100);
            make.height.mas_offset(1);
            make.centerY.mas_equalTo(0);
        }];
    }
}

- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section > 1) {
        return [DateTool getMonthAndDayWithTimeString:self.lastDateArray[section - 1]];
    }
    return @"";
}

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (self.isLoading == NO) {
        CGFloat offsetY = scrollView.contentOffset.y;
        CGFloat contHeight = scrollView.contentSize.height;
        CGFloat boundHeight = scrollView.bounds.size.height;
        
        CGFloat Y = contHeight - boundHeight;
        
        if  (offsetY >= Y) {
            self.isLoading = YES;
            [self.tableView reloadData];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"loadLastStories" object:nil];
        }
    }
}

@end
