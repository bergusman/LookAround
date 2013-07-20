//
//  LAMapViewController.m
//  LookAround
//
//  Created by Vitaly Berg on 7/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LAMapViewController.h"

#import "LAMainViewController.h"

#import "LAPostCell.h"
#import "LAPostAnnotationView.h"

#import "LAPointAnnotation.h"

#import <MapKit/MapKit.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface LAMapViewController () <
    MKMapViewDelegate,
    UITableViewDataSource,
    UITableViewDelegate,
    LAPostCellDelegate
>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (strong, nonatomic) NSArray *posts;
@end

@implementation LAMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
    [self moveLegal];
    
    self.tableView.userInteractionEnabled = YES;
    
    LAPointAnnotation *annotation = [[LAPointAnnotation alloc] init];
    annotation.coordinate = CLLocationCoordinate2DMake(30, -90);
    [self.mapView addAnnotation:annotation];
}

#pragma mark - Setups

- (void)setupTableView {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([LAPostCell class]) bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"PostCell"];
}

#pragma mark - Helpers

- (void)moveLegal {
    for (UIView *view in self.mapView.subviews) {
        if ([view isKindOfClass:[UILabel class]]) {
            CGRect frame = view.frame;
            frame.origin.x = 320 - 10 - frame.size.width;
            view.frame = frame;
        }
    }
}

#pragma mark - Actions

- (IBAction)leftAction:(id)sender {
    //[[LAMainViewController sharedMainVC] showLeft];
}

- (IBAction)tap:(id)sender {
    self.tableView.userInteractionEnabled = NO;
    [self.tableView setContentOffset:CGPointMake(0, -550) animated:YES];
}

- (IBAction)feedAction:(id)sender {
    self.tableView.userInteractionEnabled = YES;
    [self.tableView setContentOffset:CGPointMake(0, -140) animated:YES];
}

#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    static NSString *annotationIdentifier = @"PostAnnotation";
    LAPostAnnotationView *annotationView = (LAPostAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:annotationIdentifier];
    if (!annotationView) {
        annotationView = [[LAPostAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationIdentifier];
        annotationView.frame = CGRectMake(0, 0, 50, 50);
        annotationView.photoImageView.image = [UIImage imageNamed:@"Bern Switzerland.jpg"];
    }
    
    return annotationView;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"PostCell";
    LAPostCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.delegate = self;
    
    cell.backgroundColor = [UIColor whiteColor];
    //NSString *photoUrl = self.posts[indexPath.row];
    
    NSString *photoUrl = @"http://farm4.staticflickr.com/3020/5716375186_28e9da194f_b.jpg";
    
    [cell.photoImageView setImageWithURL:[NSURL URLWithString:photoUrl]];
    [cell.avatarImageView setImageWithURL:[NSURL URLWithString:@"http://cs409222.vk.me/v409222051/271c/j6Vv-I6l0cQ.jpg"]];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 500;
}

@end
