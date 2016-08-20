//
//  PQRSellerMapViewController.m
//  Photo ReQuester
//
//  Created by Nathan Fennel on 8/19/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import "PQRSellerMapViewController.h"
#import <MapKit/MapKit.h>

#import "PQRSellerDataManager.h"
#import "PQRLocalRequestModel.h"

#import "NKFColor.h"
#import "NKFColor+AppColors.h"

@interface PQRSellerMapViewController () <MKMapViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) MKMapView *map;

@end

@implementation PQRSellerMapViewController {
    NSMutableArray *_pointAnnotations;
    UIImagePickerController *_imagePickerController;
}

+ (instancetype)sharedMapController {
    static PQRSellerMapViewController *sharedMapController;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMapController = [[PQRSellerMapViewController alloc] init];
    });

    return sharedMapController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    if (!_pointAnnotations) {
        _pointAnnotations = NSMutableArray.new;
    }

    [self.view addSubview:self.map];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.view addSubview:self.footerToolbar];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    for (int i = 0; i < 200 && i < PQRSellerDataManager.currentRequests.count; i++) {
        PQRLocalRequestModel *request = PQRSellerDataManager.currentRequests[i];

        [self.map removeAnnotations:_pointAnnotations];
        MKPointAnnotation *pointAnnotation = [[MKPointAnnotation alloc] init];
        pointAnnotation.coordinate = request.coordinate;
        pointAnnotation.title = request.title;
        pointAnnotation.subtitle = [NSString stringWithFormat:@"%@ %d", request.bounty.stringExpression, i];
        [_pointAnnotations addObject:pointAnnotation];

        NSLog(@"Annotations: %d", i);
    }

    [self.map addAnnotations:_pointAnnotations];
}




#pragma mark - Subviews

- (MKMapView *)map {
    if (!_map) {
        _map = [[MKMapView alloc] initWithFrame:self.mapFrame];
        _map.delegate = self;
        _map.showsUserLocation = YES;
        _map.userTrackingMode = MKUserTrackingModeFollowWithHeading;
        _map.mapType = MKMapTypeHybrid;
    }

    return _map;
}

- (CGRect)mapFrame {
    CGRect frame = self.view.frame;

    frame.origin.y = 0.0f;
    frame.origin.x = 0.0f;

    return frame;
}






#pragma mark - Map View Delegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    if (annotation == mapView.userLocation) {
        return nil;
    }

    static NSString *identifier = @"DestinationIdentifier";
    MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if(!annotationView) {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        MKPinAnnotationView *pinAnnotationView = (MKPinAnnotationView *)annotationView;
        pinAnnotationView.pinTintColor = [NKFColor randomDarkColor];
    } else {
        annotationView.annotation = annotation;
    }

    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;

    return annotationView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {

    NSLog(@"Taking photo for %g, %g", view.annotation.coordinate.latitude, view.annotation.coordinate.longitude);

    [self takePhoto:nil];
}

- (void)takePhoto:(id)sender {
    // Lazily allocate image picker controller
    if (!_imagePickerController) {
        _imagePickerController = [[UIImagePickerController alloc] init];

        // If our device has a camera, we want to take a picture, otherwise, we just pick from
        // photo library
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            [_imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
        } else {
            [_imagePickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        }

        // image picker needs a delegate so we can respond to its messages
        [_imagePickerController setDelegate:self];
    }

    // Place image picker on the screen
    [self.presentingViewController presentViewController:_imagePickerController
                                                animated:YES
                                              completion:^{

                                              }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [_imagePickerController dismissViewControllerAnimated:YES
                                               completion:^{

                                               }];

    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [_imagePickerController dismissViewControllerAnimated:YES
                                               completion:^{
                                                   
                                               }];
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
