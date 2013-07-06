//
//  LAPostCell.m
//  LookAround
//
//  Created by Vitaly Berg on 7/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LAPostCell.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface LAPostCell ()

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *avatars;

@end

@implementation LAPostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    for (UIImageView *imageView in self.avatars) {
        [imageView setImageWithURL:[NSURL URLWithString:@"http://cs9192.vk.me/v9192123/238a/SRRQUIgFW5w.jpg"] placeholderImage:nil];
    }
}

- (IBAction)avatarAction:(id)sender {
}

@end
