//
//  LAMenuViewController.m
//  LookAround
//
//  Created by Vitaly Berg on 7/13/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LAMenuViewController.h"

#import "LAMainViewController.h"
#import "LADialogsViewController.h"
#import "LAUserViewController.h"
#import "LAProfileViewController.h"

#import "LAMenuItemCell.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface LAMenuViewController () <
    UITableViewDataSource,
    UITableViewDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation LAMenuViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
    //[self.avatarImageView setImageWithURL:[NSURL URLWithString:@"http://cs307601.vk.me/v307601245/59d/9yW4vb6qjqA.jpg"]];
    
    [self.avatarImageView setImage:[UIImage imageNamed:@"Russel Crowe.jpg"]];
    
    NSString *text = @"Russel Crowe";
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:text];
    
    NSRange range = [text rangeOfString:@"Crowe"];
    [attributedText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17] range:range];
    
    self.nameLabel.text = nil;
    self.nameLabel.attributedText = attributedText;
}

#pragma mark - Setups

- (void)setupTableView {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([LAMenuItemCell class]) bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"MenuItemCell"];
}

#pragma mark - Content

- (void)showMe {
    //LAProfileViewController *profileVC = [[LAProfileViewController alloc] init];
    //[self.navigationController pushViewController:profileVC animated:YES];
    
    LAUserViewController *userVC = [[LAUserViewController alloc] init];
    [self.navigationController pushViewController:userVC animated:YES];
}

- (void)showAround {
    [[LAMainViewController sharedMainVC] showRight];
}

- (void)showMessages {
    LADialogsViewController *dialogsVC = [[LADialogsViewController alloc] init];
    [self.navigationController pushViewController:dialogsVC animated:YES];
}

#pragma mark - Actions

- (IBAction)meAction:(id)sender {
    [self showMe];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"MenuItemCell";
    LAMenuItemCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.titleLabel.text = NSLocalizedString(@"menu.item.around", @"");
        cell.badgeLabel.text = @"14";
    } else if (indexPath.row == 1) {
        cell.titleLabel.text = NSLocalizedString(@"menu.item.messages", @"");
        cell.badgeLabel.text = @"8";
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        [self showAround];
    } else if (indexPath.row == 1) {
        [self showMessages];
    }
}

@end
