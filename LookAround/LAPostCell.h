//
//  LAPostCell.h
//  LookAround
//
//  Created by Vitaly Berg on 7/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LAPostCellDelegate;

@interface LAPostCell : UITableViewCell

@property (assign, nonatomic) id<LAPostCellDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;

@end

@protocol LAPostCellDelegate <NSObject>

@end