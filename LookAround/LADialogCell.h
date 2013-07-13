//
//  LADialogCell.h
//  LookAround
//
//  Created by Vitaly Berg on 7/13/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LADialogCellType) {
    LADialogCellTypeUser,
    LADialogCellTypePost
};

@interface LADialogCell : UITableViewCell

@property (assign, nonatomic) LADialogCellType type;
@property (assign, nonatomic) BOOL read;

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel; // Bad propertye name
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end
