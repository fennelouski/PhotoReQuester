//
//  PQRCurrency.m
//  Photo ReQuester
//
//  Created by Nathan Fennel on 8/20/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import "PQRCurrency.h"

@interface PQRCurrency ()

@end

@implementation PQRCurrency {
    NSUInteger _dollars, _cents, _absoluteCents;
}

+ (instancetype)currencyWithString:(NSString *)input {
    PQRCurrency *currency = [[PQRCurrency alloc] initWithString:input];

    return currency;
}

- (instancetype)initWithString:(NSString *)input {
    self = [super init];

    if (self) {
        NSString *floatString = [[input componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"0123456789."]] componentsJoinedByString:@""];
        if ([floatString containsString:@"."] && ![floatString hasSuffix:@"."]) {
            NSArray *components = [floatString componentsSeparatedByString:@"."];

            _dollars = [components.firstObject integerValue];
            _cents = [components.lastObject integerValue];
            _absoluteCents = _dollars * 100 + _cents * 100;
        } else {
            _dollars = floatString.integerValue;
            _absoluteCents = _dollars * 100;
        }
    }

    return self;
}

- (NSInteger)dollars {
    return _dollars;
}

- (NSInteger)cents {
    return _cents;
}

- (NSInteger)absoluteCents {
    return _absoluteCents;
}

- (void)setAbsoluteCents:(NSInteger)absoluteCents {
    _absoluteCents = absoluteCents;

    _cents = _absoluteCents % 100;
    _dollars = _absoluteCents / 100;
}

- (NSString *)stringExpression {
    if (_cents == 0) {
        return [NSString stringWithFormat:@"$%zd.00", _dollars];
    }

    if (_cents < 10) {
        return [NSString stringWithFormat:@"$%zd.0%zd", _dollars, _cents];
    }

    return [NSString stringWithFormat:@"$%zd.%zd", _dollars, _cents];
}

@end
