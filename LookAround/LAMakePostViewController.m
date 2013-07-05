//
//  LAMakePostViewController.m
//  LookAround
//
//  Created by Vitaly Berg on 7/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LAMakePostViewController.h"

@interface LAMakePostViewController () <
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate
>

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *galleryButton;

@property (weak, nonatomic) IBOutlet UILabel *cancelButtonTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *galleryButtonTitleLabel;

@end

@implementation LAMakePostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Helpers

- (void)setupLocalizableText {
    self.cancelButtonTitleLabel.text = NSLocalizedString(@"cancel", @"");
    self.galleryButtonTitleLabel.text = NSLocalizedString(@"make_photo.gallery", @"");
}

#pragma mark - IBActions

- (IBAction)takePhotoAction:(id)sender {
}

- (IBAction)cancelAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)galleryAction:(id)sender {
    UIImagePickerController *pickerVC = [[UIImagePickerController alloc] init];
    pickerVC.delegate = self;
    [self presentViewController:pickerVC animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
