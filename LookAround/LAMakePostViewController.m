//
//  LAMakePostViewController.m
//  LookAround
//
//  Created by Vitaly Berg on 7/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LAMakePostViewController.h"

@interface LAMakePostViewController ()

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *galleryButton;

@end

@implementation LAMakePostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - 

- (IBAction)takePhotoAction:(id)sender {
}

- (IBAction)cancelAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)galleryAction:(id)sender {
}

@end
