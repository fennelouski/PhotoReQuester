//
//  PQRUserManager.m
//  Photo ReQuester
//
//  Created by Nathan Fennel on 8/19/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import "PQRUserManager.h"

@implementation PQRUserManager {
    PQRUserType _userType;
}

+ (instancetype)sharedUserManager {
    static PQRUserManager *sharedUserManager;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUserManager = [[PQRUserManager alloc] init];
    });

    return sharedUserManager;
}



- (instancetype)init {
    self = [super init];

    if (self) {
        _userType = [NSUserDefaults.standardUserDefaults integerForKey:@"PQRUserType"];
    }

    return self;
}

- (PQRUserType)userType {
    return _userType;
}

- (void)setUserType:(PQRUserType)userType {
    _userType = userType;
}

#pragma mark - Static Methods

+ (PQRUserType)isBuyer {
    return PQRUserManager.sharedUserManager.userType == PQRUserTypeBuyer;
}

+ (PQRUserType)isSeller {
    return PQRUserManager.sharedUserManager.userType == PQRUserTypeSeller;
}

+ (void)setUserType:(PQRUserType)userType {
    PQRUserManager.sharedUserManager.userType = userType;
    [NSUserDefaults.standardUserDefaults setInteger:userType
                                             forKey:@"PQRUserType"];
}

+ (PQRUserType)userType {
    return PQRUserManager.sharedUserManager.userType;
}



@end
