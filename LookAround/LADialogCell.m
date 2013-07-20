//
//  LADialogCell.m
//  LookAround
//
//  Created by Vitaly Berg on 7/13/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LADialogCell.h"

@implementation LADialogCell

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.dateLabel.width = 100;
    [self.dateLabel sizeToFit];
    self.dateLabel.x = self.contentView.width - 10 - self.dateLabel.width;
    self.dateLabel.height = 20;
    
    self.titleLabel.width = self.dateLabel.x - 10 - self.titleLabel.x;
}

- (void)setType:(LADialogCellType)type {
    _type = type;
    if (type == LADialogCellTypeUser) {
        self.avatarImageView.hidden = NO;
        self.photoImageView.hidden = YES;
    } else {
        self.avatarImageView.hidden = YES;
        self.photoImageView.hidden = NO;
    }
}

- (void)setRead:(BOOL)read {
    _read = read;
    if (read) {
        self.titleLabel.font = [UIFont systemFontOfSize:16];
    } else {
        self.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    }
}

+ (CGFloat)height {
    return 74;
}

@end
