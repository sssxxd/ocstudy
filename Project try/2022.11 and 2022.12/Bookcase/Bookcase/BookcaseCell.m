//
//  BookcaseCell.m
//  Bookcase
//
//  Created by 孙旭东 on 2022/12/18.
//

#import "BookcaseCell.h"

@implementation BookcaseCell

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

@end
