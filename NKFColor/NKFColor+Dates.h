//
//  NKFColor+Dates.h
//  Alphabetical List Utility
//
//  Created by HAI on 7/22/15.
//  Copyright (c) 2015 HAI. All rights reserved.
//

#import "NKFColor.h"

@interface NKFColor (Dates)

// Holiday Colors
+ (NSArray *)holidayColorsForToday;
+ (NSArray *)holidayColorsForDate:(NSDate *)date;
+ (NSArray *)strictHolidayColorsForToday;
+ (NSArray *)strictHolidayColorsForDate:(NSDate *)date;

// color for time of day
+ (NKFColor *)colorForTimeOfDay:(NSDate *)date;
+ (NKFColor *)colorForCurrentTime;

@end
