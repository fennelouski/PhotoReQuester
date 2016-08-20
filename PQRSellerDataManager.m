//
//  PQRSellerDataManager.m
//  Photo ReQuester
//
//  Created by Nathan Fennel on 8/19/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import "PQRSellerDataManager.h"

@interface PQRSellerDataManager ()

@property (nonatomic, strong, readwrite) NSMutableArray *takenPhotos;

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
    }

    return self;
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






@end
