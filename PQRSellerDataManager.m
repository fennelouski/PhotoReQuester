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
    for (int i = 0; i < arc4random(); i+= arc4random_uniform(10)) {
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
            request.coordinate = CLLocationCoordinate2DMake(arc4random_uniform(180) - 90, arc4random_uniform(180) - 90);
            [self.requests addObject:request];
        }
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
