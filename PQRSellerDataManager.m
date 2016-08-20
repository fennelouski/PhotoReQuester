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

    for (int i = 0; i < arc4random(); i+= arc4random_uniform(i + 1)) {
        if (i % 3 == 0) {
            PQRPhotoModel *photo = PQRPhotoModel.new;
            photo.photoDescription = [NSString stringWithFormat:@"My awesome photo %d", i];
            [self.takenPhotos addObject:photo];
        } else if (i % 2 == 0) {
            PQRLocalRequestModel *request = PQRLocalRequestModel.new;
            request.title = @"Take a photo for me!";
            request.request_id = @([NSString stringWithFormat:@"%d", i].hash).description;
            request.requestDescription = request.request_id;
            request.bounty = [PQRCurrency currencyWithString:@(i).description];



            request.coordinate = CLLocationCoordinate2DMake(arc4random_uniform(10) - 5 + userCoordinate.latitude,
                                                            arc4random_uniform(20) - 10 + userCoordinate.longitude);

            while (!CLLocationCoordinate2DIsValid(request.coordinate)) {
                request.coordinate = CLLocationCoordinate2DMake(arc4random_uniform(10) - 5 + userCoordinate.latitude,
                                                                arc4random_uniform(20) - 10 + userCoordinate.longitude);
            }

            MKMapPoint point2 = MKMapPointForCoordinate(request.coordinate);
            CLLocationDistance distance = MKMetersBetweenMapPoints(point1, point2);
            request.approximateDistance = distance;

            [self.requests addObject:request];
        }

        self.requests = [self.requests sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            if ([obj1 approximateDistance] > [obj2 approximateDistance])
                return NSOrderedDescending;
            else if ([obj1 approximateDistance] < [obj2 approximateDistance])
                return NSOrderedAscending;
            return NSOrderedSame;
        }].mutableCopy;

    }
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
