//
//  LAProfileView.h
//  LookAround
//
//  Created by Vitaly Berg on 7/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LAProfileViewDelegate;

@interface LAProfileView : UIView

@property (assign, nonatomic) id<LAProfileViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;

@end

@protocol LAProfileViewDelegate <NSObject>

- (void)profileViewDidPressFollowers:(LAProfileView *)profileView;
- (void)profileViewDidPressFollowing:(LAProfileView *)profileView;

@end
