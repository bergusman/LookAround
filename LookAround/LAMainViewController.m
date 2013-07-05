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
#import "LANavigationController.h"

#import "LAMakePostViewController.h"

@interface LAMainViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *makePostButton;

@property (strong, nonatomic) UIViewController *leftViewController;
@property (strong, nonatomic) UIViewController *rightViewController;

@property (assign, nonatomic) BOOL hideButtonOnLeft;

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
    
    
    
    LAMeViewController *meVC = [[LAMeViewController alloc] init];
    LANavigationController *meNC = [[LANavigationController alloc] init];
    meNC.navigationBarHidden = YES;
    [meNC pushViewController:meVC animated:NO];
    
    [self addChildViewController:meNC];
    meNC.view.frame = CGRectMake(0, 0, 320, self.view.frame.size.height);
    [self.scrollView addSubview:meNC.view];
    [meNC didMoveToParentViewController:self];
    self.leftViewController = meNC;
    
    /*
    
    self.hideButtonOnLeft = YES;
    
    LALogInViewController *logInVC = [[LALogInViewController alloc] init];
    [self addChildViewController:logInVC];
    logInVC.view.frame = CGRectMake(0, 0, 320, self.view.frame.size.height);
    [self.scrollView addSubview:logInVC.view];
    [logInVC didMoveToParentViewController:self];
    
    self.leftViewController = logInVC;
    */
    
    LAMapViewController *mapVC = [[LAMapViewController alloc] init];
    [self addChildViewController:mapVC];
    mapVC.view.frame = CGRectMake(320, 0, 320, self.view.frame.size.height);
    [self.scrollView addSubview:mapVC.view];
    [mapVC didMoveToParentViewController:self];
    
    self.rightViewController = mapVC;
    
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

#pragma mark - Content

- (void)setMakePostButtonAlpha {
    CGFloat progress = (320 - self.scrollView.contentOffset.x) / 320;
    progress = MIN(MAX(progress, 0), 1);
    progress = 1 - progress;
    
    if (self.hideButtonOnLeft) {
        self.makePostButton.alpha = progress;
    } else {
        self.makePostButton.alpha = 1;
    }
}

#pragma mark - Public methods

- (void)showMe {
    LAMeViewController *meVC = [[LAMeViewController alloc] init];
    [self addChildViewController:meVC];
    meVC.view.frame = CGRectMake(0, 0, 320, self.view.frame.size.height);
    [self.scrollView addSubview:meVC.view];
    [meVC didMoveToParentViewController:self];
    
    [self.leftViewController willMoveToParentViewController:nil];
    [self.leftViewController.view removeFromSuperview];
    [self.leftViewController removeFromParentViewController];
    
    self.leftViewController = meVC;
    self.hideButtonOnLeft = NO;
}

#pragma mark - Property Accessors

- (void)setHideButtonOnLeft:(BOOL)hideButtonOnLeft {
    _hideButtonOnLeft = hideButtonOnLeft;
    [self setMakePostButtonAlpha];
}

#pragma mark - IBActions

- (IBAction)makePhotoAction:(id)sender {
    LAMakePostViewController *makePostVC = [[LAMakePostViewController alloc] init];
    makePostVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:makePostVC animated:YES completion:nil];
    
    
    /*
    UIImagePickerController *imagePickerVC = [[UIImagePickerController alloc] init];
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:imagePickerVC animated:YES completion:nil];
     */
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self setMakePostButtonAlpha];
}

#pragma mark - Singleton

+ (LAMainViewController *)sharedMainVC {
    return _sharedMainVC;
}

@end
