//
//  LADialogCell.h
//  LookAround
//
//  Created by Vitaly Berg on 7/13/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LADialogCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;


@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end
