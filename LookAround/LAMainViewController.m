//
//  LAMainViewController.m
//  LookAround
//
//  Created by Vitaly Berg on 7/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LAMainViewController.h"

#import "LALogInViewController.h"
#import "LAMeViewController.h"
#import "LAMapViewController.h"

@interface LAMainViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *makePostButton;

@end

@implementation LAMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    LAMeViewController *meVC = [[LAMeViewController alloc] init];
    [self addChildViewController:meVC];
    meVC.view.frame = CGRectMake(0, 0, 320, self.view.frame.size.height);
    [self.scrollView addSubview:meVC.view];
    [meVC didMoveToParentViewController:self];
    */
    
    LALogInViewController *logInVC = [[LALogInViewController alloc] init];
    [self addChildViewController:logInVC];
    logInVC.view.frame = CGRectMake(0, 0, 320, self.view.frame.size.height);
    [self.scrollView addSubview:logInVC.view];
    [logInVC didMoveToParentViewController:self];
    
    
    LAMapViewController *mapVC = [[LAMapViewController alloc] init];
    [self addChildViewController:mapVC];
    mapVC.view.frame = CGRectMake(320, 0, 320, self.view.frame.size.height);
    [self.scrollView addSubview:mapVC.view];
    [mapVC didMoveToParentViewController:self];
    
    /*
    meVC.mapBlock = ^() {
        [self.scrollView setContentOffset:CGPointMake(320, 0) animated:YES];
    };
    
    mapVC.meBlock = ^() {
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    };
     */
    
    //LAMapViewController *mapVC = [[LAMapViewController alloc] init];
    
    
    UIView *view = [[UIView alloc] init];
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    view.frame = CGRectMake(320 - 10, 0, 20, self.view.frame.size.height);
    //view.backgroundColor = [UIColor blueColor];
    [self.scrollView addSubview:view];
    
    self.scrollView.scrollsToTop = NO;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.scrollView.contentSize = CGSizeMake(640, self.view.frame.size.height);
}

- (IBAction)makePhotoAction:(id)sender {
    UIImagePickerController *imagePickerVC = [[UIImagePickerController alloc] init];
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

@end
