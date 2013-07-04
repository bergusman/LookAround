//
//  LAMagicButton.m
//  LookAround
//
//  Created by Vitaly Berg on 7/4/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LAMagicButton.h"

@implementation LAMagicButton

- (void)setHighlighted:(BOOL)highlighted {
    if (self.alphing) {
        if (highlighted) {
            self.alpha = 0.5;
            [self setNeedsDisplay];
        } else {
            double delayInSeconds = 0.1;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [UIView animateWithDuration:0.1 animations:^{
                    self.alpha = 1;
                }];
            });
        }
        return;
    }
    
    for (UIView *view in self.subviews) {
        if ([view respondsToSelector:@selector(setHighlighted:)]) {
            UILabel *label = (UILabel *)view;
            [label setHighlighted:highlighted];
        }
    }
}

#pragma mark - UIControl

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    NSLog(@"Begin");
    [self setHighlighted:YES];
    return [super beginTrackingWithTouch:touch withEvent:event];
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    NSLog(@"End");
    [self setHighlighted:NO];
    [super endTrackingWithTouch:touch withEvent:event];
}

- (void)cancelTrackingWithEvent:(UIEvent *)event {
    NSLog(@"Cancel");
    [self setHighlighted:NO];
    [super cancelTrackingWithEvent:event];
}

@end
