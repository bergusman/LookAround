//
//  LADialogsViewController.m
//  LookAround
//
//  Created by Vitaly Berg on 7/13/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LADialogsViewController.h"

#import "LAPostViewController.h"

#import "LADialogCell.h"

@interface LADialogsViewController () <
    UITableViewDataSource,
    UITableViewDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *dialogs;

@end

@implementation LADialogsViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    [self setupStubs];
}

#pragma mark - Setups

- (void)setupTableView {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([LADialogCell class]) bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"DialogCell"];
}

- (void)setupStubs {
    NSMutableArray *dialogs = [NSMutableArray array];
    for (int i = 0; i < 100; i++) {
        [dialogs addObject:@"Bingo"];
    }
    self.dialogs = dialogs;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dialogs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"DialogCell";
    LADialogCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (indexPath.row % 2) {
        cell.avatarImageView.image = [UIImage imageNamed:@"emma-watson-12.jpg"];
        cell.type = LADialogCellTypeUser;
    } else {
        cell.photoImageView.image = [UIImage imageNamed:@"Bern Switzerland.jpg"];
        cell.type = LADialogCellTypePost;
    }
    
    cell.read = indexPath.row % 3;
    cell.dateLabel.text = @"Now";
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    LAPostViewController *postVC = [[LAPostViewController alloc] init];
    [self.navigationController pushViewController:postVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [LADialogCell height];
}

@end
