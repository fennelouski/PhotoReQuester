//
//  PQRUserManager.h
//  Photo ReQuester
//
//  Created by Nathan Fennel on 8/19/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, PQRUserType) {
    PQRUserTypeBuyer,
    PQRUserTypeSeller
};

@interface PQRUserManager : NSObject

+ (PQRUserType)isBuyer;
+ (PQRUserType)isSeller;

+ (void)setUserType:(PQRUserType)userType;
+ (PQRUserType)userType;

@end
