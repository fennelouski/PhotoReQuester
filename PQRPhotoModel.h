//
//  PQRPhotoModel.h
//  Photo ReQuester
//
//  Created by Nathan Fennel on 8/19/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PQRCurrency.h"

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface PQRPhotoModel : NSObject

@property (nonatomic, strong) UIImage *photo;

@property CLLocationCoordinate2D coordinate;
@property double altitude;

@property (nonatomic, strong) NSDate *date;

@property (nonatomic, strong) PQRCurrency *price;

@property (nonatomic, strong) NSString *photoDescription;

@end
