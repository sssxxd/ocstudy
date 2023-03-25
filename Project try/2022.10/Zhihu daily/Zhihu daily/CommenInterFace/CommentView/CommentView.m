//
//  CommentView.m
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/11/1.
//

#import "CommentView.h"
#import "CommentCell.h"
#import "CommentReplyedCell.h"
#import "Manage.h"
#import "DateTool.h"
#import "Masonry.h"

#define SCREEN_SIZE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE_WIDTH [UIScreen mainScreen].bounds.size.width

#define USERICON_SIZE (SCREEN_SIZE_HEIGHT/25)

@implementation CommentView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void) ViewInit {
    self.unfoldSet = [[NSMutableSet alloc] init];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.estimatedRowHeight = 300;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self addSubview:self.tableView];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.commentDict count];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0 && self.commentDict[@"long"] != nil) {
        return [self.commentDict[@"long"] count];
    } else {
        return [self.commentDict[@"short"] count];
    }
}

//- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return self.cellHeight;
//}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && self.commentDict[@"long"] != nil) {
        if (self.commentDict[@"long"][indexPath.row][@"reply_to"] == nil) {
            NSString* cellName = @"commentCell";
            
            CommentCell* cell = [self.tableView dequeueReusableCellWithIdentifier:cellName];
            
            if (cell == nil) {
                cell = [[CommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
            }
            [Manage setImage:cell.userIcon WithString:self.commentDict[@"long"][indexPath.row][@"avatar"]];
            cell.userName.text = self.commentDict[@"long"][indexPath.row][@"author"];
            cell.userComment.text = self.commentDict[@"long"][indexPath.row][@"content"];
            cell.timeDay.text = [DateTool getMonthAndDayHaveHorizontalLineWithTimeStamp:self.commentDict[@"long"][indexPath.row][@"time"]];
            
            cell.time.text = [DateTool getExactTimeWithTimeStamp:self.commentDict[@"long"][indexPath.row][@"time"]];
            
    //        [cell.userComment sizeToFit];
            if (![self.commentDict[@"long"][indexPath.row][@"likes"] isEqual:@"0"]) {
                cell.likeNumber.text = self.commentDict[@"long"][indexPath.row][@"likes"];
            } else {
                cell.likeNumber.text = @"";
            }
            
            return cell;
        } else {
            NSString* cellName = @"commentReplyedCell";
            
            CommentReplyedCell* cell = [self.tableView dequeueReusableCellWithIdentifier:cellName];
            
            if (cell == nil) {
                cell = [[CommentReplyedCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
            }
            
            [Manage setImage:cell.userIcon WithString:self.commentDict[@"long"][indexPath.row][@"avatar"]];
            cell.userName.text = self.commentDict[@"long"][indexPath.row][@"author"];
            cell.userComment.text = self.commentDict[@"long"][indexPath.row][@"content"];
            cell.timeDay.text = [DateTool getMonthAndDayHaveHorizontalLineWithTimeStamp:self.commentDict[@"long"][indexPath.row][@"time"]];
            NSDictionary* replyToDict = self.commentDict[@"long"][indexPath.row][@"reply_to"];
            
            NSString* replyString = [NSString stringWithFormat:@"//%@：%@", replyToDict[@"author"], replyToDict[@"content"]];
            cell.replyComment.text = replyString;
            
            cell.unFoldButton.tag = (indexPath.section + 1) * 11111 + (indexPath.row + 1) * 11;
            
            cell.replyComment.tag = (indexPath.section + 1) * 22222 + (indexPath.row + 1) * 22;
            
            cell.unFoldLabel.tag = (indexPath.section + 1) * 33333 + (indexPath.row + 1) * 33;
            
//            cell.unfoldSelected = self.unfoldSet;
            if ([self labelNeedLinesWithString:replyString] > 2) {
                if ([self.unfoldSet containsObject:[NSString stringWithFormat:@"%ld", cell.unFoldButton.tag]]) {
                    cell.unFoldLabel.text = @"收起";
                    cell.replyComment.numberOfLines = 0;
                } else {
                    cell.unFoldLabel.text = @"展开全文";
                    cell.replyComment.numberOfLines = 2;
                }
            } else {
                cell.unFoldLabel.text = @"";
                cell.replyComment.numberOfLines = 2;
                cell.unFoldButton.tag = 0;
            }
            
            [cell.unFoldButton addTarget:self action:@selector(pressUnfold:) forControlEvents:UIControlEventTouchUpInside];
            
            if (![self.commentDict[@"long"][indexPath.row][@"likes"] isEqual:@"0"]) {
                cell.likeNumber.text = self.commentDict[@"long"][indexPath.row][@"likes"];
            } else {
                cell.likeNumber.text = @"";
            }
            
            cell.time.text = [DateTool getExactTimeWithTimeStamp:self.commentDict[@"long"][indexPath.row][@"time"]];
            
    //        [cell.userComment sizeToFit];
            
            
            return cell;
        }
    } else {
        if (self.commentDict[@"short"][indexPath.row][@"reply_to"] == nil) {
            NSString* cellName = @"commentCell";
            
            CommentCell* cell = [self.tableView dequeueReusableCellWithIdentifier:cellName];
            
            if (cell == nil) {
                cell = [[CommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
            }
            [Manage setImage:cell.userIcon WithString:self.commentDict[@"short"][indexPath.row][@"avatar"]];
            cell.userName.text = self.commentDict[@"short"][indexPath.row][@"author"];
            cell.userComment.text = self.commentDict[@"short"][indexPath.row][@"content"];
            cell.timeDay.text = [DateTool getMonthAndDayHaveHorizontalLineWithTimeStamp:self.commentDict[@"short"][indexPath.row][@"time"]];
            
            cell.time.text = [DateTool getExactTimeWithTimeStamp:self.commentDict[@"short"][indexPath.row][@"time"]];
            
    //        [cell.userComment sizeToFit];
            if (![self.commentDict[@"short"][indexPath.row][@"likes"] isEqual:@"0"]) {
                cell.likeNumber.text = self.commentDict[@"short"][indexPath.row][@"likes"];
            } else {
                cell.likeNumber.text = @"";
            }
            
            return cell;
        } else {
            NSString* cellName = @"commentReplyedCell";
            
            CommentReplyedCell* cell = [self.tableView dequeueReusableCellWithIdentifier:cellName];
            
            if (cell == nil) {
                cell = [[CommentReplyedCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
            }
            
            [Manage setImage:cell.userIcon WithString:self.commentDict[@"short"][indexPath.row][@"avatar"]];
            cell.userName.text = self.commentDict[@"short"][indexPath.row][@"author"];
            cell.userComment.text = self.commentDict[@"short"][indexPath.row][@"content"];
            cell.timeDay.text = [DateTool getMonthAndDayHaveHorizontalLineWithTimeStamp:self.commentDict[@"short"][indexPath.row][@"time"]];
            NSDictionary* replyToDict = self.commentDict[@"short"][indexPath.row][@"reply_to"];
            
            cell.unFoldButton.tag = (indexPath.section + 1) * 11111 + (indexPath.row + 1) * 11;
            
            cell.replyComment.tag = (indexPath.section + 1) * 22222 + (indexPath.row + 1) * 22;
            
            cell.unFoldLabel.tag = (indexPath.section + 1) * 33333 + (indexPath.row + 1) * 33;
            
//            cell.unfoldSelected = self.unfoldSet;
            
            NSString* replyString = [NSString stringWithFormat:@"//%@：%@", replyToDict[@"author"], replyToDict[@"content"]];
            cell.replyComment.text = replyString;
            
            if ([self labelNeedLinesWithString:replyString] > 2) {
                if ([self.unfoldSet containsObject:[NSString stringWithFormat:@"%ld", cell.unFoldButton.tag]]) {
                    cell.unFoldLabel.text = @"收起";
                    cell.replyComment.numberOfLines = 0;
                } else {
                    cell.unFoldLabel.text = @"展开全文";
                    cell.replyComment.numberOfLines = 2;
                }
            } else {
                cell.unFoldLabel.text = @"";
                cell.replyComment.numberOfLines = 2;
                cell.unFoldButton.tag = 0;
            }
            
            
            [cell.unFoldButton addTarget:self action:@selector(pressUnfold:) forControlEvents:UIControlEventTouchUpInside];

            if (![self.commentDict[@"short"][indexPath.row][@"likes"] isEqual:@"0"]) {
                cell.likeNumber.text = self.commentDict[@"short"][indexPath.row][@"likes"];
            } else {
                cell.likeNumber.text = @"";
            }
            
            cell.time.text = [DateTool getExactTimeWithTimeStamp:self.commentDict[@"short"][indexPath.row][@"time"]];
            
    //        [cell.userComment sizeToFit];
            
            
            return cell;
        }
    }
}

- (UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* view = [[UITableViewHeaderFooterView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE_WIDTH, 0)];
    return view;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 35;
}

- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0 && self.commentDict[@"long"] != nil) {
        return [NSString stringWithFormat:@"%ld条长评", [self.commentDict[@"long"] count]];
    } else {
        return [NSString stringWithFormat:@"%ld条短评", [self.commentDict[@"short"] count]];
    }
}

- (void) tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    UITableViewHeaderFooterView* header = (UITableViewHeaderFooterView*)view;
    header.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    header.textLabel.textColor = [UIColor blackColor];
}

- (void) viewReload {
    [self.tableView reloadData];
}

- (void)pressUnfold:(UIButton*)sender {
    if (!sender.tag) {
        return;
    }
    NSString* unfoldTagString = [NSString stringWithFormat:@"%ld", sender.tag];
    NSInteger replyCommentTag = sender.tag * 2;
    NSInteger unfoldLabelTag = sender.tag * 3;
    
    
    if ([self.unfoldSet containsObject:unfoldTagString]) {
        
        [self.unfoldSet removeObject:unfoldTagString];

        UILabel* label = (UILabel*)[sender.superview viewWithTag:replyCommentTag];
        label.numberOfLines = 2;
        
        UILabel* unfoldLabel = (UILabel*)[sender.superview viewWithTag:unfoldLabelTag];
        unfoldLabel.text = @"展开全文";

        [self.tableView reloadData];
    } else {
        
        [self.unfoldSet addObject:unfoldTagString];

        UILabel* label = (UILabel*)[sender.superview viewWithTag:replyCommentTag];
        label.numberOfLines = 0;
        
        UILabel* unfoldLabel = (UILabel*)[sender.superview viewWithTag:unfoldLabelTag];
        unfoldLabel.text = @"收起";

        [self.tableView reloadData];
    }
}

- (NSInteger) labelNeedLinesWithString:(NSString*)string {
    CGFloat width = SCREEN_SIZE_WIDTH - (USERICON_SIZE + 50);

    UILabel* lable = [[UILabel alloc] init];
    lable.font = [UIFont systemFontOfSize:16];
    
    NSInteger sum = 0;
    
    NSArray* splitText = [string componentsSeparatedByString:@"\n"];
    for (NSString* sText in splitText) {
        lable.text = sText;
        
        CGSize textSize = [lable systemLayoutSizeFittingSize:CGSizeZero];
        NSInteger lines = ceilf(textSize.width/width);
        
        lines = lines == 0?1:lines;
        sum += lines;
    }
    
    return sum;
}

@end
