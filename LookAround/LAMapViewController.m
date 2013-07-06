//
//  LAMapViewController.m
//  LookAround
//
//  Created by Vitaly Berg on 7/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LAMapViewController.h"

#import "LAMainViewController.h"

#import <MapKit/MapKit.h>

@interface LAMapViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation LAMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self moveLegal];
}

#pragma mark - Helpers

- (void)moveLegal {
    for (UIView *view in self.mapView.subviews) {
        if ([view isKindOfClass:[UILabel class]]) {
            CGRect frame = view.frame;
            frame.origin.x = 320 - 10 - frame.size.width;
            view.frame = frame;
        }
    }
}

#pragma mark - Actions

- (IBAction)leftAction:(id)sender {
    [[LAMainViewController sharedMainVC] showLeft];
}

@end
