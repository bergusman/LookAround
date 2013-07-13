//
//  LADialogCell.m
//  LookAround
//
//  Created by Vitaly Berg on 7/13/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LADialogCell.h"

@implementation LADialogCell

- (void)awakeFromNib {
    [super awakeFromNib];
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
        self.nameLabel.font = [UIFont systemFontOfSize:16];
    } else {
        self.nameLabel.font = [UIFont boldSystemFontOfSize:16];
    }
}

@end
