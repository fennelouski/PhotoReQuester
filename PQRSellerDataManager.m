//
//  PQRSellerDataManager.m
//  Photo ReQuester
//
//  Created by Nathan Fennel on 8/19/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import "PQRSellerDataManager.h"
#import "PQRPhotoModel.h"
#import "PQRLocalRequestModel.h"
#import "PQRCurrency.h"
#import "PQRLocationManager.h"

#import <MapKit/MapKit.h>

@interface PQRSellerDataManager ()

@property (nonatomic, strong, readwrite) NSMutableArray *takenPhotos;

@property (nonatomic, strong) NSMutableArray *requests;

@end

@implementation PQRSellerDataManager {
    PQRSellerVC _currentVCType;
}

+ (instancetype)sharedDataManager {
    static PQRSellerDataManager *sharedDataManager;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDataManager = [[PQRSellerDataManager alloc] init];
    });

    return sharedDataManager;
}

- (instancetype)init {
    self = [super init];

    if (self) {
        self.takenPhotos = NSMutableArray.new;
        self.requests = NSMutableArray.new;

        [self dummyData];
    }

    return self;
}

- (void)dummyData {
    CLLocationCoordinate2D userCoordinate = PQRLocationManager.currentCoordinate;

    MKMapPoint point1 = MKMapPointForCoordinate(userCoordinate);

    NSDate *startDate = NSDate.new;

    for (int i = 0; i < arc4random(); i+= arc4random_uniform(2 + sqrt(i))) {
        if (i % 3 == 0) {
            PQRPhotoModel *photo = PQRPhotoModel.new;
            photo.photoDescription = [NSString stringWithFormat:@"My awesome photo %d", i];
            [self.takenPhotos addObject:photo];
        } else if (i % 2 == 0) {
            PQRLocalRequestModel *request = PQRLocalRequestModel.new;
            request.title = @"Take a photo for me!";
            request.request_id = @([NSString stringWithFormat:@"%d", i].hash).description;
            request.requestDescription = request.request_id;
            request.bounty = [[PQRCurrency alloc] init];
            request.bounty.absoluteCents = arc4random_uniform(6) * 25 + 25;

            request.coordinate = CLLocationCoordinate2DMake((float)arc4random_uniform(10000)/1000.0f - 5 + userCoordinate.latitude,
                                                            (float)arc4random_uniform(10000)/1000.0f - 9 + userCoordinate.longitude);

            while (!CLLocationCoordinate2DIsValid(request.coordinate)) {
                request.coordinate = CLLocationCoordinate2DMake(arc4random_uniform(10) - 5 + userCoordinate.latitude,
                                                                arc4random_uniform(20) - 10 + userCoordinate.longitude);
            }

            MKMapPoint point2 = MKMapPointForCoordinate(request.coordinate);
            CLLocationDistance distance = MKMetersBetweenMapPoints(point1, point2);
            request.approximateDistance = distance;



            [self.requests addObject:request];
        }
    }

    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"approximateDistance"
                                                 ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    self.requests = [self.requests sortedArrayUsingDescriptors:sortDescriptors].mutableCopy;
}

- (PQRSellerVC)currentVCType {
    return _currentVCType;
}

- (void)setCurrentVCType:(PQRSellerVC)currentVCType {
    _currentVCType = currentVCType;
}





#pragma mark - Static Methods

+ (NSArray *)takenPhotos {
    return PQRSellerDataManager.sharedDataManager.takenPhotos;
}

+ (PQRSellerVC)currentVCType {
    return PQRSellerDataManager.sharedDataManager.currentVCType;
}

+ (void)setCurrentVCType:(PQRSellerVC)currentVCType {
    PQRSellerDataManager.sharedDataManager.currentVCType = currentVCType;
}





+ (NSArray *)currentRequests {
    return PQRSellerDataManager.sharedDataManager.requests;
}





@end
