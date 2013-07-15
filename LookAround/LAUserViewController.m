//
//  LAUserViewController.m
//  LookAround
//
//  Created by Vitaly Berg on 7/15/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LAUserViewController.h"

#import "LAPostViewController.h"
#import "LAMainViewController.h"

#import "LAUserHeaderView.h"
#import "LAPostCell.h"
#import "LAMagicButton.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface LAUserViewController () <
    UITableViewDataSource,
    UITableViewDelegate,
    LAPostCellDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) LAUserHeaderView *headerView;

@property (weak, nonatomic) IBOutlet LAMagicButton *backButton;
@property (weak, nonatomic) IBOutlet UILabel *backButtonTitleLabel;

@property (strong, nonatomic) NSArray *posts;

@end

@implementation LAUserViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    [self setupProfileView];
    [self setupLocalizableText];
    
    if ([self.navigationController.viewControllers count] == 1) {
        self.backButton.hidden = YES;
    }
    
    NSMutableArray *posts = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        [posts addObjectsFromArray:[[LAImageStubs sharedImageStubs] photos]];
    }
    self.posts = posts;
    
    [self.headerView.avatarImageView setImageWithURL:[NSURL URLWithString:@"http://cs409222.vk.me/v409222051/271c/j6Vv-I6l0cQ.jpg"]];
}

#pragma mark - Setups

- (void)setupTableView {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([LAPostCell class]) bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"PostCell"];
}

- (void)setupProfileView {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([LAUserHeaderView class]) bundle:[NSBundle mainBundle]];
    NSArray *views = [nib instantiateWithOwner:nil options:nil];
    self.headerView = views[0];
    self.tableView.tableHeaderView = self.headerView;
}

- (void)setupLocalizableText {
    self.backButtonTitleLabel.text = NSLocalizedString(@"back", @"");
}

#pragma mark - Actions

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - LAPostCellDelegate

- (void)postCellDidTouchAvatar:(LAPostCell *)cell {
    //NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    LAUserViewController *userVC = [[LAUserViewController alloc] init];
    [self.navigationController pushViewController:userVC animated:YES];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    double progress = (scrollView.contentOffset.y - 10) / 40;
    progress = MAX(MIN(progress, 1), 0);
    self.backButton.alpha = 1 - progress;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.posts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"PostCell";
    LAPostCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.delegate = self;
    
    NSString *photoUrl = self.posts[indexPath.row];
    
    [cell.photoImageView setImageWithURL:[NSURL URLWithString:photoUrl]];
    [cell.avatarImageView setImageWithURL:[NSURL URLWithString:@"http://cs409222.vk.me/v409222051/271c/j6Vv-I6l0cQ.jpg"]];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LAPostViewController *postVC = [[LAPostViewController alloc] init];
    
    [self addChildViewController:postVC];
    [self.view addSubview:postVC.view];
    [postVC didMoveToParentViewController:self];
    
    
    LAPostCell *cell = (LAPostCell *)[tableView cellForRowAtIndexPath:indexPath];
    UIImageView *imageView = cell.photoImageView;
    UIView *imageViewSuperview = imageView.superview;
    CGRect frame = imageView.frame;
    CGRect rect = [imageView convertRect:imageView.bounds toView:self.view];
    imageView.frame = rect;
    
    postVC.photoImageView = cell.photoImageView;
    
    __weak LAPostViewController *weakPostVC = postVC;
    
    [[LAMainViewController sharedMainVC] setMakePostButtonHidden:YES animated:YES];
    
    postVC.closeHandler = ^() {
        [[LAMainViewController sharedMainVC] setMakePostButtonHidden:NO animated:YES];
        
        CGRect rect = [self.view convertRect:imageView.frame fromView:weakPostVC.view];
        imageView.frame = rect;
        
        rect = [imageViewSuperview convertRect:frame toView:self.view];
        
        [self.view addSubview:imageView];
        
        [UIView animateWithDuration:0.2 animations:^{
            imageView.frame = rect;
            
        } completion:^(BOOL finished) {
            [imageViewSuperview addSubview:imageView];
            imageView.frame = frame;
        }];
        
        [weakPostVC willMoveToParentViewController:nil];
        [weakPostVC.view removeFromSuperview];
        [weakPostVC removeFromParentViewController];
    };
    
    [postVC go];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 500;
}

@end
