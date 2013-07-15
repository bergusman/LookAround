//
//  LAPostAnnotationView.m
//  LookAround
//
//  Created by Vitaly Berg on 7/14/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LAPostAnnotationView.h"

@implementation LAPostAnnotationView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _photoImageView = [[UIImageView alloc] init];
        _photoImageView.frame = CGRectMake(2, 2, 46, 46);
        [self addSubview:_photoImageView];
    }
    return self;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(50, 50);
}

@end
