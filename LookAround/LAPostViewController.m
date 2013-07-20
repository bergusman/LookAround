//
//  LAPostViewController.m
//  LookAround
//
//  Created by Vitaly Berg on 06.07.13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LAPostViewController.h"

#import "LACommentCell.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface LAPostViewController () <
    UITableViewDataSource,
    UITableViewDelegate
>

@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UIButton *photoButton;


@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *comments;

@end

@implementation LAPostViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self setupComments];
}

#pragma mark - Stubs

- (void)setupComments {
    return;
    self.comments = @[
        @"Bingo",
        @"Bingo",
        @"Bingo",
        @"Bingo",
        @"Bingo",
        @"Bingo",
        @"Bingo",
        @"Bingo",
        @"Bingo"
    ];
}

#pragma mark - Setups

- (void)setupTableView {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([LACommentCell class]) bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"CommentCell"];
}

- (void)go {
    self.contentView.alpha = 0;
    [UIView animateWithDuration:0.2 animations:^{
        self.contentView.alpha = 1;
        self.photoImageView.frame = CGRectMake(0, 0, 320, 320);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)setPhotoImageView:(UIImageView *)photoImageView {
    _photoImageView = photoImageView;
    [self.view addSubview:photoImageView];
    [self.view bringSubviewToFront:self.photoButton];
}

- (IBAction)photoAction:(id)sender {
    if (self.closeHandler) {
        self.closeHandler();
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.comments count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"CommentCell";
    LACommentCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    NSDictionary *comment = self.comments[indexPath.row];
    
    cell.nameLabel.text = comment[@"name"];
    cell.dateLabel.text = comment[@"date"];
    cell.commentLabel.text = comment[@"comment"];
    cell.avatarImageView
    
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *comment = self.comments[indexPath.row];
    return [LACommentCell heightWithComment:comment[@"comment"]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Do nothing
}

@end
