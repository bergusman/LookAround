//
//  LAUserCell.m
//  LookAround
//
//  Created by Vitaly Berg on 7/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LAUserCell.h"

@implementation LAUserCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectedBackgroundView = [[UIView alloc] init];
}

@end
