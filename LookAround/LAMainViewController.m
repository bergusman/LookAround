//
//  LAMainViewController.m
//  LookAround
//
//  Created by Vitaly Berg on 7/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LAMainViewController.h"

#import "LALogInViewController.h"
#import "LAProfileViewController.h"
#import "LAMapViewController.h"
#import "LAMenuViewController.h"
#import "LANavigationController.h"

#import "LAMakePostViewController.h"

@interface LAMainViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *makePostButton;

@property (strong, nonatomic) UIViewController *leftViewController;
@property (strong, nonatomic) UIViewController *rightViewController;

@property (assign, nonatomic) BOOL hideButtonOnLeft;

@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation LAMainViewController

#pragma mark - NSObject

static LAMainViewController *_sharedMainVC;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _sharedMainVC = self;
    }
    return self;
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.wantsFullScreenLayout = NO;
    
    
    /*
    LAProfileViewController *meVC = [[LAProfileViewController alloc] init];
    LANavigationController *meNC = [[LANavigationController alloc] init];
    meNC.navigationBarHidden = YES;
    [meNC pushViewController:meVC animated:NO];
    
    [self addChildViewController:meNC];
    meNC.view.frame = CGRectMake(0, 0, 320, self.view.frame.size.height);
    [self.scrollView addSubview:meNC.view];
    [meNC didMoveToParentViewController:self];
    self.leftViewController = meNC;
     */
    
    
    LAMenuViewController *menuVC = [[LAMenuViewController alloc] init];
    LANavigationController *menuNC = [[LANavigationController alloc] init];
    menuNC.navigationBarHidden = YES;
    [menuNC pushViewController:menuVC animated:NO];
    
    [self addChildViewController:menuNC];
    menuNC.view.frame = CGRectMake(0, 0, 320, self.view.frame.size.height);
    [self.contentView addSubview:menuNC.view];
    [menuNC didMoveToParentViewController:self];
    self.leftViewController = menuNC;
    
    
    
    /*
    self.hideButtonOnLeft = YES;
    
    LALogInViewController *logInVC = [[LALogInViewController alloc] init];
    [self addChildViewController:logInVC];
    logInVC.view.frame = CGRectMake(0, 0, 320, self.view.frame.size.height);
    [self.scrollView addSubview:logInVC.view];
    [logInVC didMoveToParentViewController:self];
    
    self.leftViewController = logInVC;
    
    */
    
    /*
    LAMapViewController *mapVC = [[LAMapViewController alloc] init];
    [self addChildViewController:mapVC];
    mapVC.view.frame = CGRectMake(320, 0, 320, self.view.frame.size.height);
    [self.scrollView addSubview:mapVC.view];
    [mapVC didMoveToParentViewController:self];
    
    self.rightViewController = mapVC;
     */
    
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

- (void)setMakePostButtonHidden:(BOOL)hidden animated:(BOOL)animated {
    if (animated) {
        if (!hidden) {
            self.makePostButton.alpha = 0;
            self.makePostButton.hidden = NO;
        }
        
        [UIView animateWithDuration:0.2 animations:^{
            self.makePostButton.alpha = (hidden ? 0 : 1);
        } completion:^(BOOL finished) {
            self.makePostButton.hidden = hidden;
        }];
    } else {
        self.makePostButton.hidden = hidden;
    }
}

#pragma mark - IBActions

- (IBAction)makePhotoAction:(id)sender {
    LAMakePostViewController *makePostVC = [[LAMakePostViewController alloc] init];
    makePostVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:makePostVC animated:YES completion:nil];
}

#pragma mark - Singleton

+ (LAMainViewController *)sharedMainVC {
    return _sharedMainVC;
}

@end
