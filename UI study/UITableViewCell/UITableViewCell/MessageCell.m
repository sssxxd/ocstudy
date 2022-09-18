//
//  MessageCell.m
//  UITableViewCell
//
//  Created by 孙旭东 on 2022/7/20.
//

#import "MessageCell.h"
#import "messageFrame.h"

@implementation MessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel* userName = [[UILabel alloc] init];
        userName.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:userName];
        self.userName = userName;
        
        UILabel* message = [[UILabel alloc] init];
        message.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:message];
        self.message = message;
        
        UIImageView* iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
    }
    return self;
}

- (void) setMessageFrame:(messageFrame *)messageFrame {
    // 设置数据模型数据
    _messageFrame = messageFrame;
    
    // 子控件的位置
    self.userName.frame = messageFrame.userNameFrame;
    self.message.frame = messageFrame.messageFrame;
}

@end
