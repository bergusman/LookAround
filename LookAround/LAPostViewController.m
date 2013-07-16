//
//  LAPostViewController.m
//  LookAround
//
//  Created by Vitaly Berg on 06.07.13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LAPostViewController.h"

@interface LAPostViewController () <
    UITableViewDataSource,
    UITableViewDelegate
>

@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UIButton *photoButton;

@end

@implementation LAPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)go {
    self.contentView.alpha = 0;
    [UIView animateWithDuration:0.2 animations:^{
        self.contentView.alpha = 1;
        self.photoImageView.frame = CGRectMake(0, 0, 320, 320);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)setPhotoImageView:(UIImageView *)photoImageView {
    _photoImageView = photoImageView;
    [self.view addSubview:photoImageView];
    [self.view bringSubviewToFront:self.photoButton];
}

- (IBAction)photoAction:(id)sender {
    if (self.closeHandler) {
        self.closeHandler();
    }
}

#pragma mark - UITableViewDataSource

#pragma mark - UITableViewDelegate

@end
