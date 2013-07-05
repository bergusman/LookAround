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
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    
    [viewController.view addGestureRecognizer:pan];
    
    [self addChildViewController:viewController];
    viewController.view.frame = self.view.bounds;
    [self.view addSubview:viewController.view];
    [viewController didMoveToParentViewController:self];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    
}

#pragma mark - Actions

- (void)pan:(UIPanGestureRecognizer *)pan {
    
}

@end
