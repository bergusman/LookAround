//
//  LAMeViewController.m
//  LookAround
//
//  Created by Vitaly Berg on 7/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LAMeViewController.h"

#import "LAProfileView.h"
#import "LAPostCell.h"

@interface LAMeViewController () <
    UITableViewDataSource,
    UITableViewDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) LAProfileView *profileView;

@property (strong, nonatomic) NSArray *posts;

@end

@implementation LAMeViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self setupProfileView];
}

#pragma mark - Setups

- (void)setupTableView {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([LAPostCell class]) bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"PostCell"];
}

- (void)setupProfileView {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([LAProfileView class]) bundle:[NSBundle mainBundle]];
    NSArray *views = [nib instantiateWithOwner:nil options:nil];
    self.profileView = views[0];
    self.tableView.tableHeaderView = self.profileView;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.posts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"PostCell";
    LAPostCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 500;
}

@end
