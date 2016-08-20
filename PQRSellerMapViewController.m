//
//  PQRSellerMapViewController.m
//  Photo ReQuester
//
//  Created by Nathan Fennel on 8/19/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import "PQRSellerMapViewController.h"
#import <MapKit/MapKit.h>

@interface PQRSellerMapViewController () <MKMapViewDelegate>

@property (nonatomic, strong) MKMapView *map;

@end

@implementation PQRSellerMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.view addSubview:self.map];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.view addSubview:self.footerToolbar];
}




#pragma mark - Subviews

- (MKMapView *)map {
    if (!_map) {
        _map = [[MKMapView alloc] initWithFrame:self.mapFrame];
        _map.delegate = self;
    }

    return _map;
}

- (CGRect)mapFrame {
    CGRect frame = self.view.frame;

    frame.origin.y = 0.0f;
    frame.origin.x = 0.0f;

    return frame;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
