//
//  PictureCell.m
//  Picture Wall
//
//  Created by 孙旭东 on 2022/11/22.
//

#import "PictureCell.h"

@implementation PictureCell

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

@end
