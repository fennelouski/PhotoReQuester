//
//  PQRPhotoModel.h
//  Photo ReQuester
//
//  Created by Nathan Fennel on 8/19/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface PQRPhotoModel : NSObject

@property (nonatomic, strong) UIImage *photo;

@property CLLocationCoordinate2D coordinate;
@property float elevation;

@property (nonatomic, strong) NSDate *date;

@end
