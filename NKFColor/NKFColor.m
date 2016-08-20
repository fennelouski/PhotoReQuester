//
//  NKFColor.m
//  Alphabetical List Utility
//
//  Created by HAI on 7/16/15.
//  Copyright (c) 2015 HAI. All rights reserved.
//

#import "NKFColor.h"
#import "NSString+AppFunctions.h"
#import "UIColor+AppColors.h"

#define DESELECTED_BRIGHTNESS 0.4f
#define SELECTED_BRIGHTNESS 0.75f
#define SHOW_LOGS NO

@implementation NKFColor

typedef struct {
	double r;       // percent [0 - 1]
	double g;       // percent [0 - 1]
	double b;       // percent [0 - 1]
	double a;       // percent [0 - 1]
} RGBA;

typedef struct {
	double h;       // angle in degrees [0 - 360]
	double s;       // percent [0 - 1]
	double v;       // percent [0 - 1]
} HSV;

#pragma mark - Forwarded methods

+ (NKFColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
	return (NKFColor *)[UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (NKFColor *)colorWithWhite:(CGFloat)white alpha:(CGFloat)alpha {
	return (NKFColor *)[UIColor colorWithRed:white green:white blue:white alpha:alpha];
}

+ (NKFColor *)redColor {
	return [NKFColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
}

+ (NKFColor *)greenColor {
	return [NKFColor colorWithRed:0.0f green:1.0f blue:0.0f alpha:1.0f];
}

+ (NKFColor *)blueColor {
	return [NKFColor colorWithRed:0.0f green:0.0f blue:1.0f alpha:1.0f];
}

+ (NKFColor *)yellowColor {
	return [NKFColor colorWithRed:1.0f green:1.0f blue:0.0f alpha:1.0f];
}

+ (NKFColor *)purpleColor {
	return [NKFColor colorWithRed:0.5f green:0.0f blue:0.5f alpha:1.0f];
}

+ (NKFColor *)magentaColor {
	return [NKFColor colorWithRed:1.0f green:0.0f blue:1.0f alpha:1.0f];
}

+ (NKFColor *)cyanColor {
	return [NKFColor colorWithRed:0.0f green:1.0f blue:1.0f alpha:1.0f];
}

+ (NKFColor *)whiteColor {
	return [NKFColor colorWithWhite:1.0f alpha:1.0f];
}

+ (NKFColor *)blackColor {
	return [NKFColor colorWithWhite:0.0f alpha:1.0f];
}

+ (NKFColor *)lightGrayColor {
	return [NKFColor colorWithWhite:0.667f alpha:1.0f];
}

+ (NKFColor *)grayColor {
	return [NKFColor colorWithWhite:0.5f alpha:1.0f];
}

+ (NKFColor *)darkGrayColor {
	return [NKFColor colorWithWhite:0.333f alpha:1.0f];
}

+ (NKFColor *)brownColor {
	return [NKFColor colorWithRed:0.6f green:0.4f blue:0.2f alpha:1.0f];
}

+ (NKFColor *)clearColor {
	return [NKFColor colorWithWhite:0.0f alpha:0.0f];
}

+ (NKFColor *)orangeColor {
	return [NKFColor colorWithRed:1.0f green:0.5f blue:0.0f alpha:1.0f];
}

+ (NKFColor *)lightTextColor {
	CGFloat red, green, blue;
	[[UIColor lightTextColor] getRed:&red
                               green:&green
                                blue:&blue
                               alpha:nil];
	
	return [NKFColor colorWithRed:red green:green blue:blue alpha:1.0f];
}

+ (NKFColor *)darkTextColor {
	CGFloat red, green, blue;
	[[UIColor darkTextColor] getRed:&red
                              green:&green
                               blue:&blue
                              alpha:nil];
	
	return [NKFColor colorWithRed:red green:green blue:blue alpha:1.0f];
}

- (NKFColor *)colorWithAlphaComponent:(CGFloat)alpha {
	CGFloat red, green, blue;
	[self getRed:&red green:&green blue:&blue alpha:nil];
	
	return [NKFColor colorWithRed:red green:green blue:blue alpha:alpha];
}

- (id)valueForUndefinedKey:(NSString *)key {
	CGFloat red, green, blue, alpha;
	[self getRed:&red
           green:&green
            blue:&blue
           alpha:&alpha];
	
	if ([key isEqualToString:@"redComponent"]) {
		return @(red);
	} else if ([key isEqualToString:@"greenComponent"]) {
		return @(green);
	} else if ([key isEqualToString:@"blueComponent"]) {
		return @(blue);
	} else if ([key isEqualToString:@"alphaComponent"]) {
		return @(alpha);
	}
	
	NSLog(@"Value for \"%@\" is undefined. Returning 0.5153", key);
	
	return @0.5153f;
}

- (NSUInteger)hash {
	CGFloat red, green, blue;
	[self getRed:&red green:&green blue:&blue alpha:nil];
	return ((NSUInteger)(red * 255) << 16) + ((NSUInteger)(green * 255) << 8) + (NSUInteger)(blue * 255);
}

- (BOOL)isEqual:(id)object {
	if (self == object) {
		return YES;
	}
	
	if (![object isKindOfClass:[NKFColor class]]) {
		return NO;
	}
	
	return [self isEqualToColor:(NKFColor *)object];
}

- (BOOL)isEqualToColor:(NKFColor *)color {
	if (!color) {
		return NO;
	}
	
	CGFloat red, green, blue, alpha;
	[self getRed:&red green:&green blue:&blue alpha:&alpha];
	
	CGFloat colorRed, colorGreen, colorBlue, colorAlpha;
	[self getRed:&colorRed green:&colorGreen blue:&colorBlue alpha:&colorAlpha];
	
	return (red == colorRed && green == colorGreen && blue == colorBlue && alpha == colorAlpha);
}

- (void)set {
	CGFloat red, green, blue, alpha;
	[self getRed:&red green:&green blue:&blue alpha:&alpha];
	
	[[UIColor colorWithRed:red green:green blue:blue alpha:alpha] set];
}

- (NSString *)colorSpaceName {
	return @"rgb";
}

+ (NKFColor *)colorWithCGColor:(CGColorRef)cgColor {
	return (NKFColor *)[UIColor colorWithCGColor:cgColor];
}

+ (NKFColor *)colorWithPatternImage:(UIImage *)image {
	return (NKFColor *)[UIColor colorWithPatternImage:image];
}

+ (NKFColor *)colorWithCIColor:(CIColor *)ciColor {
	return (NKFColor *)[UIColor colorWithCIColor:ciColor];
}

+ (NKFColor *)colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness alpha:(CGFloat)alpha {
	HSV hsvSpace;
	hsvSpace.h = hue;
	hsvSpace.s = saturation;
	hsvSpace.v = brightness;
	RGBA rgbSpace = [NKFColor RGBfromHSV:hsvSpace];
	
	return [NKFColor colorWithRed:rgbSpace.r green:rgbSpace.g blue:rgbSpace.b alpha:alpha];
}

#pragma mark - iOS Colors

+ (NKFColor *)uiSwitchGreen {
	return [NKFColor colorWithRed:76.0f/255.0f green:217.0f/255.0f blue:100.0f/255.0f alpha:1.0f];
}

#pragma mark - HSV to RGB Conversion

+ (RGBA)RGBfromHSV:(HSV)value {
	double      hh, p, q, t, ff;
	long        i;
	RGBA        out;
	out.a       = 1;
	// < is bogus, just shuts up warnings
	if (value.s <= 0.0)  {
		// value.h == NAN
		if (isnan(value.h)) {
			out.r = value.v;
			out.g = value.v;
			out.b = value.v;
			return out;
		}
		
		// error - should never happen
		out.r = 0.0;
		out.g = 0.0;
		out.b = 0.0;
		return out;
	}
	
	hh = value.h;
	if(hh >= 360.0) hh = 0.0;
	hh /= 60.0;
	i = (long)hh;
	ff = hh - i;
	p = value.v * (1.0 - value.s);
	q = value.v * (1.0 - (value.s * ff));
	t = value.v * (1.0 - (value.s * (1.0 - ff)));
	
	switch(i) {
		case 0:
			out.r = value.v;
			out.g = t;
			out.b = p;
			break;
		case 1:
			out.r = q;
			out.g = value.v;
			out.b = p;
			break;
		case 2:
			out.r = p;
			out.g = value.v;
			out.b = t;
			break;
			
		case 3:
			out.r = p;
			out.g = q;
			out.b = value.v;
			break;
		case 4:
			out.r = t;
			out.g = p;
			out.b = value.v;
			break;
		case 5:
		default:
			out.r = value.v;
			out.g = p;
			out.b = q;
			break;
	}
	
	return out;
}


#pragma mark - modify colors

- (NKFColor *)lightenColor {
	return [self lightenColorBy:0.5f];
}

- (NKFColor *)lightenColorBy:(float)lightenAmount {
    CGFloat redValue, greenValue, blueValue, alphaValue;
    [self getRed:&redValue
           green:&greenValue
            blue:&blueValue
           alpha:&alphaValue];
	
	float difference = 1.0f - redValue;
	difference *= (1.0f - lightenAmount);
	redValue += difference;
	
	difference = 1.0f - greenValue;
	difference *= (1.0f - lightenAmount);
	greenValue += difference;
	
	difference = 1.0f - blueValue;
	difference *= (1.0f - lightenAmount);
	blueValue += difference;
	
	NKFColor *tempColor = [NKFColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0f];
	
	return tempColor;
}

- (NKFColor *)darkenColor {
	return [self darkenColorBy:0.5f];
}

- (NKFColor *)darkenColorBy:(float)darkenAmount {
    CGFloat redValue, greenValue, blueValue, alphaValue;
    [self getRed:&redValue
           green:&greenValue
            blue:&blueValue
           alpha:&alphaValue];
	
	redValue *= darkenAmount;
	greenValue *= darkenAmount;
	blueValue *= darkenAmount;
	
	NKFColor *tempColor = [NKFColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0f];
	
	return tempColor;
}

- (NKFColor *)setBrightness:(float)brightness {
    CGFloat redValue, greenValue, blueValue, alphaValue;
    [self getRed:&redValue
           green:&greenValue
            blue:&blueValue
           alpha:&alphaValue];
	
	float overallBrightness = (redValue + greenValue + blueValue) / 3.0f;
	
	if (overallBrightness == brightness) {
		return self;
	}
	
	if (overallBrightness > brightness) {
		if (brightness < 0.01f) {
			return [NKFColor colorWithRed:redValue * 0.03f green:greenValue * 0.03f blue:blueValue * 0.03f alpha:1.0f];
		}
		
		while (overallBrightness > brightness) {
			redValue *= 0.99f;
			greenValue *= 0.99f;
			blueValue *= 0.99f;
			overallBrightness = (redValue + greenValue + blueValue) / 3.0f;
		}
	} else if (overallBrightness < brightness) {
		if (brightness > 0.99f) {
			return [NKFColor colorWithRed:brightness green:brightness blue:brightness alpha:1.0f];
		}
		
		while (overallBrightness < brightness) {
			redValue *= 1.01f;
			greenValue *= 1.01f;
			blueValue *= 1.01f;
			
			if (redValue > 1.0f || greenValue > 1.0f || blueValue > 1.0f) {
				if (redValue > 1.0f) {
					float redOverflow = (float)((int)(redValue * 1000)%1000)/1000.0f;
					redValue = 1.0f;
					
					if (greenValue < 0.01f && blueValue > 0.01f && blueValue < 1.0f) {
						blueValue += redOverflow;
					} else if (greenValue > 0.01f && greenValue < 1.0f && blueValue < 0.01f) {
						greenValue += redOverflow;
					} else if (greenValue > 0.01f && blueValue > 0.01f) {
						greenValue += redOverflow * (greenValue / (greenValue + blueValue));
						blueValue += redOverflow * (blueValue / (greenValue + blueValue));
					} else {
						greenValue += redOverflow / 2.0f;
						blueValue += redOverflow / 2.0f;
					}
				}
				
				if (greenValue > 1.0f) {
					float greenOverflow = (float)((int)(greenValue * 1000)%1000)/1000.0f;
					greenValue = 1.0f;
					
					if (redValue < 0.01f && blueValue > 0.01f && blueValue < 1.0f) {
						blueValue += greenOverflow;
					} else if (redValue > 0.01f && redValue < 1.0f && blueValue < 0.01f) {
						redValue += greenOverflow;
					} else if (redValue > 0.01f && blueValue > 0.01f) {
						redValue += greenOverflow * (redValue / (redValue + blueValue));
						blueValue += greenOverflow * (blueValue / (redValue + blueValue));
					} else {
						redValue += greenOverflow / 2.0f;
						blueValue += greenOverflow / 2.0f;
					}
				}
				
				if (blueValue > 1.0f) {
					float blueOverflow = (float)((int)(blueValue * 1000)%1000)/1000.0f;
					blueValue = 1.0f;
					
					if (redValue < 0.01f && greenValue > 0.01f && greenValue < 1.0f) {
						greenValue += blueOverflow;
					} else if (redValue > 0.01f && redValue < 1.0f && greenValue < 0.01f) {
						redValue += blueOverflow;
					} else if (redValue > 0.01f && greenValue > 0.01f) {
						redValue += blueOverflow * (redValue / (redValue + greenValue));
						greenValue += blueOverflow * (greenValue / (redValue + greenValue));
					} else {
						redValue += blueOverflow/2.0f;
						greenValue += blueOverflow/2.0f;
					}
				}
			}
			
			overallBrightness = (redValue + greenValue + blueValue) / 3.0f;
		}
	}
	
	return [NKFColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0f];
}

#pragma mark - random colors

+ (NKFColor *)randomPastelColor {
	float randomBrightness = (9500.0f - (arc4random()%1000)) / 10000.0f;
	return [[NKFColor randomDarkColor] setBrightness:randomBrightness];
}

+ (NKFColor *)randomDarkColor {
	[NKFColor colorWithRed:arc4random()%50/255.0f + 10.0f green:arc4random()%50/255.0f + 10.0f blue:arc4random()%50/255.0f + 10.0f alpha:1.0f];
	return (NKFColor *)[UIColor colorWithHue:arc4random()%10000/10000.0f saturation:(arc4random()%200 + 55)/255.0f brightness:((arc4random()%200) + 55.0f)/555.0f alpha:1.0f];
}

+ (NKFColor *)randomColor {
	NSArray *allColors = [NKFColor allColorsArray];
	// subtract 1 to ignore clearColor
	NSInteger randomeValue = arc4random()%([allColors count] - 1);
	return [allColors objectAtIndex:randomeValue];
}

+ (NSString *)randomColorName {
	NSMutableArray *adjectives = [NSMutableArray arrayWithArray:@[@"Big", @"Vuluptuous", @"Square", @"Brilliant", @"Bold", @"Meek", @"Unique", @"Plain", @"Gentle", @"Medium", @"Mediocre", @"Subtle", @"Short", @"Quizzical", @"Classic", @"Modern", @"Post-Modern", @"Jabbering", @"Melancholy", @"Wild", @"Tame", @"Free", @"Pacific", @"Original", @"Creative", @"Wandering", @"Awesome", @"Boring", @"Broken", @"Chilled", @"Charismatic", @"Cheerful", @"Callous", @"Cold", @"Hard", @"Kind", @"Compassionate", @"Spicy", @"Bawdy", @"Juicy", @"Zesty", @"Strong", @"Pungent", @"Lively", @"Colorful", @"Peppery", @"Seasoned", @"Tasty", @"Dull", @"Stodgy", @"Flat", @"Tiring", @"Monotonous", @"Tiny", @"Toy", @"Baby", @"Little", @"Huge", @"Cosmic", @"Gigantic", @"Gargantuan", @"Massive", @"Colossal", @"Vast", @"Beautiful", @"Ugly", @"Elegant", @"Beguiling", @"Graceful", @"Gracious", @"Ravishing", @"Cute", @"Foxy", @"Divine", @"Stunning", @"Dramatic", @"Engrossing", @"Impressive", @"Spectacular", @"", @"", @"", @"Rich", @"Fat", @"Wide", @"Skinny", @"Ancient", @"Dusty", @"Old", @"Young", @"Impoverished", @"Opinionated", @"Rough", @"Smooth", @"Preachy", @"Enticing", @"Brave", @"Puzzled", @"Inquisitive", @"Perplexed", @"Meandering", @"Lost", @"Empty", @"Monstrous", @"Peaceful", @"Amusing", @"Bewildered", @"Obnoxious"]];
	NSArray *nouns = @[@"", @"", @"", @"", @"Leopard", @"Jaguar", @"Dog", @"Tree", @"Bill", @"Water", @"Road", @"Season", @"Color", @"Name", @"Champion", @"Jaunt", @"Run", @"Dig", @"Fire", @"Signal", @"Mountain", @"Sports Car", @"Dinner", @"Cone", @"Ball", @"Wilderness", @"Splinter", @"Tribe", @"Carriage", @"Pram", @"Boat", @"Twig", @"Breeze", @"Cloud", @"Window", @"Pole", @"Chair", @"Seat", @"Iron", @"Wall", @"Bed", @"Letter", @"Star", @"Moon", @"Friend", @"Gymnasium", @"School", @"Roof", @"Bathroom", @"Attic", @"Pool", @"Raindrop", @"Whistle", @"Tail", @"Toga", @"Greek", @"Roman", @"American", @"Icing", @"Intrigue", @"Night", @"Morning", @"Sunset", @"Sunrise", @"Afternoon", @"Curve", @"Cave", @"Cocktail", @"Indicator", @"Alert", @"Politic", @"Principle", @"Principal", @"Giant", @"Book", @"Librarian", @"Teacher", @"Hair", @"Head", @"Toe", @"Fried Chicken", @"Toaster", @"Pacifist", @"Broom", @"Amusement Park", @"New Yorker"];
	NSArray *suffixes = @[@"", @"", @"", @"", @"", @"", @"", @"s", @"", @"", @"", @"", @""];
	
	NSMutableString *name = [[NSMutableString alloc] init];
	NSString *adjective = [adjectives objectAtIndex:arc4random()%adjectives.count];
	[name appendString:adjective];
	[adjectives removeObject:adjective];
	
	while (arc4random()%20 == 1 && name.length > 0) {
		NSString *adjective = [adjectives objectAtIndex:arc4random()%adjectives.count];
		[name appendFormat:@" %@", adjective];
		[adjectives removeObject:adjective];
	}
	
	NSString *noun = [nouns objectAtIndex:arc4random()%nouns.count];
	if (noun.length > 0) {
		[name appendFormat:@" %@", noun];
		[name appendString:[suffixes objectAtIndex:arc4random()%suffixes.count]];
	}
	
	if (name.length < 3) {
		return [NKFColor randomColorName];
	}
	
	return name;
}

+ (NSString *)randomColorNameWithColor:(NKFColor *)color {
	return [color randomColorName];
}

+ (NKFColor *)randomDarkColorFromString:(NSString *)string {
	if (string.length == 0) {
		return [NKFColor colorWithWhite:0.0f alpha:1.0f];
	}
	
	NSDictionary *whiteList = @{@"Player 2" : [NKFColor darkRed],
								@"Player 3" : [NKFColor darkGreen],
								@"Player 4" : [NKFColor gray],
								@"Player 5" : [NKFColor purpleNavy],
								@"Player 6" : [NKFColor orangeCrayola],
								@"Player 7" : [NKFColor lightCoral],
								@"Player 8" : [NKFColor seashell],
								@"Player 9" : [NKFColor darkBlue],
								@"Girl"		: [NKFColor carmine],
								@"Boy"		: [NKFColor denim],
								@"Women"	: [NKFColor carmine],
								@"Men"		: [NKFColor denim],
								@"Nathan"	: [NKFColor royalBlue],
								@"Paul"		: [NKFColor darkGreenX11],
								@"Katie"	: [NKFColor etonBlue],
								@"Ryan"		: [NKFColor orangePeel],
								@"Promise"	: [NKFColor hotPink],
								@"Janelle"	: [NKFColor rose],
								@"Christie"	: [NKFColor jungleGreen],
								@"Susan"	: [NKFColor deepCarmine],
								@"Prayer"	: [NKFColor bluebonnet]
								};
	
	for (NSString *key in [whiteList allKeys]) {
		if ([[string lowercaseString] isEqualToString:[key lowercaseString]]) {
			NKFColor *whiteColor = [whiteList objectForKey:key];
			if ([whiteColor respondsToSelector:@selector(setBrightness:)]) {
				whiteColor = [whiteColor setBrightness:SELECTED_BRIGHTNESS];
				whiteColor = [whiteColor setBrightness:DESELECTED_BRIGHTNESS];
			}
			return whiteColor;
		}
	}
	
	for (NSString *key in [whiteList allKeys]) {
		if ([[string lowercaseString] rangeOfString:[key lowercaseString]].location != NSNotFound) {
			NKFColor *whiteColor = [whiteList objectForKey:key];
			if ([whiteColor respondsToSelector:@selector(setBrightness:)]) {
				whiteColor = [whiteColor setBrightness:DESELECTED_BRIGHTNESS];
			}
			return whiteColor;
		}
	}
	
	if (string.length == 0) {
		return [NKFColor blackColor];
	}
	
	NSString *subString1 = [string substringToIndex:string.length/3];
	NSString *subString2 = [string substringWithRange:NSMakeRange(string.length/3, string.length/3)];
	NSString *subString3 = [string substringFromIndex:string.length * 0.667f];
	
	
	int blueValueInt = [subString1 intValue];
	for (int i = 0; i < subString1.length && subString1.length > 0; i++) {
		char character = [subString1 characterAtIndex:i];
		blueValueInt += (((int)character%2) + 1) * ((((int)character%12) + 1) * (((int)character%7) + 1)) * ((((int)character%12) + 1) * (((int)character%7) + 1));
	}
	
	int redValueInt = [subString2 intValue];
	for (int i = 0; i < subString2.length && subString2.length > 0; i++) {
		char character = [subString2 characterAtIndex:i];
		redValueInt *= (((int)character%2) + 1) * (((int)character%17) + 1) * (((int)character%8) + 1) * ((int)character%19);
	}
	
	int greenValueInt = [subString3 intValue];
	for (int i = 0; i < subString3.length && subString3.length > 0; i++) {
		char character = [subString3 characterAtIndex:i];
		greenValueInt += (((int)character%2) + 1) * (((int)character%13) + 1) * (((int)character%11) + 1);
	}
	
	redValueInt += 37;
	greenValueInt += 78;
	blueValueInt += 14;
	
	float redValue = [self pseudoRandomNumberFor:redValueInt] / 192.0f;
	float greenValue = [self pseudoRandomNumberFor:greenValueInt] / 216.0f;
	float blueValue = [self pseudoRandomNumberFor:blueValueInt] / 144.0f;
	
	return [NKFColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0f];
}

+ (int)pseudoRandomNumberFor:(int)input {
	int mappedValues[250] = {21, 45, 69, 63, 50, 62, 31, 16, 43, 57, 91, 59, 114, 3, 30, 72, 3, 72, 18, 62, 27, 87, 48, 3, 102, 14, 17, 122, 102, 46, 101, 45, 42, 103, 116, 12, 120, 7, 6, 103, 31, 63, 63, 15, 110, 7, 89, 44, 58, 5, 2, 125, 52, 60, 23, 62, 79, 18, 98, 39, 77, 10, 111, 12, 71, 121, 9, 80, 118, 77, 85, 71, 57, 48, 57, 8, 104, 104, 65, 123, 71, 47, 27, 126, 12, 49, 96, 88, 75, 25, 45, 85, 6, 108, 57, 94, 118, 122, 57, 7, 125, 103, 126, 9, 101, 92, 68, 111, 57, 75, 46, 121, 105, 60, 9, 82, 33, 113, 59, 5, 14, 88, 108, 2, 97, 28, 99, 116, 118, 16, 31, 78, 65, 29, 116, 78, 22, 125, 114, 79, 13, 38, 112, 13, 63, 52, 86, 16, 124, 0, 79, 33, 55, 77, 67, 66, 43, 40, 86, 100, 125, 68, 43, 40, 89, 59, 73, 91, 17, 36, 116, 45, 46, 41, 115, 17, 15, 112, 127, 99, 119, 86, 36, 3, 57, 24, 6, 85, 93, 58, 48, 90, 83, 83, 87, 100, 93, 53, 92, 25, 40, 51, 120, 114, 53, 27, 85, 123, 112, 99, 75, 39, 29, 8, 92, 16, 43, 24, 48, 97, 100, 44, 62, 25, 27, 71, 120, 24, 67, 66, 59, 61, 0, 112, 51, 13, 50, 23, 23, 84, 94, 14, 1, 99, 1, 121, 71, 45, 10, 80};
	int size = sizeof(mappedValues) / sizeof(int);
	int index = input % size;
	return mappedValues[index];
}

- (NSString *)randomColorName {
	NSMutableString *randomName = [[NSMutableString alloc] init];
	
    CGFloat redValue, greenValue, blueValue, alphaValue;
    [self getRed:&redValue
           green:&greenValue
            blue:&blueValue
           alpha:&alphaValue];
	float overallBrightness = (redValue + greenValue + blueValue)/3.0f;
	
	float darkThreshold = 0.25f;
	float brightThreshold = 0.5f;
	float veryBrightThreshold = 0.6f;
	float ultraBrightThreshold = 0.8f;
	float differenceRatio = 1.8f;
	
	if (overallBrightness > ultraBrightThreshold) {
		NSArray *lightAdjectives = @[@"Light", @"Soft", @"Gentle", @"Mild", @"Benevolent", @"Watery", @"Easter", @"Pale", @"Morning", @"Arctic", @"Floral", @"Aromatic"];
		[randomName appendFormat:@"%@ ", [lightAdjectives objectAtIndex:arc4random()%lightAdjectives.count]];
	} else if (overallBrightness < darkThreshold) {
		NSArray *darkAdjectives = @[@"Dark", @"Deep", @"Rich", @"Evening", @"Luscious", @"Savory", @"Midnight", @"Somber", @"Twilight", @"Space", @"Sad"];
		[randomName appendFormat:@"%@ ", [darkAdjectives objectAtIndex:arc4random()%darkAdjectives.count]];
	} else {
		NSMutableArray *adjectives = [NSMutableArray arrayWithArray:@[@"Big", @"Vuluptuous", @"Square", @"Brilliant", @"Bold", @"Meek", @"Unique", @"Plain", @"Soft", @"Gentle", @"Light", @"Dark", @"Medium", @"Mediocre", @"Subtle", @"Short", @"Quizzical", @"Classic", @"Modern", @"Post-Modern", @"Jabbering", @"Melancholy", @"Wild", @"Tame", @"Free", @"Pacific", @"Original", @"Creative", @"Wandering", @"Awesome", @"Boring", @"Broken", @"Chilled", @"Charismatic", @"Cheerful", @"Callous", @"Cold", @"Hard", @"Kind", @"Compassionate", @"Spicy", @"Bawdy", @"Juicy", @"Zesty", @"Strong", @"Pungent", @"Lively", @"Colorful", @"Peppery", @"Seasoned", @"Tasty", @"Dull", @"Stodgy", @"Flat", @"Tiring", @"Monotonous", @"Tiny", @"Toy", @"Baby", @"Little", @"Huge", @"Cosmic", @"Gigantic", @"Gargantuan", @"Massive", @"Colossal", @"Vast", @"Beautiful", @"Ugly", @"Elegant", @"Beguiling", @"Graceful", @"Gracious", @"Ravishing", @"Cute", @"Foxy", @"Divine", @"Stunning", @"Dramatic", @"Engrossing", @"Impressive", @"Spectacular", @"", @"", @"", @"Rich", @"Fat", @"Wide", @"Skinny", @"Ancient", @"Dusty", @"Old", @"Young", @"Impoverished", @"Opinionated", @"Rough", @"Smooth", @"Preachy", @"Enticing", @"Brave", @"Puzzled", @"Inquisitive", @"Perplexed", @"Meandering", @"Lost", @"Empty", @"Monstrous", @"Peaceful", @"Amusing", @"Bewildered", @"Obnoxious"]];
		[randomName appendFormat:@"%@ ", [adjectives objectAtIndex:arc4random()%adjectives.count]];
	}
	
	float differenceThreshold = 0.25f;
	float redDifferenceThreshold = 0.35f;
	float similarThreshold = 0.25f;
	
	// these are only used if the color is NOT purple
	float blueBlueGreenMinimumRatio = 1.214f;
	float blueBlueRedMinimumRatio = 1.8f;
	
	float orangeGreenMinimum = 0.24f;
	float orangeGreenMaxium = 0.64f;
	float orangeRedMinimum = 0.67f;
	float orangeRedGreenMinimumRatio = 1.51f;
	float orangeGreenBlueMinimumRatio = 1.22f;
	
	// purple is simple: blue >= red >> green
	float purpleRedBlueMaximumRatio = 1.0f;
	float purpleRedBlueMinimumRatio = 0.48f;
	
	float pinkGreenMinimum = 0.25f;
	float pinkRedMinimum = 0.804f;
	float pinkMinimumBrightness = 0.53f;
	float pinkRedBlueMinimumRatio = 1.11f;
	float pinkRedBlueMaximumRatio = 1.48f;
	
	float brownRedGreenMinimumRatio = 1.55f;
	float brownRedGreenMaxiumRatio = 2.65f;
	
	float yellowRedGreenMinimumRatio = 0.914f;
	float yellowRedGreenMaximumRatio = 1.1852f;
	float yellowRedMinimum = 0.91f;
	float yellowGreenMinimum = 0.91f;
	float yellowGreenBlueMinimumRatio = 2.16f;
	float yellowGreenRedMinimumNoBlue = 0.945f;
	
	float steelBlueGreenRatio = 1.31f;
	float steelGreenRedRatio = 1.31f;
	float steelMinimumBrightness = 0.4f;
	float steelMaximumBrightness = 0.7f;
	
	float greyVariation = 0.1f;
	
	if (SHOW_LOGS) {
		NSLog(@"R: %d \tG: %d \tB: %d \tR/G: %f \tR/B: %f \tG/B: %f", (int)(redValue*256), (int)(greenValue*256), (int)(blueValue*256), redValue/(greenValue + 0.01f), redValue/(blueValue + 0.01f), greenValue/(blueValue + 0.01f));
	}
	
	// grey
	if (greenValue - redValue < greyVariation && redValue - greenValue < greyVariation && greenValue - blueValue < greyVariation && blueValue - greenValue < greyVariation && redValue - blueValue < greyVariation && blueValue - redValue < greyVariation) {
		
		NSMutableArray *greyNouns = [NSMutableArray arrayWithArray:@[@"Grey", @"Gray", @"Concrete", @"Cement", @"Sidewalk", @"Clouds", @"Cloud", @"Grey", @"Gray", @"Grey", @"Gray", @"Grey", @"Grey", @"Grey", @"Gray", @"Grey", @"Gray"]];
		
		if (overallBrightness > 0.98f) {
			if (blueValue < redValue && blueValue < greenValue && blueValue < 0.98f) {
				return @"Chiffon";
			}
			
			return @"White";
		}
		
		if (overallBrightness > 0.95f) {
			greyNouns = [NSMutableArray arrayWithArray:@[@"White", @"Eggshell", @"Cream", @"Milk", @"Powder", @"Air", @"Cloud", @"Mist", @"Fog"]];
		}
		
		if (overallBrightness < 0.1f) {
			greyNouns = [NSMutableArray arrayWithArray:@[@"Black", @"Black Leather", @"Space", @"Black Cat", @"Black", @"Black", @"Black", @"Jet Black", @"Dark"]];
		}
		
		if (overallBrightness < 0.01) {
			return @"Black";
		}
		
		// purple grey
		if (redValue - blueValue < blueValue - greenValue && blueValue - redValue < redValue - greenValue) {
			if (SHOW_LOGS) {
				NSLog(@"\"Purple Grey?\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
			}
			[greyNouns addObjectsFromArray:@[@"Mountain"]];
		} else if (blueValue > greenValue && blueValue > redValue) { // blue grey
			if (SHOW_LOGS) {
				NSLog(@"\"Blue Grey?\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
			}
			[greyNouns addObjectsFromArray:@[]];
		} else if (redValue > greenValue && redValue > blueValue) { // red grey
			if (SHOW_LOGS) {
				NSLog(@"\"Red Grey?\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
			}
			[greyNouns addObjectsFromArray:@[@"Sandstone"]];
		} else if (greenValue > redValue && greenValue > blueValue) { // green grey
			if (SHOW_LOGS) {
				NSLog(@"\"Green Grey?\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
			}
			[greyNouns addObjectsFromArray:@[]];
		} else { // totally even grey
			if (SHOW_LOGS) {
				NSLog(@"\"Totally even Grey.\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
			}
			greyNouns = [NSMutableArray arrayWithArray:@[@"Grey", @"Gray"]];
		}
		
		[randomName appendFormat:@"%@", [greyNouns objectAtIndex:arc4random()%greyNouns.count]];
	} else if (redValue > greenValue && blueValue > redValue && redValue / blueValue < purpleRedBlueMaximumRatio && redValue / blueValue > purpleRedBlueMinimumRatio && blueValue - redValue < (redValue - greenValue) * 2.1f) { // purple
		
		NSMutableArray *purpleNouns = [NSMutableArray arrayWithArray:@[@"Purple", @"Violet"]];
		
		// very bright
		if (overallBrightness > ultraBrightThreshold) {
			if (SHOW_LOGS) {
				NSLog(@"\"Bright Purple!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
			}
			[purpleNouns addObjectsFromArray:@[]];
		} else if (overallBrightness < darkThreshold) { // very dark
			if (SHOW_LOGS) {
				NSLog(@"\"Dark Purple!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
			}
			[purpleNouns addObjectsFromArray:@[@"Amethyst"]];
		} else if (overallBrightness < veryBrightThreshold) { // medium
			if (SHOW_LOGS) {
				NSLog(@"\"Medium Purple!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
			}
			[purpleNouns addObjectsFromArray:@[@"Indigo"]];
		} else { // kind of light
			if (SHOW_LOGS) {
				NSLog(@"\"Lightish Purple!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
			}
			purpleNouns = [NSMutableArray arrayWithArray:@[@"Magenta", @"Fucshia"]];
		}
		
		[randomName appendFormat:@"%@", [purpleNouns objectAtIndex:arc4random()%purpleNouns.count]];
	} else if (redValue > pinkRedMinimum && redValue > blueValue && blueValue > greenValue && overallBrightness > pinkMinimumBrightness && redValue / blueValue > pinkRedBlueMinimumRatio && redValue / blueValue < pinkRedBlueMaximumRatio) { // pink
		
		NSMutableArray *pinkNouns = [NSMutableArray arrayWithArray:@[@"Pink"]];
		
		if (greenValue > pinkGreenMinimum) {
			if (SHOW_LOGS) {
				NSLog(@"\"Light Pink!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
			}
			[pinkNouns addObjectsFromArray:@[@"Rose", @"Rosé"]];
		} else {
			if (SHOW_LOGS) {
				NSLog(@"\"Dark Pink!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
			}
			[pinkNouns addObjectsFromArray:@[@"Secret", @"Lipstick"]];
		}
		
		[randomName appendFormat:@"%@", [pinkNouns objectAtIndex:arc4random()%pinkNouns.count]];
	} else if (redValue - blueValue < similarThreshold && blueValue - redValue < similarThreshold && redValue - greenValue > differenceThreshold && blueValue - greenValue > differenceThreshold) { // purple color
		
		NSMutableArray *purpleNouns = [NSMutableArray arrayWithArray:@[@"Purple"]];
		
		if (redValue > pinkRedMinimum && redValue / blueValue > pinkRedBlueMinimumRatio && redValue / blueValue < pinkRedBlueMaximumRatio) {
			if (SHOW_LOGS) {
				NSLog(@"\"Pinkish Purple\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
			}
			[purpleNouns addObjectsFromArray:@[@"Violet"]];
		} else if (blueValue / redValue < differenceRatio) {
			if (SHOW_LOGS) {
				NSLog(@"\"Purplish\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
			}
			[purpleNouns addObjectsFromArray:@[@"Violet"]];
		} else {
			if (SHOW_LOGS) {
				NSLog(@"\"Maybe Magenta\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
			}
			[purpleNouns addObjectsFromArray:@[@"Magenta"]];
		}
		
		[randomName appendFormat:@"%@", [purpleNouns objectAtIndex:arc4random()%purpleNouns.count]];
	} else if (greenValue > orangeGreenMinimum && greenValue < orangeGreenMaxium && greenValue / blueValue > orangeGreenBlueMinimumRatio && redValue > orangeRedMinimum && redValue / greenValue > orangeRedGreenMinimumRatio) { // orange Color
		
		NSMutableArray *orangeNouns = [NSMutableArray arrayWithArray:@[@"Orange"]];
		
		if (overallBrightness > brightThreshold) {
			if (SHOW_LOGS) {
				NSLog(@"\"Orange!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
			}
			[orangeNouns addObjectsFromArray:@[@"Tangerine", @"Orange Slice"]];
			
			if (overallBrightness > ultraBrightThreshold) {
				[orangeNouns addObjectsFromArray:@[@"Creamsicle"]];
			}
		} else {
			if (SHOW_LOGS) {
				NSLog(@"\"Orange!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
			}
			[orangeNouns addObjectsFromArray:@[@"Burnt Orange"]];
		}
		
		[randomName appendFormat:@"%@", [orangeNouns objectAtIndex:arc4random()%orangeNouns.count]];
	} else if (redValue - greenValue > redDifferenceThreshold && redValue - blueValue > redDifferenceThreshold) { // red color
		
		NSMutableArray *redNouns = [NSMutableArray arrayWithArray:@[@"Cardinal", @"Rose", @"Pomegranate", @"Apple", @"Red"]];
		
		if (overallBrightness > brightThreshold) {
			[redNouns addObjectsFromArray:@[@"Salmon", @"Coral", @"Raspberry"]];
		} else if (overallBrightness < darkThreshold) {
			[redNouns addObjectsFromArray:@[@"Burgandy"]];
		}
		
		[randomName appendFormat:@"%@", [redNouns objectAtIndex:arc4random()%redNouns.count]];
	} else if (redValue / greenValue < brownRedGreenMaxiumRatio && redValue / greenValue > brownRedGreenMinimumRatio && blueValue < greenValue && blueValue < redValue) { // brown color
		
		NSMutableArray *brownNouns = [NSMutableArray arrayWithArray:@[@"Brown", @"Dirt", @"Wood", @"Tree", @"Log", @"Vine", @"Root"]];
		
		if (overallBrightness > brightThreshold) {
			if (SHOW_LOGS) {
				NSLog(@"\"Light Brown!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
			}
			[brownNouns addObjectsFromArray:@[@"Dust"]];
		} else {
			if (SHOW_LOGS) {
				NSLog(@"\"Dark Brown!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
			}
			[brownNouns addObjectsFromArray:@[@"Leather"]];
		}
		
		[randomName appendFormat:@"%@", [brownNouns objectAtIndex:arc4random()%brownNouns.count]];
	} else if ((redValue > yellowRedMinimum && greenValue > yellowGreenMinimum && redValue / greenValue > yellowRedGreenMinimumRatio && redValue / greenValue < yellowRedGreenMaximumRatio && greenValue / blueValue > yellowGreenBlueMinimumRatio) || (redValue > yellowGreenRedMinimumNoBlue && greenValue > yellowGreenRedMinimumNoBlue && redValue > blueValue && greenValue > blueValue)) { // yellow Color
		
		NSMutableArray *yellowNouns = [NSMutableArray arrayWithArray:@[@"Sunshine", @"Yellow", @"Lemon", @"Grapefruit", @"Chiffon"]];
		
		if (SHOW_LOGS) {
			NSLog(@"\"Yellow!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
		}
		
		[randomName appendFormat:@"%@", [yellowNouns objectAtIndex:arc4random()%yellowNouns.count]];
	} else if (greenValue - redValue > differenceThreshold && greenValue - blueValue > differenceThreshold) { // green color
		
		NSMutableArray *greenNouns = [NSMutableArray arrayWithArray:@[@"Forest", @"Green", @"Moss", @"Frog", @"Lime"]];
		
		if (overallBrightness > ultraBrightThreshold) {
			[greenNouns addObjectsFromArray:@[@"Mint"]];
		}
		
		if (overallBrightness > brightThreshold) {
			[greenNouns addObjectsFromArray:@[@"Green Apple", @"Sour Apple", @"Watermelon", @"Pear"]];
		} else if (overallBrightness < darkThreshold) {
			[greenNouns addObjectsFromArray:@[@"Amazon"]];
		}
		
		[randomName appendFormat:@"%@", [greenNouns objectAtIndex:arc4random()%greenNouns.count]];
	} else if (blueValue / redValue > blueBlueRedMinimumRatio && blueValue / greenValue > blueBlueGreenMinimumRatio) { // blue color
		
		NSMutableArray *blueNouns = [NSMutableArray arrayWithArray:@[@"Ocean", @"River", @"Lake", @"Pond", @"Puddle", @"Sky", @"Denim"]];
		
		if (overallBrightness > veryBrightThreshold) {
			[blueNouns addObjectsFromArray:@[@"Crystal", @"Icicle"]];
		} else if (overallBrightness < darkThreshold) {
			[blueNouns addObjectsFromArray:@[@"Sea", @"Sapphire"]];
		}
		
		[randomName appendFormat:@"%@", [blueNouns objectAtIndex:arc4random()%blueNouns.count]];
		
		if (arc4random()%5 == 1) {
			[randomName appendString:@" Blue"];
		}
	} else if (overallBrightness > veryBrightThreshold && blueValue - greenValue < similarThreshold && greenValue - blueValue < similarThreshold && blueValue - redValue > differenceThreshold && greenValue - redValue > differenceThreshold) { // cyan
		
		NSMutableArray *cyanNouns = [NSMutableArray arrayWithArray:@[@"Cyan", @"Stream", @"Sky", @"Pool", @"Waters", @"Reef", @"Water", @"Tide"]];
		
		if (SHOW_LOGS) {
			NSLog(@"\"Cyan!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
		}
		
		[randomName appendFormat:@"%@", [cyanNouns objectAtIndex:arc4random()%cyanNouns.count]];
	} else if (redValue - greenValue < similarThreshold && greenValue - redValue < similarThreshold && redValue - blueValue > differenceThreshold && greenValue - blueValue > differenceThreshold) { // yellow, orange, brown, or a pea soup green...this needs to be refined
		if (overallBrightness > veryBrightThreshold) {
			
			// yellow green
			if (greenValue - greyVariation/3.0f > redValue) {
				if (SHOW_LOGS) {
					NSLog(@"\"Maybe Yellow-Green?\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
				}
				[randomName appendFormat:@"%@", [NKFColor randomColorName]];
			} else {
				// pretty sure it's yellow
				if (redValue + greyVariation > yellowRedMinimum && greenValue + greyVariation > yellowGreenMinimum) {
					
					NSMutableArray *maybeYellowNouns = [NSMutableArray arrayWithArray:@[@"Burnt Lemon", @"Sunset"]];
					
					if (overallBrightness < brightThreshold) {
						[maybeYellowNouns addObjectsFromArray:@[@"Wheat", @"Sand"]];
					}
					
					if (SHOW_LOGS) {
						NSLog(@"\"Maybe Yellow?\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
					}
					
					[randomName appendFormat:@"%@", [maybeYellowNouns objectAtIndex:arc4random()%maybeYellowNouns.count]];
				} else { // the "sage" family of colors
					NSMutableArray *sageNouns = [NSMutableArray arrayWithArray:@[@"Sage", @"Oregano", @"Thyme", @"Brush", @"Cactus", @"Street Car"]];
					
					if (SHOW_LOGS) {
						NSLog(@"\"Sage Family?\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
					}
					
					[randomName appendFormat:@"%@", [sageNouns objectAtIndex:arc4random()%sageNouns.count]];
				}
			}
		} else if (greenValue > redValue && greenValue > blueValue && greenValue > darkThreshold) {
			if (SHOW_LOGS) {
				NSLog(@"\"Maybe Pea Soup?\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
			}
			[randomName appendFormat:@"%@", [NKFColor randomColorName]];
		} else if (overallBrightness < brightThreshold && overallBrightness > darkThreshold) {
			if (SHOW_LOGS) {
				NSLog(@"\"Maybe Murky?\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
			}
			[randomName appendFormat:@"%@", [NKFColor randomColorName]];
		} else if (overallBrightness < darkThreshold) {
			if (redValue / greenValue < brownRedGreenMinimumRatio) {
				if (SHOW_LOGS) {
					NSLog(@"\"Probably not Brown\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
				}
				[randomName appendFormat:@"%@", [NKFColor randomColorName]];
			} else {
				if (SHOW_LOGS) {
					NSLog(@"\"Maybe Brown?\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
				}
				[randomName appendFormat:@"%@", [NKFColor randomColorName]];
			}
		} else {
			if (SHOW_LOGS) {
				NSLog(@"\"Maybe Not Yellow, Orange, Brown, or Pea Soup?\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
			}
			[randomName appendFormat:@"%@", [NKFColor randomColorName]];
		}
	} else if (blueValue > greenValue && greenValue > redValue && blueValue / greenValue < steelBlueGreenRatio && greenValue / redValue < steelGreenRedRatio && overallBrightness > steelMinimumBrightness && overallBrightness < steelMaximumBrightness && blueValue / (greenValue + 0.01f) > greenValue / (redValue + 0.01f)) { // steel
		if (SHOW_LOGS) {
			NSLog(@"\"Steel?\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
		}
		[randomName appendFormat:@"%@", [NKFColor randomColorName]];
	} else if (redValue > greenValue && greenValue > blueValue && (redValue - greenValue) * 3.465f > greenValue - blueValue && (greenValue - blueValue) * 3.81f > redValue - greenValue && overallBrightness < veryBrightThreshold) { // brown check 2
		if (SHOW_LOGS) {
			NSLog(@"\"Brown2?\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
		}
		
		NSMutableArray *brownNouns = [NSMutableArray arrayWithArray:@[@"Brown", @"Dirt", @"Wood", @"Tree", @"Log", @"Vine", @"Root"]];
		
		if (overallBrightness > brightThreshold) {
			if (SHOW_LOGS) {
				NSLog(@"\"Light Brown!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
			}
			[brownNouns addObjectsFromArray:@[@"Dust"]];
		} else {
			if (SHOW_LOGS) {
				NSLog(@"\"Dark Brown!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
			}
			[brownNouns addObjectsFromArray:@[@"Leather"]];
		}
		
		[randomName appendFormat:@"%@", [brownNouns objectAtIndex:arc4random()%brownNouns.count]];
	} else {
		if (SHOW_LOGS) {
			NSLog(@"Couldn't come up with a name\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
		}
		return [NKFColor randomColorName];
	}
	
	if (randomName.length > 20) {
		if (SHOW_LOGS) {
			NSLog(@"Couldn't come up with a shorter name than \"%@\"\t\tr: %f\tg: %f\tb:%f", randomName, redValue, greenValue, blueValue);
		}
		return [NKFColor randomColorName];
	}
	
	if (randomName.length > 2) {
		if (SHOW_LOGS) {
			NSLog(@"\"%@\"\tr: %f\tg: %f\tb:%f", randomName, redValue, greenValue, blueValue);
		}
		
		return [randomName portmonteau];
	}
	
	if (SHOW_LOGS) {
		NSLog(@"Color name is not long enough \"%@\"", randomName);
	}
	
	return [NKFColor randomColorName];
}


#pragma mark - Hex Values

- (NSString *)hexValue {
    CGFloat redValue, greenValue, blueValue, alphaValue;
    [self getRed:&redValue
           green:&greenValue
            blue:&blueValue
           alpha:&alphaValue];
	
	int redInt = redValue * 255.0f;
	int greenInt = greenValue * 255.0f;
	int blueInt = blueValue * 255.0f;
	
	NSString *hexString = [NSString stringWithFormat:@"#%02x%02x%02x", redInt, greenInt, blueInt];
	if (!hexString) {
		NSLog(@"What is wrong here?");
	}
	return [hexString uppercaseString];
}

+ (NSString *)hexValue:(NKFColor *)color {
	return [color hexValue];
}

#pragma mark - Opposite Text Color

- (NKFColor *)oppositeTextColor {
    CGFloat red, green, blue, alpha;
    [self getRed:&red
           green:&green
            blue:&blue
           alpha:&alpha];
	
	float totalBrightnessCoefficient = (2.0f - red - green)*(2.0f - green - blue)*(2.0f - red - blue);
	if ((green > 0.8f && red + blue < 0.05f)) {
		totalBrightnessCoefficient *= 1.0f - green;
	} else {
		totalBrightnessCoefficient *= 1.0f - green - ((0.8f - green)*(0.8f - green)*(0.8f - green));
	}
	
	float maxColorRange = 255.0f;
	totalBrightnessCoefficient *= totalBrightnessCoefficient;
	float redTextColor = red*maxColorRange-maxColorRange/2.0f;
	redTextColor = (float)fabsf(redTextColor);
	redTextColor /= maxColorRange/2.0f;
	redTextColor *= totalBrightnessCoefficient;
	float blueTextColor = blue*maxColorRange-maxColorRange/2.0f;
	blueTextColor = (float)fabsf(blueTextColor);
	blueTextColor /= maxColorRange/2.0f;
	blueTextColor *= totalBrightnessCoefficient;
	float greenTextColor = green*maxColorRange-maxColorRange/2.0f;
	greenTextColor = (float)fabsf(greenTextColor);
	greenTextColor /= maxColorRange/2.0f;
	greenTextColor *= totalBrightnessCoefficient;
	
	float similarityThreshold = 0.1f;
	while (redTextColor - red >= -similarityThreshold && redTextColor - red < similarityThreshold &&
		   greenTextColor - green >= -similarityThreshold && greenTextColor - green < similarityThreshold &&
		   blueTextColor - blue >= -similarityThreshold && blueTextColor - blue < similarityThreshold) {
		redTextColor += similarityThreshold/10.0f;
		greenTextColor += similarityThreshold/10.0f;
		blueTextColor += similarityThreshold/10.0f;
		similarityThreshold /= 1.1f;
		//        NSLog(@"r: %f:%f\t\tg: %f:%f\t\tb: %f:%f", red, redTextColor, green, greenTextColor, blue, blueTextColor);
	}
	
	NKFColor *textColor = [NKFColor colorWithRed:redTextColor
										   green:greenTextColor
											blue:blueTextColor
										   alpha:1.0f];
	
	return textColor;
}

+ (NKFColor *)oppositeTextColor:(NKFColor *)color {
	return [color oppositeTextColor];
}

- (NKFColor *)oppositeBlackOrWhite {
	return [self oppositeBlackOrWhite:0.667f];
}

+ (NKFColor *)oppositeBlackOrWhite:(NKFColor *)color {
	return [color oppositeBlackOrWhite];
}

- (NKFColor *)oppositeBlackOrWhite:(float)weighting {
    CGFloat hue, saturation, brightness, alpha;
    [self getHue:&hue
      saturation:&saturation
      brightness:&brightness
           alpha:&alpha];
	
	if (brightness > weighting) {
		return [NKFColor colorWithWhite:0.0f alpha:1.0f];
	}
	
	return [NKFColor colorWithWhite:1.0f alpha:0.0f];
}

+ (NKFColor *)oppositeBlackOrWhite:(NKFColor *)color weighting:(float)weighting {
	return [color oppositeBlackOrWhite:weighting];
}

- (BOOL)isDark {
	return ![self isLighterThan:0.667f];
}

+ (BOOL)colorIsDark:(NKFColor *)color {
	return [color isDark];
}

- (BOOL)isLight {
	return [self isLighterThan:0.667f];
}

+ (BOOL)colorIsLight:(NKFColor *)color {
	return [color isLight];
}

- (BOOL)isLighterThan:(float)threshold {
    CGFloat hue, saturation, brightness, alpha;
    [self getHue:&hue
      saturation:&saturation
      brightness:&brightness
           alpha:&alpha];
	
	return (brightness > threshold);
}

+ (BOOL)color:(NKFColor *)color isLighterThan:(float)threshold {
	return [color isLighterThan:threshold];
}

+ (NKFColor *)colorWithHexString:(NSString *)hexString {
	unsigned rgbValue = 0;
	NSScanner *scanner = [NSScanner scannerWithString:hexString];
	[scanner setScanLocation:1]; // bypass '#' character
	[scanner scanHexInt:&rgbValue];
	
	return [NKFColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}



// these are method names inherited by UIColor, mostly from NSObject
// while NKFColor will respond to methods with these names, they will not necessarily return a valid object
// checking for these words before finding a selector with these names prevents a multitude of unexpected behavior
+ (NSArray *)bannedWords {
    return @[@"new",
			 @"description",
			 @"init",
			 @"initialize",
			 @"alloc",
			 @"dealloc",
			 @"copy",
			 @"mutable",
			 @"selector",
			 @"invocation",
			 @"method",
			 @"reference",
			 @"hash",
			 @"class",
			 @"load",
			 @"initialize",
			 @"init",
			 @"new",
			 @"allocWithZone",
			 @"alloc",
			 @"dealloc",
			 @"finalize",
			 @"copy",
			 @"mutableCopy",
			 @"copyWithZone",
			 @"mutableCopyWithZone",
			 @"instancesRespondToSelector",
			 @"conformsToProtocol",
			 @"methodForSelector",
			 @"instanceMethodForSelector",
			 @"doesNotRecognizeSelector",
			 @"forwardingTargetForSelector",
			 @"forwardInvocation",
			 @"methodSignatureForSelector",
			 @"instanceMethodSignatureForSelector",
			 @"allowsWeakReference",
			 @"retainWeakReference",
			 @"isSubclassOfClass",
			 @"resolveClassMethod",
			 @"resolveInstanceMethod",
			 @"hash",
			 @"superclass",
			 @"class",
			 @"description",
			 @"debugDescription",
			 @"set",
			 @"setFill",
			 @"setStroke",
			 @"getWhite",
			 @"getHue",
			 @"getRed",
			 @"CGColor",
			 @"CIColor",
			 @"initWithColor"];
}




@end
