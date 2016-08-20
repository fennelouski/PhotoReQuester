//
//  PQRLocationManager.m
//  Photo ReQuester
//
//  Created by Nathan Fennel on 8/19/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import "PQRLocationManager.h"

@interface PQRLocationManager () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@property (nonatomic, strong) CLLocation *currentLocation;


@end

@implementation PQRLocationManager {
    CLGeocoder *_geocoder;
}


+ (instancetype)sharedLocationManager {
    static PQRLocationManager *sharedLocationManager;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedLocationManager = [[PQRLocationManager alloc] init];
    });

    return sharedLocationManager;
}

- (instancetype)init {
    self = [super init];

    if (self) {
        [self locationManager];
    }

    return self;
}



#pragma mark - Location Manager

- (CLLocationManager *)locationManager {
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;

        if ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)] || [self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            CLAuthorizationStatus status = [CLLocationManager authorizationStatus];

            if (status == kCLAuthorizationStatusNotDetermined) {

                if ([[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSLocationWhenInUseUsageDescription"]) {
                    [self.locationManager  requestWhenInUseAuthorization];
                } else if([[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSLocationAlwaysUsageDescription"]){
                    [self.locationManager requestAlwaysAuthorization];
                } else {
                    NSLog(@"Info.plist does not contain NSLocationAlwaysUsageDescription or NSLocationWhenInUseUsageDescription");
                }

            }
        }

        [self.locationManager startUpdatingLocation];
    }

    return _locationManager;
}

- (CLLocation *)currentLocation {
    return _currentLocation;
}

#pragma mark - Location Manager Delegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    if (locations.count > 0) {
        self.currentLocation = locations.firstObject;
//        NSLog(@"currentLocation: %@", self.currentLocation);
    } else {
        NSLog(@"Location Manager updated with new \"locations\" but there weren't any locations in the array that it returned.");
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Failed %@", error);
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    switch (status) {
        case kCLAuthorizationStatusNotDetermined: {
            NSLog(@"User still thinking..");
        } break;

        case kCLAuthorizationStatusDenied: {
            NSLog(@"User denies location access. Consider implementing a preset list of locations the user can hceck out.");
        } break;

        case kCLAuthorizationStatusAuthorizedWhenInUse:
        case kCLAuthorizationStatusAuthorizedAlways: {
            [self.locationManager startUpdatingLocation];
        } break;

        default: {
        } break;
    }
}




#pragma mark - Static Methods

+ (void)start {
    [PQRLocationManager.sharedLocationManager.locationManager startUpdatingLocation];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [PQRLocationManager.sharedLocationManager.locationManager startUpdatingLocation];
    });
}

+ (CLLocationCoordinate2D)currentCoordinate {
    return PQRLocationManager.sharedLocationManager.currentLocation.coordinate;
}

@end
