//
//  LAMainViewController.h
//  LookAround
//
//  Created by Vitaly Berg on 7/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LAMainViewController : UIViewController

- (void)showMe;

- (void)showLeft;
- (void)showRight;

+ (LAMainViewController *)sharedMainVC;

- (void)setMakePostButtonHidden:(BOOL)hidden animated:(BOOL)animated;

@end
