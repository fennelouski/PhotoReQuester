//
//  PQRCurrency.h
//  Photo ReQuester
//
//  Created by Nathan Fennel on 8/20/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PQRCurrency : NSObject

+ (instancetype)currencyWithString:(NSString *)input;

- (NSInteger)dollars;
- (NSInteger)cents;

- (NSInteger)absoluteCents;

- (NSString *)stringExpression;

@end
