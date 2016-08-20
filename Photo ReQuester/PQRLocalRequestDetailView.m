//
//  PQRLocalRequestDetailView.m
//  Photo ReQuester
//
//  Created by Nathan Fennel on 8/20/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import "PQRLocalRequestDetailView.h"
#import <MapKit/MapKit.h>
#import <AddressBook/AddressBook.h>

#import "PQRLocationManager.h"

#import "NKFColor.h"
#import "NKFColor+AppColors.h"

@interface PQRLocalRequestDetailView () <MKMapViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UIToolbar *headerToolbar;

@property (nonatomic, strong) MKMapView *mapView;

@property (nonatomic, strong) UITextView *detailTextView;

@property (nonatomic, strong) UILabel *bountyLabel;

@property (nonatomic, strong) UIBarButtonItem *flexibleSpace, *cameraButton, *fixedSpace;

@end

@implementation PQRLocalRequestDetailView {
    PQRLocalRequestModel *_localRequest;
    MKPointAnnotation *_pointAnnotation;
    UIImagePickerController *_imagePickerController;
}

- (void)layoutSubviews {
    [super layoutSubviews];


    if (CLLocationCoordinate2DIsValid(_localRequest.coordinate)) {
        self.mapView.region = [PQRLocationManager userRegionWithCoordinate:_localRequest.coordinate];
        [self addSubview:self.mapView];
    } else {
        [self.mapView removeFromSuperview];
    }

    [self addSubview:self.headerToolbar];

    [self addSubview:self.detailTextView];
}

#pragma mark - Subviews

- (UIToolbar *)headerToolbar {
    if (!_headerToolbar) {
        _headerToolbar = [[UIToolbar alloc] initWithFrame:self.headerToolbarFrame];
        [_headerToolbar addSubview:self.bountyLabel];
        [_headerToolbar setItems:@[self.flexibleSpace, self.cameraButton, self.fixedSpace]];
    }

    return _headerToolbar;
}

- (CGRect)headerToolbarFrame {
    CGRect frame = self.bounds;

    frame.size.height = 44.0f;

    return frame;
}

- (MKMapView *)mapView {
    if (!_mapView) {
        _mapView = [[MKMapView alloc] initWithFrame:self.mapViewFrame];
        _mapView.showsUserLocation = YES;
        _mapView.delegate = self;
        _mapView.mapType = MKMapTypeHybrid;
    }

    return _mapView;
}

- (CGRect)mapViewFrame {
    CGRect frame = self.bounds;

    frame.size.height -= self.detailTextViewFrame.size.height;
    frame.size.height -= self.headerToolbarFrame.size.height;
    frame.origin.y += self.headerToolbarFrame.size.height;

    return frame;
}

- (UITextView *)detailTextView {
    if (!_detailTextView) {
        _detailTextView = [[UITextView alloc] initWithFrame:self.detailTextViewFrame];
        _detailTextView.editable = NO;
        _detailTextView.font = [UIFont systemFontOfSize:18.0f];
    }

    return _detailTextView;
}

- (CGRect)detailTextViewFrame {
    CGRect frame = self.bounds;

    frame.size.height = 80.0f;
    frame.origin.y = self.bounds.size.height - frame.size.height;

    return frame;
}

- (UILabel *)bountyLabel {
    if (!_bountyLabel) {
        _bountyLabel = [[UILabel alloc] initWithFrame:self.bountyLabelFrame];
        _bountyLabel.textColor = [UIColor blackColor];
    }

    return _bountyLabel;
}

- (CGRect)bountyLabelFrame {
    CGRect frame = self.headerToolbar.bounds;

    frame.size.width *= 0.5f;
    frame.origin.x = 10.0f;

    return frame;
}

- (UIBarButtonItem *)flexibleSpace {
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                         target:self
                                                         action:nil];
}

- (UIBarButtonItem *)fixedSpace {
    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                target:self
                                                                                action:nil];
    fixedSpace.width = 10.0f;

    return fixedSpace;
}

- (UIBarButtonItem *)cameraButton {
    if (!_cameraButton) {
        _cameraButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
                                                                      target:self
                                                                      action:@selector(takePhoto:)];
    }

    return _cameraButton;
}



#pragma mark - Instance Properties

- (PQRLocalRequestModel *)localRequest {
    return _localRequest;
}

- (void)setLocalRequest:(PQRLocalRequestModel *)localRequest {
    _localRequest = localRequest;

    [self layoutSubviews];

    [self.mapView removeAnnotation:_pointAnnotation];
    _pointAnnotation = [[MKPointAnnotation alloc] init];
    _pointAnnotation.coordinate = localRequest.coordinate;
    _pointAnnotation.title = localRequest.title;
    _pointAnnotation.subtitle = [NSString stringWithFormat:@"%@", localRequest.bounty.stringExpression];
    [self.mapView addAnnotation:_pointAnnotation];

    self.detailTextView.text = [NSString stringWithFormat:@"%@\n%@", _localRequest.title, _localRequest.requestDescription];
    self.bountyLabel.text = _localRequest.bounty.stringExpression;
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

    NSLog(@"Taking photo for %g, %g", _localRequest.coordinate.latitude, _localRequest.coordinate.longitude);

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

    [self hide];

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


@end
