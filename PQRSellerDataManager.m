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
#import <CoreLocation/CoreLocation.h>



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

            request.coordinate = CLLocationCoordinate2DMake((float)arc4random_uniform(10000)/1000000.0f - 0.005f + userCoordinate.latitude,
                                                            (float)arc4random_uniform(10000)/1000000.0f - 0.005f + userCoordinate.longitude);

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

+ (void)fulfillRequest:(PQRLocalRequestModel *)localRequest
             withPhoto:(UIImage *)photo {

    localRequest.completed = YES;

    PQRPhotoModel *photoModel = PQRPhotoModel.new;
    photoModel.photo = photo;
    photoModel.coordinate = PQRLocationManager.currentCoordinate;
    photoModel.date = NSDate.new;
    photoModel.price = localRequest.bounty;
    photoModel.altitude = PQRLocationManager.currentLocation.altitude;
    [PQRSellerDataManager.sharedDataManager.takenPhotos addObject:photoModel];

    NSData *imageData = UIImageJPEGRepresentation(photo, 1.0);
    NSString *encodedString = [imageData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithCarriageReturn];

    if (!encodedString) {
        NSLog(@"This is ALL wrong. The photo couldn't be encoded and is gonna cause MAD problems.");
        return;
    }

    NSURL *url = [NSURL URLWithString:@"localhost:3000/api/v1/request/upload-photo"];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";

    NSDictionary *dictionary = @{@"data": encodedString};
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary
                                                   options:kNilOptions error:&error];

    if (!error) {
        NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request
                                                                   fromData:data completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
                                                                       if (error) {
                                                                           NSLog(@"Error while uploading photo\n%@", error);
                                                                       } else {
                                                                           NSLog(@"It worked! The photo was uploaded. %@", response);
                                                                       }
                                                                   }];
        
        [uploadTask resume];
    }

}




@end
