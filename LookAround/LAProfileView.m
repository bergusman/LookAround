//
//  LAProfileView.m
//  LookAround
//
//  Created by Vitaly Berg on 7/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LAProfileView.h"

@interface LAProfileView ()

@property (weak, nonatomic) IBOutlet UILabel *followersCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *followingCountLabel;

@property (weak, nonatomic) IBOutlet UILabel *followersTitleButtonLabel;
@property (weak, nonatomic) IBOutlet UILabel *followingTitleButtonLabel;

@end

@implementation LAProfileView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupLocalizableText];
}

- (void)setupLocalizableText {
    self.followersTitleButtonLabel.text = NSLocalizedString(@"profile.followers", @"");
    self.followingTitleButtonLabel.text = NSLocalizedString(@"profile.following", @"");
}

- (IBAction)followersAction:(id)sender {
}

- (IBAction)followingAction:(id)sender {
}

@end
