//
//  NKFColor+Dates.m
//  Alphabetical List Utility
//
//  Created by HAI on 7/22/15.
//  Copyright (c) 2015 HAI. All rights reserved.
//

#import "NKFColor+Dates.h"
#import "NKFColor+WikipediaColors.h"

@implementation NKFColor (Dates)

#pragma mark - Holiday colors

// Holiday Colors for Today
// the first color in the returned array is the darkest color, the second is the lightest and each color after the second gets progressively lighter
+ (NSArray *)holidayColorsForToday {
	NSDate *now = [NSDate date];
	
	return [NKFColor holidayColorsForDate:now];
}

+ (NSArray *)holidayColorsForDate:(NSDate *)date {
	NSCalendar *gregorianCal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSDateComponents *dateComps = [gregorianCal components: (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
												  fromDate: date];

	NSMutableArray *colors = [[NSMutableArray alloc] init];
	
	// all of this is just for calculating Easter...which might be a bit excessive
	BOOL isEaster = NO;
	if ([dateComps month] == 3 || [dateComps month] == 4) {
		NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
		
		NSNumber *month = [defaults objectForKey:[NSString stringWithFormat:@"Month Of Easter In Year %ld", (long)[dateComps year]]];
		NSNumber *day = [defaults objectForKey:[NSString stringWithFormat:@"Day Of Easter In Year %ld", (long)[dateComps year]]];
		
		if (month && day) {
			if ([month intValue] == [dateComps month] && [day intValue] == [dateComps day]) {
				isEaster = YES;
			}
		} else {
			NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
			NSUInteger unitFlags = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
			NSDateComponents *gregorianComps = [gregorian components:unitFlags fromDate:date];
			[gregorianComps  setDay:21];
			[gregorianComps setMonth:3];
			NSDate *easterStartDate = [gregorianCal dateFromComponents:gregorianComps]; //March 21 for the year
			
			NSCalendar *chinese = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
			// convert from gregorian calendar to chinese calendar
			NSDateComponents *chineseComps = [chinese components:unitFlags fromDate:easterStartDate];
			NSDate *easterStartDateChineseDate = [chinese dateFromComponents:chineseComps];
			
			NSDate *easterStartDateChineseDateTemp = easterStartDateChineseDate;
			if ([chineseComps day] >=15) {            // 15 is the full month day in Chinese Calendar
				NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
				[offsetComponents setMonth:1];                   // set the next month
				easterStartDateChineseDateTemp = [chinese dateByAddingComponents:offsetComponents toDate:easterStartDateChineseDate options:0];
			}
			NSDateComponents *dayComponents = [chinese components:NSCalendarUnitDay fromDate:easterStartDateChineseDateTemp];
			NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
			[componentsToAdd setDay: (15 - [dayComponents day])];
			// find the next full month date
			NSDate *springEquinoChineseDate = [chinese dateByAddingComponents:componentsToAdd toDate:easterStartDateChineseDateTemp options:0];
			
			NSDateComponents *diffComps = [chinese components:NSCalendarUnitDay fromDate:easterStartDateChineseDate toDate:springEquinoChineseDate options:0];
			NSInteger diffDays = [diffComps day];
			
			// calculate the days difference from the March 21 to the next full month day
			NSDateComponents *daysToAdd = [[NSDateComponents alloc] init];
			[daysToAdd setDay:diffDays];
			NSDate *springEquinoGregorianDate = [gregorian dateByAddingComponents:daysToAdd toDate:easterStartDate options:0];
			
			// convert the next full month date from ChineseDate to GregorianComps
			NSDateComponents *springEquinoGregorianComps = [gregorian components:unitFlags fromDate:springEquinoGregorianDate];
			
			NSLog(@"springEquinoGregorian is %ld %ld %ld",(long)[springEquinoGregorianComps year], (long)[springEquinoGregorianComps month], (long)[springEquinoGregorianComps day]);
			
			NSInteger weekday = [springEquinoGregorianComps weekday];
			NSDate *easterSundayGregorianDateTemp = springEquinoGregorianDate;
			NSDateComponents *offsetGregorianComponents = [[NSDateComponents alloc] init];
			if (weekday == 7) {
				[offsetGregorianComponents setWeekOfMonth:2]; // If the full moon falls on a Sunday, Easter Day is the Sunday following
			} else {
				[offsetGregorianComponents setWeekOfMonth:1];
			}
			easterSundayGregorianDateTemp = [gregorian dateByAddingComponents:offsetGregorianComponents toDate:springEquinoGregorianDate options:0];
			NSDateComponents *weekdayComponents = [gregorian components:NSCalendarUnitWeekday fromDate:easterSundayGregorianDateTemp];
			NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
			[componentsToSubtract setDay: 0 - ([weekdayComponents weekday] - 1)];
			NSDate *easterDate = [gregorian dateByAddingComponents:componentsToSubtract toDate:easterSundayGregorianDateTemp options:0];
			
			NSDateComponents *easterComps = [gregorian components:unitFlags fromDate:easterDate];
			NSLog(@"Easter Date is %ld %ld %ld",(long)[easterComps year], (long)[easterComps month], (long)[easterComps day]);
			
			NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
			
			[defaults setObject:[NSNumber numberWithInt:(int)[easterComps month]] forKey:[NSString stringWithFormat:@"Month Of Easter In Year %ld", (long)[easterComps year]]];
			[defaults setObject:[NSNumber numberWithInt:(int)[easterComps day]] forKey:[NSString stringWithFormat:@"Day Of Easter In Year %ld", (long)[easterComps year]]];
			
			if ([dateComps day] == [easterComps day] && [dateComps month] == [easterComps month]) {
				isEaster = YES;
			}
		}
	}
	
	if ([dateComps month] == 1) {
		if (colors.count == 0) {
			[colors addObjectsFromArray:@[[NKFColor colorWithRed:16.0f/255.0f green:21.0f/255.0f blue:43.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:1.0f green:0.97f blue:206.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:45.0f/255.0f green:159.0f/255.0f blue:169.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:26.0f/255.0f green:81.0f/255.0f blue:86.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:15.0f/255.0f green:20.0f/255.0f blue:42.0f/255.0f alpha:1.0f]]];
		}
	} else if ([dateComps month] == 2) {
		// Valentine's Day
		if ([dateComps day] == 14) {
			[colors addObjectsFromArray:@[[NKFColor barnRed],
										  [NKFColor lavenderBlush],
										  [NKFColor cerise],
										  [NKFColor cardinal],
										  [NKFColor burgundy]]];
		} else if ([dateComps day] == 13) {
			[colors addObjectsFromArray:@[[NKFColor colorWithRed:89.0f/255.0f green:60.0f/255.0f blue:79.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:220.0f/255.0f green:72.0f/255.0f blue:105.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:186.0f/255.0f green:71.0f/255.0f blue:98.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:122.0f/255.0f green:63.0f/255.0f blue:85.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:154.0f/255.0f green:67.0f/255.0f blue:92.0f/255.0f alpha:1.0f]]];
		}
	} else if ([dateComps month] == 3) {
		// St Patrick's Day
		if ([dateComps day] == 17) {
			[colors addObjectsFromArray:@[[NKFColor darkGreen],
										  [NKFColor beige],
										  [NKFColor cadmiumGreen],
										  [NKFColor islamicGreen],
										  [NKFColor brunswickGreen]]];
		} else if ([dateComps day] < 17) {
			[colors addObjectsFromArray:@[[NKFColor colorWithRed:58.0f/255.0f green:53.0f/255.0f blue:59.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:244.0f/255.0f green:241.0f/255.0f blue:236.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:115.0f/255.0f green:168.0f/255.0f blue:114.0f/255.0f alpha:1.05],
										  [NKFColor colorWithRed:28.0f/255.0f green:139.0f/255.0f blue:56.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:71.0f/255.0f green:66.0f/255.0f blue:73.0f/255.0f alpha:1.0f]]];
		}
	} else if ([dateComps month] == 4) {
		if (isEaster) {
			[colors addObjectsFromArray:@[[NKFColor deepCarmine],
										  [NKFColor colorWithRed:224.0f/255.0f green:201.0f/255.0f blue:230.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:240.0f/255.0f green:219.0f/255.0f blue:125.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:215.0f/255.0f green:130.0f/255.0f blue:177.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:246.0f/255.0f green:164.0f/255.0f blue:50.0f/255.0f alpha:1.0f]]];
		}
	} else if ([dateComps month] == 5) {
		if (colors.count == 0) {
			[colors addObjectsFromArray:@[[NKFColor colorWithRed:27.0f/255.0f green:50.0f/255.0f blue:90.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:233.0f/255.0f green:242.0f/255.0f blue:249.0f alpha:1.0f],
										  [NKFColor colorWithRed:155.0f/255.0f green:197.0f/255.0f blue:230.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:61.0f/255.0f green:138.0f/255.0f blue:199.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:240.0f/255.0f green:108.0f/255.0f blue:83.0f/255.0f alpha:1.0f]]];
		}
	} else if ([dateComps month] == 6) {
		if ([dateComps day] % 3 == 0) {
			[colors addObjectsFromArray:@[[NKFColor colorWithRed:63.0f/255.0f green:80.0f/255.0f blue:87.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:235.0f/255.0f green:214.0f/255.0f blue:99.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:253.0f/255.0f green:173.0f/255.0f blue:9.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:115.0f/255.0f green:176.0f/255.0f blue:113.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:26.0f/255.0f green:143.0f/255.0f blue:143.0f/255.0f alpha:1.0f]]];
		}
	} else if ([dateComps month] == 7) {
		// 4th of July
		if ([dateComps day] == 4) {
			[colors addObjectsFromArray:@[[NKFColor navy],
										  [NKFColor white],
										  [NKFColor skyBlue],
										  [NKFColor redColor],
										  [NKFColor darkRed]]];
		} else if ([dateComps day] % 4 == 0) {
			[colors addObjectsFromArray:@[[NKFColor colorWithRed:16.0f/255.0f green:21.0f/255.0f blue:43.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:1.0f green:0.97f blue:206.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:45.0f/255.0f green:159.0f/255.0f blue:169.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:26.0f/255.0f green:81.0f/255.0f blue:86.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:15.0f/255.0f green:20.0f/255.0f blue:42.0f/255.0f alpha:1.0f]]];
		}
	} else if ([dateComps month] == 8) {
		if ([dateComps day] % 5 == 0) {
			[colors addObjectsFromArray:@[[NKFColor colorWithRed:79.0f/255.0f green:64.0f/255.0f blue:35.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:238.0f/255.0f green:238.0f/255.0f blue:238.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:207.0f/255.0f green:216.0f/255.0f blue:151.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:143.0f/255.0f green:206.0f/255.0f blue:203.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:132.0f/255.0f green:126.0f/255.0f blue:110.0f/255.0f alpha:1.0f]]];
		}
	} else if ([dateComps month] == 9) {
		// special colors for my birthday, my parents' anniversary, last day of summer, and my cousin's anniversary
		if ([dateComps day] % 7 == 0) {
			[colors addObjectsFromArray:@[[NKFColor colorWithRed:100.0f/255.0f green:118.0f/255.0f blue:99.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:233.0f/255.0f green:233.0f/255.0f blue:191.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:173.0f/255.0f green:180.0f/255.0f blue:132.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:218.0f/255.0f green:155.0f/255.0f blue:58.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:202.0f/255.0f green:102.0f/255.0f blue:1.0f/255.0f alpha:1.0f]]];
		}
	} else if ([dateComps month] == 10) {
		// Halloween
		if ([dateComps day] == 31) {
            [colors addObjectsFromArray:@[[NKFColor colorWithRed:116.0f/255.0f green:32.0f/255.0f blue:31.0f/255.0f alpha:1.0f],
                                          [NKFColor colorWithRed:239.0f/255.0f green:231.0f/255.0f blue:166.0f/255.0f alpha:1.0f],
                                          [NKFColor colorWithRed:206.0f/255.0f green:197.0f/255.0f blue:132.0f/255.0f alpha:1.0f],
                                          [NKFColor colorWithRed:155.0f/255.0f green:132.0f/255.0f blue:84.0f/255.0f alpha:1.0f],
                                          [NKFColor colorWithRed:79.0f/255.0f green:75.0f/255.0f blue:44.0f/255.0f alpha:1.0f]]];
		}
		
		// special colors for my mom's birthday and Dave Price's Birthday
		if ([dateComps day] == 5 || [dateComps day] == 12) {
			[colors addObjectsFromArray:@[[NKFColor colorWithRed:116.0f/255.0f green:32.0f/255.0f blue:31.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:239.0f/255.0f green:231.0f/255.0f blue:166.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:206.0f/255.0f green:197.0f/255.0f blue:132.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:155.0f/255.0f green:132.0f/255.0f blue:84.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:79.0f/255.0f green:75.0f/255.0f blue:44.0f/255.0f alpha:1.0f]]];
		}
	} else if ([dateComps month] == 11) {
		// special colors for Katie's birthday / veteran's day
		if ([dateComps day] == 11) {
			// need to figure these colors out
            [colors addObjectsFromArray:@[[NKFColor colorWithRed:116.0f/255.0f green:32.0f/255.0f blue:31.0f/255.0f alpha:1.0f],
                                          [NKFColor colorWithRed:239.0f/255.0f green:231.0f/255.0f blue:166.0f/255.0f alpha:1.0f],
                                          [NKFColor colorWithRed:206.0f/255.0f green:197.0f/255.0f blue:132.0f/255.0f alpha:1.0f],
                                          [NKFColor colorWithRed:155.0f/255.0f green:132.0f/255.0f blue:84.0f/255.0f alpha:1.0f],
                                          [NKFColor colorWithRed:79.0f/255.0f green:75.0f/255.0f blue:44.0f/255.0f alpha:1.0f]]];
		} else if ([dateComps day] % 12 == 0) {
			[colors addObjectsFromArray:@[[NKFColor colorWithRed:40.0f/255.0f green:39.0f/255.0f blue:41.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:245.0f/255.0f green:152.0f/255.0f blue:31.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:219.0f/255.0f green:84.0f/255.0f blue:80.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:176.0f/255.0f green:13.0f/255.0f blue:34.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:65.0f/255.0f green:11.0f/255.0f blue:26.0f/255.0f alpha:1.0f]]];
		}
	} else if ([dateComps month] == 12) {
		// Christmas colors for the 25 days leading up to and including Christmas
		if ([dateComps day] <= 25) {
			[colors addObjectsFromArray:@[[NKFColor deepRed],
										  [NKFColor white],
										  [NKFColor greenPantone],
										  [NKFColor uPForestGreen],
										  [NKFColor rubyRed]]];
		} else { // new year's eve colors!
			[colors addObjectsFromArray:@[[NKFColor jet],
										  [NKFColor champagne],
										  [NKFColor silver],
										  [NKFColor darkGrayColor],
										  [NKFColor goldenrod]]];
		}
	}
	
	// add a default set of colors that I think look nice
	if (colors.count == 0) {
		[colors addObjectsFromArray:@[[NKFColor colorWithRed:16.0f/255.0f green:21.0f/255.0f blue:43.0f/255.0f alpha:1.0f],
									  [NKFColor colorWithRed:1.0f green:0.97f blue:206.0f/255.0f alpha:1.0f],
									  [NKFColor colorWithRed:45.0f/255.0f green:159.0f/255.0f blue:169.0f/255.0f alpha:1.0f],
									  [NKFColor colorWithRed:26.0f/255.0f green:81.0f/255.0f blue:86.0f/255.0f alpha:1.0f],
									  [NKFColor colorWithRed:15.0f/255.0f green:20.0f/255.0f blue:42.0f/255.0f alpha:1.0f]]];
	}
	
	if (colors.count > 0) {
		// make sure that there are five colors
		while (colors.count < 5) {
			[colors addObject:[colors objectAtIndex:arc4random()%colors.count]];
		}
		
		return colors;
	}
	
	return nil;
}

+ (NSArray *)strictHolidayColorsForToday {
	return [NKFColor strictHolidayColorsForDate:[NSDate date]];
}

+ (NSArray *)strictHolidayColorsForDate:(NSDate *)date {
	NSCalendar *gregorianCal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSDateComponents *dateComps = [gregorianCal components: (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
												  fromDate: date];
	
	NSMutableArray *colors = [[NSMutableArray alloc] init];
	
	// all of this is just for calculating Easter...which might be a bit excessive
	BOOL isEaster = NO;
	if ([dateComps month] == 3 || [dateComps month] == 4) {
		NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
		
		NSNumber *month = [defaults objectForKey:[NSString stringWithFormat:@"Month Of Easter In Year %ld", (long)[dateComps year]]];
		NSNumber *day = [defaults objectForKey:[NSString stringWithFormat:@"Day Of Easter In Year %ld", (long)[dateComps year]]];
		
		if (month && day) {
			if ([month intValue] == [dateComps month] && [day intValue] == [dateComps day]) {
				isEaster = YES;
			}
		} else {
			NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
			NSUInteger unitFlags = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
			NSDateComponents *gregorianComps = [gregorian components:unitFlags fromDate:date];
			[gregorianComps  setDay:21];
			[gregorianComps setMonth:3];
			NSDate *easterStartDate = [gregorianCal dateFromComponents:gregorianComps]; //March 21 for the year
			
			NSCalendar *chinese = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
			// convert from gregorian calendar to chinese calendar
			NSDateComponents *chineseComps = [chinese components:unitFlags fromDate:easterStartDate];
			NSDate *easterStartDateChineseDate = [chinese dateFromComponents:chineseComps];
			
			NSDate *easterStartDateChineseDateTemp = easterStartDateChineseDate;
			if ([chineseComps day] >=15) {            // 15 is the full month day in Chinese Calendar
				NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
				[offsetComponents setMonth:1];                   // set the next month
				easterStartDateChineseDateTemp = [chinese dateByAddingComponents:offsetComponents toDate:easterStartDateChineseDate options:0];
			}
			NSDateComponents *dayComponents = [chinese components:NSCalendarUnitDay fromDate:easterStartDateChineseDateTemp];
			NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
			[componentsToAdd setDay: (15 - [dayComponents day])];
			// find the next full month date
			NSDate *springEquinoChineseDate = [chinese dateByAddingComponents:componentsToAdd toDate:easterStartDateChineseDateTemp options:0];
			
			NSDateComponents *diffComps = [chinese components:NSCalendarUnitDay fromDate:easterStartDateChineseDate toDate:springEquinoChineseDate options:0];
			NSInteger diffDays = [diffComps day];
			
			// calculate the days difference from the March 21 to the next full month day
			NSDateComponents *daysToAdd = [[NSDateComponents alloc] init];
			[daysToAdd setDay:diffDays];
			NSDate *springEquinoGregorianDate = [gregorian dateByAddingComponents:daysToAdd toDate:easterStartDate options:0];
			
			// convert the next full month date from ChineseDate to GregorianComps
			NSDateComponents *springEquinoGregorianComps = [gregorian components:unitFlags fromDate:springEquinoGregorianDate];
			
			NSLog(@"springEquinoGregorian is %ld %ld %ld",(long)[springEquinoGregorianComps year], (long)[springEquinoGregorianComps month], (long)[springEquinoGregorianComps day]);
			
			NSInteger weekday = [springEquinoGregorianComps weekday];
			NSDate *easterSundayGregorianDateTemp = springEquinoGregorianDate;
			NSDateComponents *offsetGregorianComponents = [[NSDateComponents alloc] init];
			if (weekday == 7) {
				[offsetGregorianComponents setWeekOfMonth:2]; // If the full moon falls on a Sunday, Easter Day if the Sunday following
			} else {
				[offsetGregorianComponents setWeekOfMonth:1];
			}
			easterSundayGregorianDateTemp = [gregorian dateByAddingComponents:offsetGregorianComponents toDate:springEquinoGregorianDate options:0];
			NSDateComponents *weekdayComponents = [gregorian components:NSCalendarUnitWeekday fromDate:easterSundayGregorianDateTemp];
			NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
			[componentsToSubtract setDay: 0 - ([weekdayComponents weekday] - 1)];
			NSDate *easterDate = [gregorian dateByAddingComponents:componentsToSubtract toDate:easterSundayGregorianDateTemp options:0];
			
			NSDateComponents *easterComps = [gregorian components:unitFlags fromDate:easterDate];
			NSLog(@"Easter Date is %ld %ld %ld",(long)[easterComps year], (long)[easterComps month], (long)[easterComps day]);
			
			NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
			
			[defaults setObject:[NSNumber numberWithInt:(int)[easterComps month]] forKey:[NSString stringWithFormat:@"Month Of Easter In Year %ld", (long)[easterComps year]]];
			[defaults setObject:[NSNumber numberWithInt:(int)[easterComps day]] forKey:[NSString stringWithFormat:@"Day Of Easter In Year %ld", (long)[easterComps year]]];
			
			if ([dateComps day] == [easterComps day] && [dateComps month] == [easterComps month]) {
				isEaster = YES;
			}
		}
	}
	
	if ([dateComps month] == 1) {
		// new year's day
		if ([dateComps day] == 1) {
			[colors addObjectsFromArray:@[[NKFColor colorWithRed:16.0f/255.0f green:21.0f/255.0f blue:43.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:1.0f         green:0.97f        blue:206.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:45.0f/255.0f green:159.0f/255.0f blue:169.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:26.0f/255.0f green:81.0f/255.0f blue:86.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:15.0f/255.0f green:20.0f/255.0f blue:42.0f/255.0f alpha:1.0f]]];
		}
	} else if ([dateComps month] == 2) {
		// day before valentine's day
		if ([dateComps day] == 13) {
			[colors addObjectsFromArray:@[[NKFColor colorWithRed:89.0f/255.0f green:60.0f/255.0f blue:79.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:220.0f/255.0f green:72.0f/255.0f blue:105.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:186.0f/255.0f green:71.0f/255.0f blue:98.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:122.0f/255.0f green:63.0f/255.0f blue:85.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:154.0f/255.0f green:67.0f/255.0f blue:92.0f/255.0f alpha:1.0f]]];
		} else if ([dateComps day] == 14) { // Valentine's Day
			[colors addObjectsFromArray:@[[NKFColor barnRed],
										  [NKFColor lavenderBlush],
										  [NKFColor cerise],
										  [NKFColor cardinal],
										  [NKFColor burgundy]]];
		}
	} else if ([dateComps month] == 3) {
		// day before St Patrick's Day
		if ([dateComps day] == 16) {
			[colors addObjectsFromArray:@[[NKFColor colorWithRed:58.0f/255.0f green:53.0f/255.0f blue:59.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:244.0f/255.0f green:241.0f/255.0f blue:236.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:115.0f/255.0f green:168.0f/255.0f blue:114.0f/255.0f alpha:1.05],
										  [NKFColor colorWithRed:28.0f/255.0f green:139.0f/255.0f blue:56.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:71.0f/255.0f green:66.0f/255.0f blue:73.0f/255.0f alpha:1.0f]]];
		} else if ([dateComps day] == 17) { // St Patrick's Day
			[colors addObjectsFromArray:@[[NKFColor darkGreen],
										  [NKFColor beige],
										  [NKFColor cadmiumGreen],
										  [NKFColor islamicGreen],
										  [NKFColor brunswickGreen]]];
		}
	} else if ([dateComps month] == 4) {
		if (isEaster) {
			[colors addObjectsFromArray:@[[NKFColor deepCarmine],
										  [NKFColor colorWithRed:224.0f/255.0f green:201.0f/255.0f blue:230.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:240.0f/255.0f green:219.0f/255.0f blue:125.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:215.0f/255.0f green:130.0f/255.0f blue:177.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:246.0f/255.0f green:164.0f/255.0f blue:50.0f/255.0f alpha:1.0f]]];
		}
	} else if ([dateComps month] == 5) {
		// memorial day
		if ([dateComps day] == 25) {
			[colors addObjectsFromArray:@[[NKFColor colorWithRed:16.0f/255.0f green:21.0f/255.0f blue:43.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:1.0f green:0.97f blue:206.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:45.0f/255.0f green:159.0f/255.0f blue:169.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:26.0f/255.0f green:81.0f/255.0f blue:86.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:15.0f/255.0f green:20.0f/255.0f blue:42.0f/255.0f alpha:1.0f]]];
		}
	} else if ([dateComps month] == 6) {
		// first day of summer
		if ([dateComps day] == 21) {
			[colors addObjectsFromArray:@[[NKFColor colorWithRed:63.0f/255.0f green:80.0f/255.0f blue:87.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:235.0f/255.0f green:214.0f/255.0f blue:99.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:253.0f/255.0f green:173.0f/255.0f blue:9.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:115.0f/255.0f green:176.0f/255.0f blue:113.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:26.0f/255.0f green:143.0f/255.0f blue:143.0f/255.0f alpha:1.0f]]];
		}
	} else if ([dateComps month] == 7) {
		// 4th of July
		if ([dateComps day] == 4) {
			[colors addObjectsFromArray:@[[NKFColor navy],
										  [NKFColor white],
										  [NKFColor skyBlue],
										  [NKFColor redColor],
										  [NKFColor darkRed]]];
		}
	} else if ([dateComps month] == 8) {
		// no holidays in August
	} else if ([dateComps month] == 9) {
		// special colors for my birthday, my parents' anniversary, last day of summer, and my cousin's anniversary
		if ([dateComps day] % 7 == 0) {
			[colors addObjectsFromArray:@[[NKFColor colorWithRed:100.0f/255.0f green:118.0f/255.0f blue:99.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:233.0f/255.0f green:233.0f/255.0f blue:191.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:173.0f/255.0f green:180.0f/255.0f blue:132.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:218.0f/255.0f green:155.0f/255.0f blue:58.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:202.0f/255.0f green:102.0f/255.0f blue:1.0f/255.0f alpha:1.0f]]];
		}
	} else if ([dateComps month] == 10) {
		// Halloween
		if ([dateComps day] == 31) {
			
		}
		
		// special colors for my mom's birthday and Dave Price's Birthday
		if ([dateComps day] == 5 || [dateComps day] == 12) {
			[colors addObjectsFromArray:@[[NKFColor colorWithRed:116.0f/255.0f green:32.0f/255.0f blue:31.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:239.0f/255.0f green:231.0f/255.0f blue:166.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:206.0f/255.0f green:197.0f/255.0f blue:132.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:155.0f/255.0f green:132.0f/255.0f blue:84.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:79.0f/255.0f green:75.0f/255.0f blue:44.0f/255.0f alpha:1.0f]]];
		}
	} else if ([dateComps month] == 11) {
		// special colors for Katie's birthday / veteran's day
		if ([dateComps day] == 11) {
			
		} else if ([dateComps day] % 12 == 0) {
			[colors addObjectsFromArray:@[[NKFColor colorWithRed:40.0f/255.0f green:39.0f/255.0f blue:41.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:245.0f/255.0f green:152.0f/255.0f blue:31.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:219.0f/255.0f green:84.0f/255.0f blue:80.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:176.0f/255.0f green:13.0f/255.0f blue:34.0f/255.0f alpha:1.0f],
										  [NKFColor colorWithRed:65.0f/255.0f green:11.0f/255.0f blue:26.0f/255.0f alpha:1.0f]]];
		}
	} else if ([dateComps month] == 12) {
		// Christmas colors for the 12 days leading up to and including Christmas
		if ([dateComps day] <= 25 && [dateComps day] > 13) {
			[colors addObjectsFromArray:@[[NKFColor deepRed],
										  [NKFColor white],
										  [NKFColor greenPantone],
										  [NKFColor uPForestGreen],
										  [NKFColor rubyRed]]];
		} else if ([dateComps day] == 31) { // new year's eve colors!
			[colors addObjectsFromArray:@[[NKFColor jet],
										  [NKFColor champagne],
										  [NKFColor silver],
										  [NKFColor darkGrayColor],
										  [NKFColor goldenrod]]];
		}
	}
	
	if (colors.count > 0) {
		// make sure that there are five colors
		while (colors.count < 5) {
			[colors addObject:[colors objectAtIndex:arc4random()%colors.count]];
		}
		
		return colors;
	}
	
	return nil;
}

#pragma mark - Colors for Time

+ (NKFColor *)colorForCurrentTime {
	return [NKFColor colorForTimeOfDay:[NSDate date]];
}

+ (NKFColor *)colorForTimeOfDay:(NSDate *)date {
	NSCalendar *gregorianCal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSDateComponents *dateComps = [gregorianCal components: (NSCalendarUnitHour | NSCalendarUnitMinute)
												  fromDate: date];
	
	int minutes = (int)[dateComps minute];
	int hour = (int)[dateComps hour];
	hour *= 60;
	int timeValue = hour + minutes;
	timeValue -= 720; // noon is now zero
	timeValue = abs(timeValue);
	timeValue *= timeValue * timeValue;
	timeValue /= 720;
	float time = 1.0f - (((float)timeValue)/518400.0f);
	time *= 1.2f;
	time *= time;
	time /= 1.2f;
	NSLog(@"Time: %f", time);
	float redValue = time;
	float greenValue = time;
	float blueValue = time;
	
	// between 6 AM and 6 PM
	if (hour < 64800) {
		redValue -= 0.2f;
		redValue *= 0.65;
		greenValue -= 0.1f;
		greenValue *= 0.83f;
	}
	
	if (time < 0.8) {
		redValue *= 0.25f;
		greenValue *= 0.1f;
		blueValue *= 0.7f;
	}
	
	return [NKFColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0f];
}

@end
