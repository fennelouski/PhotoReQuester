//
//  PQRLocalRequestModel.h
//  Photo ReQuester
//
//  Created by Nathan Fennel on 8/20/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "PQRCurrency.h"

@interface PQRLocalRequestModel : NSObject

@property (nonatomic, strong) NSDate *expirationDate;

@property CLLocationCoordinate2D coordinate;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *requestDescription;

@property (nonatomic, strong) PQRCurrency *bounty;

@property (nonatomic, strong) NSString *request_id;

@end
