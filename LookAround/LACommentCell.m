//
//  LACommentCell.m
//  LookAround
//
//  Created by Vitaly Berg on 20.07.13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LACommentCell.h"

#define MIN_HEIGHT 75
#define COMMENT_FONT_SIZE 16
#define COMMENT_WIDTH 240

@implementation LACommentCell

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.dateLabel sizeToFit];
    self.dateLabel.x = self.contentView.width - 10 - self.dateLabel.width;
    self.dateLabel.height = 20;
    
    self.nameLabel.width = self.dateLabel.x - 10 - self.nameLabel.x;
}

+ (CGFloat)heightWithComment:(NSString *)comment {
    static UIFont *font = nil;
    if (!font) {
        font = [UIFont systemFontOfSize:COMMENT_FONT_SIZE];
    }
    CGSize size = [comment sizeWithFont:font constrainedToSize:CGSizeMake(COMMENT_WIDTH, 0) lineBreakMode:NSLineBreakByWordWrapping];
    return MAX(MIN_HEIGHT, size.height + 40);
}

@end
