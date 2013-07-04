//
//  LALogInViewController.m
//  LookAround
//
//  Created by Vitaly Berg on 7/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LALogInViewController.h"

#import "LAMainViewController.h"

#import <FacebookSDK/FacebookSDK.h>

@interface LALogInViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *facebookLogInButton;

@end

@implementation LALogInViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupLocalizableText];
    
    if (!IS_IPHONE_5) {
        CGRect frame = self.titleLabel.frame;
        frame.origin.y = 130;
        self.titleLabel.frame = frame;
    }
}

#pragma mark - Setups

- (void)setupLocalizableText {
    [self.facebookLogInButton setTitle:NSLocalizedString(@"facebook.login.button", @"") forState:UIControlStateNormal];
}

#pragma mark - IBActions

- (IBAction)facebookLogInAction:(id)sender {
    [FBSession openActiveSessionWithReadPermissions:nil allowLoginUI:YES completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
        if (status != FBSessionStateOpen) {
            return;
        }
        [session closeAndClearTokenInformation];
        [[LAMainViewController sharedMainVC] showMe];
    }];
}

@end
