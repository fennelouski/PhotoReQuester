//
//  PQRSellerDataManager.h
//  Photo ReQuester
//
//  Created by Nathan Fennel on 8/19/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, PQRSellerVC) {
    PQRSellerVCMap,
    PQRSellerVCList,
    PQRSellerVCPhoto,
};

@interface PQRSellerDataManager : NSObject

+ (NSArray *)takenPhotos;

+ (PQRSellerVC)currentVCType;
+ (void)setCurrentVCType:(PQRSellerVC)currentVCType;

+ (NSArray *)currentRequests;

@end
