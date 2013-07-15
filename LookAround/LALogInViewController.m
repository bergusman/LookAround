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

@property (weak, nonatomic) IBOutlet UIView *logoView;
@property (weak, nonatomic) IBOutlet UIButton *facebookLogInButton;
@property (weak, nonatomic) IBOutlet UILabel *copyrightLabel;

@end

@implementation LALogInViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupLocalizableText];
    
    if (!IS_IPHONE_5) {
        self.logoView.y = 95; // TODO: choose center.y for logo view for iPhone 4
    }
}

#pragma mark - Setups

- (void)setupLocalizableText {
    [self.facebookLogInButton setTitle:NSLocalizedString(@"login.facebook.button", @"") forState:UIControlStateNormal];
    self.copyrightLabel.text = NSLocalizedString(@"login.copyright", @"");
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
