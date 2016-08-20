//
//  NKFColor+AppColors.m
//  Alphabetical List Utility
//
//  Created by HAI on 7/22/15.
//  Copyright (c) 2015 HAI. All rights reserved.
//

#import "NKFColor+AppColors.h"
#import "NKFColor+WikipediaColors.h"
#import "NKFColor+Dates.h"

#define USER_COLORS_KEY @"namesOfUserColorsSeparatedByCommas"

@implementation NKFColor (AppColors)

#pragma mark - Special Tint color

+ (NKFColor *)specialTintColor {
	NSCalendar *gregorianCal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSDateComponents *dateComps = [gregorianCal components: (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour)
												  fromDate: [NSDate date]];
	
	NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
	NSNumber *easterMonth = [defaults objectForKey:[NSString stringWithFormat:@"Month Of Easter In Year %ld", (long)[dateComps year]]];
	NSNumber *easterDay = [defaults objectForKey:[NSString stringWithFormat:@"Day Of Easter In Year %ld", (long)[dateComps year]]];
	
	if ([dateComps month] == 3 && [dateComps day] == 17) { // St. Patrick's Day
		return [NKFColor greenPantone];
	} else if (([dateComps month] == 3 || [dateComps month] == 4) && easterMonth && [dateComps month] == [easterMonth intValue] && easterDay && [dateComps day] == [easterDay intValue]) { // Easter
		return [NKFColor heliotrope];
	} else if ([dateComps month] == 7 && [dateComps day] == 4) { // 4th Of July
		return [NKFColor navy];
	} else if ([dateComps month] == 10 && [dateComps day] >= 30) { // Halloween
		return [NKFColor safetyOrange];
	} else if ([dateComps month] == 12 && [dateComps day] >= 20 && [dateComps day] <= 25) { // Christmas
		return [NKFColor forestGreenWeb];
	} else if (([dateComps month] == 12 && [dateComps day] == 31) || ([dateComps month] == 1 && [dateComps day] == 1 && [dateComps hour] < 6)) {
		return [NKFColor schoolBusYellow]; // New Year's Eve
	}
	
	return nil;
}

#pragma mark - App Colors

+ (NKFColor *)appColor {
	NKFColor *specialTintColor = [self specialTintColor];
	if (specialTintColor) return specialTintColor;
	
	return [NKFColor colorWithRed:0.0f/255.0f green:71.0f/255.0f blue:127.0f/255.0f alpha:0.97f];
}

+ (NKFColor *)appColor1 {
	return [NKFColor colorWithRed:0.0f/255.0f green:36.0f/255.0f blue:63.0f/255.0f alpha:0.97f];
}

+ (NKFColor *)appColor2 {
	return [NKFColor colorWithRed:0.0f/255.0f green:71.0f/255.0f blue:127.0f/255.0f alpha:0.97f];
}

+ (NKFColor *)appColor3 {
	return [NKFColor colorWithRed:122.0f/255.0f green:164.0f/255.0f blue:192.0f/255.0f alpha:0.97f];
}

+ (NKFColor *)appColor4 {
	return [NKFColor colorWithRed:232.0f/255.0f green:190.0f/255.0f blue:48.0f/255.0f alpha:0.97f];
}

+ (NSArray *)appColors {
	return @[[self appColor1],
			 [self appColor2],
			 [self appColor3],
			 [self appColor4],
			 [self acidGreen],
			 [self aero],
			 [self africanViolet],
			 [self airForceBlueRAF],
			 [self alabamaCrimson],
			 [self alloyOrange],
			 [self almond],
			 [self airSuperiorityBlue],
			 [self aeroBlue]];
}

#pragma mark - Custom App Colors

+ (NKFColor *)redAppColor {
	NKFColor *specialTintColor = [self specialTintColor];
	if (specialTintColor) return specialTintColor;
	
	return [NKFColor venetianRed];
}

+ (NKFColor *)greenAppColor {
	return [NKFColor appleGreen];
}

+ (NKFColor *)blueAppColor {
	return [NKFColor navy];
}

+ (NKFColor *)yellowAppColor {
	return [NKFColor canaryYellow];
}

+ (NKFColor *)magentaAppColor {
	return [NKFColor magenta];
}

+ (NKFColor *)cyanAppColor {
	return [NKFColor cyan];
}

+ (NKFColor *)blackAppColor {
	return [NKFColor black];
}

+ (NKFColor *)whiteAppColor {
	return [NKFColor whiteSmoke];
}

#pragma mark - User Colors

- (void)saveColorNamed:(NSString *)name {
	NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
	
	NSString *userColorKeysString = [defaults objectForKey:USER_COLORS_KEY];
	
	if (userColorKeysString) {
		NSString *newColorKeysString = [NSString stringWithFormat:@"%@,,,%@", userColorKeysString, name];
		NSString *colorHexString = [self hexValue];
		
		[defaults setObject:colorHexString forKey:name];
		[defaults setObject:newColorKeysString forKey:USER_COLORS_KEY];
	} else {
		NSString *newColorKeysString = [NSString stringWithFormat:@"%@", name];
		NSString *colorHexString = [self hexValue];
		
		[defaults setObject:colorHexString forKey:name];
		[defaults setObject:newColorKeysString forKey:USER_COLORS_KEY];
	}
}

+ (void)saveColor:(NKFColor *)color named:(NSString *)name {
	[color saveColorNamed:name];
}

+ (void)deleteColorWithName:(NSString *)name {
	NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
	
	[defaults removeObjectForKey:name];
}

+ (NSDictionary *)userColors {
	NSMutableDictionary *userColors = [[NSMutableDictionary alloc] init];
	
	NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
	
	NSString *userColorKeysString = [defaults objectForKey:USER_COLORS_KEY];
	BOOL alteredColorString = NO;
	if (userColorKeysString) {
		NSArray *userColorKeys = [userColorKeysString componentsSeparatedByString:@",,,"];
		
		for (NSString *colorKey in userColorKeys) {
			NSString *hexValue = [defaults objectForKey:colorKey];
			
			if (hexValue.length == 6) {
				NKFColor *color = [NKFColor colorWithHexString:[NSString stringWithFormat:@"#%@", hexValue]];
				
				[userColors setObject:color forKey:colorKey];
			} else {
				alteredColorString = YES;
			}
		}
		
		if (alteredColorString) {
			NSString *firstString = [userColorKeys firstObject];
			int index = 0;
			while (![defaults objectForKey:firstString] && userColorKeys.count > index) {
				firstString = [userColorKeys objectAtIndex:index];
				index++;
			}
			
			if ([defaults objectForKey:firstString]) {
				NSMutableString *newColorKeysString = [[NSMutableString alloc] initWithString:firstString];
				
				for (int i = index + 1; i < userColorKeys.count; i++) {
					NSString *nextColorName = [userColorKeys objectAtIndex:i];
					NSString *nextColorHex = [defaults objectForKey:nextColorName];
					if (nextColorHex && nextColorHex.length == 6) {
						[newColorKeysString appendFormat:@",,,%@", nextColorName];
					}
				}
				
				[defaults setObject:newColorKeysString forKey:USER_COLORS_KEY];
			} else {
				[defaults removeObjectForKey:USER_COLORS_KEY];
			}
		}
	}
	
	return userColors;
}

@end
