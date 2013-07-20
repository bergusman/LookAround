//
//  LACommentCell.h
//  LookAround
//
//  Created by Vitaly Berg on 20.07.13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LACommentCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

+ (CGFloat)heightWithComment:(NSString *)comment;

@end
