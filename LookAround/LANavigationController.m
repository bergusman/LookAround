//
//  LANavigationController.m
//  LookAround
//
//  Created by Vitaly Berg on 05.07.13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LANavigationController.h"

@interface LANavigationController ()

@end

@implementation LANavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    UIViewController *prevVC = [self.viewControllers lastObject];
        
    if ([self.viewControllers count] > 0) {
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [viewController.view addGestureRecognizer:pan];
    }
    
    [self addChildViewController:viewController];
    [self.view addSubview:viewController.view];
    [viewController didMoveToParentViewController:self];
    
    viewController.view.frame = self.view.bounds;

    if (animated) {
        viewController.view.x = 320;
        
        [UIView animateWithDuration:0.3 animations:^{
            viewController.view.x = 0;
            prevVC.view.x = -320;
        }];
    } else {
        
    }
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    if ([self.viewControllers count] < 2) {
        return nil;
    }
    
    UIViewController *topVC = [self.viewControllers lastObject];
    UIViewController *prevVC = self.viewControllers[[self.viewControllers count] - 2];
    
    if (animated) {
        prevVC.view.x = -320;
        [UIView animateWithDuration:0.3 animations:^{
            topVC.view.x = 320;
            prevVC.view.x = 0;
        } completion:^(BOOL finished) {
            [topVC willMoveToParentViewController:nil];
            [topVC.view removeFromSuperview];
            [topVC removeFromParentViewController];
        }];
    } else {
        [topVC willMoveToParentViewController:nil];
        [topVC.view removeFromSuperview];
        [topVC removeFromParentViewController];
    }
    
    
    
    return topVC;
}

#pragma mark - Actions

- (void)pan:(UIPanGestureRecognizer *)pan {
    if ([self.viewControllers count] < 2) {
        return;
    }
     
    UIViewController *topVC = [self.viewControllers lastObject];
    UIViewController *prevVC = self.viewControllers[[self.viewControllers count] - 2];
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        [self.view addSubview:prevVC.view];
        prevVC.view.x = -320;
        
    }
    else if (pan.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [pan translationInView:topVC.view];
        
        topVC.view.centerX += translation.x;
        prevVC.view.x = topVC.view.x - 320;
        
        [pan setTranslation:CGPointZero inView:topVC.view];
    }
    else if (pan.state == UIGestureRecognizerStateEnded || pan.state == UIGestureRecognizerStateCancelled) {
        CGPoint velocity = [pan velocityInView:topVC.view];
        NSLog(@"%f", velocity.x);
        
        if (topVC.view.x > 160 || velocity.x > 100) {
            NSTimeInterval duration = 0.2;
            
            
            
            [UIView animateWithDuration:duration animations:^{
                topVC.view.x = 320;
                prevVC.view.x = 0;
            } completion:^(BOOL finished) {
                [topVC willMoveToParentViewController:nil];
                [topVC.view removeFromSuperview];
                [topVC removeFromParentViewController];
            }];
        } else {
            [UIView animateWithDuration:0.2 animations:^{
                topVC.view.x = 0;
                prevVC.view.x = topVC.view.x - 320;
            }];
        }
    }
}

@end
