//
//  LASeparatorView.m
//  LookAround
//
//  Created by Vitaly Berg on 7/4/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LASeparatorView.h"

@implementation LASeparatorView {
    UIColor *_strokeColor;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    _strokeColor = backgroundColor;
    [super setBackgroundColor:[UIColor clearColor]];
}

- (UIColor *)backgroundColor {
    return _strokeColor;
}

- (void)drawRect:(CGRect)rect {
    CGSize size = self.size;
    [_strokeColor setFill];
    
    if (self.bottom) {
        UIRectFill(CGRectMake(0, 0, size.width, 0.5));
    } else {
        UIRectFill(CGRectMake(0, size.height - 0.5, size.width, 0.5));
    }
}

@end
