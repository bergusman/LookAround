//
//  LAProfileView.m
//  LookAround
//
//  Created by Vitaly Berg on 7/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LAProfileHeaderView.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface LAProfileHeaderView ()

@property (weak, nonatomic) IBOutlet UILabel *followersCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *followingCountLabel;

@property (weak, nonatomic) IBOutlet UILabel *followersTitleButtonLabel;
@property (weak, nonatomic) IBOutlet UILabel *followingTitleButtonLabel;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *followerAvatars;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *followingAvatars;

@end

@implementation LAProfileHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupLocalizableText];
    
    for (UIImageView *imageView in self.followerAvatars) {
        [imageView setImageWithURL:[NSURL URLWithString:@"http://cs9192.vk.me/v9192123/238a/SRRQUIgFW5w.jpg"]];
    }
    for (UIImageView *imageView in self.followingAvatars) {
        [imageView setImageWithURL:[NSURL URLWithString:@"http://cs9192.vk.me/v9192123/238a/SRRQUIgFW5w.jpg"]];
    }
}

- (void)setupLocalizableText {
    self.followersTitleButtonLabel.text = NSLocalizedString(@"profile.followers", @"");
    self.followingTitleButtonLabel.text = NSLocalizedString(@"profile.following", @"");
}

- (IBAction)followersAction:(id)sender {
    [self.delegate profileViewDidPressFollowers:self];
}

- (IBAction)followingAction:(id)sender {
    [self.delegate profileViewDidPressFollowing:self];
}

@end
