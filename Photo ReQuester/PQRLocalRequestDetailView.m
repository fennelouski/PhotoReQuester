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

@interface PQRLocalRequestDetailView () <MKMapViewDelegate>

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) MKMapView *mapView;


@end

@implementation PQRLocalRequestDetailView {
    PQRLocalRequestModel *_localRequest;
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
    NSString *title = view.annotation.title;
    NSString *message = @"Get driving directions to this spot?";
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {

                                                         }];
    [alertController addAction:cancelAction];

    NSString *appleMapsTitle = @"Maps";

    if ([[UIApplication sharedApplication] canOpenURL: [NSURL URLWithString:@"comgooglemaps://"]]) {
        UIAlertAction *googleMapsAction = [UIAlertAction actionWithTitle:@"Google Maps"
                                                                   style:UIAlertActionStyleDefault
                                                                 handler:^(UIAlertAction *action) {
                                                                     NSString *googleMapsURLString = [NSString stringWithFormat:@"comgooglemaps://?saddr=%f,%f&daddr=%f,%f&directionsmode=driving",
                                                                                                      self.mapView.userLocation.coordinate.latitude,
                                                                                                      self.mapView.userLocation.coordinate.longitude,
                                                                                                      view.annotation.coordinate.latitude,
                                                                                                      view.annotation.coordinate.longitude];
                                                                     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:googleMapsURLString]];
                                                                 }];
        [alertController addAction:googleMapsAction];

        appleMapsTitle = @"Apple Maps";
    }

    UIAlertAction *appleMapsAction = [UIAlertAction actionWithTitle:appleMapsTitle
                                                              style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction *action) {
                                                                MKMapItem *currentLocationMapItem = [MKMapItem mapItemForCurrentLocation];
                                                                NSDictionary *addressDict = @{(NSString *)kABPersonAddressStreetKey : _localRequest.title};
                                                                MKPlacemark *destinationPlaceMark = [[MKPlacemark alloc] initWithCoordinate:view.annotation.coordinate addressDictionary:addressDict];
                                                                MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:destinationPlaceMark];
                                                                
                                                                NSDictionary *launchOptions = @{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving};
                                                                [MKMapItem openMapsWithItems:@[currentLocationMapItem, mapItem]
                                                                               launchOptions:launchOptions];
                                                            }];
    [alertController addAction:appleMapsAction];
    
    [self.presentingViewController presentViewController:alertController
                                                animated:YES
                                              completion:^{

                                              }];
}


@end
