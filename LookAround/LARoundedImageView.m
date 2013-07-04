//
//  LARoundedImageView.m
//  LookAround
//
//  Created by Vitaly Berg on 7/4/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LARoundedImageView.h"

@interface _LARoundedImageView : UIView

@property (strong, nonatomic) UIImage *image;

@end

@implementation _LARoundedImageView

- (void)setImage:(UIImage *)image {
    _image = image;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGSize size = self.size;
    [[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)] addClip];
    [_image drawInRect:CGRectMake(0, 0, size.width, size.height)];
}

@end

@implementation LARoundedImageView {
    _LARoundedImageView *_roundedImageView;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupInnerRoundedImageView];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupInnerRoundedImageView];
    }
    return self;
}

- (void)setupInnerRoundedImageView {
    _roundedImageView = [[_LARoundedImageView alloc] init];
    _roundedImageView.frame = self.bounds;
    _roundedImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _roundedImageView.backgroundColor = [UIColor clearColor];
    [self addSubview:_roundedImageView];
}

- (void)setImage:(UIImage *)image {
    _roundedImageView.image = image;
}

- (UIImage *)image {
    return _roundedImageView.image;
}

@end
