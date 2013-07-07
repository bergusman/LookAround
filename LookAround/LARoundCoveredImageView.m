//
//  LARoundCoveredImageView.m
//  LookAround
//
//  Created by Vitaly Berg on 7/7/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LARoundCoveredImageView.h"

@implementation LARoundCoveredImageView {
    UIImageView *_coverImageView;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupImageView];
        [self setupCoverImageView];
        [self setCover];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupImageView];
        [self setupCoverImageView];
        [self setCover];
    }
    return self;
}

- (void)setupImageView {
    self.contentMode = UIViewContentModeScaleAspectFill;
    self.clipsToBounds = YES;
}

- (void)setupCoverImageView {
    _coverImageView = [[UIImageView alloc] init];
    _coverImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _coverImageView.frame = self.bounds;
    [self addSubview:_coverImageView];
}

- (void)setCover {
    if (!_coverImageView) {
        return;
    }
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
    
    [[self findCoverColor] setFill];
    
    UIBezierPath *ovalPath = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRect:self.bounds];
    [rectPath appendPath:ovalPath];
    rectPath.usesEvenOddFillRule = YES;
    [rectPath fill];
    
    _coverImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

- (UIColor *)findCoverColor {
    if (self.coverColor) {
        return self.coverColor;
    }
    
    return [UIColor whiteColor];

    UIView *view = self.superview;
    while (view) {
        if (view.backgroundColor && ![view.backgroundColor isEqual:[UIColor clearColor]]) {
            return view.backgroundColor;
        }
        view = view.superview;
    }

    return nil;
}

- (void)setCoverColor:(UIColor *)coverColor {
    _coverColor = coverColor;
    [self setCover];
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self setCover];
}

@end
