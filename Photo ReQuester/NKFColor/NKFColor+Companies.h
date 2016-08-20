//
//  NKFColor+Companies.h
//  Alphabetical List Utility
//
//  Created by HAI on 7/22/15.
//  Copyright (c) 2015 HAI. All rights reserved.
//

#import "NKFColor.h"

@interface NKFColor (Companies)

// Company colors
+ (NKFColor *)colorForCompanyName:(NSString *)companyName;
+ (NSArray *)colorsForCompanyName:(NSString *)companyName;
+ (NKFColor *)strictColorForCompanyName:(NSString *)companyName;
+ (NSAttributedString *)attributedStringForCompanyName:(NSString *)companyName;

@end
