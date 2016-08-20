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

@interface PQRLocalRequestDetailView () <MKMapViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) MKMapView *mapView;


@end

@implementation PQRLocalRequestDetailView {
    PQRLocalRequestModel *_localRequest;
    MKPointAnnotation *_pointAnnotation;
    UIImagePickerController *_imagePickerController;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.titleLabel.text = _localRequest.title;
    [self addSubview:self.titleLabel];

    if (CLLocationCoordinate2DIsValid(_localRequest.coordinate)) {
        self.mapView.region = [PQRLocationManager userRegionWithCoordinate:_localRequest.coordinate];
    } else {
        NSLog(@"");
    }
    [self addSubview:self.mapView];
}

#pragma mark - Subviews

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:self.titleLabelFrame];
    }

    return _titleLabel;
}

- (CGRect)titleLabelFrame {
    CGRect frame = self.bounds;

    frame.size.height = 44.0f;

    return frame;
}

- (MKMapView *)mapView {
    if (!_mapView) {
        _mapView = [[MKMapView alloc] initWithFrame:self.mapViewFrame];
        _mapView.showsUserLocation = YES;
        _mapView.delegate = self;
    }

    return _mapView;
}

- (CGRect)mapViewFrame {
    CGRect frame = self.bounds;

    return frame;
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
        pinAnnotationView.pinTintColor = [UIColor greenColor];
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
    // Place image picker on the screen
    [self.presentingViewController presentViewController:_imagePickerController
                                                animated:YES
                                              completion:^{

                                              }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [self hide];

    [_imagePickerController dismissViewControllerAnimated:YES
                                               completion:^{

                                               }];

    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self hide];

    [_imagePickerController dismissViewControllerAnimated:YES
                                               completion:^{

                                               }];
}


@end
