//
//  PQRLocationManager.h
//  Photo ReQuester
//
//  Created by Nathan Fennel on 8/19/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface PQRLocationManager : NSObject

+ (void)start;

+ (CLLocationCoordinate2D)currentCoordinate;

@end
