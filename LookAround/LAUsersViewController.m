//
//  LAUsersViewController.m
//  LookAround
//
//  Created by Vitaly Berg on 7/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LAUsersViewController.h"

#import "LAProfileViewController.h"

#import "LAUserCell.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface LAUsersViewController () <
    UITableViewDataSource,
    UITableViewDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *users;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *backButtonTitleLabel;



@end

@implementation LAUsersViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    
    self.titleLabel.text = self.title;
    self.backButtonTitleLabel.text = NSLocalizedString(@"back", @"");
    
    NSMutableArray *users = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        [users addObjectsFromArray:[[LAImageStubs sharedImageStubs] avatars]];
    }
    self.users = users;
}

#pragma mark - Setups

- (void)setupTableView {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([LAUserCell class]) bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"UserCell"];
}

#pragma mark - IBActions

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.users count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"UserCell";
    LAUserCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    NSString *url = self.users[indexPath.row];
    [cell.avatarImageView setImageWithURL:[NSURL URLWithString:url]];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    LAProfileViewController *meVC = [[LAProfileViewController alloc] init];
    [self.navigationController pushViewController:meVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

@end
