//
//  LAMeViewController.m
//  LookAround
//
//  Created by Vitaly Berg on 7/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LAProfileViewController.h"

#import "LAProfileHeaderView.h"
#import "LAPostCell.h"
#import "LAMagicButton.h"

#import "LAUsersViewController.h"
#import "LAMainViewController.h"
#import "LAPostViewController.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface LAProfileViewController () <
    UITableViewDataSource,
    UITableViewDelegate,
    LAProfileViewDelegate,
    LAPostCellDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) LAProfileHeaderView *profileView;

@property (weak, nonatomic) IBOutlet LAMagicButton *backButton;
@property (weak, nonatomic) IBOutlet LAMagicButton *aroundButton;

@property (weak, nonatomic) IBOutlet UILabel *backButtonTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *aroundButtonTitleLabel;

@property (strong, nonatomic) NSArray *posts;

@end

@implementation LAProfileViewController

- (id)init {
    // To fix nib name collisions
    self = [super initWithNibName:NSStringFromClass([LAProfileViewController class]) bundle:[NSBundle mainBundle]];
    return self;
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    [self setupProfileView];
    [self setupLocalizableText];
    
    if ([self.navigationController.viewControllers count] == 1) {
        self.backButton.hidden = YES;
    } else {
        self.aroundButton.hidden = YES;
    }
    
    NSMutableArray *posts = [NSMutableArray array];
    for (int i = 0; i < 100; i++) {
        [posts addObject:@"Bingo"];
    }
    self.posts = posts;
    
    [self.profileView.avatarImageView setImageWithURL:[NSURL URLWithString:@"http://cs409222.vk.me/v409222051/271c/j6Vv-I6l0cQ.jpg"]];
}

#pragma mark - Setups

- (void)setupTableView {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([LAPostCell class]) bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"PostCell"];
}

- (void)setupProfileView {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([LAProfileHeaderView class]) bundle:[NSBundle mainBundle]];
    NSArray *views = [nib instantiateWithOwner:nil options:nil];
    self.profileView = views[0];
    self.profileView.delegate = self;
    self.tableView.tableHeaderView = self.profileView;
}

- (void)setupLocalizableText {
    self.backButtonTitleLabel.text = NSLocalizedString(@"back", @"");
    self.aroundButtonTitleLabel.text = NSLocalizedString(@"profile.around", @"");
}

#pragma mark - Actions

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)aroundAction:(id)sender {
    [[LAMainViewController sharedMainVC] showRight];
}

#pragma mark - LAProfileViewDelegate

- (void)profileViewDidPressFollowers:(LAProfileHeaderView *)profileView {
    LAUsersViewController *usersVC = [[LAUsersViewController alloc] init];
    usersVC.title = NSLocalizedString(@"followers.title", @"");
    [self.navigationController pushViewController:usersVC animated:YES];
}

- (void)profileViewDidPressFollowing:(LAProfileHeaderView *)profileView {
    LAUsersViewController *usersVC = [[LAUsersViewController alloc] init];
    usersVC.title = NSLocalizedString(@"following.title", @"");
    [self.navigationController pushViewController:usersVC animated:YES];
}

#pragma mark - LAPostCellDelegate

- (void)postCellDidTouchAvatar:(LAPostCell *)cell {
    //NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    LAProfileViewController *profileVC = [[LAProfileViewController alloc] init];
    [self.navigationController pushViewController:profileVC animated:YES];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    double progress = (scrollView.contentOffset.y - 10) / 40;
    progress = MAX(MIN(progress, 1), 0);
    self.backButton.alpha = 1 - progress;
    self.aroundButton.alpha = 1 - progress;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.posts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"PostCell";
    LAPostCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.delegate = self;
    
    [cell.photoImageView setImageWithURL:[NSURL URLWithString:@"http://farm4.staticflickr.com/3020/5716375186_28e9da194f_b.jpg"]];
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
