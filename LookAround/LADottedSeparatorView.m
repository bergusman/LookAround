//
//  LADottedSeparatorView.m
//  LookAround
//
//  Created by Vitaly Berg on 7/4/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LADottedSeparatorView.h"

@implementation LADottedSeparatorView {
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
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(size.width, 0)];
    path.lineWidth = 0.5;
    path.lineCapStyle = kCGLineCapRound;
    [path setLineDash:(CGFloat[]){0.5f, 1.5f} count:2 phase:0];
    [path stroke];
}

@end
