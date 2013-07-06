//
//  LAProfileView.h
//  LookAround
//
//  Created by Vitaly Berg on 7/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LAProfileViewDelegate;

@interface LAProfileHeaderView : UIView

@property (assign, nonatomic) id<LAProfileViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;

@end

@protocol LAProfileViewDelegate <NSObject>

- (void)profileViewDidPressFollowers:(LAProfileHeaderView *)profileView;
- (void)profileViewDidPressFollowing:(LAProfileHeaderView *)profileView;

@end
