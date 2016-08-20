//
//  UIColor+AppColors.m
//  Simon Says
//
//  Created by Developer Nathan on 12/14/14.
//  Copyright (c) 2014 Nathan Fennel. All rights reserved.
//

#import "UIColor+AppColors.h"
#import "NSString+AppFunctions.h"

#define SHOW_LOGS NO
#define DESELECTED_BRIGHTNESS 0.4f
#define SELECTED_BRIGHTNESS 0.75f

@implementation UIColor (AppColors)

+ (UIColor *)appColor {
    UIColor *specialTintColor = [self specialTintColor];
    if (specialTintColor) return specialTintColor;
    
    return [UIColor colorWithRed:0.0f/255.0f green:71.0f/255.0f blue:127.0f/255.0f alpha:0.97f];
}

+ (UIColor *)appColor1 {
    return [UIColor colorWithRed:0.0f/255.0f green:36.0f/255.0f blue:63.0f/255.0f alpha:0.97f];
}

+ (UIColor *)appColor2 {
    return [UIColor colorWithRed:0.0f/255.0f green:71.0f/255.0f blue:127.0f/255.0f alpha:0.97f];
}

+ (UIColor *)appColor3 {
    return [UIColor colorWithRed:122.0f/255.0f green:164.0f/255.0f blue:192.0f/255.0f alpha:0.97f];
}

+ (UIColor *)appColor4 {
    return [UIColor colorWithRed:232.0f/255.0f green:190.0f/255.0f blue:48.0f/255.0f alpha:0.97f];
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

+ (UIColor *)redAppColor {
    UIColor *specialTintColor = [self specialTintColor];
    if (specialTintColor) return specialTintColor;
    
    return [UIColor venetianRed];
}

+ (UIColor *)specialTintColor {
    NSCalendar *gregorianCal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComps = [gregorianCal components: (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour)
                                                  fromDate: [NSDate date]];
    
    NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
    NSNumber *easterMonth = [defaults objectForKey:[NSString stringWithFormat:@"Month Of Easter In Year %ld", (long)[dateComps year]]];
    NSNumber *easterDay = [defaults objectForKey:[NSString stringWithFormat:@"Day Of Easter In Year %ld", (long)[dateComps year]]];
    
    // St. Patrick's Day
    if ([dateComps month] == 3 && [dateComps day] == 17) {
        return [UIColor greenPantone];
    }
    
    // Easter
    else if (([dateComps month] == 3 || [dateComps month] == 4) && easterMonth && [dateComps month] == [easterMonth intValue] && easterDay && [dateComps day] == [easterDay intValue]) {
        return [UIColor heliotrope];
    }
    
    // 4th Of July
    else if ([dateComps month] == 7 && [dateComps day] == 4) {
        return [UIColor navy];
    }
    
    // Halloween
    else if ([dateComps month] == 10 && [dateComps day] >= 30) {
        return [UIColor safetyOrange];
    }
    
    // Christmas
    else if ([dateComps month] == 12 && [dateComps day] >= 20 && [dateComps day] <= 25) {
        return [UIColor forestGreenWeb];
    }
    
    // New Year's Eve
    else if (([dateComps month] == 12 && [dateComps day] == 31) || ([dateComps month] == 1 && [dateComps day] == 1 && [dateComps hour] < 6)) {
        return [UIColor schoolBusYellow];
    }
    
    return nil;
}

#pragma mark - modify colors

- (UIColor *)lightenColor {
    return [self lightenColorBy:0.5f];
}

- (UIColor *)lightenColorBy:(float)lightenAmount {
    CGFloat redValue;
    CGFloat greenValue;
    CGFloat blueValue;
    CGFloat alphaValue;
    
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
    
    UIColor *tempColor = [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0f];
    
    return tempColor;
}

- (UIColor *)darkenColor {
    return [self darkenColorBy:0.5f];
}

- (UIColor *)darkenColorBy:(float)darkenAmount {
    CGFloat redValue;
    CGFloat greenValue;
    CGFloat blueValue;
    CGFloat alphaValue;
    
    [self getRed:&redValue
           green:&greenValue
            blue:&blueValue
           alpha:&alphaValue];
    
    redValue *= darkenAmount;
    greenValue *= darkenAmount;
    blueValue *= darkenAmount;
    
    UIColor *tempColor = [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0f];
    
    return tempColor;
}

- (UIColor *)makeBrightnessOf:(float)brightness {
    CGFloat redValue;
    CGFloat greenValue;
    CGFloat blueValue;
    CGFloat alphaValue;
    
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
            return [UIColor colorWithRed:redValue * 0.03f green:greenValue * 0.03f blue:blueValue * 0.03f alpha:1.0f];
        }
        
        while (overallBrightness > brightness) {
            redValue *= 0.99f;
            greenValue *= 0.99f;
            blueValue *= 0.99f;
            overallBrightness = (redValue + greenValue + blueValue) / 3.0f;
        }
    }
    
    else if (overallBrightness < brightness) {
        if (brightness > 0.99f) {
            return [UIColor colorWithRed:brightness green:brightness blue:brightness alpha:1.0f];
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
                    }
                    
                    else if (greenValue > 0.01f && greenValue < 1.0f && blueValue < 0.01f) {
                        greenValue += redOverflow;
                    }
                    
                    else if (greenValue > 0.01f && blueValue > 0.01f) {
                        greenValue += redOverflow * (greenValue / (greenValue + blueValue));
                        blueValue += redOverflow * (blueValue / (greenValue + blueValue));
                    }
                    
                    else {
                        greenValue += redOverflow / 2.0f;
                        blueValue += redOverflow / 2.0f;
                    }
                }
                
                if (greenValue > 1.0f) {
                    float greenOverflow = (float)((int)(greenValue * 1000)%1000)/1000.0f;
                    greenValue = 1.0f;
                    
                    if (redValue < 0.01f && blueValue > 0.01f && blueValue < 1.0f) {
                        blueValue += greenOverflow;
                    }
                    
                    else if (redValue > 0.01f && redValue < 1.0f && blueValue < 0.01f) {
                        redValue += greenOverflow;
                    }
                    
                    else if (redValue > 0.01f && blueValue > 0.01f) {
                        redValue += greenOverflow * (redValue / (redValue + blueValue));
                        blueValue += greenOverflow * (blueValue / (redValue + blueValue));
                    }
                    
                    else {
                        redValue += greenOverflow / 2.0f;
                        blueValue += greenOverflow / 2.0f;
                    }
                }
                
                if (blueValue > 1.0f) {
                    float blueOverflow = (float)((int)(blueValue * 1000)%1000)/1000.0f;
                    blueValue = 1.0f;
                    
                    if (redValue < 0.01f && greenValue > 0.01f && greenValue < 1.0f) {
                        greenValue += blueOverflow;
                    }
                    
                    else if (redValue > 0.01f && redValue < 1.0f && greenValue < 0.01f) {
                        redValue += blueOverflow;
                    }
                    
                    else if (redValue > 0.01f && greenValue > 0.01f) {
                        redValue += blueOverflow * (redValue / (redValue + greenValue));
                        greenValue += blueOverflow * (greenValue / (redValue + greenValue));
                    }
                    
                    else {
                        redValue += blueOverflow/2.0f;
                        greenValue += blueOverflow/2.0f;
                    }
                }
            }
            
            overallBrightness = (redValue + greenValue + blueValue) / 3.0f;
        }
    }
    
    return [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0f];
}

#pragma mark - random colors

+ (UIColor *)randomPastelColor {
    float randomBrightness = (9500.0f - (arc4random()%1000)) / 10000.0f;
    return [[UIColor randomDarkColor] makeBrightnessOf:randomBrightness];
}

+ (UIColor *)randomDarkColor {
    [UIColor colorWithRed:arc4random()%50/255.0f + 10.0f green:arc4random()%50/255.0f + 10.0f blue:arc4random()%50/255.0f + 10.0f alpha:1.0f];
    return [UIColor colorWithHue:arc4random()%255/255.0f saturation:(arc4random()%200 + 55)/255.0f brightness:((arc4random()%200) + 55.0f)/555.0f alpha:1.0f];
}

+ (UIColor *)randomColor {
    NSArray *allColors = [UIColor allColorsArray];
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
        return [UIColor randomColorName];
    }
    
    return name;
}

+ (NSString *)randomColorNameWithColor:(UIColor *)color {
    return [color randomColorName];
}

+ (UIColor *)randomDarkColorFromString:(NSString *)string {
    if (string.length == 0) {
        return [UIColor black];
    }
    
    NSDictionary *whiteList = @{@"Player 2" : [UIColor darkRed],
                                @"Player 3" : [UIColor darkGreen],
                                @"Player 4" : [UIColor gray],
                                @"Player 5" : [UIColor purpleNavy],
                                @"Player 6" : [UIColor orangeCrayola],
                                @"Player 7" : [UIColor lightCoral],
                                @"Player 8" : [UIColor seashell],
                                @"Player 9" : [UIColor darkBlue],
                                @"Girl" : [UIColor carmine],
                                @"Boy" : [UIColor denim],
                                @"Women" : [UIColor carmine],
                                @"Men" : [UIColor denim],
                                @"Nathan" : [UIColor royalBlue],
                                @"Paul" : [UIColor darkGreenX11],
                                @"Katie" : [UIColor etonBlue],
                                @"Ryan" : [UIColor orangePeel],
                                @"Promise" : [UIColor hotPink],
                                @"Janelle" : [UIColor rose]
                                };
    for (NSString *key in [whiteList allKeys]) {
        if ([[string lowercaseString] isEqualToString:[key lowercaseString]]) {
            return [[[whiteList objectForKey:key] makeBrightnessOf:SELECTED_BRIGHTNESS] makeBrightnessOf:DESELECTED_BRIGHTNESS];
        }
    }

    for (NSString *key in [whiteList allKeys]) {
        if ([[string lowercaseString] rangeOfString:[key lowercaseString]].location != NSNotFound) {
            return [[whiteList objectForKey:key] makeBrightnessOf:DESELECTED_BRIGHTNESS];
        }
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
    
    redValueInt %= 30;
    greenValueInt %= 40;
    blueValueInt %= 50;
    
    redValueInt += 30;
    greenValueInt += 45;
    blueValueInt += 40;
    
    float redValue = (float)redValueInt/180.0f;
    float greenValue = (float)greenValueInt/255.0f;
    float blueValue = (float)blueValueInt/270.0f;
    
    return [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0f];
}

- (NSString *)randomColorName {
    NSMutableString *randomName = [[NSMutableString alloc] init];
    
    CGFloat redValue;
    CGFloat greenValue;
    CGFloat blueValue;
    CGFloat alphaValue;
    
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
    }
    
    else if (overallBrightness < darkThreshold) {
        NSArray *darkAdjectives = @[@"Dark", @"Deep", @"Rich", @"Evening", @"Luscious", @"Savory", @"Midnight", @"Somber", @"Twilight", @"Space", @"Sad"];
        [randomName appendFormat:@"%@ ", [darkAdjectives objectAtIndex:arc4random()%darkAdjectives.count]];
    }
    
    else {
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
        }
        
        // blue grey
        else if (blueValue > greenValue && blueValue > redValue) {
            if (SHOW_LOGS) {
                NSLog(@"\"Blue Grey?\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
            }
            [greyNouns addObjectsFromArray:@[]];
        }
        
        // red grey
        else if (redValue > greenValue && redValue > blueValue) {
            if (SHOW_LOGS) {
                NSLog(@"\"Red Grey?\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
            }
            [greyNouns addObjectsFromArray:@[@"Sandstone"]];
        }
        
        // green grey
        else if (greenValue > redValue && greenValue > blueValue) {
            if (SHOW_LOGS) {
                NSLog(@"\"Green Grey?\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
            }
            [greyNouns addObjectsFromArray:@[]];
        }
        
        // totally even grey
        else {
            if (SHOW_LOGS) {
                NSLog(@"\"Totally even Grey.\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
            }
            greyNouns = [NSMutableArray arrayWithArray:@[@"Grey", @"Gray"]];
        }
        
        [randomName appendFormat:@"%@", [greyNouns objectAtIndex:arc4random()%greyNouns.count]];
    }
    
    // purple
    else if (redValue > greenValue && blueValue > redValue && redValue / blueValue < purpleRedBlueMaximumRatio && redValue / blueValue > purpleRedBlueMinimumRatio && blueValue - redValue < (redValue - greenValue) * 2.1f) {
        
        NSMutableArray *purpleNouns = [NSMutableArray arrayWithArray:@[@"Purple", @"Violet"]];
        
        // very bright
        if (overallBrightness > ultraBrightThreshold) {
            if (SHOW_LOGS) {
                NSLog(@"\"Bright Purple!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
            }
            [purpleNouns addObjectsFromArray:@[]];
        }
        
        // very dark
        else if (overallBrightness < darkThreshold) {
            if (SHOW_LOGS) {
                NSLog(@"\"Dark Purple!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
            }
            [purpleNouns addObjectsFromArray:@[@"Amethyst"]];
        }
        
        // medium
        else if (overallBrightness < veryBrightThreshold) {
            if (SHOW_LOGS) {
                NSLog(@"\"Medium Purple!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
            }
            [purpleNouns addObjectsFromArray:@[@"Indigo"]];
        }
        
        // kind of light
        else {
            if (SHOW_LOGS) {
                NSLog(@"\"Lightish Purple!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
            }
            purpleNouns = [NSMutableArray arrayWithArray:@[@"Magenta", @"Fucshia"]];
        }
        
        [randomName appendFormat:@"%@", [purpleNouns objectAtIndex:arc4random()%purpleNouns.count]];
    }
    
    // pink
    else if (redValue > pinkRedMinimum && redValue > blueValue && blueValue > greenValue && overallBrightness > pinkMinimumBrightness && redValue / blueValue > pinkRedBlueMinimumRatio && redValue / blueValue < pinkRedBlueMaximumRatio) {
        
        NSMutableArray *pinkNouns = [NSMutableArray arrayWithArray:@[@"Pink"]];
        
        if (greenValue > pinkGreenMinimum) {
            if (SHOW_LOGS) {
                NSLog(@"\"Light Pink!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
            }
            [pinkNouns addObjectsFromArray:@[@"Rose", @"Rosé"]];
        }
        
        else {
            if (SHOW_LOGS) {
                NSLog(@"\"Dark Pink!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
            }
            [pinkNouns addObjectsFromArray:@[@"Secret", @"Lipstick"]];
        }
        
        [randomName appendFormat:@"%@", [pinkNouns objectAtIndex:arc4random()%pinkNouns.count]];
    }
    
    // purple color
    else if (redValue - blueValue < similarThreshold && blueValue - redValue < similarThreshold && redValue - greenValue > differenceThreshold && blueValue - greenValue > differenceThreshold) {
        
        NSMutableArray *purpleNouns = [NSMutableArray arrayWithArray:@[@"Purple"]];
        
        if (redValue > pinkRedMinimum && redValue / blueValue > pinkRedBlueMinimumRatio && redValue / blueValue < pinkRedBlueMaximumRatio) {
            if (SHOW_LOGS) {
                NSLog(@"\"Pinkish Purple\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
            }
            [purpleNouns addObjectsFromArray:@[@"Violet"]];
        }
        
        else if (blueValue / redValue < differenceRatio) {
            if (SHOW_LOGS) {
                NSLog(@"\"Purplish\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
            }
            [purpleNouns addObjectsFromArray:@[@"Violet"]];
        }
        
        else {
            if (SHOW_LOGS) {
                NSLog(@"\"Maybe Magenta\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
            }
            [purpleNouns addObjectsFromArray:@[@"Magenta"]];
        }
        
        [randomName appendFormat:@"%@", [purpleNouns objectAtIndex:arc4random()%purpleNouns.count]];
    }
    
    // orange Color
    else if (greenValue > orangeGreenMinimum && greenValue < orangeGreenMaxium && greenValue / blueValue > orangeGreenBlueMinimumRatio && redValue > orangeRedMinimum && redValue / greenValue > orangeRedGreenMinimumRatio) {
        
        NSMutableArray *orangeNouns = [NSMutableArray arrayWithArray:@[@"Orange"]];
        
        if (overallBrightness > brightThreshold) {
            if (SHOW_LOGS) {
                NSLog(@"\"Orange!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
            }
            [orangeNouns addObjectsFromArray:@[@"Tangerine", @"Orange Slice"]];
            
            if (overallBrightness > ultraBrightThreshold) {
                [orangeNouns addObjectsFromArray:@[@"Creamsicle"]];
            }
        }
        
        else {
            if (SHOW_LOGS) {
                NSLog(@"\"Orange!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
            }
            [orangeNouns addObjectsFromArray:@[@"Burnt Orange"]];
        }
        
        [randomName appendFormat:@"%@", [orangeNouns objectAtIndex:arc4random()%orangeNouns.count]];
    }
    
    // red color
    else if (redValue - greenValue > redDifferenceThreshold && redValue - blueValue > redDifferenceThreshold) {
        
        NSMutableArray *redNouns = [NSMutableArray arrayWithArray:@[@"Cardinal", @"Rose", @"Pomegranate", @"Apple", @"Red"]];
        
        if (overallBrightness > brightThreshold) {
            [redNouns addObjectsFromArray:@[@"Salmon", @"Coral", @"Raspberry"]];
        }
        
        else if (overallBrightness < darkThreshold) {
            [redNouns addObjectsFromArray:@[@"Burgandy"]];
        }
        
        [randomName appendFormat:@"%@", [redNouns objectAtIndex:arc4random()%redNouns.count]];
    }
    
    // brown color
    else if (redValue / greenValue < brownRedGreenMaxiumRatio && redValue / greenValue > brownRedGreenMinimumRatio && blueValue < greenValue && blueValue < redValue) {
        
        NSMutableArray *brownNouns = [NSMutableArray arrayWithArray:@[@"Brown", @"Dirt", @"Wood", @"Tree", @"Log", @"Vine", @"Root"]];
        
        if (overallBrightness > brightThreshold) {
            if (SHOW_LOGS) {
                NSLog(@"\"Light Brown!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
            }
            [brownNouns addObjectsFromArray:@[@"Dust"]];
        }
        
        else {
            if (SHOW_LOGS) {
                NSLog(@"\"Dark Brown!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
            }
            [brownNouns addObjectsFromArray:@[@"Leather"]];
        }
        
        [randomName appendFormat:@"%@", [brownNouns objectAtIndex:arc4random()%brownNouns.count]];
    }
    
    // yellow Color
    else if ((redValue > yellowRedMinimum && greenValue > yellowGreenMinimum && redValue / greenValue > yellowRedGreenMinimumRatio && redValue / greenValue < yellowRedGreenMaximumRatio && greenValue / blueValue > yellowGreenBlueMinimumRatio) || (redValue > yellowGreenRedMinimumNoBlue && greenValue > yellowGreenRedMinimumNoBlue && redValue > blueValue && greenValue > blueValue)) {
        
        NSMutableArray *yellowNouns = [NSMutableArray arrayWithArray:@[@"Sunshine", @"Yellow", @"Lemon", @"Grapefruit", @"Chiffon"]];
        
        if (SHOW_LOGS) {
            NSLog(@"\"Yellow!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
        }
        
        [randomName appendFormat:@"%@", [yellowNouns objectAtIndex:arc4random()%yellowNouns.count]];
    }
    
    // green color
    else if (greenValue - redValue > differenceThreshold && greenValue - blueValue > differenceThreshold) {
        
        NSMutableArray *greenNouns = [NSMutableArray arrayWithArray:@[@"Forest", @"Green", @"Moss", @"Frog", @"Lime"]];
        
        if (overallBrightness > ultraBrightThreshold) {
            [greenNouns addObjectsFromArray:@[@"Mint"]];
        }
        
        if (overallBrightness > brightThreshold) {
            [greenNouns addObjectsFromArray:@[@"Green Apple", @"Sour Apple", @"Watermelon", @"Pear"]];
        }
        
        else if (overallBrightness < darkThreshold) {
            [greenNouns addObjectsFromArray:@[@"Amazon"]];
        }
        
        [randomName appendFormat:@"%@", [greenNouns objectAtIndex:arc4random()%greenNouns.count]];
    }
    
    // blue color
    else if (blueValue / redValue > blueBlueRedMinimumRatio && blueValue / greenValue > blueBlueGreenMinimumRatio) {
        
        NSMutableArray *blueNouns = [NSMutableArray arrayWithArray:@[@"Ocean", @"River", @"Lake", @"Pond", @"Puddle", @"Sky", @"Denim"]];
        
        if (overallBrightness > veryBrightThreshold) {
            [blueNouns addObjectsFromArray:@[@"Crystal", @"Icicle"]];
        }
        
        else if (overallBrightness < darkThreshold) {
            [blueNouns addObjectsFromArray:@[@"Sea", @"Sapphire"]];
        }
        
        [randomName appendFormat:@"%@", [blueNouns objectAtIndex:arc4random()%blueNouns.count]];
        
        if (arc4random()%5 == 1) {
            [randomName appendString:@" Blue"];
        }
    }
    
    // cyan
    else if (overallBrightness > veryBrightThreshold && blueValue - greenValue < similarThreshold && greenValue - blueValue < similarThreshold && blueValue - redValue > differenceThreshold && greenValue - redValue > differenceThreshold) {
        
        NSMutableArray *cyanNouns = [NSMutableArray arrayWithArray:@[@"Cyan", @"Stream", @"Sky", @"Pool", @"Waters", @"Reef", @"Water", @"Tide"]];
        
        if (SHOW_LOGS) {
            NSLog(@"\"Cyan!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
        }

        [randomName appendFormat:@"%@", [cyanNouns objectAtIndex:arc4random()%cyanNouns.count]];
    }
    
    // yellow, orange, brown, or a pea soup green...this needs to be refined
    else if (redValue - greenValue < similarThreshold && greenValue - redValue < similarThreshold && redValue - blueValue > differenceThreshold && greenValue - blueValue > differenceThreshold) {
        if (overallBrightness > veryBrightThreshold) {
            
            // yellow green
            if (greenValue - greyVariation/3.0f > redValue) {
                if (SHOW_LOGS) {
                    NSLog(@"\"Maybe Yellow-Green?\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
                }
                [randomName appendFormat:@"%@", [UIColor randomColorName]];
            }
            
            else {
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
                }
                
                // the "sage" family of colors
                else {
                    NSMutableArray *sageNouns = [NSMutableArray arrayWithArray:@[@"Sage", @"Oregano", @"Thyme", @"Brush", @"Cactus", @"Street Car"]];
                    
                    if (SHOW_LOGS) {
                        NSLog(@"\"Sage Family?\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
                    }
                    
                    [randomName appendFormat:@"%@", [sageNouns objectAtIndex:arc4random()%sageNouns.count]];
                }
            }
        }
        
        else if (greenValue > redValue && greenValue > blueValue && greenValue > darkThreshold) {
            if (SHOW_LOGS) {
                NSLog(@"\"Maybe Pea Soup?\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
            }
            [randomName appendFormat:@"%@", [UIColor randomColorName]];
        }
        
        else if (overallBrightness < brightThreshold && overallBrightness > darkThreshold) {
            if (SHOW_LOGS) {
                NSLog(@"\"Maybe Murky?\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
            }
            [randomName appendFormat:@"%@", [UIColor randomColorName]];
        }
        
        else if (overallBrightness < darkThreshold) {
            if (redValue / greenValue < brownRedGreenMinimumRatio) {
                if (SHOW_LOGS) {
                    NSLog(@"\"Probably not Brown\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
                }
                [randomName appendFormat:@"%@", [UIColor randomColorName]];
            }
            
            else {
                if (SHOW_LOGS) {
                    NSLog(@"\"Maybe Brown?\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
                }
                [randomName appendFormat:@"%@", [UIColor randomColorName]];
            }
        }
        
        else {
            if (SHOW_LOGS) {
                NSLog(@"\"Maybe Not Yellow, Orange, Brown, or Pea Soup?\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
            }
            [randomName appendFormat:@"%@", [UIColor randomColorName]];
        }
    }
    
    // steel
    else if (blueValue > greenValue && greenValue > redValue && blueValue / greenValue < steelBlueGreenRatio && greenValue / redValue < steelGreenRedRatio && overallBrightness > steelMinimumBrightness && overallBrightness < steelMaximumBrightness && blueValue / (greenValue + 0.01f) > greenValue / (redValue + 0.01f)) {
        if (SHOW_LOGS) {
            NSLog(@"\"Steel?\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
        }
        [randomName appendFormat:@"%@", [UIColor randomColorName]];
    }
    
    // brown check 2
    else if (redValue > greenValue && greenValue > blueValue && (redValue - greenValue) * 3.465f > greenValue - blueValue && (greenValue - blueValue) * 3.81f > redValue - greenValue && overallBrightness < veryBrightThreshold) {
        if (SHOW_LOGS) {
            NSLog(@"\"Brown2?\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
        }
        
        NSMutableArray *brownNouns = [NSMutableArray arrayWithArray:@[@"Brown", @"Dirt", @"Wood", @"Tree", @"Log", @"Vine", @"Root"]];
        
        if (overallBrightness > brightThreshold) {
            if (SHOW_LOGS) {
                NSLog(@"\"Light Brown!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
            }
            [brownNouns addObjectsFromArray:@[@"Dust"]];
        }
        
        else {
            if (SHOW_LOGS) {
                NSLog(@"\"Dark Brown!!!!!!!\"\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
            }
            [brownNouns addObjectsFromArray:@[@"Leather"]];
        }
        
        [randomName appendFormat:@"%@", [brownNouns objectAtIndex:arc4random()%brownNouns.count]];
    }
    
    else {
        if (SHOW_LOGS) {
            NSLog(@"Couldn't come up with a name\tr: %f\tg: %f\tb:%f", redValue, greenValue, blueValue);
        }
        return [UIColor randomColorName];
    }
    
    if (randomName.length > 20) {
        if (SHOW_LOGS) {
            NSLog(@"Couldn't come up with a shorter name than \"%@\"\t\tr: %f\tg: %f\tb:%f", randomName, redValue, greenValue, blueValue);
        }
        return [UIColor randomColorName];
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
    
    return [UIColor randomColorName];
}

#pragma mark - sets of colors

+ (NSDictionary *)whiteShades {
    return @{@"white" : [UIColor white],
             @"antiFlashWhite" : [UIColor antiFlashWhite],
             @"antiqueWhite" : [UIColor antiqueWhite],
             @"beige" : [UIColor beige],
             @"blond" : [UIColor blond],
             @"cornsilk" : [UIColor cornsilk],
             @"cosmicLatte" : [UIColor cosmicLatte],
             @"cream" : [UIColor cream],
             @"eggshell" : [UIColor eggshell],
             @"floralWhite" : [UIColor floralWhite],
             @"ghostWhite" : [UIColor ghostWhite],
             @"honeydew" : [UIColor honeydew],
             @"isabelline" : [UIColor isabelline],
             @"ivory" : [UIColor ivory],
             @"lavenderBlush" : [UIColor lavenderBlush],
             @"lemonChiffon" : [UIColor lemonChiffon],
             @"linen" : [UIColor linen],
             @"magnolia" : [UIColor magnolia],
             @"mintCream" : [UIColor mintCream],
             @"navajoWhite" : [UIColor navajoWhite],
             @"oldLace" : [UIColor oldLace],
             @"papayaWhip" : [UIColor papayaWhip],
             @"pearl" : [UIColor pearl],
             @"seashell" : [UIColor seashell],
             @"snow" : [UIColor snow],
             @"vanilla" : [UIColor vanilla],
             @"white" : [UIColor white],
             @"whiteSmoke" : [UIColor whiteSmoke]};
}

+ (NSDictionary *)grayShades {
    return @{@"gray" : [UIColor gray],
             @"ashGrey" : [UIColor ashGrey],
             @"battleshipGrey" : [UIColor battleshipGrey],
             @"black" : [UIColor black],
             @"blueGray" : [UIColor blueGray],
             @"cadetGrey" : [UIColor cadetGrey],
             @"charcoal" : [UIColor charcoal],
             @"coolGrey" : [UIColor coolGrey],
             @"davysGrey" : [UIColor davysGrey],
             @"paynesGrey" : [UIColor paynesGrey],
             @"silver" : [UIColor silver],
             @"slateGray" : [UIColor slateGray],
             @"taupe" : [UIColor taupe],
             @"purpleTaupe" : [UIColor purpleTaupe],
             @"mediumTaupe" : [UIColor mediumTaupe],
             @"roseQuartz" : [UIColor roseQuartz],
             @"taupeGray" : [UIColor taupeGray],
             @"timberwolf" : [UIColor timberwolf]};
}

+ (NSDictionary *)greyShades {
    return [UIColor grayShades];
}

+ (NSDictionary *)pinkShades {
    return @{@"pink" : [UIColor pink],
             @"amaranth" : [UIColor amaranth],
             @"amaranthPink" : [UIColor amaranthPink],
             @"bakerMillerPink" : [UIColor bakerMillerPink],
             @"brinkPink" : [UIColor brinkPink],
             @"carmine" : [UIColor carmine],
             @"carnationPink" : [UIColor carnationPink],
             @"cerise" : [UIColor cerise],
             @"coralPink" : [UIColor coralPink],
             @"deepCarmine" : [UIColor deepCarmine],
             @"deepPink" : [UIColor deepPink],
             @"fandangoPink" : [UIColor fandangoPink],
             @"frenchRose" : [UIColor frenchRose],
             @"fuchsia" : [UIColor fuchsia],
             @"hollywoodCerise" : [UIColor hollywoodCerise],
             @"hotMagenta" : [UIColor hotMagenta],
             @"hotPink" : [UIColor hotPink],
             @"lavenderPink" : [UIColor lavenderPink],
             @"magenta" : [UIColor magenta],
             @"mauve" : [UIColor mauve],
             @"mexicanPink" : [UIColor mexicanPink],
             @"persianRose" : [UIColor persianRose],
             @"pink" : [UIColor pink],
             @"puce" : [UIColor puce],
             @"rose" : [UIColor rose],
             @"rosePink" : [UIColor rosePink],
             @"ruby" : [UIColor ruby],
             @"salmonPink" : [UIColor salmonPink],
             @"shockingPink" : [UIColor shockingPink],
             @"thulianPink" : [UIColor thulianPink],
             @"shockingPinkCrayola" : [UIColor shockingPinkCrayola],
             @"ultraPink" : [UIColor ultraPink]};
}

+ (NSDictionary *)redShades {
    return @{@"red" : [UIColor red],
             @"alizarinCrimson" : [UIColor alizarinCrimson],
             @"amaranth" : [UIColor amaranth],
             @"americanRose" : [UIColor americanRose],
             @"auburn" : [UIColor auburn],
             @"burgundy" : [UIColor burgundy],
             @"cardinal" : [UIColor cardinal],
             @"carmine" : [UIColor carmine],
             @"cerise" : [UIColor cerise],
             @"chestnut" : [UIColor chestnut],
             @"crimson" : [UIColor crimson],
             @"darkRed" : [UIColor darkRed],
             @"electricCrimson" : [UIColor electricCrimson],
             @"firebrick" : [UIColor firebrick],
             @"flame" : [UIColor flame],
             @"folly" : [UIColor folly],
             @"lava" : [UIColor lava],
             @"lust" : [UIColor lust],
             @"maroonX11" : [UIColor maroonX11],
             @"pink" : [UIColor pink],
             @"raspberry" : [UIColor raspberry],
             @"red" : [UIColor red],
             @"redViolet" : [UIColor redViolet],
             @"redwood" : [UIColor redwood],
             @"rose" : [UIColor rose],
             @"rossoCorsa" : [UIColor rossoCorsa],
             @"ruby" : [UIColor ruby],
             @"rust" : [UIColor rust],
             @"rustyRed" : [UIColor rustyRed],
             @"scarlet" : [UIColor scarlet],
             @"terraCotta" : [UIColor terraCotta],
             @"tuscanRed" : [UIColor tuscanRed],
             @"tyrianPurple" : [UIColor tyrianPurple],
             @"venetianRed" : [UIColor venetianRed],
             @"vermilion" : [UIColor vermilion]};
}

+ (NSDictionary *)brownShades {
    return @{@"brownColor" : [UIColor brownColor],
             @"auburn" : [UIColor auburn],
             @"beaver" : [UIColor beaver],
             @"beige" : [UIColor beige],
             @"bistreBrown" : [UIColor bistreBrown],
             @"bole" : [UIColor bole],
             @"bronze" : [UIColor bronze],
             @"brownColor" : [UIColor brownColor],
             @"buff" : [UIColor buff],
             @"burgundy" : [UIColor burgundy],
             @"burntSienna" : [UIColor burntSienna],
             @"burntUmber" : [UIColor burntUmber],
             @"camel" : [UIColor camel],
             @"chamoisee" : [UIColor chamoisee],
             @"chestnut" : [UIColor chestnut],
             @"chocolateTraditional" : [UIColor chocolateTraditional],
             @"coffee" : [UIColor coffee],
             @"copper" : [UIColor copper],
             @"cordovan" : [UIColor cordovan],
             @"coyoteBrown" : [UIColor coyoteBrown],
             @"earthYellow" : [UIColor earthYellow],
             @"ecru" : [UIColor ecru],
             @"fallow" : [UIColor fallow],
             @"fawn" : [UIColor fawn],
             @"fieldDrab" : [UIColor fieldDrab],
             @"fulvous" : [UIColor fulvous],
             @"khakiX11LightKhaki" : [UIColor khakiX11LightKhaki],
             @"lion" : [UIColor lion],
             @"liver" : [UIColor liver],
             @"mahogany" : [UIColor mahogany],
             @"maroonX11" : [UIColor maroonX11],
             @"ochre" : [UIColor ochre],
             @"rawUmber" : [UIColor rawUmber],
             @"redwood" : [UIColor redwood],
             @"rufous" : [UIColor rufous],
             @"russet" : [UIColor russet],
             @"rust" : [UIColor rust],
             @"sand" : [UIColor sand],
             @"sandyBrown" : [UIColor sandyBrown],
             @"sealBrown" : [UIColor sealBrown],
             @"sepia" : [UIColor sepia],
             @"sienna" : [UIColor sienna],
             @"sinopia" : [UIColor sinopia],
             @"tan" : [UIColor tan],
             @"taupe" : [UIColor taupe],
             @"umber" : [UIColor umber],
             @"wenge" : [UIColor wenge],
             @"wheat" : [UIColor wheat]};
}

+ (NSDictionary *)orangeShades {
    return @{@"orangeColor" : [UIColor orangeColor],
             @"amber" : [UIColor amber],
             @"apricot" : [UIColor apricot],
             @"atomicTangerine" : [UIColor atomicTangerine],
             @"bittersweet" : [UIColor bittersweet],
             @"burntOrange" : [UIColor burntOrange],
             @"carrotOrange" : [UIColor carrotOrange],
             @"coral" : [UIColor coral],
             @"darkSalmon" : [UIColor darkSalmon],
             @"deepCarrotOrange" : [UIColor deepCarrotOrange],
             @"amberSAEECE" : [UIColor amberSAEECE],
             @"flame" : [UIColor flame],
             @"gamboge" : [UIColor gamboge],
             @"internationalOrangeEngineering" : [UIColor internationalOrangeEngineering],
             @"marigold" : [UIColor marigold],
             @"oldGold" : [UIColor oldGold],
             @"orangeColor" : [UIColor orangeColor],
             @"orangeColorWheel" : [UIColor orangeColorWheel],
             @"orangeCrayola" : [UIColor orangeCrayola],
             @"orangePantone" : [UIColor orangePantone],
             @"orangePeel" : [UIColor orangePeel],
             @"orangeRed" : [UIColor orangeRed],
             @"orangeRYB" : [UIColor orangeRYB],
             @"orangeWeb" : [UIColor orangeWeb],
             @"peachOrange" : [UIColor peachOrange],
             @"persianOrange" : [UIColor persianOrange],
             @"persimmon" : [UIColor persimmon],
             @"portlandOrange" : [UIColor portlandOrange],
             @"princetonOrange" : [UIColor princetonOrange],
             @"pumpkin" : [UIColor pumpkin],
             @"rust" : [UIColor rust],
             @"safetyOrange" : [UIColor safetyOrange],
             @"safetyOrangeBlazeOrange" : [UIColor safetyOrangeBlazeOrange],
             @"salmon" : [UIColor salmon],
             @"tangelo" : [UIColor tangelo],
             @"tangerine" : [UIColor tangerine],
             @"tenne" : [UIColor tenne]};
}

+ (NSDictionary *)yellowShades {
    return @{@"yellow" : [UIColor yellow],
             @"amber" : [UIColor amber],
             @"amberSAEECE" : [UIColor amberSAEECE],
             @"arylideYellow" : [UIColor arylideYellow],
             @"aureolin" : [UIColor aureolin],
             @"buff" : [UIColor buff],
             @"chartreuseTraditional" : [UIColor chartreuseTraditional],
             @"citrine" : [UIColor citrine],
             @"cream" : [UIColor cream],
             @"darkGoldenrod" : [UIColor darkGoldenrod],
             @"ecru" : [UIColor ecru],
             @"goldWebGolden" : [UIColor goldWebGolden],
             @"goldMetallic" : [UIColor goldMetallic],
             @"goldenrod" : [UIColor goldenrod],
             @"jasmine" : [UIColor jasmine],
             @"jonquil" : [UIColor jonquil],
             @"lemon" : [UIColor lemon],
             @"lemonChiffon" : [UIColor lemonChiffon],
             @"lemonMeringue" : [UIColor lemonMeringue],
             @"lemonYellow" : [UIColor lemonYellow],
             @"lion" : [UIColor lion],
             @"maize" : [UIColor maize],
             @"mikadoYellow" : [UIColor mikadoYellow],
             @"mustard" : [UIColor mustard],
             @"naplesYellow" : [UIColor naplesYellow],
             @"navajoWhite" : [UIColor navajoWhite],
             @"oldGold" : [UIColor oldGold],
             @"papayaWhip" : [UIColor papayaWhip],
             @"saffron" : [UIColor saffron],
             @"schoolBusYellow" : [UIColor schoolBusYellow],
             @"selectiveYellow" : [UIColor selectiveYellow],
             @"stilDeGrainYellow" : [UIColor stilDeGrainYellow],
             @"straw" : [UIColor straw],
             @"sunglow" : [UIColor sunglow],
             @"yellow" : [UIColor yellow],
             @"yellowColor" : [UIColor yellowColor],
             @"yellowCrayola" : [UIColor yellowCrayola],
             @"yellowMunsell" : [UIColor yellowMunsell],
             @"yellowNCS" : [UIColor yellowNCS],
             @"yellowPantone" : [UIColor yellowPantone],
             @"yellowProcess" : [UIColor yellowProcess],
             @"yellowRose" : [UIColor yellowRose],
             @"yellowRYB" : [UIColor yellowRYB]};
}

+ (NSDictionary *)greenShades {
    return @{@"greenColor" : [UIColor greenColor],
             @"appleGreen" : [UIColor appleGreen],
             @"artichoke" : [UIColor artichoke],
             @"asparagus" : [UIColor asparagus],
             @"avocado" : [UIColor avocado],
             @"brightGreen" : [UIColor brightGreen],
             @"calPolyGreen" : [UIColor calPolyGreen],
             @"chartreuseTraditional" : [UIColor chartreuseTraditional],
             @"chartreuseWeb" : [UIColor chartreuseWeb],
             @"darkGreen" : [UIColor darkGreen],
             @"darkGreenX11" : [UIColor darkGreenX11],
             @"darkOliveGreen" : [UIColor darkOliveGreen],
             @"darkSpringGreen" : [UIColor darkSpringGreen],
             @"dartmouthGreen" : [UIColor dartmouthGreen],
             @"fernGreen" : [UIColor fernGreen],
             @"forestGreenTraditional" : [UIColor forestGreenTraditional],
             @"forestGreenWeb" : [UIColor forestGreenWeb],
             @"greenColor" : [UIColor greenColor],
             @"greenColorWheelX11Green" : [UIColor greenColorWheelX11Green],
             @"greenCrayola" : [UIColor greenCrayola],
             @"greenCyan" : [UIColor greenCyan],
             @"greenHTMLCSSColor" : [UIColor greenHTMLCSSColor],
             @"greenMunsell" : [UIColor greenMunsell],
             @"greenNCS" : [UIColor greenNCS],
             @"greenPantone" : [UIColor greenPantone],
             @"greenPigment" : [UIColor greenPigment],
             @"greenRYB" : [UIColor greenRYB],
             @"greenYellow" : [UIColor greenYellow],
             @"harlequin" : [UIColor harlequin],
             @"harlequinGreen" : [UIColor harlequinGreen],
             @"honeydew" : [UIColor honeydew],
             @"hunterGreen" : [UIColor hunterGreen],
             @"indiaGreen" : [UIColor indiaGreen],
             @"islamicGreen" : [UIColor islamicGreen],
             @"jungleGreen" : [UIColor jungleGreen],
             @"lawnGreen" : [UIColor lawnGreen],
             @"limeColorWheel" : [UIColor limeColorWheel],
             @"limeGreen" : [UIColor limeGreen],
             @"limeWebX11Green" : [UIColor limeWebX11Green],
             @"mantis" : [UIColor mantis],
             @"mint" : [UIColor mint],
             @"mintCream" : [UIColor mintCream],
             @"mintGreen" : [UIColor mintGreen],
             @"officeGreen" : [UIColor officeGreen],
             @"olive" : [UIColor olive],
             @"oliveDrab3" : [UIColor oliveDrab3],
             @"oliveDrab7" : [UIColor oliveDrab7],
             @"pakistanGreen" : [UIColor pakistanGreen],
             @"parisGreen" : [UIColor parisGreen],
             @"persianGreen" : [UIColor persianGreen],
             @"phthaloGreen" : [UIColor phthaloGreen],
             @"pineGreen" : [UIColor pineGreen],
             @"pistachio" : [UIColor pistachio],
             @"seaGreen" : [UIColor seaGreen],
             @"shamrockGreen" : [UIColor shamrockGreen],
             @"springBud" : [UIColor springBud],
             @"springGreen" : [UIColor springGreen],
             @"teal" : [UIColor teal],
             @"viridian" : [UIColor viridian],
             @"viridianGreen" : [UIColor viridianGreen],
             @"yellowGreen" : [UIColor yellowGreen]};
}

+ (NSDictionary *)cyanShades {
    return @{@"cyanColor" : [UIColor cyanColor],
             @"aliceBlue" : [UIColor aliceBlue],
             @"aqua" : [UIColor aqua],
             @"aquamarine" : [UIColor aquamarine],
             @"azureMist" : [UIColor azureMist],
             @"azureWebColor" : [UIColor azureWebColor],
             @"celeste" : [UIColor celeste],
             @"cerulean" : [UIColor cerulean],
             @"cyan" : [UIColor cyan],
             @"cyanAzure" : [UIColor cyanAzure],
             @"cyanBlueAzure" : [UIColor cyanBlueAzure],
             @"cyanCobaltBlue" : [UIColor cyanCobaltBlue],
             @"cyanColor" : [UIColor cyanColor],
             @"cyanCornflowerBlue" : [UIColor cyanCornflowerBlue],
             @"cyanProcess" : [UIColor cyanProcess],
             @"electricBlue" : [UIColor electricBlue],
             @"jungleGreen" : [UIColor jungleGreen],
             @"magicMint" : [UIColor magicMint],
             @"mint" : [UIColor mint],
             @"persianGreen" : [UIColor persianGreen],
             @"pineGreen" : [UIColor pineGreen],
             @"robinEggBlue" : [UIColor robinEggBlue],
             @"seaGreen" : [UIColor seaGreen],
             @"skobeloff" : [UIColor skobeloff],
             @"skyBlue" : [UIColor skyBlue],
             @"tiffanyBlue" : [UIColor tiffanyBlue],
             @"teal" : [UIColor teal],
             @"turquoise" : [UIColor turquoise]};
}

+ (NSDictionary *)blueShades {
    return @{@"blueColor" : [UIColor blueColor],
             @"airForceBlueRAF" : [UIColor airForceBlueRAF],
             @"airForceBlueUSAF" : [UIColor airForceBlueUSAF],
             @"airSuperiorityBlue" : [UIColor airSuperiorityBlue],
             @"aliceBlue" : [UIColor aliceBlue],
             @"azure" : [UIColor azure],
             @"babyBlue" : [UIColor babyBlue],
             @"bleuDeFrance" : [UIColor bleuDeFrance],
             @"blue" : [UIColor blue],
             @"blueBell" : [UIColor blueBell],
             @"blueberry" : [UIColor blueberry],
             @"bluebonnet" : [UIColor bluebonnet],
             @"blueColor" : [UIColor blueColor],
             @"blueCrayola" : [UIColor blueCrayola],
             @"blueLagoon" : [UIColor blueLagoon],
             @"blueMunsell" : [UIColor blueMunsell],
             @"blueNCS" : [UIColor blueNCS],
             @"bluePantone" : [UIColor bluePantone],
             @"bluePigment" : [UIColor bluePigment],
             @"blueRYB" : [UIColor blueRYB],
             @"bondiBlue" : [UIColor bondiBlue],
             @"blueGray" : [UIColor blueGray],
             @"brandeisBlue" : [UIColor brandeisBlue],
             @"cambridgeBlue" : [UIColor cambridgeBlue],
             @"carolinaBlue" : [UIColor carolinaBlue],
             @"celeste" : [UIColor celeste],
             @"cerulean" : [UIColor cerulean],
             @"ceruleanBlue" : [UIColor ceruleanBlue],
             @"cobaltBlue" : [UIColor cobaltBlue],
             @"columbiaBlue" : [UIColor columbiaBlue],
             @"cornflowerBlue" : [UIColor cornflowerBlue],
             @"cyan" : [UIColor cyan],
             @"darkBlue" : [UIColor darkBlue],
             @"darkBlueGray" : [UIColor darkBlueGray],
             @"deepSkyBlue" : [UIColor deepSkyBlue],
             @"denim" : [UIColor denim],
             @"dodgerBlue" : [UIColor dodgerBlue],
             @"dukeBlue" : [UIColor dukeBlue],
             @"egyptianBlue" : [UIColor egyptianBlue],
             @"electricBlue" : [UIColor electricBlue],
             @"etonBlue" : [UIColor etonBlue],
             @"glaucous" : [UIColor glaucous],
             @"electricIndigo" : [UIColor electricIndigo],
             @"indigo" : [UIColor indigo],
             @"internationalKleinBlue" : [UIColor internationalKleinBlue],
             @"iris" : [UIColor iris],
             @"lightBlue" : [UIColor lightBlue],
             @"majorelleBlue" : [UIColor majorelleBlue],
             @"mayaBlue" : [UIColor mayaBlue],
             @"mediumBlue" : [UIColor mediumBlue],
             @"midnightBlue" : [UIColor midnightBlue],
             @"navy" : [UIColor navy],
             @"nonPhotoBlue" : [UIColor nonPhotoBlue],
             @"oxfordBlue" : [UIColor oxfordBlue],
             @"palatinateBlue" : [UIColor palatinateBlue],
             @"periwinkle" : [UIColor periwinkle],
             @"persianBlue" : [UIColor persianBlue],
             @"phthaloBlue" : [UIColor phthaloBlue],
             @"powderBlue" : [UIColor powderBlue],
             @"prussianBlue" : [UIColor prussianBlue],
             @"royalBlue" : [UIColor royalBlue],
             @"sapphire" : [UIColor sapphire],
             @"sapphireBlue" : [UIColor sapphireBlue],
             @"skyBlue" : [UIColor skyBlue],
             @"steelBlue" : [UIColor steelBlue],
             @"teal" : [UIColor teal],
             @"tealBlue" : [UIColor tealBlue],
             @"tiffanyBlue" : [UIColor tiffanyBlue],
             @"trueBlue" : [UIColor trueBlue],
             @"tuftsBlue" : [UIColor tuftsBlue],
             @"turquoise" : [UIColor turquoise],
             @"turquoiseBlue" : [UIColor turquoiseBlue],
             @"uCLABlue" : [UIColor uCLABlue],
             @"ultramarine" : [UIColor ultramarine],
             @"ultramarineBlue" : [UIColor ultramarineBlue],
             @"violetBlue" : [UIColor violetBlue],
             @"viridian" : [UIColor viridian],
             @"yaleBlue" : [UIColor yaleBlue],
             @"yankeesBlue" : [UIColor yankeesBlue],
             @"zaffre" : [UIColor zaffre]};
}

+ (NSDictionary *)violetShades {
    return @{@"violet" : [UIColor violet],
             @"amethyst" : [UIColor amethyst],
             @"byzantium" : [UIColor byzantium],
             @"cerise" : [UIColor cerise],
             @"darkPurple" : [UIColor darkPurple],
             @"eggplant" : [UIColor eggplant],
             @"fandango" : [UIColor fandango],
             @"fuchsiaPurple" : [UIColor fuchsiaPurple],
             @"heliotrope" : [UIColor heliotrope],
             @"indigo" : [UIColor indigo],
             @"lavenderBlush" : [UIColor lavenderBlush],
             @"lavenderFloral" : [UIColor lavenderFloral],
             @"lavenderGray" : [UIColor lavenderGray],
             @"lavenderIndigo" : [UIColor lavenderIndigo],
             @"lavenderMagenta" : [UIColor lavenderMagenta],
             @"lavenderMist" : [UIColor lavenderMist],
             @"lavenderPurple" : [UIColor lavenderPurple],
             @"lavenderRose" : [UIColor lavenderRose],
             @"lavenderWeb" : [UIColor lavenderWeb],
             @"magenta" : [UIColor magenta],
             @"mauve" : [UIColor mauve],
             @"orchid" : [UIColor orchid],
             @"plum" : [UIColor plum],
             @"plumWeb" : [UIColor plumWeb],
             @"purpleColor" : [UIColor purpleColor],
             @"purpleHeart" : [UIColor purpleHeart],
             @"purpleHTML" : [UIColor purpleHTML],
             @"purpleMountainMajesty" : [UIColor purpleMountainMajesty],
             @"purpleMunsell" : [UIColor purpleMunsell],
             @"purpleNavy" : [UIColor purpleNavy],
             @"purplePizzazz" : [UIColor purplePizzazz],
             @"purpleTaupe" : [UIColor purpleTaupe],
             @"purpleX11" : [UIColor purpleX11],
             @"purpureus" : [UIColor purpureus],
             @"redViolet" : [UIColor redViolet],
             @"rose" : [UIColor rose],
             @"thistle" : [UIColor thistle],
             @"tyrianPurple" : [UIColor tyrianPurple],
             @"mulberry" : [UIColor mulberry],
             @"violet" : [UIColor violet],
             @"violetBlue" : [UIColor violetBlue],
             @"violetRYB" : [UIColor violetRYB],
             @"violetWeb" : [UIColor violetWeb],
             @"wisteria" : [UIColor wisteria]};
}


#pragma mark - Holiday colors

// Holiday Colors for Today
// the first color in the returned array is the darkest color, the second is the lightest and each color after the second gets progressively lighter
+ (NSArray *)holidayColorsForToday {
    NSDate *now = [NSDate date];
    
    return [UIColor holidayColorsForDate:now];
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
        }
        
        else {
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
            }
            else {
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
            [colors addObjectsFromArray:@[[UIColor colorWithRed:16.0f/255.0f green:21.0f/255.0f blue:43.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:1.0f green:0.97f blue:206.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:45.0f/255.0f green:159.0f/255.0f blue:169.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:26.0f/255.0f green:81.0f/255.0f blue:86.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:15.0f/255.0f green:20.0f/255.0f blue:42.0f/255.0f alpha:1.0f]]];
        }
    }
    
    else if ([dateComps month] == 2) {
        // Valentine's Day
        if ([dateComps day] == 14) {
            [colors addObjectsFromArray:@[[UIColor barnRed],
                                          [UIColor lavenderBlush],
                                          [UIColor cerise],
                                          [UIColor cardinal],
                                          [UIColor burgundy]]];
        }
        
        else if ([dateComps day] == 13) {
            [colors addObjectsFromArray:@[[UIColor colorWithRed:89.0f/255.0f green:60.0f/255.0f blue:79.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:220.0f/255.0f green:72.0f/255.0f blue:105.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:186.0f/255.0f green:71.0f/255.0f blue:98.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:122.0f/255.0f green:63.0f/255.0f blue:85.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:154.0f/255.0f green:67.0f/255.0f blue:92.0f/255.0f alpha:1.0f]]];
        }
    }
    
    else if ([dateComps month] == 3) {
        // St Patrick's Day
        if ([dateComps day] == 17) {
            [colors addObjectsFromArray:@[[UIColor darkGreen],
                                          [UIColor beige],
                                          [UIColor cadmiumGreen],
                                          [UIColor islamicGreen],
                                          [UIColor brunswickGreen]]];
        }
        
        else if ([dateComps day] < 17) {
            [colors addObjectsFromArray:@[[UIColor colorWithRed:58.0f/255.0f green:53.0f/255.0f blue:59.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:244.0f/255.0f green:241.0f/255.0f blue:236.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:115.0f/255.0f green:168.0f/255.0f blue:114.0f/255.0f alpha:1.05],
                                          [UIColor colorWithRed:28.0f/255.0f green:139.0f/255.0f blue:56.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:71.0f/255.0f green:66.0f/255.0f blue:73.0f/255.0f alpha:1.0f]]];
        }
    }
    
    else if ([dateComps month] == 4) {
        if (isEaster) {
            [colors addObjectsFromArray:@[[UIColor deepCarmine],
                                          [UIColor colorWithRed:224.0f/255.0f green:201.0f/255.0f blue:230.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:240.0f/255.0f green:219.0f/255.0f blue:125.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:215.0f/255.0f green:130.0f/255.0f blue:177.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:246.0f/255.0f green:164.0f/255.0f blue:50.0f/255.0f alpha:1.0f]]];
        }
    }
    
    else if ([dateComps month] == 5) {
        if (colors.count == 0) {
            [colors addObjectsFromArray:@[[UIColor colorWithRed:27.0f/255.0f green:50.0f/255.0f blue:90.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:233.0f/255.0f green:242.0f/255.0f blue:249.0f alpha:1.0f],
                                          [UIColor colorWithRed:155.0f/255.0f green:197.0f/255.0f blue:230.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:61.0f/255.0f green:138.0f/255.0f blue:199.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:240.0f/255.0f green:108.0f/255.0f blue:83.0f/255.0f alpha:1.0f]]];
        }
    }
    
    else if ([dateComps month] == 6) {
        if ([dateComps day] % 3 == 0) {
            [colors addObjectsFromArray:@[[UIColor colorWithRed:63.0f/255.0f green:80.0f/255.0f blue:87.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:235.0f/255.0f green:214.0f/255.0f blue:99.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:253.0f/255.0f green:173.0f/255.0f blue:9.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:115.0f/255.0f green:176.0f/255.0f blue:113.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:26.0f/255.0f green:143.0f/255.0f blue:143.0f/255.0f alpha:1.0f]]];
        }
    }
    
    else if ([dateComps month] == 7) {
        // 4th of July
        if ([dateComps day] == 4) {
            [colors addObjectsFromArray:@[[UIColor navy],
                                          [UIColor white],
                                          [UIColor skyBlue],
                                          [UIColor redColor],
                                          [UIColor darkRed]]];
        }
        
        else if ([dateComps day] % 4 == 0) {
            [colors addObjectsFromArray:@[[UIColor colorWithRed:16.0f/255.0f green:21.0f/255.0f blue:43.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:1.0f green:0.97f blue:206.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:45.0f/255.0f green:159.0f/255.0f blue:169.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:26.0f/255.0f green:81.0f/255.0f blue:86.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:15.0f/255.0f green:20.0f/255.0f blue:42.0f/255.0f alpha:1.0f]]];
        }
    }
    
    else if ([dateComps month] == 8) {
        if ([dateComps day] % 5 == 0) {
            [colors addObjectsFromArray:@[[UIColor colorWithRed:79.0f/255.0f green:64.0f/255.0f blue:35.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:238.0f/255.0f green:238.0f/255.0f blue:238.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:207.0f/255.0f green:216.0f/255.0f blue:151.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:143.0f/255.0f green:206.0f/255.0f blue:203.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:132.0f/255.0f green:126.0f/255.0f blue:110.0f/255.0f alpha:1.0f]]];
        }
    }
    
    else if ([dateComps month] == 9) {
        // special colors for my birthday, my parents' anniversary, last day of summer, and my cousin's anniversary
        if ([dateComps day] % 7 == 0) {
            [colors addObjectsFromArray:@[[UIColor colorWithRed:100.0f/255.0f green:118.0f/255.0f blue:99.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:233.0f/255.0f green:233.0f/255.0f blue:191.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:173.0f/255.0f green:180.0f/255.0f blue:132.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:218.0f/255.0f green:155.0f/255.0f blue:58.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:202.0f/255.0f green:102.0f/255.0f blue:1.0f/255.0f alpha:1.0f]]];
        }
    }
    
    else if ([dateComps month] == 10) {
        // Halloween
        if ([dateComps day] == 31) {
            
        }
        
        // special colors for my mom's birthday and Dave Price's Birthday
        if ([dateComps day] == 5 || [dateComps day] == 12) {
            [colors addObjectsFromArray:@[[UIColor colorWithRed:116.0f/255.0f green:32.0f/255.0f blue:31.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:239.0f/255.0f green:231.0f/255.0f blue:166.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:206.0f/255.0f green:197.0f/255.0f blue:132.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:155.0f/255.0f green:132.0f/255.0f blue:84.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:79.0f/255.0f green:75.0f/255.0f blue:44.0f/255.0f alpha:1.0f]]];
        }
    }
    
    else if ([dateComps month] == 11) {
        // special colors for Katie's birthday / veteran's day
        if ([dateComps day] == 11) {
            
        }
        
        else if ([dateComps day] % 12 == 0) {
            [colors addObjectsFromArray:@[[UIColor colorWithRed:40.0f/255.0f green:39.0f/255.0f blue:41.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:245.0f/255.0f green:152.0f/255.0f blue:31.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:219.0f/255.0f green:84.0f/255.0f blue:80.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:176.0f/255.0f green:13.0f/255.0f blue:34.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:65.0f/255.0f green:11.0f/255.0f blue:26.0f/255.0f alpha:1.0f]]];
        }
    }
    
    else if ([dateComps month] == 12) {
        // Christmas colors for the 25 days leading up to and including Christmas
        if ([dateComps day] <= 25) {
            [colors addObjectsFromArray:@[[UIColor deepRed],
                                          [UIColor white],
                                          [UIColor greenPantone],
                                          [UIColor uPForestGreen],
                                          [UIColor rubyRed]]];
        }
        
        // new year's eve colors!
        else {
            [colors addObjectsFromArray:@[[UIColor jet],
                                          [UIColor champagne],
                                          [UIColor silver],
                                          [UIColor darkGrayColor],
                                          [UIColor goldenrod]]];
        }
    }
    
    // add a default set of colors that I think look nice
    if (colors.count == 0) {
        [colors addObjectsFromArray:@[[UIColor colorWithRed:16.0f/255.0f green:21.0f/255.0f blue:43.0f/255.0f alpha:1.0f],
                                      [UIColor colorWithRed:1.0f green:0.97f blue:206.0f/255.0f alpha:1.0f],
                                      [UIColor colorWithRed:45.0f/255.0f green:159.0f/255.0f blue:169.0f/255.0f alpha:1.0f],
                                      [UIColor colorWithRed:26.0f/255.0f green:81.0f/255.0f blue:86.0f/255.0f alpha:1.0f],
                                      [UIColor colorWithRed:15.0f/255.0f green:20.0f/255.0f blue:42.0f/255.0f alpha:1.0f]]];
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
    return [UIColor strictHolidayColorsForDate:[NSDate date]];
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
        }
        
        else {
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
            }
            else {
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
            [colors addObjectsFromArray:@[[UIColor colorWithRed:16.0f/255.0f green:21.0f/255.0f blue:43.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:1.0f         green:0.97f        blue:206.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:45.0f/255.0f green:159.0f/255.0f blue:169.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:26.0f/255.0f green:81.0f/255.0f blue:86.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:15.0f/255.0f green:20.0f/255.0f blue:42.0f/255.0f alpha:1.0f]]];
        }
    }
    
    else if ([dateComps month] == 2) {
        // day before valentine's day
        if ([dateComps day] == 13) {
            [colors addObjectsFromArray:@[[UIColor colorWithRed:89.0f/255.0f green:60.0f/255.0f blue:79.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:220.0f/255.0f green:72.0f/255.0f blue:105.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:186.0f/255.0f green:71.0f/255.0f blue:98.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:122.0f/255.0f green:63.0f/255.0f blue:85.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:154.0f/255.0f green:67.0f/255.0f blue:92.0f/255.0f alpha:1.0f]]];
        }
        
        // Valentine's Day
        else if ([dateComps day] == 14) {
            [colors addObjectsFromArray:@[[UIColor barnRed],
                                          [UIColor lavenderBlush],
                                          [UIColor cerise],
                                          [UIColor cardinal],
                                          [UIColor burgundy]]];
        }
    }
    
    else if ([dateComps month] == 3) {
        // day before St Patrick's Day
        if ([dateComps day] == 16) {
            [colors addObjectsFromArray:@[[UIColor colorWithRed:58.0f/255.0f green:53.0f/255.0f blue:59.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:244.0f/255.0f green:241.0f/255.0f blue:236.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:115.0f/255.0f green:168.0f/255.0f blue:114.0f/255.0f alpha:1.05],
                                          [UIColor colorWithRed:28.0f/255.0f green:139.0f/255.0f blue:56.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:71.0f/255.0f green:66.0f/255.0f blue:73.0f/255.0f alpha:1.0f]]];
        }
        
        // St Patrick's Day
        else if ([dateComps day] == 17) {
            [colors addObjectsFromArray:@[[UIColor darkGreen],
                                          [UIColor beige],
                                          [UIColor cadmiumGreen],
                                          [UIColor islamicGreen],
                                          [UIColor brunswickGreen]]];
        }
    }
    
    else if ([dateComps month] == 4) {
        if (isEaster) {
            [colors addObjectsFromArray:@[[UIColor deepCarmine],
                                          [UIColor colorWithRed:224.0f/255.0f green:201.0f/255.0f blue:230.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:240.0f/255.0f green:219.0f/255.0f blue:125.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:215.0f/255.0f green:130.0f/255.0f blue:177.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:246.0f/255.0f green:164.0f/255.0f blue:50.0f/255.0f alpha:1.0f]]];
        }
    }
    
    else if ([dateComps month] == 5) {
        // memorial day
        if ([dateComps day] == 25) {
            [colors addObjectsFromArray:@[[UIColor colorWithRed:16.0f/255.0f green:21.0f/255.0f blue:43.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:1.0f green:0.97f blue:206.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:45.0f/255.0f green:159.0f/255.0f blue:169.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:26.0f/255.0f green:81.0f/255.0f blue:86.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:15.0f/255.0f green:20.0f/255.0f blue:42.0f/255.0f alpha:1.0f]]];
        }
    }
    
    else if ([dateComps month] == 6) {
        // first day of summer
        if ([dateComps day] == 21) {
            [colors addObjectsFromArray:@[[UIColor colorWithRed:63.0f/255.0f green:80.0f/255.0f blue:87.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:235.0f/255.0f green:214.0f/255.0f blue:99.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:253.0f/255.0f green:173.0f/255.0f blue:9.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:115.0f/255.0f green:176.0f/255.0f blue:113.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:26.0f/255.0f green:143.0f/255.0f blue:143.0f/255.0f alpha:1.0f]]];
        }
    }
    
    else if ([dateComps month] == 7) {
        // 4th of July
        if ([dateComps day] == 4) {
            [colors addObjectsFromArray:@[[UIColor navy],
                                          [UIColor white],
                                          [UIColor skyBlue],
                                          [UIColor redColor],
                                          [UIColor darkRed]]];
        }
    }
    
    else if ([dateComps month] == 8) {
        // no holidays in August
    }
    
    else if ([dateComps month] == 9) {
        // special colors for my birthday, my parents' anniversary, last day of summer, and my cousin's anniversary
        if ([dateComps day] % 7 == 0) {
            [colors addObjectsFromArray:@[[UIColor colorWithRed:100.0f/255.0f green:118.0f/255.0f blue:99.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:233.0f/255.0f green:233.0f/255.0f blue:191.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:173.0f/255.0f green:180.0f/255.0f blue:132.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:218.0f/255.0f green:155.0f/255.0f blue:58.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:202.0f/255.0f green:102.0f/255.0f blue:1.0f/255.0f alpha:1.0f]]];
        }
    }
    
    else if ([dateComps month] == 10) {
        // Halloween
        if ([dateComps day] == 31) {
            
        }
        
        // special colors for my mom's birthday and Dave Price's Birthday
        if ([dateComps day] == 5 || [dateComps day] == 12) {
            [colors addObjectsFromArray:@[[UIColor colorWithRed:116.0f/255.0f green:32.0f/255.0f blue:31.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:239.0f/255.0f green:231.0f/255.0f blue:166.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:206.0f/255.0f green:197.0f/255.0f blue:132.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:155.0f/255.0f green:132.0f/255.0f blue:84.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:79.0f/255.0f green:75.0f/255.0f blue:44.0f/255.0f alpha:1.0f]]];
        }
    }
    
    else if ([dateComps month] == 11) {
        // special colors for Katie's birthday / veteran's day
        if ([dateComps day] == 11) {
            
        }
        
        else if ([dateComps day] % 12 == 0) {
            [colors addObjectsFromArray:@[[UIColor colorWithRed:40.0f/255.0f green:39.0f/255.0f blue:41.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:245.0f/255.0f green:152.0f/255.0f blue:31.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:219.0f/255.0f green:84.0f/255.0f blue:80.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:176.0f/255.0f green:13.0f/255.0f blue:34.0f/255.0f alpha:1.0f],
                                          [UIColor colorWithRed:65.0f/255.0f green:11.0f/255.0f blue:26.0f/255.0f alpha:1.0f]]];
        }
    }
    
    else if ([dateComps month] == 12) {
        // Christmas colors for the 12 days leading up to and including Christmas
        if ([dateComps day] <= 25 && [dateComps day] > 13) {
            [colors addObjectsFromArray:@[[UIColor deepRed],
                                          [UIColor white],
                                          [UIColor greenPantone],
                                          [UIColor uPForestGreen],
                                          [UIColor rubyRed]]];
        }
        
        // new year's eve colors!
        else if ([dateComps day] == 31) {
            [colors addObjectsFromArray:@[[UIColor jet],
                                          [UIColor champagne],
                                          [UIColor silver],
                                          [UIColor darkGrayColor],
                                          [UIColor goldenrod]]];
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

+ (UIColor *)colorForCurrentTime {
    return [UIColor colorForTimeOfDay:[NSDate date]];
}

+ (UIColor *)colorForTimeOfDay:(NSDate *)date {
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
    
    NSLog(@"R: %f\t\tG: %f\t\tB: %f\t\t%@", redValue, greenValue, blueValue, date);
    
    return [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0f];
}

#pragma mark - different sets of colors for 2 different players

+ (NSArray *)player1Colors {
    return @[[UIColor randomDarkColor]];
}

+ (NSArray *)player2Colors {
    return @[[UIColor randomDarkColor]];
}

#pragma mark - iOS Colors

+ (UIColor *)uiSwitchGreen {
    return [UIColor colorWithRed:76.0f/255.0f green:217.0f/255.0f blue:100.0f/255.0f alpha:1.0f];
}

#pragma mark - Colors that should have been there from the beginning

+ (NSArray *)allColorsArray {
    return @[[UIColor acidGreen],
             [UIColor aero],
             [UIColor aeroBlue],
             [UIColor africanViolet],
             [UIColor airForceBlueRAF],
             [UIColor airForceBlueUSAF],
             [UIColor airSuperiorityBlue],
             [UIColor alabamaCrimson],
             [UIColor aliceBlue],
             [UIColor alizarinCrimson],
             [UIColor alloyOrange],
             [UIColor almond],
             [UIColor amaranth],
             [UIColor amaranthDeepPurple],
             [UIColor amaranthPink],
             [UIColor amaranthPurple],
             [UIColor amaranthRed],
             [UIColor amazon],
             [UIColor amber],
             [UIColor amberSAEECE],
             [UIColor americanRose],
             [UIColor amethyst],
             [UIColor androidGreen],
             [UIColor antiFlashWhite],
             [UIColor antiqueBrass],
             [UIColor antiqueBronze],
             [UIColor antiqueFuchsia],
             [UIColor antiqueRuby],
             [UIColor antiqueWhite],
             [UIColor aoEnglish],
             [UIColor appleGreen],
             [UIColor apricot],
             [UIColor aqua],
             [UIColor aquamarine],
             [UIColor armyGreen],
             [UIColor arsenic],
             [UIColor artichoke],
             [UIColor arylideYellow],
             [UIColor ashGrey],
             [UIColor asparagus],
             [UIColor atomicTangerine],
             [UIColor auburn],
             [UIColor aureolin],
             [UIColor auroMetalSaurus],
             [UIColor avocado],
             [UIColor azure],
             [UIColor azureWebColor],
             [UIColor azureMist],
             [UIColor azureishWhite],
             [UIColor babyBlue],
             [UIColor babyBlueEyes],
             [UIColor babyPink],
             [UIColor babyPowder],
             [UIColor bakerMillerPink],
             [UIColor ballBlue],
             [UIColor bananaMania],
             [UIColor bananaYellow],
             [UIColor bangladeshGreen],
             [UIColor barbiePink],
             [UIColor barnRed],
             [UIColor battleshipGrey],
             [UIColor bazaar],
             [UIColor beauBlue],
             [UIColor beaver],
             [UIColor beige],
             [UIColor bdazzledBlue],
             [UIColor bigDipOruby],
             [UIColor bisque],
             [UIColor bistre],
             [UIColor bistreBrown],
             [UIColor bitterLemon],
             [UIColor bitterLime],
             [UIColor bittersweet],
             [UIColor bittersweetShimmer],
             [UIColor black],
             [UIColor blackBean],
             [UIColor blackLeatherJacket],
             [UIColor blackOlive],
             [UIColor blanchedAlmond],
             [UIColor blastOffBronze],
             [UIColor bleuDeFrance],
             [UIColor blizzardBlue],
             [UIColor blond],
             [UIColor blue],
             [UIColor blueCrayola],
             [UIColor blueMunsell],
             [UIColor blueNCS],
             [UIColor bluePantone],
             [UIColor bluePigment],
             [UIColor blueRYB],
             [UIColor blueBell],
             [UIColor blueGray],
             [UIColor blueGreen],
             [UIColor blueLagoon],
             [UIColor blueMagentaViolet],
             [UIColor blueSapphire],
             [UIColor blueViolet],
             [UIColor blueYonder],
             [UIColor blueberry],
             [UIColor bluebonnet],
             [UIColor blush],
             [UIColor bole],
             [UIColor bondiBlue],
             [UIColor bone],
             [UIColor bostonUniversityRed],
             [UIColor bottleGreen],
             [UIColor boysenberry],
             [UIColor brandeisBlue],
             [UIColor brass],
             [UIColor brickRed],
             [UIColor brightCerulean],
             [UIColor brightGreen],
             [UIColor brightLavender],
             [UIColor brightLilac],
             [UIColor brightMaroon],
             [UIColor brightNavyBlue],
             [UIColor brightPink],
             [UIColor brightTurquoise],
             [UIColor brightUbe],
             [UIColor brilliantAzure],
             [UIColor brilliantLavender],
             [UIColor brilliantRose],
             [UIColor brinkPink],
             [UIColor britishRacingGreen],
             [UIColor bronze],
             [UIColor bronzeYellow],
             [UIColor brownTraditional],
             [UIColor brownWeb],
             [UIColor brownNose],
             [UIColor brownYellow],
             [UIColor brunswickGreen],
             [UIColor bubbleGum],
             [UIColor bubbles],
             [UIColor buff],
             [UIColor budGreen],
             [UIColor bulgarianRose],
             [UIColor burgundy],
             [UIColor burlywood],
             [UIColor burntOrange],
             [UIColor burntSienna],
             [UIColor burntUmber],
             [UIColor byzantine],
             [UIColor byzantium],
             [UIColor cadet],
             [UIColor cadetBlue],
             [UIColor cadetGrey],
             [UIColor cadmiumGreen],
             [UIColor cadmiumOrange],
             [UIColor cadmiumRed],
             [UIColor cadmiumYellow],
             [UIColor caféAuLait],
             [UIColor caféNoir],
             [UIColor calPolyGreen],
             [UIColor cambridgeBlue],
             [UIColor camel],
             [UIColor cameoPink],
             [UIColor camouflageGreen],
             [UIColor canaryYellow],
             [UIColor candyAppleRed],
             [UIColor candyPink],
             [UIColor capri],
             [UIColor caputMortuum],
             [UIColor cardinal],
             [UIColor caribbeanGreen],
             [UIColor carmine],
             [UIColor carmineMP],
             [UIColor carminePink],
             [UIColor carmineRed],
             [UIColor carnationPink],
             [UIColor carnelian],
             [UIColor carolinaBlue],
             [UIColor carrotOrange],
             [UIColor castletonGreen],
             [UIColor catalinaBlue],
             [UIColor catawba],
             [UIColor cedarChest],
             [UIColor ceil],
             [UIColor celadon],
             [UIColor celadonBlue],
             [UIColor celadonGreen],
             [UIColor celeste],
             [UIColor celestialBlue],
             [UIColor cerise],
             [UIColor cerisePink],
             [UIColor cerulean],
             [UIColor ceruleanBlue],
             [UIColor ceruleanFrost],
             [UIColor cGBlue],
             [UIColor cGRed],
             [UIColor chamoisee],
             [UIColor champagne],
             [UIColor charcoal],
             [UIColor charlestonGreen],
             [UIColor charmPink],
             [UIColor chartreuseTraditional],
             [UIColor chartreuseWeb],
             [UIColor cherry],
             [UIColor cherryBlossomPink],
             [UIColor chestnut],
             [UIColor chinaPink],
             [UIColor chinaRose],
             [UIColor chineseRed],
             [UIColor chineseViolet],
             [UIColor chocolateTraditional],
             [UIColor chocolateWeb],
             [UIColor chromeYellow],
             [UIColor cinereous],
             [UIColor cinnabar],
             [UIColor cinnamonCitationNeeded],
             [UIColor citrine],
             [UIColor citron],
             [UIColor claret],
             [UIColor classicRose],
             [UIColor cobaltBlue],
             [UIColor cocoaBrown],
             [UIColor coconut],
             [UIColor coffee],
             [UIColor columbiaBlue],
             [UIColor congoPink],
             [UIColor coolBlack],
             [UIColor coolGrey],
             [UIColor copper],
             [UIColor copperCrayola],
             [UIColor copperPenny],
             [UIColor copperRed],
             [UIColor copperRose],
             [UIColor coquelicot],
             [UIColor coral],
             [UIColor coralPink],
             [UIColor coralRed],
             [UIColor cordovan],
             [UIColor corn],
             [UIColor cornellRed],
             [UIColor cornflowerBlue],
             [UIColor cornsilk],
             [UIColor cosmicLatte],
             [UIColor coyoteBrown],
             [UIColor cottonCandy],
             [UIColor cream],
             [UIColor crimson],
             [UIColor crimsonGlory],
             [UIColor crimsonRed],
             [UIColor cyan],
             [UIColor cyanAzure],
             [UIColor cyanBlueAzure],
             [UIColor cyanCobaltBlue],
             [UIColor cyanCornflowerBlue],
             [UIColor cyanProcess],
             [UIColor cyberGrape],
             [UIColor cyberYellow],
             [UIColor daffodil],
             [UIColor dandelion],
             [UIColor darkBlue],
             [UIColor darkBlueGray],
             [UIColor darkBrown],
             [UIColor darkBrownTangelo],
             [UIColor darkByzantium],
             [UIColor darkCandyAppleRed],
             [UIColor darkCerulean],
             [UIColor darkChestnut],
             [UIColor darkCoral],
             [UIColor darkCyan],
             [UIColor darkElectricBlue],
             [UIColor darkGoldenrod],
             [UIColor darkGrayX11],
             [UIColor darkGreen],
             [UIColor darkGreenX11],
             [UIColor darkImperialBlue],
             [UIColor darkImperialBlue],
             [UIColor darkJungleGreen],
             [UIColor darkKhaki],
             [UIColor darkLava],
             [UIColor darkLavender],
             [UIColor darkLiver],
             [UIColor darkLiverHorses],
             [UIColor darkMagenta],
             [UIColor darkMediumGray],
             [UIColor darkMidnightBlue],
             [UIColor darkMossGreen],
             [UIColor darkOliveGreen],
             [UIColor darkOrange],
             [UIColor darkOrchid],
             [UIColor darkPastelBlue],
             [UIColor darkPastelGreen],
             [UIColor darkPastelPurple],
             [UIColor darkPastelRed],
             [UIColor darkPink],
             [UIColor darkPowderBlue],
             [UIColor darkPuce],
             [UIColor darkPurple],
             [UIColor darkRaspberry],
             [UIColor darkRed],
             [UIColor darkSalmon],
             [UIColor darkScarlet],
             [UIColor darkSeaGreen],
             [UIColor darkSienna],
             [UIColor darkSkyBlue],
             [UIColor darkSlateBlue],
             [UIColor darkSlateGray],
             [UIColor darkSpringGreen],
             [UIColor darkTan],
             [UIColor darkTangerine],
             [UIColor darkTaupe],
             [UIColor darkTerraCotta],
             [UIColor darkTurquoise],
             [UIColor darkVanilla],
             [UIColor darkViolet],
             [UIColor darkYellow],
             [UIColor dartmouthGreen],
             [UIColor davysGrey],
             [UIColor debianRed],
             [UIColor deepAquamarine],
             [UIColor deepCarmine],
             [UIColor deepCarminePink],
             [UIColor deepCarrotOrange],
             [UIColor deepCerise],
             [UIColor deepChampagne],
             [UIColor deepChestnut],
             [UIColor deepCoffee],
             [UIColor deepFuchsia],
             [UIColor deepGreen],
             [UIColor deepGreenCyanTurquoise],
             [UIColor deepJungleGreen],
             [UIColor deepKoamaru],
             [UIColor deepLemon],
             [UIColor deepLilac],
             [UIColor deepMagenta],
             [UIColor deepMaroon],
             [UIColor deepMauve],
             [UIColor deepMossGreen],
             [UIColor deepPeach],
             [UIColor deepPink],
             [UIColor deepPuce],
             [UIColor deepRed],
             [UIColor deepRuby],
             [UIColor deepSaffron],
             [UIColor deepSkyBlue],
             [UIColor deepSpaceSparkle],
             [UIColor deepSpringBud],
             [UIColor deepTaupe],
             [UIColor deepTuscanRed],
             [UIColor deepViolet],
             [UIColor deer],
             [UIColor denim],
             [UIColor desaturatedCyan],
             [UIColor desert],
             [UIColor desertSand],
             [UIColor desire],
             [UIColor diamond],
             [UIColor dimGray],
             [UIColor dirt],
             [UIColor dodgerBlue],
             [UIColor dogwoodRose],
             [UIColor dollarBill],
             [UIColor donkeyBrown],
             [UIColor drab],
             [UIColor dukeBlue],
             [UIColor dustStorm],
             [UIColor dutchWhite],
             [UIColor earthYellow],
             [UIColor ebony],
             [UIColor ecru],
             [UIColor eerieBlack],
             [UIColor eggplant],
             [UIColor eggshell],
             [UIColor egyptianBlue],
             [UIColor electricBlue],
             [UIColor electricCrimson],
             [UIColor electricCyan],
             [UIColor electricGreen],
             [UIColor electricIndigo],
             [UIColor electricLavender],
             [UIColor electricLime],
             [UIColor electricPurple],
             [UIColor electricUltramarine],
             [UIColor electricViolet],
             [UIColor electricYellow],
             [UIColor emerald],
             [UIColor eminence],
             [UIColor englishGreen],
             [UIColor englishLavender],
             [UIColor englishRed],
             [UIColor englishViolet],
             [UIColor etonBlue],
             [UIColor eucalyptus],
             [UIColor fallow],
             [UIColor faluRed],
             [UIColor fandango],
             [UIColor fandangoPink],
             [UIColor fashionFuchsia],
             [UIColor fawn],
             [UIColor feldgrau],
             [UIColor feldspar],
             [UIColor fernGreen],
             [UIColor ferrariRed],
             [UIColor fieldDrab],
             [UIColor firebrick],
             [UIColor fireEngineRed],
             [UIColor flame],
             [UIColor flamingoPink],
             [UIColor flattery],
             [UIColor flavescent],
             [UIColor flax],
             [UIColor flirt],
             [UIColor floralWhite],
             [UIColor fluorescentOrange],
             [UIColor fluorescentPink],
             [UIColor fluorescentYellow],
             [UIColor folly],
             [UIColor forestGreenTraditional],
             [UIColor forestGreenWeb],
             [UIColor frenchBeige],
             [UIColor frenchBistre],
             [UIColor frenchBlue],
             [UIColor frenchFuchsia],
             [UIColor frenchLilac],
             [UIColor frenchLime],
             [UIColor frenchMauve],
             [UIColor frenchPink],
             [UIColor frenchPlum],
             [UIColor frenchPuce],
             [UIColor frenchRaspberry],
             [UIColor frenchRose],
             [UIColor frenchSkyBlue],
             [UIColor frenchViolet],
             [UIColor frenchWine],
             [UIColor freshAir],
             [UIColor fuchsia],
             [UIColor fuchsiaCrayola],
             [UIColor fuchsiaPink],
             [UIColor fuchsiaPurple],
             [UIColor fuchsiaRose],
             [UIColor fulvous],
             [UIColor fuzzyWuzzy],
             [UIColor gamboge],
             [UIColor gambogeOrangeBrown],
             [UIColor genericViridian],
             [UIColor ghostWhite],
             [UIColor giantsOrange],
             [UIColor grussrel],
             [UIColor glaucous],
             [UIColor glitter],
             [UIColor gOGreen],
             [UIColor goldMetallic],
             [UIColor goldWebGolden],
             [UIColor goldFusion],
             [UIColor goldenBrown],
             [UIColor goldenPoppy],
             [UIColor goldenYellow],
             [UIColor goldenrod],
             [UIColor grannySmithApple],
             [UIColor grape],
             [UIColor gray],
             [UIColor grayHTMLCSSGray],
             [UIColor grayX11Gray],
             [UIColor grayAsparagus],
             [UIColor grayBlue],
             [UIColor greenColorWheelX11Green],
             [UIColor greenCrayola],
             [UIColor greenHTMLCSSColor],
             [UIColor greenMunsell],
             [UIColor greenNCS],
             [UIColor greenPantone],
             [UIColor greenPigment],
             [UIColor greenRYB],
             [UIColor greenBlue],
             [UIColor greenCyan],
             [UIColor greenYellow],
             [UIColor grizzly],
             [UIColor grullo],
             [UIColor guppieGreen],
             [UIColor halayàÚbe],
             [UIColor hanBlue],
             [UIColor hanPurple],
             [UIColor hansaYellow],
             [UIColor harlequin],
             [UIColor harlequinGreen],
             [UIColor harvardCrimson],
             [UIColor harvestGold],
             [UIColor heartGold],
             [UIColor heliotrope],
             [UIColor heliotropeGray],
             [UIColor heliotropeMagenta],
             [UIColor hollywoodCerise],
             [UIColor honeydew],
             [UIColor honoluluBlue],
             [UIColor hookersGreen],
             [UIColor hotMagenta],
             [UIColor hotPink],
             [UIColor hunterGreen],
             [UIColor iceberg],
             [UIColor icterine],
             [UIColor illuminatingEmerald],
             [UIColor imperial],
             [UIColor imperialBlue],
             [UIColor imperialPurple],
             [UIColor imperialRed],
             [UIColor inchworm],
             [UIColor independence],
             [UIColor indiaGreen],
             [UIColor indianRed],
             [UIColor indianYellow],
             [UIColor indigo],
             [UIColor indigoDye],
             [UIColor indigoWeb],
             [UIColor internationalKleinBlue],
             [UIColor internationalOrangeAerospace],
             [UIColor internationalOrangeEngineering],
             [UIColor internationalOrangeGoldenGateBridge],
             [UIColor iris],
             [UIColor irresistible],
             [UIColor isabelline],
             [UIColor islamicGreen],
             [UIColor italianSkyBlue],
             [UIColor ivory],
             [UIColor jade],
             [UIColor japaneseCarmine],
             [UIColor japaneseIndigo],
             [UIColor japaneseViolet],
             [UIColor jasmine],
             [UIColor jasper],
             [UIColor jazzberryJam],
             [UIColor jellyBean],
             [UIColor jet],
             [UIColor jonquil],
             [UIColor jordyBlue],
             [UIColor juneBud],
             [UIColor jungleGreen],
             [UIColor kellyGreen],
             [UIColor kenyanCopper],
             [UIColor keppel],
             [UIColor jawadChickenColorHTMLCSSKhaki],
             [UIColor khakiX11LightKhaki],
             [UIColor kobe],
             [UIColor kobi],
             [UIColor kombuGreen],
             [UIColor kUCrimson],
             [UIColor laSalleGreen],
             [UIColor languidLavender],
             [UIColor lapisLazuli],
             [UIColor laserLemon],
             [UIColor laurelGreen],
             [UIColor lava],
             [UIColor lavenderFloral],
             [UIColor lavenderWeb],
             [UIColor lavenderBlue],
             [UIColor lavenderBlush],
             [UIColor lavenderGray],
             [UIColor lavenderIndigo],
             [UIColor lavenderMagenta],
             [UIColor lavenderMist],
             [UIColor lavenderPink],
             [UIColor lavenderPurple],
             [UIColor lavenderRose],
             [UIColor lawnGreen],
             [UIColor lemon],
             [UIColor lemonChiffon],
             [UIColor lemonCurry],
             [UIColor lemonGlacier],
             [UIColor lemonLime],
             [UIColor lemonMeringue],
             [UIColor lemonYellow],
             [UIColor lenurple],
             [UIColor licorice],
             [UIColor liberty],
             [UIColor lightApricot],
             [UIColor lightBlue],
             [UIColor lightBrilliantRed],
             [UIColor lightBrown],
             [UIColor lightCarminePink],
             [UIColor lightCobaltBlue],
             [UIColor lightCoral],
             [UIColor lightCornflowerBlue],
             [UIColor lightCrimson],
             [UIColor lightCyan],
             [UIColor lightDeepPink],
             [UIColor lightFrenchBeige],
             [UIColor lightFuchsiaPink],
             [UIColor lightGoldenrodYellow],
             [UIColor lightGray],
             [UIColor lightGrayishMagenta],
             [UIColor lightGreen],
             [UIColor lightHotPink],
             [UIColor lightKhaki],
             [UIColor lightMediumOrchid],
             [UIColor lightMossGreen],
             [UIColor lightOrchid],
             [UIColor lightPastelPurple],
             [UIColor lightPink],
             [UIColor lightRedOchre],
             [UIColor lightSalmon],
             [UIColor lightSalmonPink],
             [UIColor lightSeaGreen],
             [UIColor lightSkyBlue],
             [UIColor lightSlateGray],
             [UIColor lightSteelBlue],
             [UIColor lightTaupe],
             [UIColor lightThulianPink],
             [UIColor lightYellow],
             [UIColor lilac],
             [UIColor limeColorWheel],
             [UIColor limeWebX11Green],
             [UIColor limeGreen],
             [UIColor limerick],
             [UIColor lincolnGreen],
             [UIColor linen],
             [UIColor lion],
             [UIColor liseranPurple],
             [UIColor littleBoyBlue],
             [UIColor liver],
             [UIColor liverDogs],
             [UIColor liverOrgan],
             [UIColor liverChestnut],
             [UIColor livid],
             [UIColor lumber],
             [UIColor lust],
             [UIColor magenta],
             [UIColor magentaCrayola],
             [UIColor magentaDye],
             [UIColor magentaPantone],
             [UIColor magentaProcess],
             [UIColor magentaHaze],
             [UIColor magentaPink],
             [UIColor magicMint],
             [UIColor magnolia],
             [UIColor mahogany],
             [UIColor maize],
             [UIColor majorelleBlue],
             [UIColor malachite],
             [UIColor manatee],
             [UIColor mangoTango],
             [UIColor mantis],
             [UIColor mardiGras],
             [UIColor marigold],
             [UIColor maroonCrayola],
             [UIColor maroonHTMLCSS],
             [UIColor maroonX11],
             [UIColor mauve],
             [UIColor mauveTaupe],
             [UIColor mauvelous],
             [UIColor mayGreen],
             [UIColor mayaBlue],
             [UIColor meatBrown],
             [UIColor mediumAquamarine],
             [UIColor mediumBlue],
             [UIColor mediumCandyAppleRed],
             [UIColor mediumCarmine],
             [UIColor mediumChampagne],
             [UIColor mediumElectricBlue],
             [UIColor mediumJungleGreen],
             [UIColor mediumLavenderMagenta],
             [UIColor mediumOrchid],
             [UIColor mediumPersianBlue],
             [UIColor mediumPurple],
             [UIColor mediumRedViolet],
             [UIColor mediumRuby],
             [UIColor mediumSeaGreen],
             [UIColor mediumSkyBlue],
             [UIColor mediumSlateBlue],
             [UIColor mediumSpringBud],
             [UIColor mediumSpringGreen],
             [UIColor mediumTaupe],
             [UIColor mediumTurquoise],
             [UIColor mediumTuscanRed],
             [UIColor mediumVermilion],
             [UIColor mediumVioletRed],
             [UIColor mellowApricot],
             [UIColor mellowYellow],
             [UIColor melon],
             [UIColor metallicSeaweed],
             [UIColor metallicSunburst],
             [UIColor mexicanPink],
             [UIColor midnightBlue],
             [UIColor midnightGreenEagleGreen],
             [UIColor mikadoYellow],
             [UIColor mindaro],
             [UIColor ming],
             [UIColor mint],
             [UIColor mintCream],
             [UIColor mintGreen],
             [UIColor mistyRose],
             [UIColor moccasin],
             [UIColor modeBeige],
             [UIColor moonstoneBlue],
             [UIColor mordantRed19],
             [UIColor mossGreen],
             [UIColor mountainMeadow],
             [UIColor mountbattenPink],
             [UIColor mSUGreen],
             [UIColor mughalGreen],
             [UIColor mulberry],
             [UIColor mustard],
             [UIColor myrtleGreen],
             [UIColor nadeshikoPink],
             [UIColor napierGreen],
             [UIColor naplesYellow],
             [UIColor navajoWhite],
             [UIColor navy],
             [UIColor navyPurple],
             [UIColor neonCarrot],
             [UIColor neonFuchsia],
             [UIColor neonGreen],
             [UIColor newCar],
             [UIColor newYorkPink],
             [UIColor nonPhotoBlue],
             [UIColor northTexasGreen],
             [UIColor nyanza],
             [UIColor oceanBoatBlue],
             [UIColor ochre],
             [UIColor officeGreen],
             [UIColor oldBurgundy],
             [UIColor oldGold],
             [UIColor oldHeliotrope],
             [UIColor oldLace],
             [UIColor oldLavender],
             [UIColor oldMauve],
             [UIColor oldMossGreen],
             [UIColor oldRose],
             [UIColor oldSilver],
             [UIColor olive],
             [UIColor oliveDrab3],
             [UIColor oliveDrab7],
             [UIColor olivine],
             [UIColor onyx],
             [UIColor operaMauve],
             [UIColor orangeColorWheel],
             [UIColor orangeCrayola],
             [UIColor orangePantone],
             [UIColor orangeRYB],
             [UIColor orangeWeb],
             [UIColor orangePeel],
             [UIColor orangeRed],
             [UIColor orangeYellow],
             [UIColor orchid],
             [UIColor orchidPink],
             [UIColor oriolesOrange],
             [UIColor otterBrown],
             [UIColor outerSpace],
             [UIColor outrageousOrange],
             [UIColor oxfordBlue],
             [UIColor oUCrimsonRed],
             [UIColor pakistanGreen],
             [UIColor palatinateBlue],
             [UIColor palatinatePurple],
             [UIColor paleAqua],
             [UIColor paleBlue],
             [UIColor paleBrown],
             [UIColor paleCarmine],
             [UIColor paleCerulean],
             [UIColor paleChestnut],
             [UIColor paleCopper],
             [UIColor paleCornflowerBlue],
             [UIColor paleCyan],
             [UIColor paleGold],
             [UIColor paleGoldenrod],
             [UIColor paleGreen],
             [UIColor paleLavender],
             [UIColor paleMagenta],
             [UIColor paleMagentaPink],
             [UIColor palePink],
             [UIColor palePlum],
             [UIColor paleRedViolet],
             [UIColor paleRobinEggBlue],
             [UIColor paleSilver],
             [UIColor paleSpringBud],
             [UIColor paleTaupe],
             [UIColor paleTurquoise],
             [UIColor paleViolet],
             [UIColor paleVioletRed],
             [UIColor pansyPurple],
             [UIColor paoloVeroneseGreen],
             [UIColor papayaWhip],
             [UIColor paradisePink],
             [UIColor parisGreen],
             [UIColor pastelBlue],
             [UIColor pastelBrown],
             [UIColor pastelGray],
             [UIColor pastelGreen],
             [UIColor pastelMagenta],
             [UIColor pastelOrange],
             [UIColor pastelPink],
             [UIColor pastelPurple],
             [UIColor pastelRed],
             [UIColor pastelViolet],
             [UIColor pastelYellow],
             [UIColor patriarch],
             [UIColor paynesGrey],
             [UIColor peach],
             [UIColor peach2],
             [UIColor peachOrange],
             [UIColor peachPuff],
             [UIColor peachYellow],
             [UIColor pear],
             [UIColor pearl],
             [UIColor pearlAqua],
             [UIColor pearlyPurple],
             [UIColor peridot],
             [UIColor periwinkle],
             [UIColor persianBlue],
             [UIColor persianGreen],
             [UIColor persianIndigo],
             [UIColor persianOrange],
             [UIColor persianPink],
             [UIColor persianPlum],
             [UIColor persianRed],
             [UIColor persianRose],
             [UIColor persimmon],
             [UIColor peru],
             [UIColor phlox],
             [UIColor phthaloBlue],
             [UIColor phthaloGreen],
             [UIColor pictonBlue],
             [UIColor pictorialCarmine],
             [UIColor piggyPink],
             [UIColor pineGreen],
             [UIColor pineapple],
             [UIColor pink],
             [UIColor pinkPantone],
             [UIColor pinkLace],
             [UIColor pinkLavender],
             [UIColor pinkOrange],
             [UIColor pinkPearl],
             [UIColor pinkRaspberry],
             [UIColor pinkSherbet],
             [UIColor pistachio],
             [UIColor platinum],
             [UIColor plum],
             [UIColor plumWeb],
             [UIColor pompAndPower],
             [UIColor popstar],
             [UIColor portlandOrange],
             [UIColor powderBlue],
             [UIColor princetonOrange],
             [UIColor prune],
             [UIColor prussianBlue],
             [UIColor psychedelicPurple],
             [UIColor puce],
             [UIColor puceRed],
             [UIColor pullmanBrownUPSBrown],
             [UIColor pullmanGreen],
             [UIColor pumpkin],
             [UIColor purpleHTML],
             [UIColor purpleMunsell],
             [UIColor purpleX11],
             [UIColor purpleHeart],
             [UIColor purpleMountainMajesty],
             [UIColor purpleNavy],
             [UIColor purplePizzazz],
             [UIColor purpleTaupe],
             [UIColor purpureus],
             [UIColor quartz],
             [UIColor queenBlue],
             [UIColor queenPink],
             [UIColor quinacridoneMagenta],
             [UIColor rackley],
             [UIColor radicalRed],
             [UIColor rajah],
             [UIColor raspberry],
             [UIColor raspberryGlace],
             [UIColor raspberryPink],
             [UIColor raspberryRose],
             [UIColor rawUmber],
             [UIColor razzleDazzleRose],
             [UIColor razzmatazz],
             [UIColor razzmicBerry],
             [UIColor rebeccaPurple],
             [UIColor red],
             [UIColor redCrayola],
             [UIColor redMunsell],
             [UIColor redNCS],
             [UIColor redPantone],
             [UIColor redPigment],
             [UIColor redRYB],
             [UIColor redBrown],
             [UIColor redDevil],
             [UIColor redOrange],
             [UIColor redPurple],
             [UIColor redViolet],
             [UIColor redwood],
             [UIColor regalia],
             [UIColor registrationBlack],
             [UIColor resolutionBlue],
             [UIColor rhythm],
             [UIColor richBlack],
             [UIColor richBlackFOGRA29],
             [UIColor richBlackFOGRA39],
             [UIColor richBrilliantLavender],
             [UIColor richCarmine],
             [UIColor richElectricBlue],
             [UIColor richLavender],
             [UIColor richLilac],
             [UIColor richMaroon],
             [UIColor rifleGreen],
             [UIColor roastCoffee],
             [UIColor robinEggBlue],
             [UIColor rocketMetallic],
             [UIColor romanSilver],
             [UIColor rose],
             [UIColor roseBonbon],
             [UIColor roseEbony],
             [UIColor roseGold],
             [UIColor roseMadder],
             [UIColor rosePink],
             [UIColor roseQuartz],
             [UIColor roseRed],
             [UIColor roseTaupe],
             [UIColor roseVale],
             [UIColor rosewood],
             [UIColor rossoCorsa],
             [UIColor rosyBrown],
             [UIColor royalAzure],
             [UIColor royalBlue],
             [UIColor royalBlue],
             [UIColor royalFuchsia],
             [UIColor royalPurple],
             [UIColor royalYellow],
             [UIColor ruber],
             [UIColor rubineRed],
             [UIColor ruby],
             [UIColor rubyRed],
             [UIColor ruddy],
             [UIColor ruddyBrown],
             [UIColor ruddyPink],
             [UIColor rufous],
             [UIColor russet],
             [UIColor russianGreen],
             [UIColor russianViolet],
             [UIColor rust],
             [UIColor rustyRed],
             [UIColor sacramentoStateGreen],
             [UIColor saddleBrown],
             [UIColor safetyOrange],
             [UIColor safetyOrangeBlazeOrange],
             [UIColor safetyYellow],
             [UIColor saffron],
             [UIColor sage],
             [UIColor stPatricksBlue],
             [UIColor salmon],
             [UIColor salmonPink],
             [UIColor sand],
             [UIColor sandDune],
             [UIColor sandstorm],
             [UIColor sandyBrown],
             [UIColor sandyTaupe],
             [UIColor sangria],
             [UIColor sapGreen],
             [UIColor sapphire],
             [UIColor sapphireBlue],
             [UIColor satinSheenGold],
             [UIColor scarlet],
             [UIColor scarlet2],
             [UIColor schaussPink],
             [UIColor schoolBusYellow],
             [UIColor screaminGreen],
             [UIColor seaBlue],
             [UIColor seaGreen],
             [UIColor sealBrown],
             [UIColor seashell],
             [UIColor selectiveYellow],
             [UIColor sepia],
             [UIColor shadow],
             [UIColor shadowBlue],
             [UIColor shampoo],
             [UIColor shamrockGreen],
             [UIColor sheenGreen],
             [UIColor shimmeringBlush],
             [UIColor shockingPink],
             [UIColor shockingPinkCrayola],
             [UIColor sienna],
             [UIColor silver],
             [UIColor silverChalice],
             [UIColor silverLakeBlue],
             [UIColor silverPink],
             [UIColor silverSand],
             [UIColor sinopia],
             [UIColor skobeloff],
             [UIColor skyBlue],
             [UIColor skyMagenta],
             [UIColor slateBlue],
             [UIColor slateGray],
             [UIColor smaltDarkPowderBlue],
             [UIColor smitten],
             [UIColor smoke],
             [UIColor smokyBlack],
             [UIColor smokyTopaz],
             [UIColor snow],
             [UIColor soap],
             [UIColor solidPink],
             [UIColor sonicSilver],
             [UIColor spartanCrimson],
             [UIColor spaceCadet],
             [UIColor spanishBistre],
             [UIColor spanishBlue],
             [UIColor spanishCarmine],
             [UIColor spanishCrimson],
             [UIColor spanishGray],
             [UIColor spanishGreen],
             [UIColor spanishOrange],
             [UIColor spanishPink],
             [UIColor spanishRed],
             [UIColor spanishSkyBlue],
             [UIColor spanishViolet],
             [UIColor spanishViridian],
             [UIColor spicyMix],
             [UIColor spiroDiscoBall],
             [UIColor springBud],
             [UIColor springGreen],
             [UIColor starCommandBlue],
             [UIColor steelBlue],
             [UIColor steelPink],
             [UIColor stilDeGrainYellow],
             [UIColor stizza],
             [UIColor stormcloud],
             [UIColor straw],
             [UIColor strawberry],
             [UIColor sunglow],
             [UIColor sunray],
             [UIColor sunset],
             [UIColor sunsetOrange],
             [UIColor superPink],
             [UIColor tan],
             [UIColor tangelo],
             [UIColor tangerine],
             [UIColor tangerineYellow],
             [UIColor tangoPink],
             [UIColor taupe],
             [UIColor taupeGray],
             [UIColor teaGreen],
             [UIColor teaRose],
             [UIColor teaRose],
             [UIColor teal],
             [UIColor tealBlue],
             [UIColor tealDeer],
             [UIColor tealGreen],
             [UIColor telemagenta],
             [UIColor tenne],
             [UIColor terraCotta],
             [UIColor thistle],
             [UIColor thulianPink],
             [UIColor tickleMePink],
             [UIColor tiffanyBlue],
             [UIColor tigersEye],
             [UIColor timberwolf],
             [UIColor titaniumYellow],
             [UIColor tomato],
             [UIColor toolbox],
             [UIColor topaz],
             [UIColor tractorRed],
             [UIColor trolleyGrey],
             [UIColor tropicalRainForest],
             [UIColor trueBlue],
             [UIColor tuftsBlue],
             [UIColor tulip],
             [UIColor tumbleweed],
             [UIColor turkishRose],
             [UIColor turquoise],
             [UIColor turquoiseBlue],
             [UIColor turquoiseGreen],
             [UIColor tuscan],
             [UIColor tuscanBrown],
             [UIColor tuscanRed],
             [UIColor tuscanTan],
             [UIColor tuscany],
             [UIColor twilightLavender],
             [UIColor tyrianPurple],
             [UIColor uABlue],
             [UIColor uARed],
             [UIColor ube],
             [UIColor uCLABlue],
             [UIColor uCLAGold],
             [UIColor uFOGreen],
             [UIColor ultramarine],
             [UIColor ultramarineBlue],
             [UIColor ultraPink],
             [UIColor ultraRed],
             [UIColor umber],
             [UIColor unbleachedSilk],
             [UIColor unitedNationsBlue],
             [UIColor universityOfCaliforniaGold],
             [UIColor unmellowYellow],
             [UIColor uPForestGreen],
             [UIColor uPMaroon],
             [UIColor upsdellRed],
             [UIColor urobilin],
             [UIColor uSAFABlue],
             [UIColor uSCCardinal],
             [UIColor uSCGold],
             [UIColor universityOfTennesseeOrange],
             [UIColor utahCrimson],
             [UIColor vanilla],
             [UIColor vanillaIce],
             [UIColor vegasGold],
             [UIColor venetianRed],
             [UIColor verdigris],
             [UIColor vermilion],
             [UIColor vermilion2],
             [UIColor veronica],
             [UIColor veryLightAzure],
             [UIColor veryLightBlue],
             [UIColor veryLightMalachiteGreen],
             [UIColor veryLightTangelo],
             [UIColor veryPaleOrange],
             [UIColor veryPaleYellow],
             [UIColor violet],
             [UIColor violetColorWheel],
             [UIColor violetRYB],
             [UIColor violetWeb],
             [UIColor violetBlue],
             [UIColor violetRed],
             [UIColor viridian],
             [UIColor viridianGreen],
             [UIColor vistaBlue],
             [UIColor vividAmber],
             [UIColor vividAuburn],
             [UIColor vividBurgundy],
             [UIColor vividCerise],
             [UIColor vividCerulean],
             [UIColor vividCrimson],
             [UIColor vividGamboge],
             [UIColor vividLimeGreen],
             [UIColor vividMalachite],
             [UIColor vividMulberry],
             [UIColor vividOrange],
             [UIColor vividOrangePeel],
             [UIColor vividOrchid],
             [UIColor vividRaspberry],
             [UIColor vividRed],
             [UIColor vividRedTangelo],
             [UIColor vividSkyBlue],
             [UIColor vividTangelo],
             [UIColor vividTangerine],
             [UIColor vividVermilion],
             [UIColor vividViolet],
             [UIColor vividYellow],
             [UIColor warmBlack],
             [UIColor waterspout],
             [UIColor wenge],
             [UIColor wheat],
             [UIColor white],
             [UIColor whiteSmoke],
             [UIColor wildBlueYonder],
             [UIColor wildOrchid],
             [UIColor wildStrawberry],
             [UIColor wildWatermelon],
             [UIColor willpowerOrange],
             [UIColor windsorTan],
             [UIColor wine],
             [UIColor wineDregs],
             [UIColor wisteria],
             [UIColor woodBrown],
             [UIColor xanadu],
             [UIColor yaleBlue],
             [UIColor yankeesBlue],
             [UIColor yellow],
             [UIColor yellowCrayola],
             [UIColor yellowMunsell],
             [UIColor yellowNCS],
             [UIColor yellowPantone],
             [UIColor yellowProcess],
             [UIColor yellowRYB],
             [UIColor yellowGreen],
             [UIColor yellowOrange],
             [UIColor yellowRose],
             [UIColor zaffre],
             [UIColor zinnwalditeBrown],
             [UIColor zomp],
             [UIColor blackColor],
             [UIColor darkGrayColor],
             [UIColor lightGrayColor],
             [UIColor lightGrayColor],
             [UIColor whiteColor],
             [UIColor grayColor],
             [UIColor redColor],
             [UIColor greenColor],
             [UIColor blueColor],
             [UIColor cyanColor],
             [UIColor yellowColor],
             [UIColor magentaColor],
             [UIColor orangeColor],
             [UIColor purpleColor],
             [UIColor brownColor],
             [UIColor clearColor]];
}

+ (NSDictionary *)allColorsDictionary {
    return @{@"acidgreen" : [UIColor acidGreen],
             @"aero" : [UIColor aero],
             @"aeroblue" : [UIColor aeroBlue],
             @"africanviolet" : [UIColor africanViolet],
             @"airforceblueraf" : [UIColor airForceBlueRAF],
             @"airforceblueusaf" : [UIColor airForceBlueUSAF],
             @"airsuperiorityblue" : [UIColor airSuperiorityBlue],
             @"alabamacrimson" : [UIColor alabamaCrimson],
             @"aliceblue" : [UIColor aliceBlue],
             @"alizarincrimson" : [UIColor alizarinCrimson],
             @"alloyorange" : [UIColor alloyOrange],
             @"almond" : [UIColor almond],
             @"amaranth" : [UIColor amaranth],
             @"amaranthdeeppurple" : [UIColor amaranthDeepPurple],
             @"amaranthpink" : [UIColor amaranthPink],
             @"amaranthpurple" : [UIColor amaranthPurple],
             @"amaranthred" : [UIColor amaranthRed],
             @"amazon" : [UIColor amazon],
             @"amber" : [UIColor amber],
             @"ambersaeece" : [UIColor amberSAEECE],
             @"americanrose" : [UIColor americanRose],
             @"amethyst" : [UIColor amethyst],
             @"androidgreen" : [UIColor androidGreen],
             @"antiflashwhite" : [UIColor antiFlashWhite],
             @"antiquebrass" : [UIColor antiqueBrass],
             @"antiquebronze" : [UIColor antiqueBronze],
             @"antiquefuchsia" : [UIColor antiqueFuchsia],
             @"antiqueruby" : [UIColor antiqueRuby],
             @"antiquewhite" : [UIColor antiqueWhite],
             @"aoenglish" : [UIColor aoEnglish],
             @"applegreen" : [UIColor appleGreen],
             @"apricot" : [UIColor apricot],
             @"aqua" : [UIColor aqua],
             @"aquamarine" : [UIColor aquamarine],
             @"armygreen" : [UIColor armyGreen],
             @"arsenic" : [UIColor arsenic],
             @"artichoke" : [UIColor artichoke],
             @"arylideyellow" : [UIColor arylideYellow],
             @"ashgrey" : [UIColor ashGrey],
             @"asparagus" : [UIColor asparagus],
             @"atomictangerine" : [UIColor atomicTangerine],
             @"auburn" : [UIColor auburn],
             @"aureolin" : [UIColor aureolin],
             @"aurometalsaurus" : [UIColor auroMetalSaurus],
             @"avocado" : [UIColor avocado],
             @"azure" : [UIColor azure],
             @"azurewebcolor" : [UIColor azureWebColor],
             @"azuremist" : [UIColor azureMist],
             @"azureishwhite" : [UIColor azureishWhite],
             @"babyblue" : [UIColor babyBlue],
             @"babyblueeyes" : [UIColor babyBlueEyes],
             @"babypink" : [UIColor babyPink],
             @"babypowder" : [UIColor babyPowder],
             @"bakermillerpink" : [UIColor bakerMillerPink],
             @"ballblue" : [UIColor ballBlue],
             @"bananamania" : [UIColor bananaMania],
             @"bananayellow" : [UIColor bananaYellow],
             @"bangladeshgreen" : [UIColor bangladeshGreen],
             @"barbiepink" : [UIColor barbiePink],
             @"barnred" : [UIColor barnRed],
             @"battleshipgrey" : [UIColor battleshipGrey],
             @"bazaar" : [UIColor bazaar],
             @"beaublue" : [UIColor beauBlue],
             @"beaver" : [UIColor beaver],
             @"beige" : [UIColor beige],
             @"bdazzledblue" : [UIColor bdazzledBlue],
             @"bigdiporuby" : [UIColor bigDipOruby],
             @"bisque" : [UIColor bisque],
             @"bistre" : [UIColor bistre],
             @"bistrebrown" : [UIColor bistreBrown],
             @"bitterlemon" : [UIColor bitterLemon],
             @"bitterlime" : [UIColor bitterLime],
             @"bittersweet" : [UIColor bittersweet],
             @"bittersweetshimmer" : [UIColor bittersweetShimmer],
             @"black" : [UIColor black],
             @"blackbean" : [UIColor blackBean],
             @"blackleatherjacket" : [UIColor blackLeatherJacket],
             @"blackolive" : [UIColor blackOlive],
             @"blanchedalmond" : [UIColor blanchedAlmond],
             @"blastoffbronze" : [UIColor blastOffBronze],
             @"bleudefrance" : [UIColor bleuDeFrance],
             @"blizzardblue" : [UIColor blizzardBlue],
             @"blond" : [UIColor blond],
             @"blue" : [UIColor blue],
             @"bluecrayola" : [UIColor blueCrayola],
             @"bluemunsell" : [UIColor blueMunsell],
             @"bluencs" : [UIColor blueNCS],
             @"bluepantone" : [UIColor bluePantone],
             @"bluepigment" : [UIColor bluePigment],
             @"blueryb" : [UIColor blueRYB],
             @"bluebell" : [UIColor blueBell],
             @"bluegray" : [UIColor blueGray],
             @"bluegreen" : [UIColor blueGreen],
             @"bluelagoon" : [UIColor blueLagoon],
             @"bluemagentaviolet" : [UIColor blueMagentaViolet],
             @"bluesapphire" : [UIColor blueSapphire],
             @"blueviolet" : [UIColor blueViolet],
             @"blueyonder" : [UIColor blueYonder],
             @"blueberry" : [UIColor blueberry],
             @"bluebonnet" : [UIColor bluebonnet],
             @"blush" : [UIColor blush],
             @"bole" : [UIColor bole],
             @"bondiblue" : [UIColor bondiBlue],
             @"bone" : [UIColor bone],
             @"bostonuniversityred" : [UIColor bostonUniversityRed],
             @"bottlegreen" : [UIColor bottleGreen],
             @"boysenberry" : [UIColor boysenberry],
             @"brandeisblue" : [UIColor brandeisBlue],
             @"brass" : [UIColor brass],
             @"brickred" : [UIColor brickRed],
             @"brightcerulean" : [UIColor brightCerulean],
             @"brightgreen" : [UIColor brightGreen],
             @"brightlavender" : [UIColor brightLavender],
             @"brightlilac" : [UIColor brightLilac],
             @"brightmaroon" : [UIColor brightMaroon],
             @"brightnavyblue" : [UIColor brightNavyBlue],
             @"brightpink" : [UIColor brightPink],
             @"brightturquoise" : [UIColor brightTurquoise],
             @"brightube" : [UIColor brightUbe],
             @"brilliantazure" : [UIColor brilliantAzure],
             @"brilliantlavender" : [UIColor brilliantLavender],
             @"brilliantrose" : [UIColor brilliantRose],
             @"brinkpink" : [UIColor brinkPink],
             @"britishracinggreen" : [UIColor britishRacingGreen],
             @"bronze" : [UIColor bronze],
             @"bronzeyellow" : [UIColor bronzeYellow],
             @"browntraditional" : [UIColor brownTraditional],
             @"brownweb" : [UIColor brownWeb],
             @"brownnose" : [UIColor brownNose],
             @"brownyellow" : [UIColor brownYellow],
             @"brunswickgreen" : [UIColor brunswickGreen],
             @"bubblegum" : [UIColor bubbleGum],
             @"bubbles" : [UIColor bubbles],
             @"buff" : [UIColor buff],
             @"budgreen" : [UIColor budGreen],
             @"bulgarianrose" : [UIColor bulgarianRose],
             @"burgundy" : [UIColor burgundy],
             @"burlywood" : [UIColor burlywood],
             @"burntorange" : [UIColor burntOrange],
             @"burntsienna" : [UIColor burntSienna],
             @"burntumber" : [UIColor burntUmber],
             @"byzantine" : [UIColor byzantine],
             @"byzantium" : [UIColor byzantium],
             @"cadet" : [UIColor cadet],
             @"cadetblue" : [UIColor cadetBlue],
             @"cadetgrey" : [UIColor cadetGrey],
             @"cadmiumgreen" : [UIColor cadmiumGreen],
             @"cadmiumorange" : [UIColor cadmiumOrange],
             @"cadmiumred" : [UIColor cadmiumRed],
             @"cadmiumyellow" : [UIColor cadmiumYellow],
             @"caféaulait" : [UIColor caféAuLait],
             @"cafénoir" : [UIColor caféNoir],
             @"calpolygreen" : [UIColor calPolyGreen],
             @"cambridgeblue" : [UIColor cambridgeBlue],
             @"camel" : [UIColor camel],
             @"cameopink" : [UIColor cameoPink],
             @"camouflagegreen" : [UIColor camouflageGreen],
             @"canaryyellow" : [UIColor canaryYellow],
             @"candyapplered" : [UIColor candyAppleRed],
             @"candypink" : [UIColor candyPink],
             @"capri" : [UIColor capri],
             @"caputmortuum" : [UIColor caputMortuum],
             @"cardinal" : [UIColor cardinal],
             @"caribbeangreen" : [UIColor caribbeanGreen],
             @"carmine" : [UIColor carmine],
             @"carminemp" : [UIColor carmineMP],
             @"carminepink" : [UIColor carminePink],
             @"carminered" : [UIColor carmineRed],
             @"carnationpink" : [UIColor carnationPink],
             @"carnelian" : [UIColor carnelian],
             @"carolinablue" : [UIColor carolinaBlue],
             @"carrotorange" : [UIColor carrotOrange],
             @"castletongreen" : [UIColor castletonGreen],
             @"catalinablue" : [UIColor catalinaBlue],
             @"catawba" : [UIColor catawba],
             @"cedarchest" : [UIColor cedarChest],
             @"ceil" : [UIColor ceil],
             @"celadon" : [UIColor celadon],
             @"celadonblue" : [UIColor celadonBlue],
             @"celadongreen" : [UIColor celadonGreen],
             @"celeste" : [UIColor celeste],
             @"celestialblue" : [UIColor celestialBlue],
             @"cerise" : [UIColor cerise],
             @"cerisepink" : [UIColor cerisePink],
             @"cerulean" : [UIColor cerulean],
             @"ceruleanblue" : [UIColor ceruleanBlue],
             @"ceruleanfrost" : [UIColor ceruleanFrost],
             @"cgblue" : [UIColor cGBlue],
             @"cgred" : [UIColor cGRed],
             @"chamoisee" : [UIColor chamoisee],
             @"champagne" : [UIColor champagne],
             @"charcoal" : [UIColor charcoal],
             @"charlestongreen" : [UIColor charlestonGreen],
             @"charmpink" : [UIColor charmPink],
             @"chartreusetraditional" : [UIColor chartreuseTraditional],
             @"chartreuseweb" : [UIColor chartreuseWeb],
             @"cherry" : [UIColor cherry],
             @"cherryblossompink" : [UIColor cherryBlossomPink],
             @"chestnut" : [UIColor chestnut],
             @"chinapink" : [UIColor chinaPink],
             @"chinarose" : [UIColor chinaRose],
             @"chinesered" : [UIColor chineseRed],
             @"chineseviolet" : [UIColor chineseViolet],
             @"chocolatetraditional" : [UIColor chocolateTraditional],
             @"chocolateweb" : [UIColor chocolateWeb],
             @"chromeyellow" : [UIColor chromeYellow],
             @"cinereous" : [UIColor cinereous],
             @"cinnabar" : [UIColor cinnabar],
             @"cinnamoncitationneeded" : [UIColor cinnamonCitationNeeded],
             @"citrine" : [UIColor citrine],
             @"citron" : [UIColor citron],
             @"claret" : [UIColor claret],
             @"classicrose" : [UIColor classicRose],
             @"cobaltblue" : [UIColor cobaltBlue],
             @"cocoabrown" : [UIColor cocoaBrown],
             @"coconut" : [UIColor coconut],
             @"coffee" : [UIColor coffee],
             @"columbiablue" : [UIColor columbiaBlue],
             @"congopink" : [UIColor congoPink],
             @"coolblack" : [UIColor coolBlack],
             @"coolgrey" : [UIColor coolGrey],
             @"copper" : [UIColor copper],
             @"coppercrayola" : [UIColor copperCrayola],
             @"copperpenny" : [UIColor copperPenny],
             @"copperred" : [UIColor copperRed],
             @"copperrose" : [UIColor copperRose],
             @"coquelicot" : [UIColor coquelicot],
             @"coral" : [UIColor coral],
             @"coralpink" : [UIColor coralPink],
             @"coralred" : [UIColor coralRed],
             @"cordovan" : [UIColor cordovan],
             @"corn" : [UIColor corn],
             @"cornellred" : [UIColor cornellRed],
             @"cornflowerblue" : [UIColor cornflowerBlue],
             @"cornsilk" : [UIColor cornsilk],
             @"cosmiclatte" : [UIColor cosmicLatte],
             @"coyotebrown" : [UIColor coyoteBrown],
             @"cottoncandy" : [UIColor cottonCandy],
             @"cream" : [UIColor cream],
             @"crimson" : [UIColor crimson],
             @"crimsonglory" : [UIColor crimsonGlory],
             @"crimsonred" : [UIColor crimsonRed],
             @"cyan" : [UIColor cyan],
             @"cyanazure" : [UIColor cyanAzure],
             @"cyanblueazure" : [UIColor cyanBlueAzure],
             @"cyancobaltblue" : [UIColor cyanCobaltBlue],
             @"cyancornflowerblue" : [UIColor cyanCornflowerBlue],
             @"cyanprocess" : [UIColor cyanProcess],
             @"cybergrape" : [UIColor cyberGrape],
             @"cyberyellow" : [UIColor cyberYellow],
             @"daffodil" : [UIColor daffodil],
             @"dandelion" : [UIColor dandelion],
             @"darkblue" : [UIColor darkBlue],
             @"darkbluegray" : [UIColor darkBlueGray],
             @"darkbrown" : [UIColor darkBrown],
             @"darkbrowntangelo" : [UIColor darkBrownTangelo],
             @"darkbyzantium" : [UIColor darkByzantium],
             @"darkcandyapplered" : [UIColor darkCandyAppleRed],
             @"darkcerulean" : [UIColor darkCerulean],
             @"darkchestnut" : [UIColor darkChestnut],
             @"darkcoral" : [UIColor darkCoral],
             @"darkcyan" : [UIColor darkCyan],
             @"darkelectricblue" : [UIColor darkElectricBlue],
             @"darkgoldenrod" : [UIColor darkGoldenrod],
             @"darkgrayx11" : [UIColor darkGrayX11],
             @"darkgreen" : [UIColor darkGreen],
             @"darkgreenx11" : [UIColor darkGreenX11],
             @"darkimperialblue" : [UIColor darkImperialBlue],
             @"darkimperialblue2" : [UIColor darkImperialBlue2],
             @"darkjunglegreen" : [UIColor darkJungleGreen],
             @"darkkhaki" : [UIColor darkKhaki],
             @"darklava" : [UIColor darkLava],
             @"darklavender" : [UIColor darkLavender],
             @"darkliver" : [UIColor darkLiver],
             @"darkliverhorses" : [UIColor darkLiverHorses],
             @"darkmagenta" : [UIColor darkMagenta],
             @"darkmediumgray" : [UIColor darkMediumGray],
             @"darkmidnightblue" : [UIColor darkMidnightBlue],
             @"darkmossgreen" : [UIColor darkMossGreen],
             @"darkolivegreen" : [UIColor darkOliveGreen],
             @"darkorange" : [UIColor darkOrange],
             @"darkorchid" : [UIColor darkOrchid],
             @"darkpastelblue" : [UIColor darkPastelBlue],
             @"darkpastelgreen" : [UIColor darkPastelGreen],
             @"darkpastelpurple" : [UIColor darkPastelPurple],
             @"darkpastelred" : [UIColor darkPastelRed],
             @"darkpink" : [UIColor darkPink],
             @"darkpowderblue" : [UIColor darkPowderBlue],
             @"darkpuce" : [UIColor darkPuce],
             @"darkpurple" : [UIColor darkPurple],
             @"darkraspberry" : [UIColor darkRaspberry],
             @"darkred" : [UIColor darkRed],
             @"darksalmon" : [UIColor darkSalmon],
             @"darkscarlet" : [UIColor darkScarlet],
             @"darkseagreen" : [UIColor darkSeaGreen],
             @"darksienna" : [UIColor darkSienna],
             @"darkskyblue" : [UIColor darkSkyBlue],
             @"darkslateblue" : [UIColor darkSlateBlue],
             @"darkslategray" : [UIColor darkSlateGray],
             @"darkspringgreen" : [UIColor darkSpringGreen],
             @"darktan" : [UIColor darkTan],
             @"darktangerine" : [UIColor darkTangerine],
             @"darktaupe" : [UIColor darkTaupe],
             @"darkterracotta" : [UIColor darkTerraCotta],
             @"darkturquoise" : [UIColor darkTurquoise],
             @"darkvanilla" : [UIColor darkVanilla],
             @"darkviolet" : [UIColor darkViolet],
             @"darkyellow" : [UIColor darkYellow],
             @"dartmouthgreen" : [UIColor dartmouthGreen],
             @"davysgrey" : [UIColor davysGrey],
             @"debianred" : [UIColor debianRed],
             @"deepaquamarine" : [UIColor deepAquamarine],
             @"deepcarmine" : [UIColor deepCarmine],
             @"deepcarminepink" : [UIColor deepCarminePink],
             @"deepcarrotorange" : [UIColor deepCarrotOrange],
             @"deepcerise" : [UIColor deepCerise],
             @"deepchampagne" : [UIColor deepChampagne],
             @"deepchestnut" : [UIColor deepChestnut],
             @"deepcoffee" : [UIColor deepCoffee],
             @"deepfuchsia" : [UIColor deepFuchsia],
             @"deepgreen" : [UIColor deepGreen],
             @"deepgreencyanturquoise" : [UIColor deepGreenCyanTurquoise],
             @"deepjunglegreen" : [UIColor deepJungleGreen],
             @"deepkoamaru" : [UIColor deepKoamaru],
             @"deeplemon" : [UIColor deepLemon],
             @"deeplilac" : [UIColor deepLilac],
             @"deepmagenta" : [UIColor deepMagenta],
             @"deepmaroon" : [UIColor deepMaroon],
             @"deepmauve" : [UIColor deepMauve],
             @"deepmossgreen" : [UIColor deepMossGreen],
             @"deeppeach" : [UIColor deepPeach],
             @"deeppink" : [UIColor deepPink],
             @"deeppuce" : [UIColor deepPuce],
             @"deepred" : [UIColor deepRed],
             @"deepruby" : [UIColor deepRuby],
             @"deepsaffron" : [UIColor deepSaffron],
             @"deepskyblue" : [UIColor deepSkyBlue],
             @"deepspacesparkle" : [UIColor deepSpaceSparkle],
             @"deepspringbud" : [UIColor deepSpringBud],
             @"deeptaupe" : [UIColor deepTaupe],
             @"deeptuscanred" : [UIColor deepTuscanRed],
             @"deepviolet" : [UIColor deepViolet],
             @"deer" : [UIColor deer],
             @"denim" : [UIColor denim],
             @"desaturatedcyan" : [UIColor desaturatedCyan],
             @"desert" : [UIColor desert],
             @"desertsand" : [UIColor desertSand],
             @"desire" : [UIColor desire],
             @"diamond" : [UIColor diamond],
             @"dimgray" : [UIColor dimGray],
             @"dirt" : [UIColor dirt],
             @"dodgerblue" : [UIColor dodgerBlue],
             @"dogwoodrose" : [UIColor dogwoodRose],
             @"dollarbill" : [UIColor dollarBill],
             @"donkeybrown" : [UIColor donkeyBrown],
             @"drab" : [UIColor drab],
             @"dukeblue" : [UIColor dukeBlue],
             @"duststorm" : [UIColor dustStorm],
             @"dutchwhite" : [UIColor dutchWhite],
             @"earthyellow" : [UIColor earthYellow],
             @"ebony" : [UIColor ebony],
             @"ecru" : [UIColor ecru],
             @"eerieblack" : [UIColor eerieBlack],
             @"eggplant" : [UIColor eggplant],
             @"eggshell" : [UIColor eggshell],
             @"egyptianblue" : [UIColor egyptianBlue],
             @"electricblue" : [UIColor electricBlue],
             @"electriccrimson" : [UIColor electricCrimson],
             @"electriccyan" : [UIColor electricCyan],
             @"electricgreen" : [UIColor electricGreen],
             @"electricindigo" : [UIColor electricIndigo],
             @"electriclavender" : [UIColor electricLavender],
             @"electriclime" : [UIColor electricLime],
             @"electricpurple" : [UIColor electricPurple],
             @"electricultramarine" : [UIColor electricUltramarine],
             @"electricviolet" : [UIColor electricViolet],
             @"electricyellow" : [UIColor electricYellow],
             @"emerald" : [UIColor emerald],
             @"eminence" : [UIColor eminence],
             @"englishgreen" : [UIColor englishGreen],
             @"englishlavender" : [UIColor englishLavender],
             @"englishred" : [UIColor englishRed],
             @"englishviolet" : [UIColor englishViolet],
             @"etonblue" : [UIColor etonBlue],
             @"eucalyptus" : [UIColor eucalyptus],
             @"fallow" : [UIColor fallow],
             @"falured" : [UIColor faluRed],
             @"fandango" : [UIColor fandango],
             @"fandangopink" : [UIColor fandangoPink],
             @"fashionfuchsia" : [UIColor fashionFuchsia],
             @"fawn" : [UIColor fawn],
             @"feldgrau" : [UIColor feldgrau],
             @"feldspar" : [UIColor feldspar],
             @"ferngreen" : [UIColor fernGreen],
             @"ferrarired" : [UIColor ferrariRed],
             @"fielddrab" : [UIColor fieldDrab],
             @"firebrick" : [UIColor firebrick],
             @"fireenginered" : [UIColor fireEngineRed],
             @"flame" : [UIColor flame],
             @"flamingopink" : [UIColor flamingoPink],
             @"flattery" : [UIColor flattery],
             @"flavescent" : [UIColor flavescent],
             @"flax" : [UIColor flax],
             @"flirt" : [UIColor flirt],
             @"floralwhite" : [UIColor floralWhite],
             @"fluorescentorange" : [UIColor fluorescentOrange],
             @"fluorescentpink" : [UIColor fluorescentPink],
             @"fluorescentyellow" : [UIColor fluorescentYellow],
             @"folly" : [UIColor folly],
             @"forestgreentraditional" : [UIColor forestGreenTraditional],
             @"forestgreenweb" : [UIColor forestGreenWeb],
             @"frenchbeige" : [UIColor frenchBeige],
             @"frenchbistre" : [UIColor frenchBistre],
             @"frenchblue" : [UIColor frenchBlue],
             @"frenchfuchsia" : [UIColor frenchFuchsia],
             @"frenchlilac" : [UIColor frenchLilac],
             @"frenchlime" : [UIColor frenchLime],
             @"frenchmauve" : [UIColor frenchMauve],
             @"frenchpink" : [UIColor frenchPink],
             @"frenchplum" : [UIColor frenchPlum],
             @"frenchpuce" : [UIColor frenchPuce],
             @"frenchraspberry" : [UIColor frenchRaspberry],
             @"frenchrose" : [UIColor frenchRose],
             @"frenchskyblue" : [UIColor frenchSkyBlue],
             @"frenchviolet" : [UIColor frenchViolet],
             @"frenchwine" : [UIColor frenchWine],
             @"freshair" : [UIColor freshAir],
             @"fuchsia" : [UIColor fuchsia],
             @"fuchsiacrayola" : [UIColor fuchsiaCrayola],
             @"fuchsiapink" : [UIColor fuchsiaPink],
             @"fuchsiapurple" : [UIColor fuchsiaPurple],
             @"fuchsiarose" : [UIColor fuchsiaRose],
             @"fulvous" : [UIColor fulvous],
             @"fuzzywuzzy" : [UIColor fuzzyWuzzy],
             @"gamboge" : [UIColor gamboge],
             @"gambogeorangebrown" : [UIColor gambogeOrangeBrown],
             @"genericviridian" : [UIColor genericViridian],
             @"ghostwhite" : [UIColor ghostWhite],
             @"giantsorange" : [UIColor giantsOrange],
             @"grussrel" : [UIColor grussrel],
             @"glaucous" : [UIColor glaucous],
             @"glitter" : [UIColor glitter],
             @"gogreen" : [UIColor gOGreen],
             @"goldmetallic" : [UIColor goldMetallic],
             @"goldwebgolden" : [UIColor goldWebGolden],
             @"goldfusion" : [UIColor goldFusion],
             @"goldenbrown" : [UIColor goldenBrown],
             @"goldenpoppy" : [UIColor goldenPoppy],
             @"goldenyellow" : [UIColor goldenYellow],
             @"goldenrod" : [UIColor goldenrod],
             @"grannysmithapple" : [UIColor grannySmithApple],
             @"grape" : [UIColor grape],
             @"gray" : [UIColor gray],
             @"grayhtmlcssgray" : [UIColor grayHTMLCSSGray],
             @"grayx11gray" : [UIColor grayX11Gray],
             @"grayasparagus" : [UIColor grayAsparagus],
             @"grayblue" : [UIColor grayBlue],
             @"greencolorwheelx11green" : [UIColor greenColorWheelX11Green],
             @"greencrayola" : [UIColor greenCrayola],
             @"greenhtmlcsscolor" : [UIColor greenHTMLCSSColor],
             @"greenmunsell" : [UIColor greenMunsell],
             @"greenncs" : [UIColor greenNCS],
             @"greenpantone" : [UIColor greenPantone],
             @"greenpigment" : [UIColor greenPigment],
             @"greenryb" : [UIColor greenRYB],
             @"greenblue" : [UIColor greenBlue],
             @"greencyan" : [UIColor greenCyan],
             @"greenyellow" : [UIColor greenYellow],
             @"grizzly" : [UIColor grizzly],
             @"grullo" : [UIColor grullo],
             @"guppiegreen" : [UIColor guppieGreen],
             @"halayàúbe" : [UIColor halayàÚbe],
             @"hanblue" : [UIColor hanBlue],
             @"hanpurple" : [UIColor hanPurple],
             @"hansayellow" : [UIColor hansaYellow],
             @"harlequin" : [UIColor harlequin],
             @"harlequingreen" : [UIColor harlequinGreen],
             @"harvardcrimson" : [UIColor harvardCrimson],
             @"harvestgold" : [UIColor harvestGold],
             @"heartgold" : [UIColor heartGold],
             @"heliotrope" : [UIColor heliotrope],
             @"heliotropegray" : [UIColor heliotropeGray],
             @"heliotropemagenta" : [UIColor heliotropeMagenta],
             @"hollywoodcerise" : [UIColor hollywoodCerise],
             @"honeydew" : [UIColor honeydew],
             @"honolulublue" : [UIColor honoluluBlue],
             @"hookersgreen" : [UIColor hookersGreen],
             @"hotmagenta" : [UIColor hotMagenta],
             @"hotpink" : [UIColor hotPink],
             @"huntergreen" : [UIColor hunterGreen],
             @"iceberg" : [UIColor iceberg],
             @"icterine" : [UIColor icterine],
             @"illuminatingemerald" : [UIColor illuminatingEmerald],
             @"imperial" : [UIColor imperial],
             @"imperialblue" : [UIColor imperialBlue],
             @"imperialpurple" : [UIColor imperialPurple],
             @"imperialred" : [UIColor imperialRed],
             @"inchworm" : [UIColor inchworm],
             @"independence" : [UIColor independence],
             @"indiagreen" : [UIColor indiaGreen],
             @"indianred" : [UIColor indianRed],
             @"indianyellow" : [UIColor indianYellow],
             @"indigo" : [UIColor indigo],
             @"indigodye" : [UIColor indigoDye],
             @"indigoweb" : [UIColor indigoWeb],
             @"internationalkleinblue" : [UIColor internationalKleinBlue],
             @"internationalorangeaerospace" : [UIColor internationalOrangeAerospace],
             @"internationalorangeengineering" : [UIColor internationalOrangeEngineering],
             @"internationalorangegoldengatebridge" : [UIColor internationalOrangeGoldenGateBridge],
             @"iris" : [UIColor iris],
             @"irresistible" : [UIColor irresistible],
             @"isabelline" : [UIColor isabelline],
             @"islamicgreen" : [UIColor islamicGreen],
             @"italianskyblue" : [UIColor italianSkyBlue],
             @"ivory" : [UIColor ivory],
             @"jade" : [UIColor jade],
             @"japanesecarmine" : [UIColor japaneseCarmine],
             @"japaneseindigo" : [UIColor japaneseIndigo],
             @"japaneseviolet" : [UIColor japaneseViolet],
             @"jasmine" : [UIColor jasmine],
             @"jasper" : [UIColor jasper],
             @"jazzberryjam" : [UIColor jazzberryJam],
             @"jellybean" : [UIColor jellyBean],
             @"jet" : [UIColor jet],
             @"jonquil" : [UIColor jonquil],
             @"jordyblue" : [UIColor jordyBlue],
             @"junebud" : [UIColor juneBud],
             @"junglegreen" : [UIColor jungleGreen],
             @"kellygreen" : [UIColor kellyGreen],
             @"kenyancopper" : [UIColor kenyanCopper],
             @"keppel" : [UIColor keppel],
             @"jawadchickencolorhtmlcsskhaki" : [UIColor jawadChickenColorHTMLCSSKhaki],
             @"khakix11lightkhaki" : [UIColor khakiX11LightKhaki],
             @"kobe" : [UIColor kobe],
             @"kobi" : [UIColor kobi],
             @"kombugreen" : [UIColor kombuGreen],
             @"kucrimson" : [UIColor kUCrimson],
             @"lasallegreen" : [UIColor laSalleGreen],
             @"languidlavender" : [UIColor languidLavender],
             @"lapislazuli" : [UIColor lapisLazuli],
             @"laserlemon" : [UIColor laserLemon],
             @"laurelgreen" : [UIColor laurelGreen],
             @"lava" : [UIColor lava],
             @"lavenderfloral" : [UIColor lavenderFloral],
             @"lavenderweb" : [UIColor lavenderWeb],
             @"lavenderblue" : [UIColor lavenderBlue],
             @"lavenderblush" : [UIColor lavenderBlush],
             @"lavendergray" : [UIColor lavenderGray],
             @"lavenderindigo" : [UIColor lavenderIndigo],
             @"lavendermagenta" : [UIColor lavenderMagenta],
             @"lavendermist" : [UIColor lavenderMist],
             @"lavenderpink" : [UIColor lavenderPink],
             @"lavenderpurple" : [UIColor lavenderPurple],
             @"lavenderrose" : [UIColor lavenderRose],
             @"lawngreen" : [UIColor lawnGreen],
             @"lemon" : [UIColor lemon],
             @"lemonchiffon" : [UIColor lemonChiffon],
             @"lemoncurry" : [UIColor lemonCurry],
             @"lemonglacier" : [UIColor lemonGlacier],
             @"lemonlime" : [UIColor lemonLime],
             @"lemonmeringue" : [UIColor lemonMeringue],
             @"lemonyellow" : [UIColor lemonYellow],
             @"lenurple" : [UIColor lenurple],
             @"licorice" : [UIColor licorice],
             @"liberty" : [UIColor liberty],
             @"lightapricot" : [UIColor lightApricot],
             @"lightblue" : [UIColor lightBlue],
             @"lightbrilliantred" : [UIColor lightBrilliantRed],
             @"lightbrown" : [UIColor lightBrown],
             @"lightcarminepink" : [UIColor lightCarminePink],
             @"lightcobaltblue" : [UIColor lightCobaltBlue],
             @"lightcoral" : [UIColor lightCoral],
             @"lightcornflowerblue" : [UIColor lightCornflowerBlue],
             @"lightcrimson" : [UIColor lightCrimson],
             @"lightcyan" : [UIColor lightCyan],
             @"lightdeeppink" : [UIColor lightDeepPink],
             @"lightfrenchbeige" : [UIColor lightFrenchBeige],
             @"lightfuchsiapink" : [UIColor lightFuchsiaPink],
             @"lightgoldenrodyellow" : [UIColor lightGoldenrodYellow],
             @"lightgray" : [UIColor lightGray],
             @"lightgrayishmagenta" : [UIColor lightGrayishMagenta],
             @"lightgreen" : [UIColor lightGreen],
             @"lighthotpink" : [UIColor lightHotPink],
             @"lightkhaki" : [UIColor lightKhaki],
             @"lightmediumorchid" : [UIColor lightMediumOrchid],
             @"lightmossgreen" : [UIColor lightMossGreen],
             @"lightorchid" : [UIColor lightOrchid],
             @"lightpastelpurple" : [UIColor lightPastelPurple],
             @"lightpink" : [UIColor lightPink],
             @"lightredochre" : [UIColor lightRedOchre],
             @"lightsalmon" : [UIColor lightSalmon],
             @"lightsalmonpink" : [UIColor lightSalmonPink],
             @"lightseagreen" : [UIColor lightSeaGreen],
             @"lightskyblue" : [UIColor lightSkyBlue],
             @"lightslategray" : [UIColor lightSlateGray],
             @"lightsteelblue" : [UIColor lightSteelBlue],
             @"lighttaupe" : [UIColor lightTaupe],
             @"lightthulianpink" : [UIColor lightThulianPink],
             @"lightyellow" : [UIColor lightYellow],
             @"lilac" : [UIColor lilac],
             @"limecolorwheel" : [UIColor limeColorWheel],
             @"limewebx11green" : [UIColor limeWebX11Green],
             @"limegreen" : [UIColor limeGreen],
             @"limerick" : [UIColor limerick],
             @"lincolngreen" : [UIColor lincolnGreen],
             @"linen" : [UIColor linen],
             @"lion" : [UIColor lion],
             @"liseranpurple" : [UIColor liseranPurple],
             @"littleboyblue" : [UIColor littleBoyBlue],
             @"liver" : [UIColor liver],
             @"liverdogs" : [UIColor liverDogs],
             @"liverorgan" : [UIColor liverOrgan],
             @"liverchestnut" : [UIColor liverChestnut],
             @"livid" : [UIColor livid],
             @"lumber" : [UIColor lumber],
             @"lust" : [UIColor lust],
             @"magenta" : [UIColor magenta],
             @"magentacrayola" : [UIColor magentaCrayola],
             @"magentadye" : [UIColor magentaDye],
             @"magentapantone" : [UIColor magentaPantone],
             @"magentaprocess" : [UIColor magentaProcess],
             @"magentahaze" : [UIColor magentaHaze],
             @"magentapink" : [UIColor magentaPink],
             @"magicmint" : [UIColor magicMint],
             @"magnolia" : [UIColor magnolia],
             @"mahogany" : [UIColor mahogany],
             @"maize" : [UIColor maize],
             @"majorelleblue" : [UIColor majorelleBlue],
             @"malachite" : [UIColor malachite],
             @"manatee" : [UIColor manatee],
             @"mangotango" : [UIColor mangoTango],
             @"mantis" : [UIColor mantis],
             @"mardigras" : [UIColor mardiGras],
             @"marigold" : [UIColor marigold],
             @"marooncrayola" : [UIColor maroonCrayola],
             @"maroonhtmlcss" : [UIColor maroonHTMLCSS],
             @"maroonx11" : [UIColor maroonX11],
             @"mauve" : [UIColor mauve],
             @"mauvetaupe" : [UIColor mauveTaupe],
             @"mauvelous" : [UIColor mauvelous],
             @"maygreen" : [UIColor mayGreen],
             @"mayablue" : [UIColor mayaBlue],
             @"meatbrown" : [UIColor meatBrown],
             @"mediumaquamarine" : [UIColor mediumAquamarine],
             @"mediumblue" : [UIColor mediumBlue],
             @"mediumcandyapplered" : [UIColor mediumCandyAppleRed],
             @"mediumcarmine" : [UIColor mediumCarmine],
             @"mediumchampagne" : [UIColor mediumChampagne],
             @"mediumelectricblue" : [UIColor mediumElectricBlue],
             @"mediumjunglegreen" : [UIColor mediumJungleGreen],
             @"mediumlavendermagenta" : [UIColor mediumLavenderMagenta],
             @"mediumorchid" : [UIColor mediumOrchid],
             @"mediumpersianblue" : [UIColor mediumPersianBlue],
             @"mediumpurple" : [UIColor mediumPurple],
             @"mediumredviolet" : [UIColor mediumRedViolet],
             @"mediumruby" : [UIColor mediumRuby],
             @"mediumseagreen" : [UIColor mediumSeaGreen],
             @"mediumskyblue" : [UIColor mediumSkyBlue],
             @"mediumslateblue" : [UIColor mediumSlateBlue],
             @"mediumspringbud" : [UIColor mediumSpringBud],
             @"mediumspringgreen" : [UIColor mediumSpringGreen],
             @"mediumtaupe" : [UIColor mediumTaupe],
             @"mediumturquoise" : [UIColor mediumTurquoise],
             @"mediumtuscanred" : [UIColor mediumTuscanRed],
             @"mediumvermilion" : [UIColor mediumVermilion],
             @"mediumvioletred" : [UIColor mediumVioletRed],
             @"mellowapricot" : [UIColor mellowApricot],
             @"mellowyellow" : [UIColor mellowYellow],
             @"melon" : [UIColor melon],
             @"metallicseaweed" : [UIColor metallicSeaweed],
             @"metallicsunburst" : [UIColor metallicSunburst],
             @"mexicanpink" : [UIColor mexicanPink],
             @"midnightblue" : [UIColor midnightBlue],
             @"midnightgreeneaglegreen" : [UIColor midnightGreenEagleGreen],
             @"mikadoyellow" : [UIColor mikadoYellow],
             @"mindaro" : [UIColor mindaro],
             @"ming" : [UIColor ming],
             @"mint" : [UIColor mint],
             @"mintcream" : [UIColor mintCream],
             @"mintgreen" : [UIColor mintGreen],
             @"mistyrose" : [UIColor mistyRose],
             @"moccasin" : [UIColor moccasin],
             @"modebeige" : [UIColor modeBeige],
             @"moonstoneblue" : [UIColor moonstoneBlue],
             @"mordantred19" : [UIColor mordantRed19],
             @"mossgreen" : [UIColor mossGreen],
             @"mountainmeadow" : [UIColor mountainMeadow],
             @"mountbattenpink" : [UIColor mountbattenPink],
             @"msugreen" : [UIColor mSUGreen],
             @"mughalgreen" : [UIColor mughalGreen],
             @"mulberry" : [UIColor mulberry],
             @"mustard" : [UIColor mustard],
             @"myrtlegreen" : [UIColor myrtleGreen],
             @"nadeshikopink" : [UIColor nadeshikoPink],
             @"napiergreen" : [UIColor napierGreen],
             @"naplesyellow" : [UIColor naplesYellow],
             @"navajowhite" : [UIColor navajoWhite],
             @"navy" : [UIColor navy],
             @"navypurple" : [UIColor navyPurple],
             @"neoncarrot" : [UIColor neonCarrot],
             @"neonfuchsia" : [UIColor neonFuchsia],
             @"neongreen" : [UIColor neonGreen],
             @"newcar" : [UIColor newCar],
             @"newyorkpink" : [UIColor newYorkPink],
             @"nonphotoblue" : [UIColor nonPhotoBlue],
             @"northtexasgreen" : [UIColor northTexasGreen],
             @"nyanza" : [UIColor nyanza],
             @"oceanboatblue" : [UIColor oceanBoatBlue],
             @"ochre" : [UIColor ochre],
             @"officegreen" : [UIColor officeGreen],
             @"oldburgundy" : [UIColor oldBurgundy],
             @"oldgold" : [UIColor oldGold],
             @"oldheliotrope" : [UIColor oldHeliotrope],
             @"oldlace" : [UIColor oldLace],
             @"oldlavender" : [UIColor oldLavender],
             @"oldmauve" : [UIColor oldMauve],
             @"oldmossgreen" : [UIColor oldMossGreen],
             @"oldrose" : [UIColor oldRose],
             @"oldsilver" : [UIColor oldSilver],
             @"olive" : [UIColor olive],
             @"olivedrab3" : [UIColor oliveDrab3],
             @"olivedrab7" : [UIColor oliveDrab7],
             @"olivine" : [UIColor olivine],
             @"onyx" : [UIColor onyx],
             @"operamauve" : [UIColor operaMauve],
             @"orangecolorwheel" : [UIColor orangeColorWheel],
             @"orangecrayola" : [UIColor orangeCrayola],
             @"orangepantone" : [UIColor orangePantone],
             @"orangeryb" : [UIColor orangeRYB],
             @"orangeweb" : [UIColor orangeWeb],
             @"orangepeel" : [UIColor orangePeel],
             @"orangered" : [UIColor orangeRed],
             @"orangeyellow" : [UIColor orangeYellow],
             @"orchid" : [UIColor orchid],
             @"orchidpink" : [UIColor orchidPink],
             @"oriolesorange" : [UIColor oriolesOrange],
             @"otterbrown" : [UIColor otterBrown],
             @"outerspace" : [UIColor outerSpace],
             @"outrageousorange" : [UIColor outrageousOrange],
             @"oxfordblue" : [UIColor oxfordBlue],
             @"oucrimsonred" : [UIColor oUCrimsonRed],
             @"pakistangreen" : [UIColor pakistanGreen],
             @"palatinateblue" : [UIColor palatinateBlue],
             @"palatinatepurple" : [UIColor palatinatePurple],
             @"paleaqua" : [UIColor paleAqua],
             @"paleblue" : [UIColor paleBlue],
             @"palebrown" : [UIColor paleBrown],
             @"palecarmine" : [UIColor paleCarmine],
             @"palecerulean" : [UIColor paleCerulean],
             @"palechestnut" : [UIColor paleChestnut],
             @"palecopper" : [UIColor paleCopper],
             @"palecornflowerblue" : [UIColor paleCornflowerBlue],
             @"palecyan" : [UIColor paleCyan],
             @"palegold" : [UIColor paleGold],
             @"palegoldenrod" : [UIColor paleGoldenrod],
             @"palegreen" : [UIColor paleGreen],
             @"palelavender" : [UIColor paleLavender],
             @"palemagenta" : [UIColor paleMagenta],
             @"palemagentapink" : [UIColor paleMagentaPink],
             @"palepink" : [UIColor palePink],
             @"paleplum" : [UIColor palePlum],
             @"paleredviolet" : [UIColor paleRedViolet],
             @"palerobineggblue" : [UIColor paleRobinEggBlue],
             @"palesilver" : [UIColor paleSilver],
             @"palespringbud" : [UIColor paleSpringBud],
             @"paletaupe" : [UIColor paleTaupe],
             @"paleturquoise" : [UIColor paleTurquoise],
             @"paleviolet" : [UIColor paleViolet],
             @"palevioletred" : [UIColor paleVioletRed],
             @"pansypurple" : [UIColor pansyPurple],
             @"paoloveronesegreen" : [UIColor paoloVeroneseGreen],
             @"papayawhip" : [UIColor papayaWhip],
             @"paradisepink" : [UIColor paradisePink],
             @"parisgreen" : [UIColor parisGreen],
             @"pastelblue" : [UIColor pastelBlue],
             @"pastelbrown" : [UIColor pastelBrown],
             @"pastelgray" : [UIColor pastelGray],
             @"pastelgreen" : [UIColor pastelGreen],
             @"pastelmagenta" : [UIColor pastelMagenta],
             @"pastelorange" : [UIColor pastelOrange],
             @"pastelpink" : [UIColor pastelPink],
             @"pastelpurple" : [UIColor pastelPurple],
             @"pastelred" : [UIColor pastelRed],
             @"pastelviolet" : [UIColor pastelViolet],
             @"pastelyellow" : [UIColor pastelYellow],
             @"patriarch" : [UIColor patriarch],
             @"paynesgrey" : [UIColor paynesGrey],
             @"peach" : [UIColor peach],
             @"peach2" : [UIColor peach2],
             @"peachorange" : [UIColor peachOrange],
             @"peachpuff" : [UIColor peachPuff],
             @"peachyellow" : [UIColor peachYellow],
             @"pear" : [UIColor pear],
             @"pearl" : [UIColor pearl],
             @"pearlaqua" : [UIColor pearlAqua],
             @"pearlypurple" : [UIColor pearlyPurple],
             @"peridot" : [UIColor peridot],
             @"periwinkle" : [UIColor periwinkle],
             @"persianblue" : [UIColor persianBlue],
             @"persiangreen" : [UIColor persianGreen],
             @"persianindigo" : [UIColor persianIndigo],
             @"persianorange" : [UIColor persianOrange],
             @"persianpink" : [UIColor persianPink],
             @"persianplum" : [UIColor persianPlum],
             @"persianred" : [UIColor persianRed],
             @"persianrose" : [UIColor persianRose],
             @"persimmon" : [UIColor persimmon],
             @"peru" : [UIColor peru],
             @"phlox" : [UIColor phlox],
             @"phthaloblue" : [UIColor phthaloBlue],
             @"phthalogreen" : [UIColor phthaloGreen],
             @"pictonblue" : [UIColor pictonBlue],
             @"pictorialcarmine" : [UIColor pictorialCarmine],
             @"piggypink" : [UIColor piggyPink],
             @"pinegreen" : [UIColor pineGreen],
             @"pineapple" : [UIColor pineapple],
             @"pink" : [UIColor pink],
             @"pinkpantone" : [UIColor pinkPantone],
             @"pinklace" : [UIColor pinkLace],
             @"pinklavender" : [UIColor pinkLavender],
             @"pinkorange" : [UIColor pinkOrange],
             @"pinkpearl" : [UIColor pinkPearl],
             @"pinkraspberry" : [UIColor pinkRaspberry],
             @"pinksherbet" : [UIColor pinkSherbet],
             @"pistachio" : [UIColor pistachio],
             @"platinum" : [UIColor platinum],
             @"plum" : [UIColor plum],
             @"plumweb" : [UIColor plumWeb],
             @"pompandpower" : [UIColor pompAndPower],
             @"popstar" : [UIColor popstar],
             @"portlandorange" : [UIColor portlandOrange],
             @"powderblue" : [UIColor powderBlue],
             @"princetonorange" : [UIColor princetonOrange],
             @"prune" : [UIColor prune],
             @"prussianblue" : [UIColor prussianBlue],
             @"psychedelicpurple" : [UIColor psychedelicPurple],
             @"puce" : [UIColor puce],
             @"pucered" : [UIColor puceRed],
             @"pullmanbrownupsbrown" : [UIColor pullmanBrownUPSBrown],
             @"pullmangreen" : [UIColor pullmanGreen],
             @"pumpkin" : [UIColor pumpkin],
             @"purplehtml" : [UIColor purpleHTML],
             @"purplemunsell" : [UIColor purpleMunsell],
             @"purplex11" : [UIColor purpleX11],
             @"purpleheart" : [UIColor purpleHeart],
             @"purplemountainmajesty" : [UIColor purpleMountainMajesty],
             @"purplenavy" : [UIColor purpleNavy],
             @"purplepizzazz" : [UIColor purplePizzazz],
             @"purpletaupe" : [UIColor purpleTaupe],
             @"purpureus" : [UIColor purpureus],
             @"quartz" : [UIColor quartz],
             @"queenblue" : [UIColor queenBlue],
             @"queenpink" : [UIColor queenPink],
             @"quinacridonemagenta" : [UIColor quinacridoneMagenta],
             @"rackley" : [UIColor rackley],
             @"radicalred" : [UIColor radicalRed],
             @"rajah" : [UIColor rajah],
             @"raspberry" : [UIColor raspberry],
             @"raspberryglace" : [UIColor raspberryGlace],
             @"raspberrypink" : [UIColor raspberryPink],
             @"raspberryrose" : [UIColor raspberryRose],
             @"rawumber" : [UIColor rawUmber],
             @"razzledazzlerose" : [UIColor razzleDazzleRose],
             @"razzmatazz" : [UIColor razzmatazz],
             @"razzmicberry" : [UIColor razzmicBerry],
             @"rebeccapurple" : [UIColor rebeccaPurple],
             @"red" : [UIColor red],
             @"redcrayola" : [UIColor redCrayola],
             @"redmunsell" : [UIColor redMunsell],
             @"redncs" : [UIColor redNCS],
             @"redpantone" : [UIColor redPantone],
             @"redpigment" : [UIColor redPigment],
             @"redryb" : [UIColor redRYB],
             @"redbrown" : [UIColor redBrown],
             @"reddevil" : [UIColor redDevil],
             @"redorange" : [UIColor redOrange],
             @"redpurple" : [UIColor redPurple],
             @"redviolet" : [UIColor redViolet],
             @"redwood" : [UIColor redwood],
             @"regalia" : [UIColor regalia],
             @"registrationblack" : [UIColor registrationBlack],
             @"resolutionblue" : [UIColor resolutionBlue],
             @"rhythm" : [UIColor rhythm],
             @"richblack" : [UIColor richBlack],
             @"richblackfogra29" : [UIColor richBlackFOGRA29],
             @"richblackfogra39" : [UIColor richBlackFOGRA39],
             @"richbrilliantlavender" : [UIColor richBrilliantLavender],
             @"richcarmine" : [UIColor richCarmine],
             @"richelectricblue" : [UIColor richElectricBlue],
             @"richlavender" : [UIColor richLavender],
             @"richlilac" : [UIColor richLilac],
             @"richmaroon" : [UIColor richMaroon],
             @"riflegreen" : [UIColor rifleGreen],
             @"roastcoffee" : [UIColor roastCoffee],
             @"robineggblue" : [UIColor robinEggBlue],
             @"rocketmetallic" : [UIColor rocketMetallic],
             @"romansilver" : [UIColor romanSilver],
             @"rose" : [UIColor rose],
             @"rosebonbon" : [UIColor roseBonbon],
             @"roseebony" : [UIColor roseEbony],
             @"rosegold" : [UIColor roseGold],
             @"rosemadder" : [UIColor roseMadder],
             @"rosepink" : [UIColor rosePink],
             @"rosequartz" : [UIColor roseQuartz],
             @"rosered" : [UIColor roseRed],
             @"rosetaupe" : [UIColor roseTaupe],
             @"rosevale" : [UIColor roseVale],
             @"rosewood" : [UIColor rosewood],
             @"rossocorsa" : [UIColor rossoCorsa],
             @"rosybrown" : [UIColor rosyBrown],
             @"royalazure" : [UIColor royalAzure],
             @"royalblue" : [UIColor royalBlue],
             @"royalblue2" : [UIColor royalBlue2],
             @"royalfuchsia" : [UIColor royalFuchsia],
             @"royalpurple" : [UIColor royalPurple],
             @"royalyellow" : [UIColor royalYellow],
             @"ruber" : [UIColor ruber],
             @"rubinered" : [UIColor rubineRed],
             @"ruby" : [UIColor ruby],
             @"rubyred" : [UIColor rubyRed],
             @"ruddy" : [UIColor ruddy],
             @"ruddybrown" : [UIColor ruddyBrown],
             @"ruddypink" : [UIColor ruddyPink],
             @"rufous" : [UIColor rufous],
             @"russet" : [UIColor russet],
             @"russiangreen" : [UIColor russianGreen],
             @"russianviolet" : [UIColor russianViolet],
             @"rust" : [UIColor rust],
             @"rustyred" : [UIColor rustyRed],
             @"sacramentostategreen" : [UIColor sacramentoStateGreen],
             @"saddlebrown" : [UIColor saddleBrown],
             @"safetyorange" : [UIColor safetyOrange],
             @"safetyorangeblazeorange" : [UIColor safetyOrangeBlazeOrange],
             @"safetyyellow" : [UIColor safetyYellow],
             @"saffron" : [UIColor saffron],
             @"sage" : [UIColor sage],
             @"stpatricksblue" : [UIColor stPatricksBlue],
             @"salmon" : [UIColor salmon],
             @"salmonpink" : [UIColor salmonPink],
             @"sand" : [UIColor sand],
             @"sanddune" : [UIColor sandDune],
             @"sandstorm" : [UIColor sandstorm],
             @"sandybrown" : [UIColor sandyBrown],
             @"sandytaupe" : [UIColor sandyTaupe],
             @"sangria" : [UIColor sangria],
             @"sapgreen" : [UIColor sapGreen],
             @"sapphire" : [UIColor sapphire],
             @"sapphireblue" : [UIColor sapphireBlue],
             @"satinsheengold" : [UIColor satinSheenGold],
             @"scarlet" : [UIColor scarlet],
             @"scarlet2" : [UIColor scarlet2],
             @"schausspink" : [UIColor schaussPink],
             @"schoolbusyellow" : [UIColor schoolBusYellow],
             @"screamingreen" : [UIColor screaminGreen],
             @"seablue" : [UIColor seaBlue],
             @"seagreen" : [UIColor seaGreen],
             @"sealbrown" : [UIColor sealBrown],
             @"seashell" : [UIColor seashell],
             @"selectiveyellow" : [UIColor selectiveYellow],
             @"sepia" : [UIColor sepia],
             @"shadow" : [UIColor shadow],
             @"shadowblue" : [UIColor shadowBlue],
             @"shampoo" : [UIColor shampoo],
             @"shamrockgreen" : [UIColor shamrockGreen],
             @"sheengreen" : [UIColor sheenGreen],
             @"shimmeringblush" : [UIColor shimmeringBlush],
             @"shockingpink" : [UIColor shockingPink],
             @"shockingpinkcrayola" : [UIColor shockingPinkCrayola],
             @"sienna" : [UIColor sienna],
             @"silver" : [UIColor silver],
             @"silverchalice" : [UIColor silverChalice],
             @"silverlakeblue" : [UIColor silverLakeBlue],
             @"silverpink" : [UIColor silverPink],
             @"silversand" : [UIColor silverSand],
             @"sinopia" : [UIColor sinopia],
             @"skobeloff" : [UIColor skobeloff],
             @"skyblue" : [UIColor skyBlue],
             @"skymagenta" : [UIColor skyMagenta],
             @"slateblue" : [UIColor slateBlue],
             @"slategray" : [UIColor slateGray],
             @"smaltdarkpowderblue" : [UIColor smaltDarkPowderBlue],
             @"smitten" : [UIColor smitten],
             @"smoke" : [UIColor smoke],
             @"smokyblack" : [UIColor smokyBlack],
             @"smokytopaz" : [UIColor smokyTopaz],
             @"snow" : [UIColor snow],
             @"soap" : [UIColor soap],
             @"solidpink" : [UIColor solidPink],
             @"sonicsilver" : [UIColor sonicSilver],
             @"spartancrimson" : [UIColor spartanCrimson],
             @"spacecadet" : [UIColor spaceCadet],
             @"spanishbistre" : [UIColor spanishBistre],
             @"spanishblue" : [UIColor spanishBlue],
             @"spanishcarmine" : [UIColor spanishCarmine],
             @"spanishcrimson" : [UIColor spanishCrimson],
             @"spanishgray" : [UIColor spanishGray],
             @"spanishgreen" : [UIColor spanishGreen],
             @"spanishorange" : [UIColor spanishOrange],
             @"spanishpink" : [UIColor spanishPink],
             @"spanishred" : [UIColor spanishRed],
             @"spanishskyblue" : [UIColor spanishSkyBlue],
             @"spanishviolet" : [UIColor spanishViolet],
             @"spanishviridian" : [UIColor spanishViridian],
             @"spicymix" : [UIColor spicyMix],
             @"spirodiscoball" : [UIColor spiroDiscoBall],
             @"springbud" : [UIColor springBud],
             @"springgreen" : [UIColor springGreen],
             @"starcommandblue" : [UIColor starCommandBlue],
             @"steelblue" : [UIColor steelBlue],
             @"steelpink" : [UIColor steelPink],
             @"stildegrainyellow" : [UIColor stilDeGrainYellow],
             @"stizza" : [UIColor stizza],
             @"stormcloud" : [UIColor stormcloud],
             @"straw" : [UIColor straw],
             @"strawberry" : [UIColor strawberry],
             @"sunglow" : [UIColor sunglow],
             @"sunray" : [UIColor sunray],
             @"sunset" : [UIColor sunset],
             @"sunsetorange" : [UIColor sunsetOrange],
             @"superpink" : [UIColor superPink],
             @"tan" : [UIColor tan],
             @"tangelo" : [UIColor tangelo],
             @"tangerine" : [UIColor tangerine],
             @"tangerineyellow" : [UIColor tangerineYellow],
             @"tangopink" : [UIColor tangoPink],
             @"taupe" : [UIColor taupe],
             @"taupegray" : [UIColor taupeGray],
             @"teagreen" : [UIColor teaGreen],
             @"tearose" : [UIColor teaRose],
             @"tearose2" : [UIColor teaRose2],
             @"teal" : [UIColor teal],
             @"tealblue" : [UIColor tealBlue],
             @"tealdeer" : [UIColor tealDeer],
             @"tealgreen" : [UIColor tealGreen],
             @"telemagenta" : [UIColor telemagenta],
             @"tenne" : [UIColor tenne],
             @"terracotta" : [UIColor terraCotta],
             @"thistle" : [UIColor thistle],
             @"thulianpink" : [UIColor thulianPink],
             @"ticklemepink" : [UIColor tickleMePink],
             @"tiffanyblue" : [UIColor tiffanyBlue],
             @"tigerseye" : [UIColor tigersEye],
             @"timberwolf" : [UIColor timberwolf],
             @"titaniumyellow" : [UIColor titaniumYellow],
             @"tomato" : [UIColor tomato],
             @"toolbox" : [UIColor toolbox],
             @"topaz" : [UIColor topaz],
             @"tractorred" : [UIColor tractorRed],
             @"trolleygrey" : [UIColor trolleyGrey],
             @"tropicalrainforest" : [UIColor tropicalRainForest],
             @"trueblue" : [UIColor trueBlue],
             @"tuftsblue" : [UIColor tuftsBlue],
             @"tulip" : [UIColor tulip],
             @"tumbleweed" : [UIColor tumbleweed],
             @"turkishrose" : [UIColor turkishRose],
             @"turquoise" : [UIColor turquoise],
             @"turquoiseblue" : [UIColor turquoiseBlue],
             @"turquoisegreen" : [UIColor turquoiseGreen],
             @"tuscan" : [UIColor tuscan],
             @"tuscanbrown" : [UIColor tuscanBrown],
             @"tuscanred" : [UIColor tuscanRed],
             @"tuscantan" : [UIColor tuscanTan],
             @"tuscany" : [UIColor tuscany],
             @"twilightlavender" : [UIColor twilightLavender],
             @"tyrianpurple" : [UIColor tyrianPurple],
             @"uablue" : [UIColor uABlue],
             @"uared" : [UIColor uARed],
             @"ube" : [UIColor ube],
             @"uclablue" : [UIColor uCLABlue],
             @"uclagold" : [UIColor uCLAGold],
             @"ufogreen" : [UIColor uFOGreen],
             @"ultramarine" : [UIColor ultramarine],
             @"ultramarineblue" : [UIColor ultramarineBlue],
             @"ultrapink" : [UIColor ultraPink],
             @"ultrared" : [UIColor ultraRed],
             @"umber" : [UIColor umber],
             @"unbleachedsilk" : [UIColor unbleachedSilk],
             @"unitednationsblue" : [UIColor unitedNationsBlue],
             @"universityofcaliforniagold" : [UIColor universityOfCaliforniaGold],
             @"unmellowyellow" : [UIColor unmellowYellow],
             @"upforestgreen" : [UIColor uPForestGreen],
             @"upmaroon" : [UIColor uPMaroon],
             @"upsdellred" : [UIColor upsdellRed],
             @"urobilin" : [UIColor urobilin],
             @"usafablue" : [UIColor uSAFABlue],
             @"usccardinal" : [UIColor uSCCardinal],
             @"uscgold" : [UIColor uSCGold],
             @"universityoftennesseeorange" : [UIColor universityOfTennesseeOrange],
             @"utahcrimson" : [UIColor utahCrimson],
             @"vanilla" : [UIColor vanilla],
             @"vanillaice" : [UIColor vanillaIce],
             @"vegasgold" : [UIColor vegasGold],
             @"venetianred" : [UIColor venetianRed],
             @"verdigris" : [UIColor verdigris],
             @"vermilion" : [UIColor vermilion],
             @"vermilion2" : [UIColor vermilion2],
             @"veronica" : [UIColor veronica],
             @"verylightazure" : [UIColor veryLightAzure],
             @"verylightblue" : [UIColor veryLightBlue],
             @"verylightmalachitegreen" : [UIColor veryLightMalachiteGreen],
             @"verylighttangelo" : [UIColor veryLightTangelo],
             @"verypaleorange" : [UIColor veryPaleOrange],
             @"verypaleyellow" : [UIColor veryPaleYellow],
             @"violet" : [UIColor violet],
             @"violetcolorwheel" : [UIColor violetColorWheel],
             @"violetryb" : [UIColor violetRYB],
             @"violetweb" : [UIColor violetWeb],
             @"violetblue" : [UIColor violetBlue],
             @"violetred" : [UIColor violetRed],
             @"viridian" : [UIColor viridian],
             @"viridiangreen" : [UIColor viridianGreen],
             @"vistablue" : [UIColor vistaBlue],
             @"vividamber" : [UIColor vividAmber],
             @"vividauburn" : [UIColor vividAuburn],
             @"vividburgundy" : [UIColor vividBurgundy],
             @"vividcerise" : [UIColor vividCerise],
             @"vividcerulean" : [UIColor vividCerulean],
             @"vividcrimson" : [UIColor vividCrimson],
             @"vividgamboge" : [UIColor vividGamboge],
             @"vividlimegreen" : [UIColor vividLimeGreen],
             @"vividmalachite" : [UIColor vividMalachite],
             @"vividmulberry" : [UIColor vividMulberry],
             @"vividorange" : [UIColor vividOrange],
             @"vividorangepeel" : [UIColor vividOrangePeel],
             @"vividorchid" : [UIColor vividOrchid],
             @"vividraspberry" : [UIColor vividRaspberry],
             @"vividred" : [UIColor vividRed],
             @"vividredtangelo" : [UIColor vividRedTangelo],
             @"vividskyblue" : [UIColor vividSkyBlue],
             @"vividtangelo" : [UIColor vividTangelo],
             @"vividtangerine" : [UIColor vividTangerine],
             @"vividvermilion" : [UIColor vividVermilion],
             @"vividviolet" : [UIColor vividViolet],
             @"vividyellow" : [UIColor vividYellow],
             @"warmblack" : [UIColor warmBlack],
             @"waterspout" : [UIColor waterspout],
             @"wenge" : [UIColor wenge],
             @"wheat" : [UIColor wheat],
             @"white" : [UIColor white],
             @"whitesmoke" : [UIColor whiteSmoke],
             @"wildblueyonder" : [UIColor wildBlueYonder],
             @"wildorchid" : [UIColor wildOrchid],
             @"wildstrawberry" : [UIColor wildStrawberry],
             @"wildwatermelon" : [UIColor wildWatermelon],
             @"willpowerorange" : [UIColor willpowerOrange],
             @"windsortan" : [UIColor windsorTan],
             @"wine" : [UIColor wine],
             @"winedregs" : [UIColor wineDregs],
             @"wisteria" : [UIColor wisteria],
             @"woodbrown" : [UIColor woodBrown],
             @"xanadu" : [UIColor xanadu],
             @"yaleblue" : [UIColor yaleBlue],
             @"yankeesblue" : [UIColor yankeesBlue],
             @"yellow" : [UIColor yellow],
             @"yellowcrayola" : [UIColor yellowCrayola],
             @"yellowmunsell" : [UIColor yellowMunsell],
             @"yellowncs" : [UIColor yellowNCS],
             @"yellowpantone" : [UIColor yellowPantone],
             @"yellowprocess" : [UIColor yellowProcess],
             @"yellowryb" : [UIColor yellowRYB],
             @"yellowgreen" : [UIColor yellowGreen],
             @"yelloworange" : [UIColor yellowOrange],
             @"yellowrose" : [UIColor yellowRose],
             @"zaffre" : [UIColor zaffre],
             @"zinnwalditebrown" : [UIColor zinnwalditeBrown],
             @"zomp" : [UIColor zomp],
             @"blackcolor" : [UIColor blackColor],
             @"darkgraycolor" : [UIColor darkGrayColor],
             @"lightgraycolor" : [UIColor lightGrayColor],
             @"lightgraycolor" : [UIColor lightGrayColor],
             @"whitecolor" : [UIColor whiteColor],
             @"graycolor" : [UIColor grayColor],
             @"redcolor" : [UIColor redColor],
             @"greencolor" : [UIColor greenColor],
             @"bluecolor" : [UIColor blueColor],
             @"cyancolor" : [UIColor cyanColor],
             @"yellowcolor" : [UIColor yellowColor],
             @"magentacolor" : [UIColor magentaColor],
             @"orangecolor" : [UIColor orangeColor],
             @"purplecolor" : [UIColor purpleColor],
             @"browncolor" : [UIColor brownColor],
             @"clearcolor" : [UIColor clearColor]};
}

+ (NSDictionary *)allColorsProperNamesDictionary {
    return @{@"acidGreen" : @"Acid Green",
             @"acidgreen" : @"Acid Green",
             @"aero" : @"Aero",
             @"aero" : @"Aero",
             @"aeroBlue" : @"Aero Blue",
             @"aeroblue" : @"Aero Blue",
             @"africanViolet" : @"African Violet",
             @"africanviolet" : @"African Violet",
             @"airForceBlueRAF" : @"Air Force Blue (RAF)",
             @"airforceblueraf" : @"Air Force Blue (RAF)",
             @"airForceBlueUSAF" : @"Air Force Blue (USAF)",
             @"airforceblueusaf" : @"Air Force Blue (USAF)",
             @"airSuperiorityBlue" : @"Air Superiority Blue",
             @"airsuperiorityblue" : @"Air Superiority Blue",
             @"alabamaCrimson" : @"Alabama Crimson",
             @"alabamacrimson" : @"Alabama Crimson",
             @"aliceBlue" : @"Alice Blue",
             @"aliceblue" : @"Alice Blue",
             @"alizarinCrimson" : @"Alizarin Crimson",
             @"alizarincrimson" : @"Alizarin Crimson",
             @"alloyOrange" : @"Alloy Orange",
             @"alloyorange" : @"Alloy Orange",
             @"almond" : @"Almond",
             @"almond" : @"Almond",
             @"amaranth" : @"Amaranth",
             @"amaranth" : @"Amaranth",
             @"amaranthDeepPurple" : @"Amaranth Deep Purple",
             @"amaranthdeeppurple" : @"Amaranth Deep Purple",
             @"amaranthPink" : @"Amaranth Pink",
             @"amaranthpink" : @"Amaranth Pink",
             @"amaranthPurple" : @"Amaranth Purple",
             @"amaranthpurple" : @"Amaranth Purple",
             @"amaranthRed" : @"Amaranth Red",
             @"amaranthred" : @"Amaranth Red",
             @"amazon" : @"Amazon",
             @"amazon" : @"Amazon",
             @"amber" : @"Amber",
             @"amber" : @"Amber",
             @"amberSAEECE" : @"Amber (SAE/ECE)",
             @"ambersaeece" : @"Amber (SAE/ECE)",
             @"americanRose" : @"American Rose",
             @"americanrose" : @"American Rose",
             @"amethyst" : @"Amethyst",
             @"amethyst" : @"Amethyst",
             @"androidGreen" : @"Android Green",
             @"androidgreen" : @"Android Green",
             @"antiFlashWhite" : @"Anti-Flash White",
             @"antiflashwhite" : @"Anti-Flash White",
             @"antiqueBrass" : @"Antique Brass",
             @"antiquebrass" : @"Antique Brass",
             @"antiqueBronze" : @"Antique Bronze",
             @"antiquebronze" : @"Antique Bronze",
             @"antiqueFuchsia" : @"Antique Fuchsia",
             @"antiquefuchsia" : @"Antique Fuchsia",
             @"antiqueRuby" : @"Antique Ruby",
             @"antiqueruby" : @"Antique Ruby",
             @"antiqueWhite" : @"Antique White",
             @"antiquewhite" : @"Antique White",
             @"aoEnglish" : @"Ao (English)",
             @"aoenglish" : @"Ao (English)",
             @"appleGreen" : @"Apple Green",
             @"applegreen" : @"Apple Green",
             @"apricot" : @"Apricot",
             @"apricot" : @"Apricot",
             @"aqua" : @"Aqua",
             @"aqua" : @"Aqua",
             @"aquamarine" : @"Aquamarine",
             @"aquamarine" : @"Aquamarine",
             @"armyGreen" : @"Army Green",
             @"armygreen" : @"Army Green",
             @"arsenic" : @"Arsenic",
             @"arsenic" : @"Arsenic",
             @"artichoke" : @"Artichoke",
             @"artichoke" : @"Artichoke",
             @"arylideYellow" : @"Arylide Yellow",
             @"arylideyellow" : @"Arylide Yellow",
             @"ashGrey" : @"Ash Grey",
             @"ashgrey" : @"Ash Grey",
             @"asparagus" : @"Asparagus",
             @"asparagus" : @"Asparagus",
             @"atomicTangerine" : @"Atomic Tangerine",
             @"atomictangerine" : @"Atomic Tangerine",
             @"auburn" : @"Auburn",
             @"auburn" : @"Auburn",
             @"aureolin" : @"Aureolin",
             @"aureolin" : @"Aureolin",
             @"auroMetalSaurus" : @"AuroMetalSaurus",
             @"aurometalsaurus" : @"AuroMetalSaurus",
             @"avocado" : @"Avocado",
             @"avocado" : @"Avocado",
             @"azure" : @"Azure",
             @"azure" : @"Azure",
             @"azureWebColor" : @"Azure (Web Color)",
             @"azurewebcolor" : @"Azure (Web Color)",
             @"azureMist" : @"Azure Mist",
             @"azuremist" : @"Azure Mist",
             @"azureishWhite" : @"Azureish White",
             @"azureishwhite" : @"Azureish White",
             @"babyBlue" : @"Baby Blue",
             @"babyblue" : @"Baby Blue",
             @"babyBlueEyes" : @"Baby Blue Eyes",
             @"babyblueeyes" : @"Baby Blue Eyes",
             @"babyPink" : @"Baby Pink",
             @"babypink" : @"Baby Pink",
             @"babyPowder" : @"Baby Powder",
             @"babypowder" : @"Baby Powder",
             @"bakerMillerPink" : @"Baker-Miller Pink",
             @"bakermillerpink" : @"Baker-Miller Pink",
             @"ballBlue" : @"Ball Blue",
             @"ballblue" : @"Ball Blue",
             @"bananaMania" : @"Banana Mania",
             @"bananamania" : @"Banana Mania",
             @"bananaYellow" : @"Banana Yellow",
             @"bananayellow" : @"Banana Yellow",
             @"bangladeshGreen" : @"Bangladesh Green",
             @"bangladeshgreen" : @"Bangladesh Green",
             @"barbiePink" : @"Barbie Pink",
             @"barbiepink" : @"Barbie Pink",
             @"barnRed" : @"Barn Red",
             @"barnred" : @"Barn Red",
             @"battleshipGrey" : @"Battleship Grey",
             @"battleshipgrey" : @"Battleship Grey",
             @"bazaar" : @"Bazaar",
             @"bazaar" : @"Bazaar",
             @"beauBlue" : @"Beau Blue",
             @"beaublue" : @"Beau Blue",
             @"beaver" : @"Beaver",
             @"beaver" : @"Beaver",
             @"beige" : @"Beige",
             @"beige" : @"Beige",
             @"bdazzledBlue" : @"B'dazzled Blue",
             @"bdazzledblue" : @"B'dazzled Blue",
             @"bigDipOruby" : @"Big Dip O’ruby",
             @"bigdiporuby" : @"Big Dip O’ruby",
             @"bisque" : @"Bisque",
             @"bisque" : @"Bisque",
             @"bistre" : @"Bistre",
             @"bistre" : @"Bistre",
             @"bistreBrown" : @"Bistre Brown",
             @"bistrebrown" : @"Bistre Brown",
             @"bitterLemon" : @"Bitter Lemon",
             @"bitterlemon" : @"Bitter Lemon",
             @"bitterLime" : @"Bitter Lime",
             @"bitterlime" : @"Bitter Lime",
             @"bittersweet" : @"Bittersweet",
             @"bittersweet" : @"Bittersweet",
             @"bittersweetShimmer" : @"Bittersweet Shimmer",
             @"bittersweetshimmer" : @"Bittersweet Shimmer",
             @"black" : @"Black",
             @"black" : @"Black",
             @"blackBean" : @"Black Bean",
             @"blackbean" : @"Black Bean",
             @"blackLeatherJacket" : @"Black Leather Jacket",
             @"blackleatherjacket" : @"Black Leather Jacket",
             @"blackOlive" : @"Black Olive",
             @"blackolive" : @"Black Olive",
             @"blanchedAlmond" : @"Blanched Almond",
             @"blanchedalmond" : @"Blanched Almond",
             @"blastOffBronze" : @"Blast-Off Bronze",
             @"blastoffbronze" : @"Blast-Off Bronze",
             @"bleuDeFrance" : @"Bleu De France",
             @"bleudefrance" : @"Bleu De France",
             @"blizzardBlue" : @"Blizzard Blue",
             @"blizzardblue" : @"Blizzard Blue",
             @"blond" : @"Blond",
             @"blond" : @"Blond",
             @"blue" : @"Blue",
             @"blue" : @"Blue",
             @"blueCrayola" : @"Blue (Crayola)",
             @"bluecrayola" : @"Blue (Crayola)",
             @"blueMunsell" : @"Blue (Munsell)",
             @"bluemunsell" : @"Blue (Munsell)",
             @"blueNCS" : @"Blue (NCS)",
             @"bluencs" : @"Blue (NCS)",
             @"bluePantone" : @"Blue (Pantone)",
             @"bluepantone" : @"Blue (Pantone)",
             @"bluePigment" : @"Blue (Pigment)",
             @"bluepigment" : @"Blue (Pigment)",
             @"blueRYB" : @"Blue (RYB)",
             @"blueryb" : @"Blue (RYB)",
             @"blueBell" : @"Blue Bell",
             @"bluebell" : @"Blue Bell",
             @"blueGray" : @"Blue-Gray",
             @"bluegray" : @"Blue-Gray",
             @"blueGreen" : @"Blue-Green",
             @"bluegreen" : @"Blue-Green",
             @"blueLagoon" : @"Blue Lagoon",
             @"bluelagoon" : @"Blue Lagoon",
             @"blueMagentaViolet" : @"Blue-Magenta Violet",
             @"bluemagentaviolet" : @"Blue-Magenta Violet",
             @"blueSapphire" : @"Blue Sapphire",
             @"bluesapphire" : @"Blue Sapphire",
             @"blueViolet" : @"Blue-Violet",
             @"blueviolet" : @"Blue-Violet",
             @"blueYonder" : @"Blue Yonder",
             @"blueyonder" : @"Blue Yonder",
             @"blueberry" : @"Blueberry",
             @"blueberry" : @"Blueberry",
             @"bluebonnet" : @"Bluebonnet",
             @"bluebonnet" : @"Bluebonnet",
             @"blush" : @"Blush",
             @"blush" : @"Blush",
             @"bole" : @"Bole",
             @"bole" : @"Bole",
             @"bondiBlue" : @"Bondi Blue",
             @"bondiblue" : @"Bondi Blue",
             @"bone" : @"Bone",
             @"bone" : @"Bone",
             @"bostonUniversityRed" : @"Boston University Red",
             @"bostonuniversityred" : @"Boston University Red",
             @"bottleGreen" : @"Bottle Green",
             @"bottlegreen" : @"Bottle Green",
             @"boysenberry" : @"Boysenberry",
             @"boysenberry" : @"Boysenberry",
             @"brandeisBlue" : @"Brandeis Blue",
             @"brandeisblue" : @"Brandeis Blue",
             @"brass" : @"Brass",
             @"brass" : @"Brass",
             @"brickRed" : @"Brick Red",
             @"brickred" : @"Brick Red",
             @"brightCerulean" : @"Bright Cerulean",
             @"brightcerulean" : @"Bright Cerulean",
             @"brightGreen" : @"Bright Green",
             @"brightgreen" : @"Bright Green",
             @"brightLavender" : @"Bright Lavender",
             @"brightlavender" : @"Bright Lavender",
             @"brightLilac" : @"Bright Lilac",
             @"brightlilac" : @"Bright Lilac",
             @"brightMaroon" : @"Bright Maroon",
             @"brightmaroon" : @"Bright Maroon",
             @"brightNavyBlue" : @"Bright Navy Blue",
             @"brightnavyblue" : @"Bright Navy Blue",
             @"brightPink" : @"Bright Pink",
             @"brightpink" : @"Bright Pink",
             @"brightTurquoise" : @"Bright Turquoise",
             @"brightturquoise" : @"Bright Turquoise",
             @"brightUbe" : @"Bright Ube",
             @"brightube" : @"Bright Ube",
             @"brilliantAzure" : @"Brilliant Azure",
             @"brilliantazure" : @"Brilliant Azure",
             @"brilliantLavender" : @"Brilliant Lavender",
             @"brilliantlavender" : @"Brilliant Lavender",
             @"brilliantRose" : @"Brilliant Rose",
             @"brilliantrose" : @"Brilliant Rose",
             @"brinkPink" : @"Brink Pink",
             @"brinkpink" : @"Brink Pink",
             @"britishRacingGreen" : @"British Racing Green",
             @"britishracinggreen" : @"British Racing Green",
             @"bronze" : @"Bronze",
             @"bronze" : @"Bronze",
             @"bronzeYellow" : @"Bronze Yellow",
             @"bronzeyellow" : @"Bronze Yellow",
             @"brownTraditional" : @"Brown (Traditional)",
             @"browntraditional" : @"Brown (Traditional)",
             @"brownWeb" : @"Brown (Web)",
             @"brownweb" : @"Brown (Web)",
             @"brownNose" : @"Brown-Nose",
             @"brownnose" : @"Brown-Nose",
             @"brownYellow" : @"Brown Yellow",
             @"brownyellow" : @"Brown Yellow",
             @"brunswickGreen" : @"Brunswick Green",
             @"brunswickgreen" : @"Brunswick Green",
             @"bubbleGum" : @"Bubble Gum",
             @"bubblegum" : @"Bubble Gum",
             @"bubbles" : @"Bubbles",
             @"bubbles" : @"Bubbles",
             @"buff" : @"Buff",
             @"buff" : @"Buff",
             @"budGreen" : @"Bud Green",
             @"budgreen" : @"Bud Green",
             @"bulgarianRose" : @"Bulgarian Rose",
             @"bulgarianrose" : @"Bulgarian Rose",
             @"burgundy" : @"Burgundy",
             @"burgundy" : @"Burgundy",
             @"burlywood" : @"Burlywood",
             @"burlywood" : @"Burlywood",
             @"burntOrange" : @"Burnt Orange",
             @"burntorange" : @"Burnt Orange",
             @"burntSienna" : @"Burnt Sienna",
             @"burntsienna" : @"Burnt Sienna",
             @"burntUmber" : @"Burnt Umber",
             @"burntumber" : @"Burnt Umber",
             @"byzantine" : @"Byzantine",
             @"byzantine" : @"Byzantine",
             @"byzantium" : @"Byzantium",
             @"byzantium" : @"Byzantium",
             @"cadet" : @"Cadet",
             @"cadet" : @"Cadet",
             @"cadetBlue" : @"Cadet Blue",
             @"cadetblue" : @"Cadet Blue",
             @"cadetGrey" : @"Cadet Grey",
             @"cadetgrey" : @"Cadet Grey",
             @"cadmiumGreen" : @"Cadmium Green",
             @"cadmiumgreen" : @"Cadmium Green",
             @"cadmiumOrange" : @"Cadmium Orange",
             @"cadmiumorange" : @"Cadmium Orange",
             @"cadmiumRed" : @"Cadmium Red",
             @"cadmiumred" : @"Cadmium Red",
             @"cadmiumYellow" : @"Cadmium Yellow",
             @"cadmiumyellow" : @"Cadmium Yellow",
             @"caféAuLait" : @"Café Au Lait",
             @"caféaulait" : @"Café Au Lait",
             @"caféNoir" : @"Café Noir",
             @"cafénoir" : @"Café Noir",
             @"calPolyGreen" : @"Cal Poly Green",
             @"calpolygreen" : @"Cal Poly Green",
             @"cambridgeBlue" : @"Cambridge Blue",
             @"cambridgeblue" : @"Cambridge Blue",
             @"camel" : @"Camel",
             @"camel" : @"Camel",
             @"cameoPink" : @"Cameo Pink",
             @"cameopink" : @"Cameo Pink",
             @"camouflageGreen" : @"Camouflage Green",
             @"camouflagegreen" : @"Camouflage Green",
             @"canaryYellow" : @"Canary Yellow",
             @"canaryyellow" : @"Canary Yellow",
             @"candyAppleRed" : @"Candy Apple Red",
             @"candyapplered" : @"Candy Apple Red",
             @"candyPink" : @"Candy Pink",
             @"candypink" : @"Candy Pink",
             @"capri" : @"Capri",
             @"capri" : @"Capri",
             @"caputMortuum" : @"Caput Mortuum",
             @"caputmortuum" : @"Caput Mortuum",
             @"cardinal" : @"Cardinal",
             @"cardinal" : @"Cardinal",
             @"caribbeanGreen" : @"Caribbean Green",
             @"caribbeangreen" : @"Caribbean Green",
             @"carmine" : @"Carmine",
             @"carmine" : @"Carmine",
             @"carmineMP" : @"Carmine (M&P)",
             @"carminemp" : @"Carmine (M&P)",
             @"carminePink" : @"Carmine Pink",
             @"carminepink" : @"Carmine Pink",
             @"carmineRed" : @"Carmine Red",
             @"carminered" : @"Carmine Red",
             @"carnationPink" : @"Carnation Pink",
             @"carnationpink" : @"Carnation Pink",
             @"carnelian" : @"Carnelian",
             @"carnelian" : @"Carnelian",
             @"carolinaBlue" : @"Carolina Blue",
             @"carolinablue" : @"Carolina Blue",
             @"carrotOrange" : @"Carrot Orange",
             @"carrotorange" : @"Carrot Orange",
             @"castletonGreen" : @"Castleton Green",
             @"castletongreen" : @"Castleton Green",
             @"catalinaBlue" : @"Catalina Blue",
             @"catalinablue" : @"Catalina Blue",
             @"catawba" : @"Catawba",
             @"catawba" : @"Catawba",
             @"cedarChest" : @"Cedar Chest",
             @"cedarchest" : @"Cedar Chest",
             @"ceil" : @"Ceil",
             @"ceil" : @"Ceil",
             @"celadon" : @"Celadon",
             @"celadon" : @"Celadon",
             @"celadonBlue" : @"Celadon Blue",
             @"celadonblue" : @"Celadon Blue",
             @"celadonGreen" : @"Celadon Green",
             @"celadongreen" : @"Celadon Green",
             @"celeste" : @"Celeste",
             @"celeste" : @"Celeste",
             @"celestialBlue" : @"Celestial Blue",
             @"celestialblue" : @"Celestial Blue",
             @"cerise" : @"Cerise",
             @"cerise" : @"Cerise",
             @"cerisePink" : @"Cerise Pink",
             @"cerisepink" : @"Cerise Pink",
             @"cerulean" : @"Cerulean",
             @"cerulean" : @"Cerulean",
             @"ceruleanBlue" : @"Cerulean Blue",
             @"ceruleanblue" : @"Cerulean Blue",
             @"ceruleanFrost" : @"Cerulean Frost",
             @"ceruleanfrost" : @"Cerulean Frost",
             @"cGBlue" : @"CG Blue",
             @"cgblue" : @"CG Blue",
             @"cGRed" : @"CG Red",
             @"cgred" : @"CG Red",
             @"chamoisee" : @"Chamoisee",
             @"chamoisee" : @"Chamoisee",
             @"champagne" : @"Champagne",
             @"champagne" : @"Champagne",
             @"charcoal" : @"Charcoal",
             @"charcoal" : @"Charcoal",
             @"charlestonGreen" : @"Charleston Green",
             @"charlestongreen" : @"Charleston Green",
             @"charmPink" : @"Charm Pink",
             @"charmpink" : @"Charm Pink",
             @"chartreuseTraditional" : @"Chartreuse (Traditional)",
             @"chartreusetraditional" : @"Chartreuse (Traditional)",
             @"chartreuseWeb" : @"Chartreuse (Web)",
             @"chartreuseweb" : @"Chartreuse (Web)",
             @"cherry" : @"Cherry",
             @"cherry" : @"Cherry",
             @"cherryBlossomPink" : @"Cherry Blossom Pink",
             @"cherryblossompink" : @"Cherry Blossom Pink",
             @"chestnut" : @"Chestnut",
             @"chestnut" : @"Chestnut",
             @"chinaPink" : @"China Pink",
             @"chinapink" : @"China Pink",
             @"chinaRose" : @"China Rose",
             @"chinarose" : @"China Rose",
             @"chineseRed" : @"Chinese Red",
             @"chinesered" : @"Chinese Red",
             @"chineseViolet" : @"Chinese Violet",
             @"chineseviolet" : @"Chinese Violet",
             @"chocolateTraditional" : @"Chocolate (Traditional)",
             @"chocolatetraditional" : @"Chocolate (Traditional)",
             @"chocolateWeb" : @"Chocolate (Web)",
             @"chocolateweb" : @"Chocolate (Web)",
             @"chromeYellow" : @"Chrome Yellow",
             @"chromeyellow" : @"Chrome Yellow",
             @"cinereous" : @"Cinereous",
             @"cinereous" : @"Cinereous",
             @"cinnabar" : @"Cinnabar",
             @"cinnabar" : @"Cinnabar",
             @"cinnamonCitationNeeded" : @"Cinnamon[Citation Needed]",
             @"cinnamoncitationneeded" : @"Cinnamon[Citation Needed]",
             @"citrine" : @"Citrine",
             @"citrine" : @"Citrine",
             @"citron" : @"Citron",
             @"citron" : @"Citron",
             @"claret" : @"Claret",
             @"claret" : @"Claret",
             @"classicRose" : @"Classic Rose",
             @"classicrose" : @"Classic Rose",
             @"cobaltBlue" : @"Cobalt Blue",
             @"cobaltblue" : @"Cobalt Blue",
             @"cocoaBrown" : @"Cocoa Brown",
             @"cocoabrown" : @"Cocoa Brown",
             @"coconut" : @"Coconut",
             @"coconut" : @"Coconut",
             @"coffee" : @"Coffee",
             @"coffee" : @"Coffee",
             @"columbiaBlue" : @"Columbia Blue",
             @"columbiablue" : @"Columbia Blue",
             @"congoPink" : @"Congo Pink",
             @"congopink" : @"Congo Pink",
             @"coolBlack" : @"Cool Black",
             @"coolblack" : @"Cool Black",
             @"coolGrey" : @"Cool Grey",
             @"coolgrey" : @"Cool Grey",
             @"copper" : @"Copper",
             @"copper" : @"Copper",
             @"copperCrayola" : @"Copper (Crayola)",
             @"coppercrayola" : @"Copper (Crayola)",
             @"copperPenny" : @"Copper Penny",
             @"copperpenny" : @"Copper Penny",
             @"copperRed" : @"Copper Red",
             @"copperred" : @"Copper Red",
             @"copperRose" : @"Copper Rose",
             @"copperrose" : @"Copper Rose",
             @"coquelicot" : @"Coquelicot",
             @"coquelicot" : @"Coquelicot",
             @"coral" : @"Coral",
             @"coral" : @"Coral",
             @"coralPink" : @"Coral Pink",
             @"coralpink" : @"Coral Pink",
             @"coralRed" : @"Coral Red",
             @"coralred" : @"Coral Red",
             @"cordovan" : @"Cordovan",
             @"cordovan" : @"Cordovan",
             @"corn" : @"Corn",
             @"corn" : @"Corn",
             @"cornellRed" : @"Cornell Red",
             @"cornellred" : @"Cornell Red",
             @"cornflowerBlue" : @"Cornflower Blue",
             @"cornflowerblue" : @"Cornflower Blue",
             @"cornsilk" : @"Cornsilk",
             @"cornsilk" : @"Cornsilk",
             @"cosmicLatte" : @"Cosmic Latte",
             @"cosmiclatte" : @"Cosmic Latte",
             @"coyoteBrown" : @"Coyote Brown",
             @"coyotebrown" : @"Coyote Brown",
             @"cottonCandy" : @"Cotton Candy",
             @"cottoncandy" : @"Cotton Candy",
             @"cream" : @"Cream",
             @"cream" : @"Cream",
             @"crimson" : @"Crimson",
             @"crimson" : @"Crimson",
             @"crimsonGlory" : @"Crimson Glory",
             @"crimsonglory" : @"Crimson Glory",
             @"crimsonRed" : @"Crimson Red",
             @"crimsonred" : @"Crimson Red",
             @"cyan" : @"Cyan",
             @"cyan" : @"Cyan",
             @"cyanAzure" : @"Cyan Azure",
             @"cyanazure" : @"Cyan Azure",
             @"cyanBlueAzure" : @"Cyan-Blue Azure",
             @"cyanblueazure" : @"Cyan-Blue Azure",
             @"cyanCobaltBlue" : @"Cyan Cobalt Blue",
             @"cyancobaltblue" : @"Cyan Cobalt Blue",
             @"cyanCornflowerBlue" : @"Cyan Cornflower Blue",
             @"cyancornflowerblue" : @"Cyan Cornflower Blue",
             @"cyanProcess" : @"Cyan (Process)",
             @"cyanprocess" : @"Cyan (Process)",
             @"cyberGrape" : @"Cyber Grape",
             @"cybergrape" : @"Cyber Grape",
             @"cyberYellow" : @"Cyber Yellow",
             @"cyberyellow" : @"Cyber Yellow",
             @"daffodil" : @"Daffodil",
             @"daffodil" : @"Daffodil",
             @"dandelion" : @"Dandelion",
             @"dandelion" : @"Dandelion",
             @"darkBlue" : @"Dark Blue",
             @"darkblue" : @"Dark Blue",
             @"darkBlueGray" : @"Dark Blue-Gray",
             @"darkbluegray" : @"Dark Blue-Gray",
             @"darkBrown" : @"Dark Brown",
             @"darkbrown" : @"Dark Brown",
             @"darkBrownTangelo" : @"Dark Brown-Tangelo",
             @"darkbrowntangelo" : @"Dark Brown-Tangelo",
             @"darkByzantium" : @"Dark Byzantium",
             @"darkbyzantium" : @"Dark Byzantium",
             @"darkCandyAppleRed" : @"Dark Candy Apple Red",
             @"darkcandyapplered" : @"Dark Candy Apple Red",
             @"darkCerulean" : @"Dark Cerulean",
             @"darkcerulean" : @"Dark Cerulean",
             @"darkChestnut" : @"Dark Chestnut",
             @"darkchestnut" : @"Dark Chestnut",
             @"darkCoral" : @"Dark Coral",
             @"darkcoral" : @"Dark Coral",
             @"darkCyan" : @"Dark Cyan",
             @"darkcyan" : @"Dark Cyan",
             @"darkElectricBlue" : @"Dark Electric Blue",
             @"darkelectricblue" : @"Dark Electric Blue",
             @"darkGoldenrod" : @"Dark Goldenrod",
             @"darkgoldenrod" : @"Dark Goldenrod",
             @"darkGrayX11" : @"Dark Gray (X11)",
             @"darkgrayx11" : @"Dark Gray (X11)",
             @"darkGreen" : @"Dark Green",
             @"darkgreen" : @"Dark Green",
             @"darkGreenX11" : @"Dark Green (X11)",
             @"darkgreenx11" : @"Dark Green (X11)",
             @"darkImperialBlue" : @"Dark Imperial Blue",
             @"darkimperialblue" : @"Dark Imperial Blue",
             @"darkImperialBlue2" : @"Dark Imperial Blue",
             @"darkimperialblue2" : @"Dark Imperial Blue",
             @"darkJungleGreen" : @"Dark Jungle Green",
             @"darkjunglegreen" : @"Dark Jungle Green",
             @"darkKhaki" : @"Dark Khaki",
             @"darkkhaki" : @"Dark Khaki",
             @"darkLava" : @"Dark Lava",
             @"darklava" : @"Dark Lava",
             @"darkLavender" : @"Dark Lavender",
             @"darklavender" : @"Dark Lavender",
             @"darkLiver" : @"Dark Liver",
             @"darkliver" : @"Dark Liver",
             @"darkLiverHorses" : @"Dark Liver (Horses)",
             @"darkliverhorses" : @"Dark Liver (Horses)",
             @"darkMagenta" : @"Dark Magenta",
             @"darkmagenta" : @"Dark Magenta",
             @"darkMediumGray" : @"Dark Medium Gray",
             @"darkmediumgray" : @"Dark Medium Gray",
             @"darkMidnightBlue" : @"Dark Midnight Blue",
             @"darkmidnightblue" : @"Dark Midnight Blue",
             @"darkMossGreen" : @"Dark Moss Green",
             @"darkmossgreen" : @"Dark Moss Green",
             @"darkOliveGreen" : @"Dark Olive Green",
             @"darkolivegreen" : @"Dark Olive Green",
             @"darkOrange" : @"Dark Orange",
             @"darkorange" : @"Dark Orange",
             @"darkOrchid" : @"Dark Orchid",
             @"darkorchid" : @"Dark Orchid",
             @"darkPastelBlue" : @"Dark Pastel Blue",
             @"darkpastelblue" : @"Dark Pastel Blue",
             @"darkPastelGreen" : @"Dark Pastel Green",
             @"darkpastelgreen" : @"Dark Pastel Green",
             @"darkPastelPurple" : @"Dark Pastel Purple",
             @"darkpastelpurple" : @"Dark Pastel Purple",
             @"darkPastelRed" : @"Dark Pastel Red",
             @"darkpastelred" : @"Dark Pastel Red",
             @"darkPink" : @"Dark Pink",
             @"darkpink" : @"Dark Pink",
             @"darkPowderBlue" : @"Dark Powder Blue",
             @"darkpowderblue" : @"Dark Powder Blue",
             @"darkPuce" : @"Dark Puce",
             @"darkpuce" : @"Dark Puce",
             @"darkPurple" : @"Dark Purple",
             @"darkpurple" : @"Dark Purple",
             @"darkRaspberry" : @"Dark Raspberry",
             @"darkraspberry" : @"Dark Raspberry",
             @"darkRed" : @"Dark Red",
             @"darkred" : @"Dark Red",
             @"darkSalmon" : @"Dark Salmon",
             @"darksalmon" : @"Dark Salmon",
             @"darkScarlet" : @"Dark Scarlet",
             @"darkscarlet" : @"Dark Scarlet",
             @"darkSeaGreen" : @"Dark Sea Green",
             @"darkseagreen" : @"Dark Sea Green",
             @"darkSienna" : @"Dark Sienna",
             @"darksienna" : @"Dark Sienna",
             @"darkSkyBlue" : @"Dark Sky Blue",
             @"darkskyblue" : @"Dark Sky Blue",
             @"darkSlateBlue" : @"Dark Slate Blue",
             @"darkslateblue" : @"Dark Slate Blue",
             @"darkSlateGray" : @"Dark Slate Gray",
             @"darkslategray" : @"Dark Slate Gray",
             @"darkSpringGreen" : @"Dark Spring Green",
             @"darkspringgreen" : @"Dark Spring Green",
             @"darkTan" : @"Dark Tan",
             @"darktan" : @"Dark Tan",
             @"darkTangerine" : @"Dark Tangerine",
             @"darktangerine" : @"Dark Tangerine",
             @"darkTaupe" : @"Dark Taupe",
             @"darktaupe" : @"Dark Taupe",
             @"darkTerraCotta" : @"Dark Terra Cotta",
             @"darkterracotta" : @"Dark Terra Cotta",
             @"darkTurquoise" : @"Dark Turquoise",
             @"darkturquoise" : @"Dark Turquoise",
             @"darkVanilla" : @"Dark Vanilla",
             @"darkvanilla" : @"Dark Vanilla",
             @"darkViolet" : @"Dark Violet",
             @"darkviolet" : @"Dark Violet",
             @"darkYellow" : @"Dark Yellow",
             @"darkyellow" : @"Dark Yellow",
             @"dartmouthGreen" : @"Dartmouth Green",
             @"dartmouthgreen" : @"Dartmouth Green",
             @"davysGrey" : @"Davy's Grey",
             @"davysgrey" : @"Davy's Grey",
             @"debianRed" : @"Debian Red",
             @"debianred" : @"Debian Red",
             @"deepAquamarine" : @"Deep Aquamarine",
             @"deepaquamarine" : @"Deep Aquamarine",
             @"deepCarmine" : @"Deep Carmine",
             @"deepcarmine" : @"Deep Carmine",
             @"deepCarminePink" : @"Deep Carmine Pink",
             @"deepcarminepink" : @"Deep Carmine Pink",
             @"deepCarrotOrange" : @"Deep Carrot Orange",
             @"deepcarrotorange" : @"Deep Carrot Orange",
             @"deepCerise" : @"Deep Cerise",
             @"deepcerise" : @"Deep Cerise",
             @"deepChampagne" : @"Deep Champagne",
             @"deepchampagne" : @"Deep Champagne",
             @"deepChestnut" : @"Deep Chestnut",
             @"deepchestnut" : @"Deep Chestnut",
             @"deepCoffee" : @"Deep Coffee",
             @"deepcoffee" : @"Deep Coffee",
             @"deepFuchsia" : @"Deep Fuchsia",
             @"deepfuchsia" : @"Deep Fuchsia",
             @"deepGreen" : @"Deep Green",
             @"deepgreen" : @"Deep Green",
             @"deepGreenCyanTurquoise" : @"Deep Green-Cyan Turquoise",
             @"deepgreencyanturquoise" : @"Deep Green-Cyan Turquoise",
             @"deepJungleGreen" : @"Deep Jungle Green",
             @"deepjunglegreen" : @"Deep Jungle Green",
             @"deepKoamaru" : @"Deep Koamaru",
             @"deepkoamaru" : @"Deep Koamaru",
             @"deepLemon" : @"Deep Lemon",
             @"deeplemon" : @"Deep Lemon",
             @"deepLilac" : @"Deep Lilac",
             @"deeplilac" : @"Deep Lilac",
             @"deepMagenta" : @"Deep Magenta",
             @"deepmagenta" : @"Deep Magenta",
             @"deepMaroon" : @"Deep Maroon",
             @"deepmaroon" : @"Deep Maroon",
             @"deepMauve" : @"Deep Mauve",
             @"deepmauve" : @"Deep Mauve",
             @"deepMossGreen" : @"Deep Moss Green",
             @"deepmossgreen" : @"Deep Moss Green",
             @"deepPeach" : @"Deep Peach",
             @"deeppeach" : @"Deep Peach",
             @"deepPink" : @"Deep Pink",
             @"deeppink" : @"Deep Pink",
             @"deepPuce" : @"Deep Puce",
             @"deeppuce" : @"Deep Puce",
             @"deepRed" : @"Deep Red",
             @"deepred" : @"Deep Red",
             @"deepRuby" : @"Deep Ruby",
             @"deepruby" : @"Deep Ruby",
             @"deepSaffron" : @"Deep Saffron",
             @"deepsaffron" : @"Deep Saffron",
             @"deepSkyBlue" : @"Deep Sky Blue",
             @"deepskyblue" : @"Deep Sky Blue",
             @"deepSpaceSparkle" : @"Deep Space Sparkle",
             @"deepspacesparkle" : @"Deep Space Sparkle",
             @"deepSpringBud" : @"Deep Spring Bud",
             @"deepspringbud" : @"Deep Spring Bud",
             @"deepTaupe" : @"Deep Taupe",
             @"deeptaupe" : @"Deep Taupe",
             @"deepTuscanRed" : @"Deep Tuscan Red",
             @"deeptuscanred" : @"Deep Tuscan Red",
             @"deepViolet" : @"Deep Violet",
             @"deepviolet" : @"Deep Violet",
             @"deer" : @"Deer",
             @"deer" : @"Deer",
             @"denim" : @"Denim",
             @"denim" : @"Denim",
             @"desaturatedCyan" : @"Desaturated Cyan",
             @"desaturatedcyan" : @"Desaturated Cyan",
             @"desert" : @"Desert",
             @"desert" : @"Desert",
             @"desertSand" : @"Desert Sand",
             @"desertsand" : @"Desert Sand",
             @"desire" : @"Desire",
             @"desire" : @"Desire",
             @"diamond" : @"Diamond",
             @"diamond" : @"Diamond",
             @"dimGray" : @"Dim Gray",
             @"dimgray" : @"Dim Gray",
             @"dirt" : @"Dirt",
             @"dirt" : @"Dirt",
             @"dodgerBlue" : @"Dodger Blue",
             @"dodgerblue" : @"Dodger Blue",
             @"dogwoodRose" : @"Dogwood Rose",
             @"dogwoodrose" : @"Dogwood Rose",
             @"dollarBill" : @"Dollar Bill",
             @"dollarbill" : @"Dollar Bill",
             @"donkeyBrown" : @"Donkey Brown",
             @"donkeybrown" : @"Donkey Brown",
             @"drab" : @"Drab",
             @"drab" : @"Drab",
             @"dukeBlue" : @"Duke Blue",
             @"dukeblue" : @"Duke Blue",
             @"dustStorm" : @"Dust Storm",
             @"duststorm" : @"Dust Storm",
             @"dutchWhite" : @"Dutch White",
             @"dutchwhite" : @"Dutch White",
             @"earthYellow" : @"Earth Yellow",
             @"earthyellow" : @"Earth Yellow",
             @"ebony" : @"Ebony",
             @"ebony" : @"Ebony",
             @"ecru" : @"Ecru",
             @"ecru" : @"Ecru",
             @"eerieBlack" : @"Eerie Black",
             @"eerieblack" : @"Eerie Black",
             @"eggplant" : @"Eggplant",
             @"eggplant" : @"Eggplant",
             @"eggshell" : @"Eggshell",
             @"eggshell" : @"Eggshell",
             @"egyptianBlue" : @"Egyptian Blue",
             @"egyptianblue" : @"Egyptian Blue",
             @"electricBlue" : @"Electric Blue",
             @"electricblue" : @"Electric Blue",
             @"electricCrimson" : @"Electric Crimson",
             @"electriccrimson" : @"Electric Crimson",
             @"electricCyan" : @"Electric Cyan",
             @"electriccyan" : @"Electric Cyan",
             @"electricGreen" : @"Electric Green",
             @"electricgreen" : @"Electric Green",
             @"electricIndigo" : @"Electric Indigo",
             @"electricindigo" : @"Electric Indigo",
             @"electricLavender" : @"Electric Lavender",
             @"electriclavender" : @"Electric Lavender",
             @"electricLime" : @"Electric Lime",
             @"electriclime" : @"Electric Lime",
             @"electricPurple" : @"Electric Purple",
             @"electricpurple" : @"Electric Purple",
             @"electricUltramarine" : @"Electric Ultramarine",
             @"electricultramarine" : @"Electric Ultramarine",
             @"electricViolet" : @"Electric Violet",
             @"electricviolet" : @"Electric Violet",
             @"electricYellow" : @"Electric Yellow",
             @"electricyellow" : @"Electric Yellow",
             @"emerald" : @"Emerald",
             @"emerald" : @"Emerald",
             @"eminence" : @"Eminence",
             @"eminence" : @"Eminence",
             @"englishGreen" : @"English Green",
             @"englishgreen" : @"English Green",
             @"englishLavender" : @"English Lavender",
             @"englishlavender" : @"English Lavender",
             @"englishRed" : @"English Red",
             @"englishred" : @"English Red",
             @"englishViolet" : @"English Violet",
             @"englishviolet" : @"English Violet",
             @"etonBlue" : @"Eton Blue",
             @"etonblue" : @"Eton Blue",
             @"eucalyptus" : @"Eucalyptus",
             @"eucalyptus" : @"Eucalyptus",
             @"fallow" : @"Fallow",
             @"fallow" : @"Fallow",
             @"faluRed" : @"Falu Red",
             @"falured" : @"Falu Red",
             @"fandango" : @"Fandango",
             @"fandango" : @"Fandango",
             @"fandangoPink" : @"Fandango Pink",
             @"fandangopink" : @"Fandango Pink",
             @"fashionFuchsia" : @"Fashion Fuchsia",
             @"fashionfuchsia" : @"Fashion Fuchsia",
             @"fawn" : @"Fawn",
             @"fawn" : @"Fawn",
             @"feldgrau" : @"Feldgrau",
             @"feldgrau" : @"Feldgrau",
             @"feldspar" : @"Feldspar",
             @"feldspar" : @"Feldspar",
             @"fernGreen" : @"Fern Green",
             @"ferngreen" : @"Fern Green",
             @"ferrariRed" : @"Ferrari Red",
             @"ferrarired" : @"Ferrari Red",
             @"fieldDrab" : @"Field Drab",
             @"fielddrab" : @"Field Drab",
             @"firebrick" : @"Firebrick",
             @"firebrick" : @"Firebrick",
             @"fireEngineRed" : @"Fire Engine Red",
             @"fireenginered" : @"Fire Engine Red",
             @"flame" : @"Flame",
             @"flame" : @"Flame",
             @"flamingoPink" : @"Flamingo Pink",
             @"flamingopink" : @"Flamingo Pink",
             @"flattery" : @"Flattery",
             @"flattery" : @"Flattery",
             @"flavescent" : @"Flavescent",
             @"flavescent" : @"Flavescent",
             @"flax" : @"Flax",
             @"flax" : @"Flax",
             @"flirt" : @"Flirt",
             @"flirt" : @"Flirt",
             @"floralWhite" : @"Floral White",
             @"floralwhite" : @"Floral White",
             @"fluorescentOrange" : @"Fluorescent Orange",
             @"fluorescentorange" : @"Fluorescent Orange",
             @"fluorescentPink" : @"Fluorescent Pink",
             @"fluorescentpink" : @"Fluorescent Pink",
             @"fluorescentYellow" : @"Fluorescent Yellow",
             @"fluorescentyellow" : @"Fluorescent Yellow",
             @"folly" : @"Folly",
             @"folly" : @"Folly",
             @"forestGreenTraditional" : @"Forest Green (Traditional)",
             @"forestgreentraditional" : @"Forest Green (Traditional)",
             @"forestGreenWeb" : @"Forest Green (Web)",
             @"forestgreenweb" : @"Forest Green (Web)",
             @"frenchBeige" : @"French Beige",
             @"frenchbeige" : @"French Beige",
             @"frenchBistre" : @"French Bistre",
             @"frenchbistre" : @"French Bistre",
             @"frenchBlue" : @"French Blue",
             @"frenchblue" : @"French Blue",
             @"frenchFuchsia" : @"French Fuchsia",
             @"frenchfuchsia" : @"French Fuchsia",
             @"frenchLilac" : @"French Lilac",
             @"frenchlilac" : @"French Lilac",
             @"frenchLime" : @"French Lime",
             @"frenchlime" : @"French Lime",
             @"frenchMauve" : @"French Mauve",
             @"frenchmauve" : @"French Mauve",
             @"frenchPink" : @"French Pink",
             @"frenchpink" : @"French Pink",
             @"frenchPlum" : @"French Plum",
             @"frenchplum" : @"French Plum",
             @"frenchPuce" : @"French Puce",
             @"frenchpuce" : @"French Puce",
             @"frenchRaspberry" : @"French Raspberry",
             @"frenchraspberry" : @"French Raspberry",
             @"frenchRose" : @"French Rose",
             @"frenchrose" : @"French Rose",
             @"frenchSkyBlue" : @"French Sky Blue",
             @"frenchskyblue" : @"French Sky Blue",
             @"frenchViolet" : @"French Violet",
             @"frenchviolet" : @"French Violet",
             @"frenchWine" : @"French Wine",
             @"frenchwine" : @"French Wine",
             @"freshAir" : @"Fresh Air",
             @"freshair" : @"Fresh Air",
             @"fuchsia" : @"Fuchsia",
             @"fuchsia" : @"Fuchsia",
             @"fuchsiaCrayola" : @"Fuchsia (Crayola)",
             @"fuchsiacrayola" : @"Fuchsia (Crayola)",
             @"fuchsiaPink" : @"Fuchsia Pink",
             @"fuchsiapink" : @"Fuchsia Pink",
             @"fuchsiaPurple" : @"Fuchsia Purple",
             @"fuchsiapurple" : @"Fuchsia Purple",
             @"fuchsiaRose" : @"Fuchsia Rose",
             @"fuchsiarose" : @"Fuchsia Rose",
             @"fulvous" : @"Fulvous",
             @"fulvous" : @"Fulvous",
             @"fuzzyWuzzy" : @"Fuzzy Wuzzy",
             @"fuzzywuzzy" : @"Fuzzy Wuzzy",
             @"gamboge" : @"Gamboge",
             @"gamboge" : @"Gamboge",
             @"gambogeOrangeBrown" : @"Gamboge Orange (Brown)",
             @"gambogeorangebrown" : @"Gamboge Orange (Brown)",
             @"genericViridian" : @"Generic Viridian",
             @"genericviridian" : @"Generic Viridian",
             @"ghostWhite" : @"Ghost White",
             @"ghostwhite" : @"Ghost White",
             @"giantsOrange" : @"Giants Orange",
             @"giantsorange" : @"Giants Orange",
             @"grussrel" : @"Grussrel",
             @"grussrel" : @"Grussrel",
             @"glaucous" : @"Glaucous",
             @"glaucous" : @"Glaucous",
             @"glitter" : @"Glitter",
             @"glitter" : @"Glitter",
             @"gOGreen" : @"GO Green",
             @"gogreen" : @"GO Green",
             @"goldMetallic" : @"Gold (Metallic)",
             @"goldmetallic" : @"Gold (Metallic)",
             @"goldWebGolden" : @"Gold (Web) (Golden)",
             @"goldwebgolden" : @"Gold (Web) (Golden)",
             @"goldFusion" : @"Gold Fusion",
             @"goldfusion" : @"Gold Fusion",
             @"goldenBrown" : @"Golden Brown",
             @"goldenbrown" : @"Golden Brown",
             @"goldenPoppy" : @"Golden Poppy",
             @"goldenpoppy" : @"Golden Poppy",
             @"goldenYellow" : @"Golden Yellow",
             @"goldenyellow" : @"Golden Yellow",
             @"goldenrod" : @"Goldenrod",
             @"goldenrod" : @"Goldenrod",
             @"grannySmithApple" : @"Granny Smith Apple",
             @"grannysmithapple" : @"Granny Smith Apple",
             @"grape" : @"Grape",
             @"grape" : @"Grape",
             @"gray" : @"Gray",
             @"gray" : @"Gray",
             @"grayHTMLCSSGray" : @"Gray (HTML/CSS Gray)",
             @"grayhtmlcssgray" : @"Gray (HTML/CSS Gray)",
             @"grayX11Gray" : @"Gray (X11 Gray)",
             @"grayx11gray" : @"Gray (X11 Gray)",
             @"grayAsparagus" : @"Gray-Asparagus",
             @"grayasparagus" : @"Gray-Asparagus",
             @"grayBlue" : @"Gray-Blue",
             @"grayblue" : @"Gray-Blue",
             @"greenColorWheelX11Green" : @"Green (Color Wheel) (X11 Green)",
             @"greencolorwheelx11green" : @"Green (Color Wheel) (X11 Green)",
             @"greenCrayola" : @"Green (Crayola)",
             @"greencrayola" : @"Green (Crayola)",
             @"greenHTMLCSSColor" : @"Green (HTML/CSS Color)",
             @"greenhtmlcsscolor" : @"Green (HTML/CSS Color)",
             @"greenMunsell" : @"Green (Munsell)",
             @"greenmunsell" : @"Green (Munsell)",
             @"greenNCS" : @"Green (NCS)",
             @"greenncs" : @"Green (NCS)",
             @"greenPantone" : @"Green (Pantone)",
             @"greenpantone" : @"Green (Pantone)",
             @"greenPigment" : @"Green (Pigment)",
             @"greenpigment" : @"Green (Pigment)",
             @"greenRYB" : @"Green (RYB)",
             @"greenryb" : @"Green (RYB)",
             @"greenBlue" : @"Green-Blue",
             @"greenblue" : @"Green-Blue",
             @"greenCyan" : @"Green-Cyan",
             @"greencyan" : @"Green-Cyan",
             @"greenYellow" : @"Green-Yellow",
             @"greenyellow" : @"Green-Yellow",
             @"grizzly" : @"Grizzly",
             @"grizzly" : @"Grizzly",
             @"grullo" : @"Grullo",
             @"grullo" : @"Grullo",
             @"guppieGreen" : @"Guppie Green",
             @"guppiegreen" : @"Guppie Green",
             @"halayàÚbe" : @"Halayà Úbe",
             @"halayàúbe" : @"Halayà Úbe",
             @"hanBlue" : @"Han Blue",
             @"hanblue" : @"Han Blue",
             @"hanPurple" : @"Han Purple",
             @"hanpurple" : @"Han Purple",
             @"hansaYellow" : @"Hansa Yellow",
             @"hansayellow" : @"Hansa Yellow",
             @"harlequin" : @"Harlequin",
             @"harlequin" : @"Harlequin",
             @"harlequinGreen" : @"Harlequin Green",
             @"harlequingreen" : @"Harlequin Green",
             @"harvardCrimson" : @"Harvard Crimson",
             @"harvardcrimson" : @"Harvard Crimson",
             @"harvestGold" : @"Harvest Gold",
             @"harvestgold" : @"Harvest Gold",
             @"heartGold" : @"Heart Gold",
             @"heartgold" : @"Heart Gold",
             @"heliotrope" : @"Heliotrope",
             @"heliotrope" : @"Heliotrope",
             @"heliotropeGray" : @"Heliotrope Gray",
             @"heliotropegray" : @"Heliotrope Gray",
             @"heliotropeMagenta" : @"Heliotrope Magenta",
             @"heliotropemagenta" : @"Heliotrope Magenta",
             @"hollywoodCerise" : @"Hollywood Cerise",
             @"hollywoodcerise" : @"Hollywood Cerise",
             @"honeydew" : @"Honeydew",
             @"honeydew" : @"Honeydew",
             @"honoluluBlue" : @"Honolulu Blue",
             @"honolulublue" : @"Honolulu Blue",
             @"hookersGreen" : @"Hooker's Green",
             @"hookersgreen" : @"Hooker's Green",
             @"hotMagenta" : @"Hot Magenta",
             @"hotmagenta" : @"Hot Magenta",
             @"hotPink" : @"Hot Pink",
             @"hotpink" : @"Hot Pink",
             @"hunterGreen" : @"Hunter Green",
             @"huntergreen" : @"Hunter Green",
             @"iceberg" : @"Iceberg",
             @"iceberg" : @"Iceberg",
             @"icterine" : @"Icterine",
             @"icterine" : @"Icterine",
             @"illuminatingEmerald" : @"Illuminating Emerald",
             @"illuminatingemerald" : @"Illuminating Emerald",
             @"imperial" : @"Imperial",
             @"imperial" : @"Imperial",
             @"imperialBlue" : @"Imperial Blue",
             @"imperialblue" : @"Imperial Blue",
             @"imperialPurple" : @"Imperial Purple",
             @"imperialpurple" : @"Imperial Purple",
             @"imperialRed" : @"Imperial Red",
             @"imperialred" : @"Imperial Red",
             @"inchworm" : @"Inchworm",
             @"inchworm" : @"Inchworm",
             @"independence" : @"Independence",
             @"independence" : @"Independence",
             @"indiaGreen" : @"India Green",
             @"indiagreen" : @"India Green",
             @"indianRed" : @"Indian Red",
             @"indianred" : @"Indian Red",
             @"indianYellow" : @"Indian Yellow",
             @"indianyellow" : @"Indian Yellow",
             @"indigo" : @"Indigo",
             @"indigo" : @"Indigo",
             @"indigoDye" : @"Indigo Dye",
             @"indigodye" : @"Indigo Dye",
             @"indigoWeb" : @"Indigo (Web)",
             @"indigoweb" : @"Indigo (Web)",
             @"internationalKleinBlue" : @"International Klein Blue",
             @"internationalkleinblue" : @"International Klein Blue",
             @"internationalOrangeAerospace" : @"International Orange (Aerospace)",
             @"internationalorangeaerospace" : @"International Orange (Aerospace)",
             @"internationalOrangeEngineering" : @"International Orange (Engineering)",
             @"internationalorangeengineering" : @"International Orange (Engineering)",
             @"internationalOrangeGoldenGateBridge" : @"International Orange (Golden Gate Bridge)",
             @"internationalorangegoldengatebridge" : @"International Orange (Golden Gate Bridge)",
             @"iris" : @"Iris",
             @"iris" : @"Iris",
             @"irresistible" : @"Irresistible",
             @"irresistible" : @"Irresistible",
             @"isabelline" : @"Isabelline",
             @"isabelline" : @"Isabelline",
             @"islamicGreen" : @"Islamic Green",
             @"islamicgreen" : @"Islamic Green",
             @"italianSkyBlue" : @"Italian Sky Blue",
             @"italianskyblue" : @"Italian Sky Blue",
             @"ivory" : @"Ivory",
             @"ivory" : @"Ivory",
             @"jade" : @"Jade",
             @"jade" : @"Jade",
             @"japaneseCarmine" : @"Japanese Carmine",
             @"japanesecarmine" : @"Japanese Carmine",
             @"japaneseIndigo" : @"Japanese Indigo",
             @"japaneseindigo" : @"Japanese Indigo",
             @"japaneseViolet" : @"Japanese Violet",
             @"japaneseviolet" : @"Japanese Violet",
             @"jasmine" : @"Jasmine",
             @"jasmine" : @"Jasmine",
             @"jasper" : @"Jasper",
             @"jasper" : @"Jasper",
             @"jazzberryJam" : @"Jazzberry Jam",
             @"jazzberryjam" : @"Jazzberry Jam",
             @"jellyBean" : @"Jelly Bean",
             @"jellybean" : @"Jelly Bean",
             @"jet" : @"Jet",
             @"jet" : @"Jet",
             @"jonquil" : @"Jonquil",
             @"jonquil" : @"Jonquil",
             @"jordyBlue" : @"Jordy Blue",
             @"jordyblue" : @"Jordy Blue",
             @"juneBud" : @"June Bud",
             @"junebud" : @"June Bud",
             @"jungleGreen" : @"Jungle Green",
             @"junglegreen" : @"Jungle Green",
             @"kellyGreen" : @"Kelly Green",
             @"kellygreen" : @"Kelly Green",
             @"kenyanCopper" : @"Kenyan Copper",
             @"kenyancopper" : @"Kenyan Copper",
             @"keppel" : @"Keppel",
             @"keppel" : @"Keppel",
             @"jawadChickenColorHTMLCSSKhaki" : @"Jawad/Chicken Color (HTML/CSS) (Khaki)",
             @"jawadchickencolorhtmlcsskhaki" : @"Jawad/Chicken Color (HTML/CSS) (Khaki)",
             @"khakiX11LightKhaki" : @"Khaki (X11) (Light Khaki)",
             @"khakix11lightkhaki" : @"Khaki (X11) (Light Khaki)",
             @"kobe" : @"Kobe",
             @"kobe" : @"Kobe",
             @"kobi" : @"Kobi",
             @"kobi" : @"Kobi",
             @"kombuGreen" : @"Kombu Green",
             @"kombugreen" : @"Kombu Green",
             @"kUCrimson" : @"KU Crimson",
             @"kucrimson" : @"KU Crimson",
             @"laSalleGreen" : @"La Salle Green",
             @"lasallegreen" : @"La Salle Green",
             @"languidLavender" : @"Languid Lavender",
             @"languidlavender" : @"Languid Lavender",
             @"lapisLazuli" : @"Lapis Lazuli",
             @"lapislazuli" : @"Lapis Lazuli",
             @"laserLemon" : @"Laser Lemon",
             @"laserlemon" : @"Laser Lemon",
             @"laurelGreen" : @"Laurel Green",
             @"laurelgreen" : @"Laurel Green",
             @"lava" : @"Lava",
             @"lava" : @"Lava",
             @"lavenderFloral" : @"Lavender (Floral)",
             @"lavenderfloral" : @"Lavender (Floral)",
             @"lavenderWeb" : @"Lavender (Web)",
             @"lavenderweb" : @"Lavender (Web)",
             @"lavenderBlue" : @"Lavender Blue",
             @"lavenderblue" : @"Lavender Blue",
             @"lavenderBlush" : @"Lavender Blush",
             @"lavenderblush" : @"Lavender Blush",
             @"lavenderGray" : @"Lavender Gray",
             @"lavendergray" : @"Lavender Gray",
             @"lavenderIndigo" : @"Lavender Indigo",
             @"lavenderindigo" : @"Lavender Indigo",
             @"lavenderMagenta" : @"Lavender Magenta",
             @"lavendermagenta" : @"Lavender Magenta",
             @"lavenderMist" : @"Lavender Mist",
             @"lavendermist" : @"Lavender Mist",
             @"lavenderPink" : @"Lavender Pink",
             @"lavenderpink" : @"Lavender Pink",
             @"lavenderPurple" : @"Lavender Purple",
             @"lavenderpurple" : @"Lavender Purple",
             @"lavenderRose" : @"Lavender Rose",
             @"lavenderrose" : @"Lavender Rose",
             @"lawnGreen" : @"Lawn Green",
             @"lawngreen" : @"Lawn Green",
             @"lemon" : @"Lemon",
             @"lemon" : @"Lemon",
             @"lemonChiffon" : @"Lemon Chiffon",
             @"lemonchiffon" : @"Lemon Chiffon",
             @"lemonCurry" : @"Lemon Curry",
             @"lemoncurry" : @"Lemon Curry",
             @"lemonGlacier" : @"Lemon Glacier",
             @"lemonglacier" : @"Lemon Glacier",
             @"lemonLime" : @"Lemon Lime",
             @"lemonlime" : @"Lemon Lime",
             @"lemonMeringue" : @"Lemon Meringue",
             @"lemonmeringue" : @"Lemon Meringue",
             @"lemonYellow" : @"Lemon Yellow",
             @"lemonyellow" : @"Lemon Yellow",
             @"lenurple" : @"Lenurple",
             @"lenurple" : @"Lenurple",
             @"licorice" : @"Licorice",
             @"licorice" : @"Licorice",
             @"liberty" : @"Liberty",
             @"liberty" : @"Liberty",
             @"lightApricot" : @"Light Apricot",
             @"lightapricot" : @"Light Apricot",
             @"lightBlue" : @"Light Blue",
             @"lightblue" : @"Light Blue",
             @"lightBrilliantRed" : @"Light Brilliant Red",
             @"lightbrilliantred" : @"Light Brilliant Red",
             @"lightBrown" : @"Light Brown",
             @"lightbrown" : @"Light Brown",
             @"lightCarminePink" : @"Light Carmine Pink",
             @"lightcarminepink" : @"Light Carmine Pink",
             @"lightCobaltBlue" : @"Light Cobalt Blue",
             @"lightcobaltblue" : @"Light Cobalt Blue",
             @"lightCoral" : @"Light Coral",
             @"lightcoral" : @"Light Coral",
             @"lightCornflowerBlue" : @"Light Cornflower Blue",
             @"lightcornflowerblue" : @"Light Cornflower Blue",
             @"lightCrimson" : @"Light Crimson",
             @"lightcrimson" : @"Light Crimson",
             @"lightCyan" : @"Light Cyan",
             @"lightcyan" : @"Light Cyan",
             @"lightDeepPink" : @"Light Deep Pink",
             @"lightdeeppink" : @"Light Deep Pink",
             @"lightFrenchBeige" : @"Light French Beige",
             @"lightfrenchbeige" : @"Light French Beige",
             @"lightFuchsiaPink" : @"Light Fuchsia Pink",
             @"lightfuchsiapink" : @"Light Fuchsia Pink",
             @"lightGoldenrodYellow" : @"Light Goldenrod Yellow",
             @"lightgoldenrodyellow" : @"Light Goldenrod Yellow",
             @"lightGray" : @"Light Gray",
             @"lightgray" : @"Light Gray",
             @"lightGrayishMagenta" : @"Light Grayish Magenta",
             @"lightgrayishmagenta" : @"Light Grayish Magenta",
             @"lightGreen" : @"Light Green",
             @"lightgreen" : @"Light Green",
             @"lightHotPink" : @"Light Hot Pink",
             @"lighthotpink" : @"Light Hot Pink",
             @"lightKhaki" : @"Light Khaki",
             @"lightkhaki" : @"Light Khaki",
             @"lightMediumOrchid" : @"Light Medium Orchid",
             @"lightmediumorchid" : @"Light Medium Orchid",
             @"lightMossGreen" : @"Light Moss Green",
             @"lightmossgreen" : @"Light Moss Green",
             @"lightOrchid" : @"Light Orchid",
             @"lightorchid" : @"Light Orchid",
             @"lightPastelPurple" : @"Light Pastel Purple",
             @"lightpastelpurple" : @"Light Pastel Purple",
             @"lightPink" : @"Light Pink",
             @"lightpink" : @"Light Pink",
             @"lightRedOchre" : @"Light Red Ochre",
             @"lightredochre" : @"Light Red Ochre",
             @"lightSalmon" : @"Light Salmon",
             @"lightsalmon" : @"Light Salmon",
             @"lightSalmonPink" : @"Light Salmon Pink",
             @"lightsalmonpink" : @"Light Salmon Pink",
             @"lightSeaGreen" : @"Light Sea Green",
             @"lightseagreen" : @"Light Sea Green",
             @"lightSkyBlue" : @"Light Sky Blue",
             @"lightskyblue" : @"Light Sky Blue",
             @"lightSlateGray" : @"Light Slate Gray",
             @"lightslategray" : @"Light Slate Gray",
             @"lightSteelBlue" : @"Light Steel Blue",
             @"lightsteelblue" : @"Light Steel Blue",
             @"lightTaupe" : @"Light Taupe",
             @"lighttaupe" : @"Light Taupe",
             @"lightThulianPink" : @"Light Thulian Pink",
             @"lightthulianpink" : @"Light Thulian Pink",
             @"lightYellow" : @"Light Yellow",
             @"lightyellow" : @"Light Yellow",
             @"lilac" : @"Lilac",
             @"lilac" : @"Lilac",
             @"limeColorWheel" : @"Lime (Color Wheel)",
             @"limecolorwheel" : @"Lime (Color Wheel)",
             @"limeWebX11Green" : @"Lime (Web) (X11 Green)",
             @"limewebx11green" : @"Lime (Web) (X11 Green)",
             @"limeGreen" : @"Lime Green",
             @"limegreen" : @"Lime Green",
             @"limerick" : @"Limerick",
             @"limerick" : @"Limerick",
             @"lincolnGreen" : @"Lincoln Green",
             @"lincolngreen" : @"Lincoln Green",
             @"linen" : @"Linen",
             @"linen" : @"Linen",
             @"lion" : @"Lion",
             @"lion" : @"Lion",
             @"liseranPurple" : @"Liseran Purple",
             @"liseranpurple" : @"Liseran Purple",
             @"littleBoyBlue" : @"Little Boy Blue",
             @"littleboyblue" : @"Little Boy Blue",
             @"liver" : @"Liver",
             @"liver" : @"Liver",
             @"liverDogs" : @"Liver (Dogs)",
             @"liverdogs" : @"Liver (Dogs)",
             @"liverOrgan" : @"Liver (Organ)",
             @"liverorgan" : @"Liver (Organ)",
             @"liverChestnut" : @"Liver Chestnut",
             @"liverchestnut" : @"Liver Chestnut",
             @"livid" : @"Livid",
             @"livid" : @"Livid",
             @"lumber" : @"Lumber",
             @"lumber" : @"Lumber",
             @"lust" : @"Lust",
             @"lust" : @"Lust",
             @"magenta" : @"Magenta",
             @"magenta" : @"Magenta",
             @"magentaCrayola" : @"Magenta (Crayola)",
             @"magentacrayola" : @"Magenta (Crayola)",
             @"magentaDye" : @"Magenta (Dye)",
             @"magentadye" : @"Magenta (Dye)",
             @"magentaPantone" : @"Magenta (Pantone)",
             @"magentapantone" : @"Magenta (Pantone)",
             @"magentaProcess" : @"Magenta (Process)",
             @"magentaprocess" : @"Magenta (Process)",
             @"magentaHaze" : @"Magenta Haze",
             @"magentahaze" : @"Magenta Haze",
             @"magentaPink" : @"Magenta-Pink",
             @"magentapink" : @"Magenta-Pink",
             @"magicMint" : @"Magic Mint",
             @"magicmint" : @"Magic Mint",
             @"magnolia" : @"Magnolia",
             @"magnolia" : @"Magnolia",
             @"mahogany" : @"Mahogany",
             @"mahogany" : @"Mahogany",
             @"maize" : @"Maize",
             @"maize" : @"Maize",
             @"majorelleBlue" : @"Majorelle Blue",
             @"majorelleblue" : @"Majorelle Blue",
             @"malachite" : @"Malachite",
             @"malachite" : @"Malachite",
             @"manatee" : @"Manatee",
             @"manatee" : @"Manatee",
             @"mangoTango" : @"Mango Tango",
             @"mangotango" : @"Mango Tango",
             @"mantis" : @"Mantis",
             @"mantis" : @"Mantis",
             @"mardiGras" : @"Mardi Gras",
             @"mardigras" : @"Mardi Gras",
             @"marigold" : @"Marigold",
             @"marigold" : @"Marigold",
             @"maroonCrayola" : @"Maroon (Crayola)",
             @"marooncrayola" : @"Maroon (Crayola)",
             @"maroonHTMLCSS" : @"Maroon (HTML/CSS)",
             @"maroonhtmlcss" : @"Maroon (HTML/CSS)",
             @"maroonX11" : @"Maroon (X11)",
             @"maroonx11" : @"Maroon (X11)",
             @"mauve" : @"Mauve",
             @"mauve" : @"Mauve",
             @"mauveTaupe" : @"Mauve Taupe",
             @"mauvetaupe" : @"Mauve Taupe",
             @"mauvelous" : @"Mauvelous",
             @"mauvelous" : @"Mauvelous",
             @"mayGreen" : @"May Green",
             @"maygreen" : @"May Green",
             @"mayaBlue" : @"Maya Blue",
             @"mayablue" : @"Maya Blue",
             @"meatBrown" : @"Meat Brown",
             @"meatbrown" : @"Meat Brown",
             @"mediumAquamarine" : @"Medium Aquamarine",
             @"mediumaquamarine" : @"Medium Aquamarine",
             @"mediumBlue" : @"Medium Blue",
             @"mediumblue" : @"Medium Blue",
             @"mediumCandyAppleRed" : @"Medium Candy Apple Red",
             @"mediumcandyapplered" : @"Medium Candy Apple Red",
             @"mediumCarmine" : @"Medium Carmine",
             @"mediumcarmine" : @"Medium Carmine",
             @"mediumChampagne" : @"Medium Champagne",
             @"mediumchampagne" : @"Medium Champagne",
             @"mediumElectricBlue" : @"Medium Electric Blue",
             @"mediumelectricblue" : @"Medium Electric Blue",
             @"mediumJungleGreen" : @"Medium Jungle Green",
             @"mediumjunglegreen" : @"Medium Jungle Green",
             @"mediumLavenderMagenta" : @"Medium Lavender Magenta",
             @"mediumlavendermagenta" : @"Medium Lavender Magenta",
             @"mediumOrchid" : @"Medium Orchid",
             @"mediumorchid" : @"Medium Orchid",
             @"mediumPersianBlue" : @"Medium Persian Blue",
             @"mediumpersianblue" : @"Medium Persian Blue",
             @"mediumPurple" : @"Medium Purple",
             @"mediumpurple" : @"Medium Purple",
             @"mediumRedViolet" : @"Medium Red-Violet",
             @"mediumredviolet" : @"Medium Red-Violet",
             @"mediumRuby" : @"Medium Ruby",
             @"mediumruby" : @"Medium Ruby",
             @"mediumSeaGreen" : @"Medium Sea Green",
             @"mediumseagreen" : @"Medium Sea Green",
             @"mediumSkyBlue" : @"Medium Sky Blue",
             @"mediumskyblue" : @"Medium Sky Blue",
             @"mediumSlateBlue" : @"Medium Slate Blue",
             @"mediumslateblue" : @"Medium Slate Blue",
             @"mediumSpringBud" : @"Medium Spring Bud",
             @"mediumspringbud" : @"Medium Spring Bud",
             @"mediumSpringGreen" : @"Medium Spring Green",
             @"mediumspringgreen" : @"Medium Spring Green",
             @"mediumTaupe" : @"Medium Taupe",
             @"mediumtaupe" : @"Medium Taupe",
             @"mediumTurquoise" : @"Medium Turquoise",
             @"mediumturquoise" : @"Medium Turquoise",
             @"mediumTuscanRed" : @"Medium Tuscan Red",
             @"mediumtuscanred" : @"Medium Tuscan Red",
             @"mediumVermilion" : @"Medium Vermilion",
             @"mediumvermilion" : @"Medium Vermilion",
             @"mediumVioletRed" : @"Medium Violet-Red",
             @"mediumvioletred" : @"Medium Violet-Red",
             @"mellowApricot" : @"Mellow Apricot",
             @"mellowapricot" : @"Mellow Apricot",
             @"mellowYellow" : @"Mellow Yellow",
             @"mellowyellow" : @"Mellow Yellow",
             @"melon" : @"Melon",
             @"melon" : @"Melon",
             @"metallicSeaweed" : @"Metallic Seaweed",
             @"metallicseaweed" : @"Metallic Seaweed",
             @"metallicSunburst" : @"Metallic Sunburst",
             @"metallicsunburst" : @"Metallic Sunburst",
             @"mexicanPink" : @"Mexican Pink",
             @"mexicanpink" : @"Mexican Pink",
             @"midnightBlue" : @"Midnight Blue",
             @"midnightblue" : @"Midnight Blue",
             @"midnightGreenEagleGreen" : @"Midnight Green (Eagle Green)",
             @"midnightgreeneaglegreen" : @"Midnight Green (Eagle Green)",
             @"mikadoYellow" : @"Mikado Yellow",
             @"mikadoyellow" : @"Mikado Yellow",
             @"mindaro" : @"Mindaro",
             @"mindaro" : @"Mindaro",
             @"ming" : @"Ming",
             @"ming" : @"Ming",
             @"mint" : @"Mint",
             @"mint" : @"Mint",
             @"mintCream" : @"Mint Cream",
             @"mintcream" : @"Mint Cream",
             @"mintGreen" : @"Mint Green",
             @"mintgreen" : @"Mint Green",
             @"mistyRose" : @"Misty Rose",
             @"mistyrose" : @"Misty Rose",
             @"moccasin" : @"Moccasin",
             @"moccasin" : @"Moccasin",
             @"modeBeige" : @"Mode Beige",
             @"modebeige" : @"Mode Beige",
             @"moonstoneBlue" : @"Moonstone Blue",
             @"moonstoneblue" : @"Moonstone Blue",
             @"mordantRed19" : @"Mordant Red 19",
             @"mordantred19" : @"Mordant Red 19",
             @"mossGreen" : @"Moss Green",
             @"mossgreen" : @"Moss Green",
             @"mountainMeadow" : @"Mountain Meadow",
             @"mountainmeadow" : @"Mountain Meadow",
             @"mountbattenPink" : @"Mountbatten Pink",
             @"mountbattenpink" : @"Mountbatten Pink",
             @"mSUGreen" : @"MSU Green",
             @"msugreen" : @"MSU Green",
             @"mughalGreen" : @"Mughal Green",
             @"mughalgreen" : @"Mughal Green",
             @"mulberry" : @"Mulberry",
             @"mulberry" : @"Mulberry",
             @"mustard" : @"Mustard",
             @"mustard" : @"Mustard",
             @"myrtleGreen" : @"Myrtle Green",
             @"myrtlegreen" : @"Myrtle Green",
             @"nadeshikoPink" : @"Nadeshiko Pink",
             @"nadeshikopink" : @"Nadeshiko Pink",
             @"napierGreen" : @"Napier Green",
             @"napiergreen" : @"Napier Green",
             @"naplesYellow" : @"Naples Yellow",
             @"naplesyellow" : @"Naples Yellow",
             @"navajoWhite" : @"Navajo White",
             @"navajowhite" : @"Navajo White",
             @"navy" : @"Navy",
             @"navy" : @"Navy",
             @"navyPurple" : @"Navy Purple",
             @"navypurple" : @"Navy Purple",
             @"neonCarrot" : @"Neon Carrot",
             @"neoncarrot" : @"Neon Carrot",
             @"neonFuchsia" : @"Neon Fuchsia",
             @"neonfuchsia" : @"Neon Fuchsia",
             @"neonGreen" : @"Neon Green",
             @"neongreen" : @"Neon Green",
             @"newCar" : @"New Car",
             @"newcar" : @"New Car",
             @"newYorkPink" : @"New York Pink",
             @"newyorkpink" : @"New York Pink",
             @"nonPhotoBlue" : @"Non-Photo Blue",
             @"nonphotoblue" : @"Non-Photo Blue",
             @"northTexasGreen" : @"North Texas Green",
             @"northtexasgreen" : @"North Texas Green",
             @"nyanza" : @"Nyanza",
             @"nyanza" : @"Nyanza",
             @"oceanBoatBlue" : @"Ocean Boat Blue",
             @"oceanboatblue" : @"Ocean Boat Blue",
             @"ochre" : @"Ochre",
             @"ochre" : @"Ochre",
             @"officeGreen" : @"Office Green",
             @"officegreen" : @"Office Green",
             @"oldBurgundy" : @"Old Burgundy",
             @"oldburgundy" : @"Old Burgundy",
             @"oldGold" : @"Old Gold",
             @"oldgold" : @"Old Gold",
             @"oldHeliotrope" : @"Old Heliotrope",
             @"oldheliotrope" : @"Old Heliotrope",
             @"oldLace" : @"Old Lace",
             @"oldlace" : @"Old Lace",
             @"oldLavender" : @"Old Lavender",
             @"oldlavender" : @"Old Lavender",
             @"oldMauve" : @"Old Mauve",
             @"oldmauve" : @"Old Mauve",
             @"oldMossGreen" : @"Old Moss Green",
             @"oldmossgreen" : @"Old Moss Green",
             @"oldRose" : @"Old Rose",
             @"oldrose" : @"Old Rose",
             @"oldSilver" : @"Old Silver",
             @"oldsilver" : @"Old Silver",
             @"olive" : @"Olive",
             @"olive" : @"Olive",
             @"oliveDrab3" : @"Olive Drab (#3)",
             @"olivedrab3" : @"Olive Drab (#3)",
             @"oliveDrab7" : @"Olive Drab #7",
             @"olivedrab7" : @"Olive Drab #7",
             @"olivine" : @"Olivine",
             @"olivine" : @"Olivine",
             @"onyx" : @"Onyx",
             @"onyx" : @"Onyx",
             @"operaMauve" : @"Opera Mauve",
             @"operamauve" : @"Opera Mauve",
             @"orangeColorWheel" : @"Orange (Color Wheel)",
             @"orangecolorwheel" : @"Orange (Color Wheel)",
             @"orangeCrayola" : @"Orange (Crayola)",
             @"orangecrayola" : @"Orange (Crayola)",
             @"orangePantone" : @"Orange (Pantone)",
             @"orangepantone" : @"Orange (Pantone)",
             @"orangeRYB" : @"Orange (RYB)",
             @"orangeryb" : @"Orange (RYB)",
             @"orangeWeb" : @"Orange (Web)",
             @"orangeweb" : @"Orange (Web)",
             @"orangePeel" : @"Orange Peel",
             @"orangepeel" : @"Orange Peel",
             @"orangeRed" : @"Orange-Red",
             @"orangered" : @"Orange-Red",
             @"orangeYellow" : @"Orange-Yellow",
             @"orangeyellow" : @"Orange-Yellow",
             @"orchid" : @"Orchid",
             @"orchid" : @"Orchid",
             @"orchidPink" : @"Orchid Pink",
             @"orchidpink" : @"Orchid Pink",
             @"oriolesOrange" : @"Orioles Orange",
             @"oriolesorange" : @"Orioles Orange",
             @"otterBrown" : @"Otter Brown",
             @"otterbrown" : @"Otter Brown",
             @"outerSpace" : @"Outer Space",
             @"outerspace" : @"Outer Space",
             @"outrageousOrange" : @"Outrageous Orange",
             @"outrageousorange" : @"Outrageous Orange",
             @"oxfordBlue" : @"Oxford Blue",
             @"oxfordblue" : @"Oxford Blue",
             @"oUCrimsonRed" : @"OU Crimson Red",
             @"oucrimsonred" : @"OU Crimson Red",
             @"pakistanGreen" : @"Pakistan Green",
             @"pakistangreen" : @"Pakistan Green",
             @"palatinateBlue" : @"Palatinate Blue",
             @"palatinateblue" : @"Palatinate Blue",
             @"palatinatePurple" : @"Palatinate Purple",
             @"palatinatepurple" : @"Palatinate Purple",
             @"paleAqua" : @"Pale Aqua",
             @"paleaqua" : @"Pale Aqua",
             @"paleBlue" : @"Pale Blue",
             @"paleblue" : @"Pale Blue",
             @"paleBrown" : @"Pale Brown",
             @"palebrown" : @"Pale Brown",
             @"paleCarmine" : @"Pale Carmine",
             @"palecarmine" : @"Pale Carmine",
             @"paleCerulean" : @"Pale Cerulean",
             @"palecerulean" : @"Pale Cerulean",
             @"paleChestnut" : @"Pale Chestnut",
             @"palechestnut" : @"Pale Chestnut",
             @"paleCopper" : @"Pale Copper",
             @"palecopper" : @"Pale Copper",
             @"paleCornflowerBlue" : @"Pale Cornflower Blue",
             @"palecornflowerblue" : @"Pale Cornflower Blue",
             @"paleCyan" : @"Pale Cyan",
             @"palecyan" : @"Pale Cyan",
             @"paleGold" : @"Pale Gold",
             @"palegold" : @"Pale Gold",
             @"paleGoldenrod" : @"Pale Goldenrod",
             @"palegoldenrod" : @"Pale Goldenrod",
             @"paleGreen" : @"Pale Green",
             @"palegreen" : @"Pale Green",
             @"paleLavender" : @"Pale Lavender",
             @"palelavender" : @"Pale Lavender",
             @"paleMagenta" : @"Pale Magenta",
             @"palemagenta" : @"Pale Magenta",
             @"paleMagentaPink" : @"Pale Magenta-Pink",
             @"palemagentapink" : @"Pale Magenta-Pink",
             @"palePink" : @"Pale Pink",
             @"palepink" : @"Pale Pink",
             @"palePlum" : @"Pale Plum",
             @"paleplum" : @"Pale Plum",
             @"paleRedViolet" : @"Pale Red-Violet",
             @"paleredviolet" : @"Pale Red-Violet",
             @"paleRobinEggBlue" : @"Pale Robin Egg Blue",
             @"palerobineggblue" : @"Pale Robin Egg Blue",
             @"paleSilver" : @"Pale Silver",
             @"palesilver" : @"Pale Silver",
             @"paleSpringBud" : @"Pale Spring Bud",
             @"palespringbud" : @"Pale Spring Bud",
             @"paleTaupe" : @"Pale Taupe",
             @"paletaupe" : @"Pale Taupe",
             @"paleTurquoise" : @"Pale Turquoise",
             @"paleturquoise" : @"Pale Turquoise",
             @"paleViolet" : @"Pale Violet",
             @"paleviolet" : @"Pale Violet",
             @"paleVioletRed" : @"Pale Violet-Red",
             @"palevioletred" : @"Pale Violet-Red",
             @"pansyPurple" : @"Pansy Purple",
             @"pansypurple" : @"Pansy Purple",
             @"paoloVeroneseGreen" : @"Paolo Veronese Green",
             @"paoloveronesegreen" : @"Paolo Veronese Green",
             @"papayaWhip" : @"Papaya Whip",
             @"papayawhip" : @"Papaya Whip",
             @"paradisePink" : @"Paradise Pink",
             @"paradisepink" : @"Paradise Pink",
             @"parisGreen" : @"Paris Green",
             @"parisgreen" : @"Paris Green",
             @"pastelBlue" : @"Pastel Blue",
             @"pastelblue" : @"Pastel Blue",
             @"pastelBrown" : @"Pastel Brown",
             @"pastelbrown" : @"Pastel Brown",
             @"pastelGray" : @"Pastel Gray",
             @"pastelgray" : @"Pastel Gray",
             @"pastelGreen" : @"Pastel Green",
             @"pastelgreen" : @"Pastel Green",
             @"pastelMagenta" : @"Pastel Magenta",
             @"pastelmagenta" : @"Pastel Magenta",
             @"pastelOrange" : @"Pastel Orange",
             @"pastelorange" : @"Pastel Orange",
             @"pastelPink" : @"Pastel Pink",
             @"pastelpink" : @"Pastel Pink",
             @"pastelPurple" : @"Pastel Purple",
             @"pastelpurple" : @"Pastel Purple",
             @"pastelRed" : @"Pastel Red",
             @"pastelred" : @"Pastel Red",
             @"pastelViolet" : @"Pastel Violet",
             @"pastelviolet" : @"Pastel Violet",
             @"pastelYellow" : @"Pastel Yellow",
             @"pastelyellow" : @"Pastel Yellow",
             @"patriarch" : @"Patriarch",
             @"patriarch" : @"Patriarch",
             @"paynesGrey" : @"Payne's Grey",
             @"paynesgrey" : @"Payne's Grey",
             @"peach" : @"Peach",
             @"peach" : @"Peach",
             @"peach2" : @"Peach",
             @"peach2" : @"Peach",
             @"peachOrange" : @"Peach-Orange",
             @"peachorange" : @"Peach-Orange",
             @"peachPuff" : @"Peach Puff",
             @"peachpuff" : @"Peach Puff",
             @"peachYellow" : @"Peach-Yellow",
             @"peachyellow" : @"Peach-Yellow",
             @"pear" : @"Pear",
             @"pear" : @"Pear",
             @"pearl" : @"Pearl",
             @"pearl" : @"Pearl",
             @"pearlAqua" : @"Pearl Aqua",
             @"pearlaqua" : @"Pearl Aqua",
             @"pearlyPurple" : @"Pearly Purple",
             @"pearlypurple" : @"Pearly Purple",
             @"peridot" : @"Peridot",
             @"peridot" : @"Peridot",
             @"periwinkle" : @"Periwinkle",
             @"periwinkle" : @"Periwinkle",
             @"persianBlue" : @"Persian Blue",
             @"persianblue" : @"Persian Blue",
             @"persianGreen" : @"Persian Green",
             @"persiangreen" : @"Persian Green",
             @"persianIndigo" : @"Persian Indigo",
             @"persianindigo" : @"Persian Indigo",
             @"persianOrange" : @"Persian Orange",
             @"persianorange" : @"Persian Orange",
             @"persianPink" : @"Persian Pink",
             @"persianpink" : @"Persian Pink",
             @"persianPlum" : @"Persian Plum",
             @"persianplum" : @"Persian Plum",
             @"persianRed" : @"Persian Red",
             @"persianred" : @"Persian Red",
             @"persianRose" : @"Persian Rose",
             @"persianrose" : @"Persian Rose",
             @"persimmon" : @"Persimmon",
             @"persimmon" : @"Persimmon",
             @"peru" : @"Peru",
             @"peru" : @"Peru",
             @"phlox" : @"Phlox",
             @"phlox" : @"Phlox",
             @"phthaloBlue" : @"Phthalo Blue",
             @"phthaloblue" : @"Phthalo Blue",
             @"phthaloGreen" : @"Phthalo Green",
             @"phthalogreen" : @"Phthalo Green",
             @"pictonBlue" : @"Picton Blue",
             @"pictonblue" : @"Picton Blue",
             @"pictorialCarmine" : @"Pictorial Carmine",
             @"pictorialcarmine" : @"Pictorial Carmine",
             @"piggyPink" : @"Piggy Pink",
             @"piggypink" : @"Piggy Pink",
             @"pineGreen" : @"Pine Green",
             @"pinegreen" : @"Pine Green",
             @"pineapple" : @"Pineapple",
             @"pineapple" : @"Pineapple",
             @"pink" : @"Pink",
             @"pink" : @"Pink",
             @"pinkPantone" : @"Pink (Pantone)",
             @"pinkpantone" : @"Pink (Pantone)",
             @"pinkLace" : @"Pink Lace",
             @"pinklace" : @"Pink Lace",
             @"pinkLavender" : @"Pink Lavender",
             @"pinklavender" : @"Pink Lavender",
             @"pinkOrange" : @"Pink-Orange",
             @"pinkorange" : @"Pink-Orange",
             @"pinkPearl" : @"Pink Pearl",
             @"pinkpearl" : @"Pink Pearl",
             @"pinkRaspberry" : @"Pink Raspberry",
             @"pinkraspberry" : @"Pink Raspberry",
             @"pinkSherbet" : @"Pink Sherbet",
             @"pinksherbet" : @"Pink Sherbet",
             @"pistachio" : @"Pistachio",
             @"pistachio" : @"Pistachio",
             @"platinum" : @"Platinum",
             @"platinum" : @"Platinum",
             @"plum" : @"Plum",
             @"plum" : @"Plum",
             @"plumWeb" : @"Plum (Web)",
             @"plumweb" : @"Plum (Web)",
             @"pompAndPower" : @"Pomp And Power",
             @"pompandpower" : @"Pomp And Power",
             @"popstar" : @"Popstar",
             @"popstar" : @"Popstar",
             @"portlandOrange" : @"Portland Orange",
             @"portlandorange" : @"Portland Orange",
             @"powderBlue" : @"Powder Blue",
             @"powderblue" : @"Powder Blue",
             @"princetonOrange" : @"Princeton Orange",
             @"princetonorange" : @"Princeton Orange",
             @"prune" : @"Prune",
             @"prune" : @"Prune",
             @"prussianBlue" : @"Prussian Blue",
             @"prussianblue" : @"Prussian Blue",
             @"psychedelicPurple" : @"Psychedelic Purple",
             @"psychedelicpurple" : @"Psychedelic Purple",
             @"puce" : @"Puce",
             @"puce" : @"Puce",
             @"puceRed" : @"Puce Red",
             @"pucered" : @"Puce Red",
             @"pullmanBrownUPSBrown" : @"Pullman Brown (UPS Brown)",
             @"pullmanbrownupsbrown" : @"Pullman Brown (UPS Brown)",
             @"pullmanGreen" : @"Pullman Green",
             @"pullmangreen" : @"Pullman Green",
             @"pumpkin" : @"Pumpkin",
             @"pumpkin" : @"Pumpkin",
             @"purpleHTML" : @"Purple (HTML)",
             @"purplehtml" : @"Purple (HTML)",
             @"purpleMunsell" : @"Purple (Munsell)",
             @"purplemunsell" : @"Purple (Munsell)",
             @"purpleX11" : @"Purple (X11)",
             @"purplex11" : @"Purple (X11)",
             @"purpleHeart" : @"Purple Heart",
             @"purpleheart" : @"Purple Heart",
             @"purpleMountainMajesty" : @"Purple Mountain Majesty",
             @"purplemountainmajesty" : @"Purple Mountain Majesty",
             @"purpleNavy" : @"Purple Navy",
             @"purplenavy" : @"Purple Navy",
             @"purplePizzazz" : @"Purple Pizzazz",
             @"purplepizzazz" : @"Purple Pizzazz",
             @"purpleTaupe" : @"Purple Taupe",
             @"purpletaupe" : @"Purple Taupe",
             @"purpureus" : @"Purpureus",
             @"purpureus" : @"Purpureus",
             @"quartz" : @"Quartz",
             @"quartz" : @"Quartz",
             @"queenBlue" : @"Queen Blue",
             @"queenblue" : @"Queen Blue",
             @"queenPink" : @"Queen Pink",
             @"queenpink" : @"Queen Pink",
             @"quinacridoneMagenta" : @"Quinacridone Magenta",
             @"quinacridonemagenta" : @"Quinacridone Magenta",
             @"rackley" : @"Rackley",
             @"rackley" : @"Rackley",
             @"radicalRed" : @"Radical Red",
             @"radicalred" : @"Radical Red",
             @"rajah" : @"Rajah",
             @"rajah" : @"Rajah",
             @"raspberry" : @"Raspberry",
             @"raspberry" : @"Raspberry",
             @"raspberryGlace" : @"Raspberry Glace",
             @"raspberryglace" : @"Raspberry Glace",
             @"raspberryPink" : @"Raspberry Pink",
             @"raspberrypink" : @"Raspberry Pink",
             @"raspberryRose" : @"Raspberry Rose",
             @"raspberryrose" : @"Raspberry Rose",
             @"rawUmber" : @"Raw Umber",
             @"rawumber" : @"Raw Umber",
             @"razzleDazzleRose" : @"Razzle Dazzle Rose",
             @"razzledazzlerose" : @"Razzle Dazzle Rose",
             @"razzmatazz" : @"Razzmatazz",
             @"razzmatazz" : @"Razzmatazz",
             @"razzmicBerry" : @"Razzmic Berry",
             @"razzmicberry" : @"Razzmic Berry",
             @"rebeccaPurple" : @"Rebecca Purple",
             @"rebeccapurple" : @"Rebecca Purple",
             @"red" : @"Red",
             @"red" : @"Red",
             @"redCrayola" : @"Red (Crayola)",
             @"redcrayola" : @"Red (Crayola)",
             @"redMunsell" : @"Red (Munsell)",
             @"redmunsell" : @"Red (Munsell)",
             @"redNCS" : @"Red (NCS)",
             @"redncs" : @"Red (NCS)",
             @"redPantone" : @"Red (Pantone)",
             @"redpantone" : @"Red (Pantone)",
             @"redPigment" : @"Red (Pigment)",
             @"redpigment" : @"Red (Pigment)",
             @"redRYB" : @"Red (RYB)",
             @"redryb" : @"Red (RYB)",
             @"redBrown" : @"Red-Brown",
             @"redbrown" : @"Red-Brown",
             @"redDevil" : @"Red Devil",
             @"reddevil" : @"Red Devil",
             @"redOrange" : @"Red-Orange",
             @"redorange" : @"Red-Orange",
             @"redPurple" : @"Red-Purple",
             @"redpurple" : @"Red-Purple",
             @"redViolet" : @"Red-Violet",
             @"redviolet" : @"Red-Violet",
             @"redwood" : @"Redwood",
             @"redwood" : @"Redwood",
             @"regalia" : @"Regalia",
             @"regalia" : @"Regalia",
             @"registrationBlack" : @"Registration Black",
             @"registrationblack" : @"Registration Black",
             @"resolutionBlue" : @"Resolution Blue",
             @"resolutionblue" : @"Resolution Blue",
             @"rhythm" : @"Rhythm",
             @"rhythm" : @"Rhythm",
             @"richBlack" : @"Rich Black",
             @"richblack" : @"Rich Black",
             @"richBlackFOGRA29" : @"Rich Black (FOGRA29)",
             @"richblackfogra29" : @"Rich Black (FOGRA29)",
             @"richBlackFOGRA39" : @"Rich Black (FOGRA39)",
             @"richblackfogra39" : @"Rich Black (FOGRA39)",
             @"richBrilliantLavender" : @"Rich Brilliant Lavender",
             @"richbrilliantlavender" : @"Rich Brilliant Lavender",
             @"richCarmine" : @"Rich Carmine",
             @"richcarmine" : @"Rich Carmine",
             @"richElectricBlue" : @"Rich Electric Blue",
             @"richelectricblue" : @"Rich Electric Blue",
             @"richLavender" : @"Rich Lavender",
             @"richlavender" : @"Rich Lavender",
             @"richLilac" : @"Rich Lilac",
             @"richlilac" : @"Rich Lilac",
             @"richMaroon" : @"Rich Maroon",
             @"richmaroon" : @"Rich Maroon",
             @"rifleGreen" : @"Rifle Green",
             @"riflegreen" : @"Rifle Green",
             @"roastCoffee" : @"Roast Coffee",
             @"roastcoffee" : @"Roast Coffee",
             @"robinEggBlue" : @"Robin Egg Blue",
             @"robineggblue" : @"Robin Egg Blue",
             @"rocketMetallic" : @"Rocket Metallic",
             @"rocketmetallic" : @"Rocket Metallic",
             @"romanSilver" : @"Roman Silver",
             @"romansilver" : @"Roman Silver",
             @"rose" : @"Rose",
             @"rose" : @"Rose",
             @"roseBonbon" : @"Rose Bonbon",
             @"rosebonbon" : @"Rose Bonbon",
             @"roseEbony" : @"Rose Ebony",
             @"roseebony" : @"Rose Ebony",
             @"roseGold" : @"Rose Gold",
             @"rosegold" : @"Rose Gold",
             @"roseMadder" : @"Rose Madder",
             @"rosemadder" : @"Rose Madder",
             @"rosePink" : @"Rose Pink",
             @"rosepink" : @"Rose Pink",
             @"roseQuartz" : @"Rose Quartz",
             @"rosequartz" : @"Rose Quartz",
             @"roseRed" : @"Rose Red",
             @"rosered" : @"Rose Red",
             @"roseTaupe" : @"Rose Taupe",
             @"rosetaupe" : @"Rose Taupe",
             @"roseVale" : @"Rose Vale",
             @"rosevale" : @"Rose Vale",
             @"rosewood" : @"Rosewood",
             @"rosewood" : @"Rosewood",
             @"rossoCorsa" : @"Rosso Corsa",
             @"rossocorsa" : @"Rosso Corsa",
             @"rosyBrown" : @"Rosy Brown",
             @"rosybrown" : @"Rosy Brown",
             @"royalAzure" : @"Royal Azure",
             @"royalazure" : @"Royal Azure",
             @"royalBlue" : @"Royal Blue",
             @"royalblue" : @"Royal Blue",
             @"royalBlue2" : @"Royal Blue",
             @"royalblue2" : @"Royal Blue",
             @"royalFuchsia" : @"Royal Fuchsia",
             @"royalfuchsia" : @"Royal Fuchsia",
             @"royalPurple" : @"Royal Purple",
             @"royalpurple" : @"Royal Purple",
             @"royalYellow" : @"Royal Yellow",
             @"royalyellow" : @"Royal Yellow",
             @"ruber" : @"Ruber",
             @"ruber" : @"Ruber",
             @"rubineRed" : @"Rubine Red",
             @"rubinered" : @"Rubine Red",
             @"ruby" : @"Ruby",
             @"ruby" : @"Ruby",
             @"rubyRed" : @"Ruby Red",
             @"rubyred" : @"Ruby Red",
             @"ruddy" : @"Ruddy",
             @"ruddy" : @"Ruddy",
             @"ruddyBrown" : @"Ruddy Brown",
             @"ruddybrown" : @"Ruddy Brown",
             @"ruddyPink" : @"Ruddy Pink",
             @"ruddypink" : @"Ruddy Pink",
             @"rufous" : @"Rufous",
             @"rufous" : @"Rufous",
             @"russet" : @"Russet",
             @"russet" : @"Russet",
             @"russianGreen" : @"Russian Green",
             @"russiangreen" : @"Russian Green",
             @"russianViolet" : @"Russian Violet",
             @"russianviolet" : @"Russian Violet",
             @"rust" : @"Rust",
             @"rust" : @"Rust",
             @"rustyRed" : @"Rusty Red",
             @"rustyred" : @"Rusty Red",
             @"sacramentoStateGreen" : @"Sacramento State Green",
             @"sacramentostategreen" : @"Sacramento State Green",
             @"saddleBrown" : @"Saddle Brown",
             @"saddlebrown" : @"Saddle Brown",
             @"safetyOrange" : @"Safety Orange",
             @"safetyorange" : @"Safety Orange",
             @"safetyOrangeBlazeOrange" : @"Safety Orange (Blaze Orange)",
             @"safetyorangeblazeorange" : @"Safety Orange (Blaze Orange)",
             @"safetyYellow" : @"Safety Yellow",
             @"safetyyellow" : @"Safety Yellow",
             @"saffron" : @"Saffron",
             @"saffron" : @"Saffron",
             @"sage" : @"Sage",
             @"sage" : @"Sage",
             @"stPatricksBlue" : @"St. Patrick's Blue",
             @"stpatricksblue" : @"St. Patrick's Blue",
             @"salmon" : @"Salmon",
             @"salmon" : @"Salmon",
             @"salmonPink" : @"Salmon Pink",
             @"salmonpink" : @"Salmon Pink",
             @"sand" : @"Sand",
             @"sand" : @"Sand",
             @"sandDune" : @"Sand Dune",
             @"sanddune" : @"Sand Dune",
             @"sandstorm" : @"Sandstorm",
             @"sandstorm" : @"Sandstorm",
             @"sandyBrown" : @"Sandy Brown",
             @"sandybrown" : @"Sandy Brown",
             @"sandyTaupe" : @"Sandy Taupe",
             @"sandytaupe" : @"Sandy Taupe",
             @"sangria" : @"Sangria",
             @"sangria" : @"Sangria",
             @"sapGreen" : @"Sap Green",
             @"sapgreen" : @"Sap Green",
             @"sapphire" : @"Sapphire",
             @"sapphire" : @"Sapphire",
             @"sapphireBlue" : @"Sapphire Blue",
             @"sapphireblue" : @"Sapphire Blue",
             @"satinSheenGold" : @"Satin Sheen Gold",
             @"satinsheengold" : @"Satin Sheen Gold",
             @"scarlet" : @"Scarlet",
             @"scarlet" : @"Scarlet",
             @"scarlet2" : @"Scarlet",
             @"scarlet2" : @"Scarlet",
             @"schaussPink" : @"Schauss Pink",
             @"schausspink" : @"Schauss Pink",
             @"schoolBusYellow" : @"School Bus Yellow",
             @"schoolbusyellow" : @"School Bus Yellow",
             @"screaminGreen" : @"Screamin' Green",
             @"screamingreen" : @"Screamin' Green",
             @"seaBlue" : @"Sea Blue",
             @"seablue" : @"Sea Blue",
             @"seaGreen" : @"Sea Green",
             @"seagreen" : @"Sea Green",
             @"sealBrown" : @"Seal Brown",
             @"sealbrown" : @"Seal Brown",
             @"seashell" : @"Seashell",
             @"seashell" : @"Seashell",
             @"selectiveYellow" : @"Selective Yellow",
             @"selectiveyellow" : @"Selective Yellow",
             @"sepia" : @"Sepia",
             @"sepia" : @"Sepia",
             @"shadow" : @"Shadow",
             @"shadow" : @"Shadow",
             @"shadowBlue" : @"Shadow Blue",
             @"shadowblue" : @"Shadow Blue",
             @"shampoo" : @"Shampoo",
             @"shampoo" : @"Shampoo",
             @"shamrockGreen" : @"Shamrock Green",
             @"shamrockgreen" : @"Shamrock Green",
             @"sheenGreen" : @"Sheen Green",
             @"sheengreen" : @"Sheen Green",
             @"shimmeringBlush" : @"Shimmering Blush",
             @"shimmeringblush" : @"Shimmering Blush",
             @"shockingPink" : @"Shocking Pink",
             @"shockingpink" : @"Shocking Pink",
             @"shockingPinkCrayola" : @"Shocking Pink (Crayola)",
             @"shockingpinkcrayola" : @"Shocking Pink (Crayola)",
             @"sienna" : @"Sienna",
             @"sienna" : @"Sienna",
             @"silver" : @"Silver",
             @"silver" : @"Silver",
             @"silverChalice" : @"Silver Chalice",
             @"silverchalice" : @"Silver Chalice",
             @"silverLakeBlue" : @"Silver Lake Blue",
             @"silverlakeblue" : @"Silver Lake Blue",
             @"silverPink" : @"Silver Pink",
             @"silverpink" : @"Silver Pink",
             @"silverSand" : @"Silver Sand",
             @"silversand" : @"Silver Sand",
             @"sinopia" : @"Sinopia",
             @"sinopia" : @"Sinopia",
             @"skobeloff" : @"Skobeloff",
             @"skobeloff" : @"Skobeloff",
             @"skyBlue" : @"Sky Blue",
             @"skyblue" : @"Sky Blue",
             @"skyMagenta" : @"Sky Magenta",
             @"skymagenta" : @"Sky Magenta",
             @"slateBlue" : @"Slate Blue",
             @"slateblue" : @"Slate Blue",
             @"slateGray" : @"Slate Gray",
             @"slategray" : @"Slate Gray",
             @"smaltDarkPowderBlue" : @"Smalt (Dark Powder Blue)",
             @"smaltdarkpowderblue" : @"Smalt (Dark Powder Blue)",
             @"smitten" : @"Smitten",
             @"smitten" : @"Smitten",
             @"smoke" : @"Smoke",
             @"smoke" : @"Smoke",
             @"smokyBlack" : @"Smoky Black",
             @"smokyblack" : @"Smoky Black",
             @"smokyTopaz" : @"Smoky Topaz",
             @"smokytopaz" : @"Smoky Topaz",
             @"snow" : @"Snow",
             @"snow" : @"Snow",
             @"soap" : @"Soap",
             @"soap" : @"Soap",
             @"solidPink" : @"Solid Pink",
             @"solidpink" : @"Solid Pink",
             @"sonicSilver" : @"Sonic Silver",
             @"sonicsilver" : @"Sonic Silver",
             @"spartanCrimson" : @"Spartan Crimson",
             @"spartancrimson" : @"Spartan Crimson",
             @"spaceCadet" : @"Space Cadet",
             @"spacecadet" : @"Space Cadet",
             @"spanishBistre" : @"Spanish Bistre",
             @"spanishbistre" : @"Spanish Bistre",
             @"spanishBlue" : @"Spanish Blue",
             @"spanishblue" : @"Spanish Blue",
             @"spanishCarmine" : @"Spanish Carmine",
             @"spanishcarmine" : @"Spanish Carmine",
             @"spanishCrimson" : @"Spanish Crimson",
             @"spanishcrimson" : @"Spanish Crimson",
             @"spanishGray" : @"Spanish Gray",
             @"spanishgray" : @"Spanish Gray",
             @"spanishGreen" : @"Spanish Green",
             @"spanishgreen" : @"Spanish Green",
             @"spanishOrange" : @"Spanish Orange",
             @"spanishorange" : @"Spanish Orange",
             @"spanishPink" : @"Spanish Pink",
             @"spanishpink" : @"Spanish Pink",
             @"spanishRed" : @"Spanish Red",
             @"spanishred" : @"Spanish Red",
             @"spanishSkyBlue" : @"Spanish Sky Blue",
             @"spanishskyblue" : @"Spanish Sky Blue",
             @"spanishViolet" : @"Spanish Violet",
             @"spanishviolet" : @"Spanish Violet",
             @"spanishViridian" : @"Spanish Viridian",
             @"spanishviridian" : @"Spanish Viridian",
             @"spicyMix" : @"Spicy Mix",
             @"spicymix" : @"Spicy Mix",
             @"spiroDiscoBall" : @"Spiro Disco Ball",
             @"spirodiscoball" : @"Spiro Disco Ball",
             @"springBud" : @"Spring Bud",
             @"springbud" : @"Spring Bud",
             @"springGreen" : @"Spring Green",
             @"springgreen" : @"Spring Green",
             @"starCommandBlue" : @"Star Command Blue",
             @"starcommandblue" : @"Star Command Blue",
             @"steelBlue" : @"Steel Blue",
             @"steelblue" : @"Steel Blue",
             @"steelPink" : @"Steel Pink",
             @"steelpink" : @"Steel Pink",
             @"stilDeGrainYellow" : @"Stil De Grain Yellow",
             @"stildegrainyellow" : @"Stil De Grain Yellow",
             @"stizza" : @"Stizza",
             @"stizza" : @"Stizza",
             @"stormcloud" : @"Stormcloud",
             @"stormcloud" : @"Stormcloud",
             @"straw" : @"Straw",
             @"straw" : @"Straw",
             @"strawberry" : @"Strawberry",
             @"strawberry" : @"Strawberry",
             @"sunglow" : @"Sunglow",
             @"sunglow" : @"Sunglow",
             @"sunray" : @"Sunray",
             @"sunray" : @"Sunray",
             @"sunset" : @"Sunset",
             @"sunset" : @"Sunset",
             @"sunsetOrange" : @"Sunset Orange",
             @"sunsetorange" : @"Sunset Orange",
             @"superPink" : @"Super Pink",
             @"superpink" : @"Super Pink",
             @"tan" : @"Tan",
             @"tan" : @"Tan",
             @"tangelo" : @"Tangelo",
             @"tangelo" : @"Tangelo",
             @"tangerine" : @"Tangerine",
             @"tangerine" : @"Tangerine",
             @"tangerineYellow" : @"Tangerine Yellow",
             @"tangerineyellow" : @"Tangerine Yellow",
             @"tangoPink" : @"Tango Pink",
             @"tangopink" : @"Tango Pink",
             @"taupe" : @"Taupe",
             @"taupe" : @"Taupe",
             @"taupeGray" : @"Taupe Gray",
             @"taupegray" : @"Taupe Gray",
             @"teaGreen" : @"Tea Green",
             @"teagreen" : @"Tea Green",
             @"teaRose" : @"Tea Rose",
             @"tearose" : @"Tea Rose",
             @"teaRose2" : @"Tea Rose",
             @"tearose2" : @"Tea Rose",
             @"teal" : @"Teal",
             @"teal" : @"Teal",
             @"tealBlue" : @"Teal Blue",
             @"tealblue" : @"Teal Blue",
             @"tealDeer" : @"Teal Deer",
             @"tealdeer" : @"Teal Deer",
             @"tealGreen" : @"Teal Green",
             @"tealgreen" : @"Teal Green",
             @"telemagenta" : @"Telemagenta",
             @"telemagenta" : @"Telemagenta",
             @"tenne" : @"Tenne",
             @"tenne" : @"Tenne",
             @"terraCotta" : @"Terra Cotta",
             @"terracotta" : @"Terra Cotta",
             @"thistle" : @"Thistle",
             @"thistle" : @"Thistle",
             @"thulianPink" : @"Thulian Pink",
             @"thulianpink" : @"Thulian Pink",
             @"tickleMePink" : @"Tickle Me Pink",
             @"ticklemepink" : @"Tickle Me Pink",
             @"tiffanyBlue" : @"Tiffany Blue",
             @"tiffanyblue" : @"Tiffany Blue",
             @"tigersEye" : @"Tiger's Eye",
             @"tigerseye" : @"Tiger's Eye",
             @"timberwolf" : @"Timberwolf",
             @"timberwolf" : @"Timberwolf",
             @"titaniumYellow" : @"Titanium Yellow",
             @"titaniumyellow" : @"Titanium Yellow",
             @"tomato" : @"Tomato",
             @"tomato" : @"Tomato",
             @"toolbox" : @"Toolbox",
             @"toolbox" : @"Toolbox",
             @"topaz" : @"Topaz",
             @"topaz" : @"Topaz",
             @"tractorRed" : @"Tractor Red",
             @"tractorred" : @"Tractor Red",
             @"trolleyGrey" : @"Trolley Grey",
             @"trolleygrey" : @"Trolley Grey",
             @"tropicalRainForest" : @"Tropical Rain Forest",
             @"tropicalrainforest" : @"Tropical Rain Forest",
             @"trueBlue" : @"True Blue",
             @"trueblue" : @"True Blue",
             @"tuftsBlue" : @"Tufts Blue",
             @"tuftsblue" : @"Tufts Blue",
             @"tulip" : @"Tulip",
             @"tulip" : @"Tulip",
             @"tumbleweed" : @"Tumbleweed",
             @"tumbleweed" : @"Tumbleweed",
             @"turkishRose" : @"Turkish Rose",
             @"turkishrose" : @"Turkish Rose",
             @"turquoise" : @"Turquoise",
             @"turquoise" : @"Turquoise",
             @"turquoiseBlue" : @"Turquoise Blue",
             @"turquoiseblue" : @"Turquoise Blue",
             @"turquoiseGreen" : @"Turquoise Green",
             @"turquoisegreen" : @"Turquoise Green",
             @"tuscan" : @"Tuscan",
             @"tuscan" : @"Tuscan",
             @"tuscanBrown" : @"Tuscan Brown",
             @"tuscanbrown" : @"Tuscan Brown",
             @"tuscanRed" : @"Tuscan Red",
             @"tuscanred" : @"Tuscan Red",
             @"tuscanTan" : @"Tuscan Tan",
             @"tuscantan" : @"Tuscan Tan",
             @"tuscany" : @"Tuscany",
             @"tuscany" : @"Tuscany",
             @"twilightLavender" : @"Twilight Lavender",
             @"twilightlavender" : @"Twilight Lavender",
             @"tyrianPurple" : @"Tyrian Purple",
             @"tyrianpurple" : @"Tyrian Purple",
             @"uABlue" : @"UA Blue",
             @"uablue" : @"UA Blue",
             @"uARed" : @"UA Red",
             @"uared" : @"UA Red",
             @"ube" : @"Ube",
             @"ube" : @"Ube",
             @"uCLABlue" : @"UCLA Blue",
             @"uclablue" : @"UCLA Blue",
             @"uCLAGold" : @"UCLA Gold",
             @"uclagold" : @"UCLA Gold",
             @"uFOGreen" : @"UFO Green",
             @"ufogreen" : @"UFO Green",
             @"ultramarine" : @"Ultramarine",
             @"ultramarine" : @"Ultramarine",
             @"ultramarineBlue" : @"Ultramarine Blue",
             @"ultramarineblue" : @"Ultramarine Blue",
             @"ultraPink" : @"Ultra Pink",
             @"ultrapink" : @"Ultra Pink",
             @"ultraRed" : @"Ultra Red",
             @"ultrared" : @"Ultra Red",
             @"umber" : @"Umber",
             @"umber" : @"Umber",
             @"unbleachedSilk" : @"Unbleached Silk",
             @"unbleachedsilk" : @"Unbleached Silk",
             @"unitedNationsBlue" : @"United Nations Blue",
             @"unitednationsblue" : @"United Nations Blue",
             @"universityOfCaliforniaGold" : @"University Of California Gold",
             @"universityofcaliforniagold" : @"University Of California Gold",
             @"unmellowYellow" : @"Unmellow Yellow",
             @"unmellowyellow" : @"Unmellow Yellow",
             @"uPForestGreen" : @"UP Forest Green",
             @"upforestgreen" : @"UP Forest Green",
             @"uPMaroon" : @"UP Maroon",
             @"upmaroon" : @"UP Maroon",
             @"upsdellRed" : @"Upsdell Red",
             @"upsdellred" : @"Upsdell Red",
             @"urobilin" : @"Urobilin",
             @"urobilin" : @"Urobilin",
             @"uSAFABlue" : @"USAFA Blue",
             @"usafablue" : @"USAFA Blue",
             @"uSCCardinal" : @"USC Cardinal",
             @"usccardinal" : @"USC Cardinal",
             @"uSCGold" : @"USC Gold",
             @"uscgold" : @"USC Gold",
             @"universityOfTennesseeOrange" : @"University Of Tennessee Orange",
             @"universityoftennesseeorange" : @"University Of Tennessee Orange",
             @"utahCrimson" : @"Utah Crimson",
             @"utahcrimson" : @"Utah Crimson",
             @"vanilla" : @"Vanilla",
             @"vanilla" : @"Vanilla",
             @"vanillaIce" : @"Vanilla Ice",
             @"vanillaice" : @"Vanilla Ice",
             @"vegasGold" : @"Vegas Gold",
             @"vegasgold" : @"Vegas Gold",
             @"venetianRed" : @"Venetian Red",
             @"venetianred" : @"Venetian Red",
             @"verdigris" : @"Verdigris",
             @"verdigris" : @"Verdigris",
             @"vermilion" : @"Vermilion",
             @"vermilion" : @"Vermilion",
             @"vermilion2" : @"Vermilion",
             @"vermilion2" : @"Vermilion",
             @"veronica" : @"Veronica",
             @"veronica" : @"Veronica",
             @"veryLightAzure" : @"Very Light Azure",
             @"verylightazure" : @"Very Light Azure",
             @"veryLightBlue" : @"Very Light Blue",
             @"verylightblue" : @"Very Light Blue",
             @"veryLightMalachiteGreen" : @"Very Light Malachite Green",
             @"verylightmalachitegreen" : @"Very Light Malachite Green",
             @"veryLightTangelo" : @"Very Light Tangelo",
             @"verylighttangelo" : @"Very Light Tangelo",
             @"veryPaleOrange" : @"Very Pale Orange",
             @"verypaleorange" : @"Very Pale Orange",
             @"veryPaleYellow" : @"Very Pale Yellow",
             @"verypaleyellow" : @"Very Pale Yellow",
             @"violet" : @"Violet",
             @"violet" : @"Violet",
             @"violetColorWheel" : @"Violet (Color Wheel)",
             @"violetcolorwheel" : @"Violet (Color Wheel)",
             @"violetRYB" : @"Violet (RYB)",
             @"violetryb" : @"Violet (RYB)",
             @"violetWeb" : @"Violet (Web)",
             @"violetweb" : @"Violet (Web)",
             @"violetBlue" : @"Violet-Blue",
             @"violetblue" : @"Violet-Blue",
             @"violetRed" : @"Violet-Red",
             @"violetred" : @"Violet-Red",
             @"viridian" : @"Viridian",
             @"viridian" : @"Viridian",
             @"viridianGreen" : @"Viridian Green",
             @"viridiangreen" : @"Viridian Green",
             @"vistaBlue" : @"Vista Blue",
             @"vistablue" : @"Vista Blue",
             @"vividAmber" : @"Vivid Amber",
             @"vividamber" : @"Vivid Amber",
             @"vividAuburn" : @"Vivid Auburn",
             @"vividauburn" : @"Vivid Auburn",
             @"vividBurgundy" : @"Vivid Burgundy",
             @"vividburgundy" : @"Vivid Burgundy",
             @"vividCerise" : @"Vivid Cerise",
             @"vividcerise" : @"Vivid Cerise",
             @"vividCerulean" : @"Vivid Cerulean",
             @"vividcerulean" : @"Vivid Cerulean",
             @"vividCrimson" : @"Vivid Crimson",
             @"vividcrimson" : @"Vivid Crimson",
             @"vividGamboge" : @"Vivid Gamboge",
             @"vividgamboge" : @"Vivid Gamboge",
             @"vividLimeGreen" : @"Vivid Lime Green",
             @"vividlimegreen" : @"Vivid Lime Green",
             @"vividMalachite" : @"Vivid Malachite",
             @"vividmalachite" : @"Vivid Malachite",
             @"vividMulberry" : @"Vivid Mulberry",
             @"vividmulberry" : @"Vivid Mulberry",
             @"vividOrange" : @"Vivid Orange",
             @"vividorange" : @"Vivid Orange",
             @"vividOrangePeel" : @"Vivid Orange Peel",
             @"vividorangepeel" : @"Vivid Orange Peel",
             @"vividOrchid" : @"Vivid Orchid",
             @"vividorchid" : @"Vivid Orchid",
             @"vividRaspberry" : @"Vivid Raspberry",
             @"vividraspberry" : @"Vivid Raspberry",
             @"vividRed" : @"Vivid Red",
             @"vividred" : @"Vivid Red",
             @"vividRedTangelo" : @"Vivid Red-Tangelo",
             @"vividredtangelo" : @"Vivid Red-Tangelo",
             @"vividSkyBlue" : @"Vivid Sky Blue",
             @"vividskyblue" : @"Vivid Sky Blue",
             @"vividTangelo" : @"Vivid Tangelo",
             @"vividtangelo" : @"Vivid Tangelo",
             @"vividTangerine" : @"Vivid Tangerine",
             @"vividtangerine" : @"Vivid Tangerine",
             @"vividVermilion" : @"Vivid Vermilion",
             @"vividvermilion" : @"Vivid Vermilion",
             @"vividViolet" : @"Vivid Violet",
             @"vividviolet" : @"Vivid Violet",
             @"vividYellow" : @"Vivid Yellow",
             @"vividyellow" : @"Vivid Yellow",
             @"warmBlack" : @"Warm Black",
             @"warmblack" : @"Warm Black",
             @"waterspout" : @"Waterspout",
             @"waterspout" : @"Waterspout",
             @"wenge" : @"Wenge",
             @"wenge" : @"Wenge",
             @"wheat" : @"Wheat",
             @"wheat" : @"Wheat",
             @"white" : @"White",
             @"white" : @"White",
             @"whiteSmoke" : @"White Smoke",
             @"whitesmoke" : @"White Smoke",
             @"wildBlueYonder" : @"Wild Blue Yonder",
             @"wildblueyonder" : @"Wild Blue Yonder",
             @"wildOrchid" : @"Wild Orchid",
             @"wildorchid" : @"Wild Orchid",
             @"wildStrawberry" : @"Wild Strawberry",
             @"wildstrawberry" : @"Wild Strawberry",
             @"wildWatermelon" : @"Wild Watermelon",
             @"wildwatermelon" : @"Wild Watermelon",
             @"willpowerOrange" : @"Willpower Orange",
             @"willpowerorange" : @"Willpower Orange",
             @"windsorTan" : @"Windsor Tan",
             @"windsortan" : @"Windsor Tan",
             @"wine" : @"Wine",
             @"wine" : @"Wine",
             @"wineDregs" : @"Wine Dregs",
             @"winedregs" : @"Wine Dregs",
             @"wisteria" : @"Wisteria",
             @"wisteria" : @"Wisteria",
             @"woodBrown" : @"Wood Brown",
             @"woodbrown" : @"Wood Brown",
             @"xanadu" : @"Xanadu",
             @"xanadu" : @"Xanadu",
             @"yaleBlue" : @"Yale Blue",
             @"yaleblue" : @"Yale Blue",
             @"yankeesBlue" : @"Yankees Blue",
             @"yankeesblue" : @"Yankees Blue",
             @"yellow" : @"Yellow",
             @"yellow" : @"Yellow",
             @"yellowCrayola" : @"Yellow (Crayola)",
             @"yellowcrayola" : @"Yellow (Crayola)",
             @"yellowMunsell" : @"Yellow (Munsell)",
             @"yellowmunsell" : @"Yellow (Munsell)",
             @"yellowNCS" : @"Yellow (NCS)",
             @"yellowncs" : @"Yellow (NCS)",
             @"yellowPantone" : @"Yellow (Pantone)",
             @"yellowpantone" : @"Yellow (Pantone)",
             @"yellowProcess" : @"Yellow (Process)",
             @"yellowprocess" : @"Yellow (Process)",
             @"yellowRYB" : @"Yellow (RYB)",
             @"yellowryb" : @"Yellow (RYB)",
             @"yellowGreen" : @"Yellow-Green",
             @"yellowgreen" : @"Yellow-Green",
             @"yellowOrange" : @"Yellow Orange",
             @"yelloworange" : @"Yellow Orange",
             @"yellowRose" : @"Yellow Rose",
             @"yellowrose" : @"Yellow Rose",
             @"zaffre" : @"Zaffre",
             @"zaffre" : @"Zaffre",
             @"zinnwalditeBrown" : @"Zinnwaldite Brown",
             @"zinnwalditebrown" : @"Zinnwaldite Brown",
             @"zomp" : @"Zomp",
             @"zomp" : @"Zomp",
             @"blackColor" : @"Black",
             @"blackcolor" : @"Black",
             @"darkGrayColor" : @"DarkGray",
             @"darkgraycolor" : @"DarkGray",
             @"lightGrayColor" : @"LightGray",
             @"lightgraycolor" : @"LightGray",
             @"lightGrayColor" : @"LightGray",
             @"lightgraycolor" : @"LightGray",
             @"whiteColor" : @"White",
             @"whitecolor" : @"White",
             @"grayColor" : @"Gray",
             @"graycolor" : @"Gray",
             @"redColor" : @"Red",
             @"redcolor" : @"Red",
             @"greenColor" : @"Green",
             @"greencolor" : @"Green",
             @"blueColor" : @"Blue",
             @"bluecolor" : @"Blue",
             @"cyanColor" : @"Cyan",
             @"cyancolor" : @"Cyan",
             @"yellowColor" : @"Yellow",
             @"yellowcolor" : @"Yellow",
             @"magentaColor" : @"Magenta",
             @"magentacolor" : @"Magenta",
             @"orangeColor" : @"Orange",
             @"orangecolor" : @"Orange",
             @"purpleColor" : @"Purple",
             @"purplecolor" : @"Purple",
             @"brownColor" : @"Brown",
             @"browncolor" : @"Brown",
             @"clearColor" : @"Clear",
             @"clearcolor" : @"Clear"};
}

+ (UIColor *)acidGreen {
    UIColor *acidGreen = [UIColor colorWithRed:69.0f/100.0f green:0.75f blue:1.0f/10.0f alpha:1.0f];
    [acidGreen setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"redComponent"];
    [acidGreen setValue:[NSNumber numberWithFloat:0.75f] forKey:@"greenComponent"];
    [acidGreen setValue:[NSNumber numberWithFloat:1.0f/10.0f] forKey:@"blueComponent"];
    return acidGreen;
}

+ (UIColor *)aero {
    UIColor *aero = [UIColor colorWithRed:49.0f/100.0f green:73.0f/100.0f blue:91.0f/100.0f alpha:1.0f];
    [aero setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"redComponent"];
    [aero setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"greenComponent"];
    [aero setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"blueComponent"];
    return aero;
}

+ (UIColor *)aeroBlue {
    UIColor *aeroBlue = [UIColor colorWithRed:79.0f/100.0f green:1.0f blue:9.0f/10.0f alpha:1.0f];
    [aeroBlue setValue:[NSNumber numberWithFloat:79.0f/100.0f] forKey:@"redComponent"];
    [aeroBlue setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [aeroBlue setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"blueComponent"];
    return aeroBlue;
}

+ (UIColor *)africanViolet {
    UIColor *africanViolet = [UIColor colorWithRed:7.0f/10.0f green:52.0f/100.0f blue:0.75f alpha:1.0f];
    [africanViolet setValue:[NSNumber numberWithFloat:7.0f/10.0f] forKey:@"redComponent"];
    [africanViolet setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"greenComponent"];
    [africanViolet setValue:[NSNumber numberWithFloat:0.75f] forKey:@"blueComponent"];
    return africanViolet;
}

+ (UIColor *)airForceBlueRAF {
    UIColor *airForceBlueRAF = [UIColor colorWithRed:36.0f/100.0f green:54.0f/100.0f blue:66.0f/100.0f alpha:1.0f];
    [airForceBlueRAF setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"redComponent"];
    [airForceBlueRAF setValue:[NSNumber numberWithFloat:54.0f/100.0f] forKey:@"greenComponent"];
    [airForceBlueRAF setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"blueComponent"];
    return airForceBlueRAF;
}

+ (UIColor *)airForceBlueUSAF {
    UIColor *airForceBlueUSAF = [UIColor colorWithRed:0.0f green:19.0f/100.0f blue:56.0f/100.0f alpha:1.0f];
    [airForceBlueUSAF setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [airForceBlueUSAF setValue:[NSNumber numberWithFloat:19.0f/100.0f] forKey:@"greenComponent"];
    [airForceBlueUSAF setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"blueComponent"];
    return airForceBlueUSAF;
}

+ (UIColor *)airSuperiorityBlue {
    UIColor *airSuperiorityBlue = [UIColor colorWithRed:45.0f/100.0f green:63.0f/100.0f blue:76.0f/100.0f alpha:1.0f];
    [airSuperiorityBlue setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"redComponent"];
    [airSuperiorityBlue setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"greenComponent"];
    [airSuperiorityBlue setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"blueComponent"];
    return airSuperiorityBlue;
}

+ (UIColor *)alabamaCrimson {
    UIColor *alabamaCrimson = [UIColor colorWithRed:69.0f/100.0f green:0.0f blue:16.0f/100.0f alpha:1.0f];
    [alabamaCrimson setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"redComponent"];
    [alabamaCrimson setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [alabamaCrimson setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"blueComponent"];
    return alabamaCrimson;
}

+ (UIColor *)aliceBlue {
    UIColor *aliceBlue = [UIColor colorWithRed:94.0f/100.0f green:97.0f/100.0f blue:1.0f alpha:1.0f];
    [aliceBlue setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"redComponent"];
    [aliceBlue setValue:[NSNumber numberWithFloat:97.0f/100.0f] forKey:@"greenComponent"];
    [aliceBlue setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return aliceBlue;
}

+ (UIColor *)alizarinCrimson {
    UIColor *alizarinCrimson = [UIColor colorWithRed:89.0f/100.0f green:15.0f/100.0f blue:21.0f/100.0f alpha:1.0f];
    [alizarinCrimson setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"redComponent"];
    [alizarinCrimson setValue:[NSNumber numberWithFloat:15.0f/100.0f] forKey:@"greenComponent"];
    [alizarinCrimson setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"blueComponent"];
    return alizarinCrimson;
}

+ (UIColor *)alloyOrange {
    UIColor *alloyOrange = [UIColor colorWithRed:77.0f/100.0f green:38.0f/100.0f blue:6.0f/100.0f alpha:1.0f];
    [alloyOrange setValue:[NSNumber numberWithFloat:77.0f/100.0f] forKey:@"redComponent"];
    [alloyOrange setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"greenComponent"];
    [alloyOrange setValue:[NSNumber numberWithFloat:6.0f/100.0f] forKey:@"blueComponent"];
    return alloyOrange;
}

+ (UIColor *)almond {
    UIColor *almond = [UIColor colorWithRed:94.0f/100.0f green:87.0f/100.0f blue:8.0f/10.0f alpha:1.0f];
    [almond setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"redComponent"];
    [almond setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"greenComponent"];
    [almond setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"blueComponent"];
    return almond;
}

+ (UIColor *)amaranth {
    UIColor *amaranth = [UIColor colorWithRed:9.0f/10.0f green:0.1667f blue:31.0f/100.0f alpha:1.0f];
    [amaranth setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"redComponent"];
    [amaranth setValue:[NSNumber numberWithFloat:0.1667f] forKey:@"greenComponent"];
    [amaranth setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"blueComponent"];
    return amaranth;
}

+ (UIColor *)amaranthDeepPurple {
    UIColor *amaranthDeepPurple = [UIColor colorWithRed:0.667f green:15.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
    [amaranthDeepPurple setValue:[NSNumber numberWithFloat:0.667f] forKey:@"redComponent"];
    [amaranthDeepPurple setValue:[NSNumber numberWithFloat:15.0f/100.0f] forKey:@"greenComponent"];
    [amaranthDeepPurple setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"blueComponent"];
    return amaranthDeepPurple;
}

+ (UIColor *)amaranthPink {
    UIColor *amaranthPink = [UIColor colorWithRed:95.0f/100.0f green:61.0f/100.0f blue:73.0f/100.0f alpha:1.0f];
    [amaranthPink setValue:[NSNumber numberWithFloat:95.0f/100.0f] forKey:@"redComponent"];
    [amaranthPink setValue:[NSNumber numberWithFloat:61.0f/100.0f] forKey:@"greenComponent"];
    [amaranthPink setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"blueComponent"];
    return amaranthPink;
}

+ (UIColor *)amaranthPurple {
    UIColor *amaranthPurple = [UIColor colorWithRed:0.667f green:15.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
    [amaranthPurple setValue:[NSNumber numberWithFloat:0.667f] forKey:@"redComponent"];
    [amaranthPurple setValue:[NSNumber numberWithFloat:15.0f/100.0f] forKey:@"greenComponent"];
    [amaranthPurple setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"blueComponent"];
    return amaranthPurple;
}

+ (UIColor *)amaranthRed {
    UIColor *amaranthRed = [UIColor colorWithRed:83.0f/100.0f green:13.0f/100.0f blue:18.0f/100.0f alpha:1.0f];
    [amaranthRed setValue:[NSNumber numberWithFloat:83.0f/100.0f] forKey:@"redComponent"];
    [amaranthRed setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"greenComponent"];
    [amaranthRed setValue:[NSNumber numberWithFloat:18.0f/100.0f] forKey:@"blueComponent"];
    return amaranthRed;
}

+ (UIColor *)amazon {
    UIColor *amazon = [UIColor colorWithRed:23.0f/100.0f green:48.0f/100.0f blue:34.0f/100.0f alpha:1.0f];
    [amazon setValue:[NSNumber numberWithFloat:23.0f/100.0f] forKey:@"redComponent"];
    [amazon setValue:[NSNumber numberWithFloat:48.0f/100.0f] forKey:@"greenComponent"];
    [amazon setValue:[NSNumber numberWithFloat:34.0f/100.0f] forKey:@"blueComponent"];
    return amazon;
}

+ (UIColor *)amber {
    UIColor *amber = [UIColor colorWithRed:1.0f green:0.75f blue:0.0f alpha:1.0f];
    [amber setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [amber setValue:[NSNumber numberWithFloat:0.75f] forKey:@"greenComponent"];
    [amber setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return amber;
}

+ (UIColor *)amberSAEECE {
    UIColor *amberSAEECE = [UIColor colorWithRed:1.0f green:49.0f/100.0f blue:0.0f alpha:1.0f];
    [amberSAEECE setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [amberSAEECE setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"greenComponent"];
    [amberSAEECE setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return amberSAEECE;
}

+ (UIColor *)americanRose {
    UIColor *americanRose = [UIColor colorWithRed:1.0f green:1.0f/100.0f blue:24.0f/100.0f alpha:1.0f];
    [americanRose setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [americanRose setValue:[NSNumber numberWithFloat:1.0f/100.0f] forKey:@"greenComponent"];
    [americanRose setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"blueComponent"];
    return americanRose;
}

+ (UIColor *)amethyst {
    UIColor *amethyst = [UIColor colorWithRed:6.0f/10.0f green:4.0f/10.0f blue:8.0f/10.0f alpha:1.0f];
    [amethyst setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"redComponent"];
    [amethyst setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"greenComponent"];
    [amethyst setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"blueComponent"];
    return amethyst;
}

+ (UIColor *)androidGreen {
    UIColor *androidGreen = [UIColor colorWithRed:64.0f/100.0f green:78.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
    [androidGreen setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"redComponent"];
    [androidGreen setValue:[NSNumber numberWithFloat:78.0f/100.0f] forKey:@"greenComponent"];
    [androidGreen setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"blueComponent"];
    return androidGreen;
}

+ (UIColor *)antiFlashWhite {
    UIColor *antiFlashWhite = [UIColor colorWithRed:95.0f/100.0f green:95.0f/100.0f blue:96.0f/100.0f alpha:1.0f];
    [antiFlashWhite setValue:[NSNumber numberWithFloat:95.0f/100.0f] forKey:@"redComponent"];
    [antiFlashWhite setValue:[NSNumber numberWithFloat:95.0f/100.0f] forKey:@"greenComponent"];
    [antiFlashWhite setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"blueComponent"];
    return antiFlashWhite;
}

+ (UIColor *)antiqueBrass {
    UIColor *antiqueBrass = [UIColor colorWithRed:8.0f/10.0f green:58.0f/100.0f blue:46.0f/100.0f alpha:1.0f];
    [antiqueBrass setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [antiqueBrass setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"greenComponent"];
    [antiqueBrass setValue:[NSNumber numberWithFloat:46.0f/100.0f] forKey:@"blueComponent"];
    return antiqueBrass;
}

+ (UIColor *)antiqueBronze {
    UIColor *antiqueBronze = [UIColor colorWithRed:4.0f/10.0f green:36.0f/100.0f blue:12.0f/100.0f alpha:1.0f];
    [antiqueBronze setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"redComponent"];
    [antiqueBronze setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"greenComponent"];
    [antiqueBronze setValue:[NSNumber numberWithFloat:12.0f/100.0f] forKey:@"blueComponent"];
    return antiqueBronze;
}

+ (UIColor *)antiqueFuchsia {
    UIColor *antiqueFuchsia = [UIColor colorWithRed:57.0f/100.0f green:36.0f/100.0f blue:51.0f/100.0f alpha:1.0f];
    [antiqueFuchsia setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"redComponent"];
    [antiqueFuchsia setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"greenComponent"];
    [antiqueFuchsia setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"blueComponent"];
    return antiqueFuchsia;
}

+ (UIColor *)antiqueRuby {
    UIColor *antiqueRuby = [UIColor colorWithRed:52.0f/100.0f green:11.0f/100.0f blue:18.0f/100.0f alpha:1.0f];
    [antiqueRuby setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"redComponent"];
    [antiqueRuby setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"greenComponent"];
    [antiqueRuby setValue:[NSNumber numberWithFloat:18.0f/100.0f] forKey:@"blueComponent"];
    return antiqueRuby;
}

+ (UIColor *)antiqueWhite {
    UIColor *antiqueWhite = [UIColor colorWithRed:98.0f/100.0f green:92.0f/100.0f blue:84.0f/100.0f alpha:1.0f];
    [antiqueWhite setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [antiqueWhite setValue:[NSNumber numberWithFloat:92.0f/100.0f] forKey:@"greenComponent"];
    [antiqueWhite setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"blueComponent"];
    return antiqueWhite;
}

+ (UIColor *)aoEnglish {
    UIColor *aoEnglish = [UIColor colorWithRed:0.0f green:0.5f blue:0.0f alpha:1.0f];
    [aoEnglish setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [aoEnglish setValue:[NSNumber numberWithFloat:0.5f] forKey:@"greenComponent"];
    [aoEnglish setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return aoEnglish;
}

+ (UIColor *)appleGreen {
    UIColor *appleGreen = [UIColor colorWithRed:55.0f/100.0f green:71.0f/100.0f blue:0.0f alpha:1.0f];
    [appleGreen setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"redComponent"];
    [appleGreen setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"greenComponent"];
    [appleGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return appleGreen;
}

+ (UIColor *)apricot {
    UIColor *apricot = [UIColor colorWithRed:98.0f/100.0f green:81.0f/100.0f blue:69.0f/100.0f alpha:1.0f];
    [apricot setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [apricot setValue:[NSNumber numberWithFloat:81.0f/100.0f] forKey:@"greenComponent"];
    [apricot setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"blueComponent"];
    return apricot;
}

+ (UIColor *)aqua {
    UIColor *aqua = [UIColor colorWithRed:0.0f green:1.0f blue:1.0f alpha:1.0f];
    [aqua setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [aqua setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [aqua setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return aqua;
}

+ (UIColor *)aquamarine {
    UIColor *aquamarine = [UIColor colorWithRed:0.5f green:1.0f blue:83.0f/100.0f alpha:1.0f];
    [aquamarine setValue:[NSNumber numberWithFloat:0.5f] forKey:@"redComponent"];
    [aquamarine setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [aquamarine setValue:[NSNumber numberWithFloat:83.0f/100.0f] forKey:@"blueComponent"];
    return aquamarine;
}

+ (UIColor *)armyGreen {
    UIColor *armyGreen = [UIColor colorWithRed:29.0f/100.0f green:0.333f blue:13.0f/100.0f alpha:1.0f];
    [armyGreen setValue:[NSNumber numberWithFloat:29.0f/100.0f] forKey:@"redComponent"];
    [armyGreen setValue:[NSNumber numberWithFloat:0.333f] forKey:@"greenComponent"];
    [armyGreen setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"blueComponent"];
    return armyGreen;
}

+ (UIColor *)arsenic {
    UIColor *arsenic = [UIColor colorWithRed:23.0f/100.0f green:27.0f/100.0f blue:29.0f/100.0f alpha:1.0f];
    [arsenic setValue:[NSNumber numberWithFloat:23.0f/100.0f] forKey:@"redComponent"];
    [arsenic setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"greenComponent"];
    [arsenic setValue:[NSNumber numberWithFloat:29.0f/100.0f] forKey:@"blueComponent"];
    return arsenic;
}

+ (UIColor *)artichoke {
    UIColor *artichoke = [UIColor colorWithRed:56.0f/100.0f green:59.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
    [artichoke setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"redComponent"];
    [artichoke setValue:[NSNumber numberWithFloat:59.0f/100.0f] forKey:@"greenComponent"];
    [artichoke setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"blueComponent"];
    return artichoke;
}

+ (UIColor *)arylideYellow {
    UIColor *arylideYellow = [UIColor colorWithRed:91.0f/100.0f green:84.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
    [arylideYellow setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"redComponent"];
    [arylideYellow setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"greenComponent"];
    [arylideYellow setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"blueComponent"];
    return arylideYellow;
}

+ (UIColor *)ashGrey {
    UIColor *ashGrey = [UIColor colorWithRed:7.0f/10.0f green:0.75f blue:71.0f/100.0f alpha:1.0f];
    [ashGrey setValue:[NSNumber numberWithFloat:7.0f/10.0f] forKey:@"redComponent"];
    [ashGrey setValue:[NSNumber numberWithFloat:0.75f] forKey:@"greenComponent"];
    [ashGrey setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"blueComponent"];
    return ashGrey;
}

+ (UIColor *)asparagus {
    UIColor *asparagus = [UIColor colorWithRed:53.0f/100.0f green:66.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
    [asparagus setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"redComponent"];
    [asparagus setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"greenComponent"];
    [asparagus setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"blueComponent"];
    return asparagus;
}

+ (UIColor *)atomicTangerine {
    UIColor *atomicTangerine = [UIColor colorWithRed:1.0f green:6.0f/10.0f blue:4.0f/10.0f alpha:1.0f];
    [atomicTangerine setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [atomicTangerine setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [atomicTangerine setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"blueComponent"];
    return atomicTangerine;
}

+ (UIColor *)auburn {
    UIColor *auburn = [UIColor colorWithRed:65.0f/100.0f green:16.0f/100.0f blue:16.0f/100.0f alpha:1.0f];
    [auburn setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"redComponent"];
    [auburn setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"greenComponent"];
    [auburn setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"blueComponent"];
    return auburn;
}

+ (UIColor *)aureolin {
    UIColor *aureolin = [UIColor colorWithRed:99.0f/100.0f green:93.0f/100.0f blue:0.0f alpha:1.0f];
    [aureolin setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"redComponent"];
    [aureolin setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"greenComponent"];
    [aureolin setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return aureolin;
}

+ (UIColor *)auroMetalSaurus {
    UIColor *auroMetalSaurus = [UIColor colorWithRed:43.0f/100.0f green:0.5f blue:0.5f alpha:1.0f];
    [auroMetalSaurus setValue:[NSNumber numberWithFloat:43.0f/100.0f] forKey:@"redComponent"];
    [auroMetalSaurus setValue:[NSNumber numberWithFloat:0.5f] forKey:@"greenComponent"];
    [auroMetalSaurus setValue:[NSNumber numberWithFloat:0.5f] forKey:@"blueComponent"];
    return auroMetalSaurus;
}

+ (UIColor *)avocado {
    UIColor *avocado = [UIColor colorWithRed:34.0f/100.0f green:51.0f/100.0f blue:1.0f/100.0f alpha:1.0f];
    [avocado setValue:[NSNumber numberWithFloat:34.0f/100.0f] forKey:@"redComponent"];
    [avocado setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"greenComponent"];
    [avocado setValue:[NSNumber numberWithFloat:1.0f/100.0f] forKey:@"blueComponent"];
    return avocado;
}

+ (UIColor *)azure {
    UIColor *azure = [UIColor colorWithRed:0.0f green:0.5f blue:1.0f alpha:1.0f];
    [azure setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [azure setValue:[NSNumber numberWithFloat:0.5f] forKey:@"greenComponent"];
    [azure setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return azure;
}

+ (UIColor *)azureWebColor {
    UIColor *azureWebColor = [UIColor colorWithRed:94.0f/100.0f green:1.0f blue:1.0f alpha:1.0f];
    [azureWebColor setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"redComponent"];
    [azureWebColor setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [azureWebColor setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return azureWebColor;
}

+ (UIColor *)azureMist {
    UIColor *azureMist = [UIColor colorWithRed:94.0f/100.0f green:1.0f blue:1.0f alpha:1.0f];
    [azureMist setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"redComponent"];
    [azureMist setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [azureMist setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return azureMist;
}

+ (UIColor *)azureishWhite {
    UIColor *azureishWhite = [UIColor colorWithRed:86.0f/100.0f green:91.0f/100.0f blue:96.0f/100.0f alpha:1.0f];
    [azureishWhite setValue:[NSNumber numberWithFloat:86.0f/100.0f] forKey:@"redComponent"];
    [azureishWhite setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"greenComponent"];
    [azureishWhite setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"blueComponent"];
    return azureishWhite;
}

+ (UIColor *)babyBlue {
    UIColor *babyBlue = [UIColor colorWithRed:54.0f/100.0f green:81.0f/100.0f blue:94.0f/100.0f alpha:1.0f];
    [babyBlue setValue:[NSNumber numberWithFloat:54.0f/100.0f] forKey:@"redComponent"];
    [babyBlue setValue:[NSNumber numberWithFloat:81.0f/100.0f] forKey:@"greenComponent"];
    [babyBlue setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"blueComponent"];
    return babyBlue;
}

+ (UIColor *)babyBlueEyes {
    UIColor *babyBlueEyes = [UIColor colorWithRed:63.0f/100.0f green:79.0f/100.0f blue:95.0f/100.0f alpha:1.0f];
    [babyBlueEyes setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"redComponent"];
    [babyBlueEyes setValue:[NSNumber numberWithFloat:79.0f/100.0f] forKey:@"greenComponent"];
    [babyBlueEyes setValue:[NSNumber numberWithFloat:95.0f/100.0f] forKey:@"blueComponent"];
    return babyBlueEyes;
}

+ (UIColor *)babyPink {
    UIColor *babyPink = [UIColor colorWithRed:96.0f/100.0f green:76.0f/100.0f blue:76.0f/100.0f alpha:1.0f];
    [babyPink setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"redComponent"];
    [babyPink setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"greenComponent"];
    [babyPink setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"blueComponent"];
    return babyPink;
}

+ (UIColor *)babyPowder {
    UIColor *babyPowder = [UIColor colorWithRed:1.0f green:1.0f blue:98.0f/100.0f alpha:1.0f];
    [babyPowder setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [babyPowder setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [babyPowder setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"blueComponent"];
    return babyPowder;
}

+ (UIColor *)bakerMillerPink {
    UIColor *bakerMillerPink = [UIColor colorWithRed:1.0f green:57.0f/100.0f blue:69.0f/100.0f alpha:1.0f];
    [bakerMillerPink setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [bakerMillerPink setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"greenComponent"];
    [bakerMillerPink setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"blueComponent"];
    return bakerMillerPink;
}

+ (UIColor *)ballBlue {
    UIColor *ballBlue = [UIColor colorWithRed:13.0f/100.0f green:0.667f blue:8.0f/10.0f alpha:1.0f];
    [ballBlue setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"redComponent"];
    [ballBlue setValue:[NSNumber numberWithFloat:0.667f] forKey:@"greenComponent"];
    [ballBlue setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"blueComponent"];
    return ballBlue;
}

+ (UIColor *)bananaMania {
    UIColor *bananaMania = [UIColor colorWithRed:98.0f/100.0f green:91.0f/100.0f blue:71.0f/100.0f alpha:1.0f];
    [bananaMania setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [bananaMania setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"greenComponent"];
    [bananaMania setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"blueComponent"];
    return bananaMania;
}

+ (UIColor *)bananaYellow {
    UIColor *bananaYellow = [UIColor colorWithRed:1.0f green:88.0f/100.0f blue:21.0f/100.0f alpha:1.0f];
    [bananaYellow setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [bananaYellow setValue:[NSNumber numberWithFloat:88.0f/100.0f] forKey:@"greenComponent"];
    [bananaYellow setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"blueComponent"];
    return bananaYellow;
}

+ (UIColor *)bangladeshGreen {
    UIColor *bangladeshGreen = [UIColor colorWithRed:0.0f green:42.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
    [bangladeshGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [bangladeshGreen setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"greenComponent"];
    [bangladeshGreen setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"blueComponent"];
    return bangladeshGreen;
}

+ (UIColor *)barbiePink {
    UIColor *barbiePink = [UIColor colorWithRed:88.0f/100.0f green:13.0f/100.0f blue:54.0f/100.0f alpha:1.0f];
    [barbiePink setValue:[NSNumber numberWithFloat:88.0f/100.0f] forKey:@"redComponent"];
    [barbiePink setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"greenComponent"];
    [barbiePink setValue:[NSNumber numberWithFloat:54.0f/100.0f] forKey:@"blueComponent"];
    return barbiePink;
}

+ (UIColor *)barnRed {
    UIColor *barnRed = [UIColor colorWithRed:49.0f/100.0f green:4.0f/100.0f blue:1.0f/100.0f alpha:1.0f];
    [barnRed setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"redComponent"];
    [barnRed setValue:[NSNumber numberWithFloat:4.0f/100.0f] forKey:@"greenComponent"];
    [barnRed setValue:[NSNumber numberWithFloat:1.0f/100.0f] forKey:@"blueComponent"];
    return barnRed;
}

+ (UIColor *)battleshipGrey {
    UIColor *battleshipGrey = [UIColor colorWithRed:52.0f/100.0f green:52.0f/100.0f blue:51.0f/100.0f alpha:1.0f];
    [battleshipGrey setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"redComponent"];
    [battleshipGrey setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"greenComponent"];
    [battleshipGrey setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"blueComponent"];
    return battleshipGrey;
}

+ (UIColor *)bazaar {
    UIColor *bazaar = [UIColor colorWithRed:6.0f/10.0f green:47.0f/100.0f blue:48.0f/100.0f alpha:1.0f];
    [bazaar setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"redComponent"];
    [bazaar setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"greenComponent"];
    [bazaar setValue:[NSNumber numberWithFloat:48.0f/100.0f] forKey:@"blueComponent"];
    return bazaar;
}

+ (UIColor *)beauBlue {
    UIColor *beauBlue = [UIColor colorWithRed:74.0f/100.0f green:83.0f/100.0f blue:9.0f/10.0f alpha:1.0f];
    [beauBlue setValue:[NSNumber numberWithFloat:74.0f/100.0f] forKey:@"redComponent"];
    [beauBlue setValue:[NSNumber numberWithFloat:83.0f/100.0f] forKey:@"greenComponent"];
    [beauBlue setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"blueComponent"];
    return beauBlue;
}

+ (UIColor *)beaver {
    UIColor *beaver = [UIColor colorWithRed:62.0f/100.0f green:51.0f/100.0f blue:44.0f/100.0f alpha:1.0f];
    [beaver setValue:[NSNumber numberWithFloat:62.0f/100.0f] forKey:@"redComponent"];
    [beaver setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"greenComponent"];
    [beaver setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"blueComponent"];
    return beaver;
}

+ (UIColor *)beige {
    UIColor *beige = [UIColor colorWithRed:96.0f/100.0f green:96.0f/100.0f blue:86.0f/100.0f alpha:1.0f];
    [beige setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"redComponent"];
    [beige setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"greenComponent"];
    [beige setValue:[NSNumber numberWithFloat:86.0f/100.0f] forKey:@"blueComponent"];
    return beige;
}

+ (UIColor *)bdazzledBlue {
    UIColor *bdazzledBlue = [UIColor colorWithRed:18.0f/100.0f green:35.0f/100.0f blue:58.0f/100.0f alpha:1.0f];
    [bdazzledBlue setValue:[NSNumber numberWithFloat:18.0f/100.0f] forKey:@"redComponent"];
    [bdazzledBlue setValue:[NSNumber numberWithFloat:35.0f/100.0f] forKey:@"greenComponent"];
    [bdazzledBlue setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"blueComponent"];
    return bdazzledBlue;
}

+ (UIColor *)bigDipOruby {
    UIColor *bigDipOruby = [UIColor colorWithRed:61.0f/100.0f green:15.0f/100.0f blue:26.0f/100.0f alpha:1.0f];
    [bigDipOruby setValue:[NSNumber numberWithFloat:61.0f/100.0f] forKey:@"redComponent"];
    [bigDipOruby setValue:[NSNumber numberWithFloat:15.0f/100.0f] forKey:@"greenComponent"];
    [bigDipOruby setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"blueComponent"];
    return bigDipOruby;
}

+ (UIColor *)bisque {
    UIColor *bisque = [UIColor colorWithRed:1.0f green:89.0f/100.0f blue:77.0f/100.0f alpha:1.0f];
    [bisque setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [bisque setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"greenComponent"];
    [bisque setValue:[NSNumber numberWithFloat:77.0f/100.0f] forKey:@"blueComponent"];
    return bisque;
}

+ (UIColor *)bistre {
    UIColor *bistre = [UIColor colorWithRed:24.0f/100.0f green:0.1667f blue:12.0f/100.0f alpha:1.0f];
    [bistre setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"redComponent"];
    [bistre setValue:[NSNumber numberWithFloat:0.1667f] forKey:@"greenComponent"];
    [bistre setValue:[NSNumber numberWithFloat:12.0f/100.0f] forKey:@"blueComponent"];
    return bistre;
}

+ (UIColor *)bistreBrown {
    UIColor *bistreBrown = [UIColor colorWithRed:59.0f/100.0f green:44.0f/100.0f blue:9.0f/100.0f alpha:1.0f];
    [bistreBrown setValue:[NSNumber numberWithFloat:59.0f/100.0f] forKey:@"redComponent"];
    [bistreBrown setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"greenComponent"];
    [bistreBrown setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"blueComponent"];
    return bistreBrown;
}

+ (UIColor *)bitterLemon {
    UIColor *bitterLemon = [UIColor colorWithRed:79.0f/100.0f green:88.0f/100.0f blue:5.0f/100.0f alpha:1.0f];
    [bitterLemon setValue:[NSNumber numberWithFloat:79.0f/100.0f] forKey:@"redComponent"];
    [bitterLemon setValue:[NSNumber numberWithFloat:88.0f/100.0f] forKey:@"greenComponent"];
    [bitterLemon setValue:[NSNumber numberWithFloat:5.0f/100.0f] forKey:@"blueComponent"];
    return bitterLemon;
}

+ (UIColor *)bitterLime {
    UIColor *bitterLime = [UIColor colorWithRed:0.75f green:1.0f blue:0.0f alpha:1.0f];
    [bitterLime setValue:[NSNumber numberWithFloat:0.75f] forKey:@"redComponent"];
    [bitterLime setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [bitterLime setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return bitterLime;
}

+ (UIColor *)bittersweet {
    UIColor *bittersweet = [UIColor colorWithRed:1.0f green:44.0f/100.0f blue:37.0f/100.0f alpha:1.0f];
    [bittersweet setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [bittersweet setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"greenComponent"];
    [bittersweet setValue:[NSNumber numberWithFloat:37.0f/100.0f] forKey:@"blueComponent"];
    return bittersweet;
}

+ (UIColor *)bittersweetShimmer {
    UIColor *bittersweetShimmer = [UIColor colorWithRed:0.75f green:31.0f/100.0f blue:32.0f/100.0f alpha:1.0f];
    [bittersweetShimmer setValue:[NSNumber numberWithFloat:0.75f] forKey:@"redComponent"];
    [bittersweetShimmer setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"greenComponent"];
    [bittersweetShimmer setValue:[NSNumber numberWithFloat:32.0f/100.0f] forKey:@"blueComponent"];
    return bittersweetShimmer;
}

+ (UIColor *)black {
    UIColor *black = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f];
    [black setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [black setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [black setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return black;
}

+ (UIColor *)blackBean {
    UIColor *blackBean = [UIColor colorWithRed:24.0f/100.0f green:5.0f/100.0f blue:1.0f/100.0f alpha:1.0f];
    [blackBean setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"redComponent"];
    [blackBean setValue:[NSNumber numberWithFloat:5.0f/100.0f] forKey:@"greenComponent"];
    [blackBean setValue:[NSNumber numberWithFloat:1.0f/100.0f] forKey:@"blueComponent"];
    return blackBean;
}

+ (UIColor *)blackLeatherJacket {
    UIColor *blackLeatherJacket = [UIColor colorWithRed:15.0f/100.0f green:21.0f/100.0f blue:16.0f/100.0f alpha:1.0f];
    [blackLeatherJacket setValue:[NSNumber numberWithFloat:15.0f/100.0f] forKey:@"redComponent"];
    [blackLeatherJacket setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"greenComponent"];
    [blackLeatherJacket setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"blueComponent"];
    return blackLeatherJacket;
}

+ (UIColor *)blackOlive {
    UIColor *blackOlive = [UIColor colorWithRed:23.0f/100.0f green:24.0f/100.0f blue:21.0f/100.0f alpha:1.0f];
    [blackOlive setValue:[NSNumber numberWithFloat:23.0f/100.0f] forKey:@"redComponent"];
    [blackOlive setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"greenComponent"];
    [blackOlive setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"blueComponent"];
    return blackOlive;
}

+ (UIColor *)blanchedAlmond {
    UIColor *blanchedAlmond = [UIColor colorWithRed:1.0f green:92.0f/100.0f blue:8.0f/10.0f alpha:1.0f];
    [blanchedAlmond setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [blanchedAlmond setValue:[NSNumber numberWithFloat:92.0f/100.0f] forKey:@"greenComponent"];
    [blanchedAlmond setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"blueComponent"];
    return blanchedAlmond;
}

+ (UIColor *)blastOffBronze {
    UIColor *blastOffBronze = [UIColor colorWithRed:65.0f/100.0f green:44.0f/100.0f blue:39.0f/100.0f alpha:1.0f];
    [blastOffBronze setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"redComponent"];
    [blastOffBronze setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"greenComponent"];
    [blastOffBronze setValue:[NSNumber numberWithFloat:39.0f/100.0f] forKey:@"blueComponent"];
    return blastOffBronze;
}

+ (UIColor *)bleuDeFrance {
    UIColor *bleuDeFrance = [UIColor colorWithRed:19.0f/100.0f green:55.0f/100.0f blue:91.0f/100.0f alpha:1.0f];
    [bleuDeFrance setValue:[NSNumber numberWithFloat:19.0f/100.0f] forKey:@"redComponent"];
    [bleuDeFrance setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"greenComponent"];
    [bleuDeFrance setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"blueComponent"];
    return bleuDeFrance;
}

+ (UIColor *)blizzardBlue {
    UIColor *blizzardBlue = [UIColor colorWithRed:0.667f green:9.0f/10.0f blue:93.0f/100.0f alpha:1.0f];
    [blizzardBlue setValue:[NSNumber numberWithFloat:0.667f] forKey:@"redComponent"];
    [blizzardBlue setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"greenComponent"];
    [blizzardBlue setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"blueComponent"];
    return blizzardBlue;
}

+ (UIColor *)blond {
    UIColor *blond = [UIColor colorWithRed:98.0f/100.0f green:94.0f/100.0f blue:0.75f alpha:1.0f];
    [blond setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [blond setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"greenComponent"];
    [blond setValue:[NSNumber numberWithFloat:0.75f] forKey:@"blueComponent"];
    return blond;
}

+ (UIColor *)blue {
    UIColor *blue = [UIColor colorWithRed:0.0f green:0.0f blue:1.0f alpha:1.0f];
    [blue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [blue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [blue setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return blue;
}

+ (UIColor *)blueCrayola {
    UIColor *blueCrayola = [UIColor colorWithRed:12.0f/100.0f green:46.0f/100.0f blue:1.0f alpha:1.0f];
    [blueCrayola setValue:[NSNumber numberWithFloat:12.0f/100.0f] forKey:@"redComponent"];
    [blueCrayola setValue:[NSNumber numberWithFloat:46.0f/100.0f] forKey:@"greenComponent"];
    [blueCrayola setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return blueCrayola;
}

+ (UIColor *)blueMunsell {
    UIColor *blueMunsell = [UIColor colorWithRed:0.0f green:58.0f/100.0f blue:69.0f/100.0f alpha:1.0f];
    [blueMunsell setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [blueMunsell setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"greenComponent"];
    [blueMunsell setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"blueComponent"];
    return blueMunsell;
}

+ (UIColor *)blueNCS {
    UIColor *blueNCS = [UIColor colorWithRed:0.0f green:53.0f/100.0f blue:74.0f/100.0f alpha:1.0f];
    [blueNCS setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [blueNCS setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"greenComponent"];
    [blueNCS setValue:[NSNumber numberWithFloat:74.0f/100.0f] forKey:@"blueComponent"];
    return blueNCS;
}

+ (UIColor *)bluePantone {
    UIColor *bluePantone = [UIColor colorWithRed:0.0f green:9.0f/100.0f blue:66.0f/100.0f alpha:1.0f];
    [bluePantone setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [bluePantone setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"greenComponent"];
    [bluePantone setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"blueComponent"];
    return bluePantone;
}

+ (UIColor *)bluePigment {
    UIColor *bluePigment = [UIColor colorWithRed:2.0f/10.0f green:2.0f/10.0f blue:6.0f/10.0f alpha:1.0f];
    [bluePigment setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"redComponent"];
    [bluePigment setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"greenComponent"];
    [bluePigment setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"blueComponent"];
    return bluePigment;
}

+ (UIColor *)blueRYB {
    UIColor *blueRYB = [UIColor colorWithRed:1.0f/100.0f green:28.0f/100.0f blue:1.0f alpha:1.0f];
    [blueRYB setValue:[NSNumber numberWithFloat:1.0f/100.0f] forKey:@"redComponent"];
    [blueRYB setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"greenComponent"];
    [blueRYB setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return blueRYB;
}

+ (UIColor *)blueBell {
    UIColor *blueBell = [UIColor colorWithRed:64.0f/100.0f green:64.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
    [blueBell setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"redComponent"];
    [blueBell setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"greenComponent"];
    [blueBell setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"blueComponent"];
    return blueBell;
}

+ (UIColor *)blueGray {
    UIColor *blueGray = [UIColor colorWithRed:4.0f/10.0f green:6.0f/10.0f blue:8.0f/10.0f alpha:1.0f];
    [blueGray setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"redComponent"];
    [blueGray setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [blueGray setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"blueComponent"];
    return blueGray;
}

+ (UIColor *)blueGreen {
    UIColor *blueGreen = [UIColor colorWithRed:5.0f/100.0f green:6.0f/10.0f blue:73.0f/100.0f alpha:1.0f];
    [blueGreen setValue:[NSNumber numberWithFloat:5.0f/100.0f] forKey:@"redComponent"];
    [blueGreen setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [blueGreen setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"blueComponent"];
    return blueGreen;
}

+ (UIColor *)blueLagoon {
    UIColor *blueLagoon = [UIColor colorWithRed:37.0f/100.0f green:58.0f/100.0f blue:63.0f/100.0f alpha:1.0f];
    [blueLagoon setValue:[NSNumber numberWithFloat:37.0f/100.0f] forKey:@"redComponent"];
    [blueLagoon setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"greenComponent"];
    [blueLagoon setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"blueComponent"];
    return blueLagoon;
}

+ (UIColor *)blueMagentaViolet {
    UIColor *blueMagentaViolet = [UIColor colorWithRed:0.333f green:21.0f/100.0f blue:57.0f/100.0f alpha:1.0f];
    [blueMagentaViolet setValue:[NSNumber numberWithFloat:0.333f] forKey:@"redComponent"];
    [blueMagentaViolet setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"greenComponent"];
    [blueMagentaViolet setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"blueComponent"];
    return blueMagentaViolet;
}

+ (UIColor *)blueSapphire {
    UIColor *blueSapphire = [UIColor colorWithRed:7.0f/100.0f green:38.0f/100.0f blue:0.5f alpha:1.0f];
    [blueSapphire setValue:[NSNumber numberWithFloat:7.0f/100.0f] forKey:@"redComponent"];
    [blueSapphire setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"greenComponent"];
    [blueSapphire setValue:[NSNumber numberWithFloat:0.5f] forKey:@"blueComponent"];
    return blueSapphire;
}

+ (UIColor *)blueViolet {
    UIColor *blueViolet = [UIColor colorWithRed:54.0f/100.0f green:0.1667f blue:89.0f/100.0f alpha:1.0f];
    [blueViolet setValue:[NSNumber numberWithFloat:54.0f/100.0f] forKey:@"redComponent"];
    [blueViolet setValue:[NSNumber numberWithFloat:0.1667f] forKey:@"greenComponent"];
    [blueViolet setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"blueComponent"];
    return blueViolet;
}

+ (UIColor *)blueYonder {
    UIColor *blueYonder = [UIColor colorWithRed:31.0f/100.0f green:45.0f/100.0f blue:65.0f/100.0f alpha:1.0f];
    [blueYonder setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"redComponent"];
    [blueYonder setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"greenComponent"];
    [blueYonder setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"blueComponent"];
    return blueYonder;
}

+ (UIColor *)blueberry {
    UIColor *blueberry = [UIColor colorWithRed:31.0f/100.0f green:53.0f/100.0f blue:97.0f/100.0f alpha:1.0f];
    [blueberry setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"redComponent"];
    [blueberry setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"greenComponent"];
    [blueberry setValue:[NSNumber numberWithFloat:97.0f/100.0f] forKey:@"blueComponent"];
    return blueberry;
}

+ (UIColor *)bluebonnet {
    UIColor *bluebonnet = [UIColor colorWithRed:11.0f/100.0f green:11.0f/100.0f blue:94.0f/100.0f alpha:1.0f];
    [bluebonnet setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"redComponent"];
    [bluebonnet setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"greenComponent"];
    [bluebonnet setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"blueComponent"];
    return bluebonnet;
}

+ (UIColor *)blush {
    UIColor *blush = [UIColor colorWithRed:87.0f/100.0f green:36.0f/100.0f blue:51.0f/100.0f alpha:1.0f];
    [blush setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"redComponent"];
    [blush setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"greenComponent"];
    [blush setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"blueComponent"];
    return blush;
}

+ (UIColor *)bole {
    UIColor *bole = [UIColor colorWithRed:47.0f/100.0f green:27.0f/100.0f blue:23.0f/100.0f alpha:1.0f];
    [bole setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"redComponent"];
    [bole setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"greenComponent"];
    [bole setValue:[NSNumber numberWithFloat:23.0f/100.0f] forKey:@"blueComponent"];
    return bole;
}

+ (UIColor *)bondiBlue {
    UIColor *bondiBlue = [UIColor colorWithRed:0.0f green:58.0f/100.0f blue:71.0f/100.0f alpha:1.0f];
    [bondiBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [bondiBlue setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"greenComponent"];
    [bondiBlue setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"blueComponent"];
    return bondiBlue;
}

+ (UIColor *)bone {
    UIColor *bone = [UIColor colorWithRed:89.0f/100.0f green:85.0f/100.0f blue:79.0f/100.0f alpha:1.0f];
    [bone setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"redComponent"];
    [bone setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"greenComponent"];
    [bone setValue:[NSNumber numberWithFloat:79.0f/100.0f] forKey:@"blueComponent"];
    return bone;
}

+ (UIColor *)bostonUniversityRed {
    UIColor *bostonUniversityRed = [UIColor colorWithRed:8.0f/10.0f green:0.0f blue:0.0f alpha:1.0f];
    [bostonUniversityRed setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [bostonUniversityRed setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [bostonUniversityRed setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return bostonUniversityRed;
}

+ (UIColor *)bottleGreen {
    UIColor *bottleGreen = [UIColor colorWithRed:0.0f green:42.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
    [bottleGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [bottleGreen setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"greenComponent"];
    [bottleGreen setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"blueComponent"];
    return bottleGreen;
}

+ (UIColor *)boysenberry {
    UIColor *boysenberry = [UIColor colorWithRed:53.0f/100.0f green:2.0f/10.0f blue:38.0f/100.0f alpha:1.0f];
    [boysenberry setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"redComponent"];
    [boysenberry setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"greenComponent"];
    [boysenberry setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"blueComponent"];
    return boysenberry;
}

+ (UIColor *)brandeisBlue {
    UIColor *brandeisBlue = [UIColor colorWithRed:0.0f green:44.0f/100.0f blue:1.0f alpha:1.0f];
    [brandeisBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [brandeisBlue setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"greenComponent"];
    [brandeisBlue setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return brandeisBlue;
}

+ (UIColor *)brass {
    UIColor *brass = [UIColor colorWithRed:71.0f/100.0f green:65.0f/100.0f blue:26.0f/100.0f alpha:1.0f];
    [brass setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"redComponent"];
    [brass setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"greenComponent"];
    [brass setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"blueComponent"];
    return brass;
}

+ (UIColor *)brickRed {
    UIColor *brickRed = [UIColor colorWithRed:8.0f/10.0f green:0.25f blue:0.333f alpha:1.0f];
    [brickRed setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [brickRed setValue:[NSNumber numberWithFloat:0.25f] forKey:@"greenComponent"];
    [brickRed setValue:[NSNumber numberWithFloat:0.333f] forKey:@"blueComponent"];
    return brickRed;
}

+ (UIColor *)brightCerulean {
    UIColor *brightCerulean = [UIColor colorWithRed:11.0f/100.0f green:0.667f blue:84.0f/100.0f alpha:1.0f];
    [brightCerulean setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"redComponent"];
    [brightCerulean setValue:[NSNumber numberWithFloat:0.667f] forKey:@"greenComponent"];
    [brightCerulean setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"blueComponent"];
    return brightCerulean;
}

+ (UIColor *)brightGreen {
    UIColor *brightGreen = [UIColor colorWithRed:4.0f/10.0f green:1.0f blue:0.0f alpha:1.0f];
    [brightGreen setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"redComponent"];
    [brightGreen setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [brightGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return brightGreen;
}

+ (UIColor *)brightLavender {
    UIColor *brightLavender = [UIColor colorWithRed:0.75f green:58.0f/100.0f blue:89.0f/100.0f alpha:1.0f];
    [brightLavender setValue:[NSNumber numberWithFloat:0.75f] forKey:@"redComponent"];
    [brightLavender setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"greenComponent"];
    [brightLavender setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"blueComponent"];
    return brightLavender;
}

+ (UIColor *)brightLilac {
    UIColor *brightLilac = [UIColor colorWithRed:85.0f/100.0f green:57.0f/100.0f blue:94.0f/100.0f alpha:1.0f];
    [brightLilac setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"redComponent"];
    [brightLilac setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"greenComponent"];
    [brightLilac setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"blueComponent"];
    return brightLilac;
}

+ (UIColor *)brightMaroon {
    UIColor *brightMaroon = [UIColor colorWithRed:76.0f/100.0f green:13.0f/100.0f blue:28.0f/100.0f alpha:1.0f];
    [brightMaroon setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"redComponent"];
    [brightMaroon setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"greenComponent"];
    [brightMaroon setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"blueComponent"];
    return brightMaroon;
}

+ (UIColor *)brightNavyBlue {
    UIColor *brightNavyBlue = [UIColor colorWithRed:1.0f/10.0f green:45.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
    [brightNavyBlue setValue:[NSNumber numberWithFloat:1.0f/10.0f] forKey:@"redComponent"];
    [brightNavyBlue setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"greenComponent"];
    [brightNavyBlue setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"blueComponent"];
    return brightNavyBlue;
}

+ (UIColor *)brightPink {
    UIColor *brightPink = [UIColor colorWithRed:1.0f green:0.0f blue:0.5f alpha:1.0f];
    [brightPink setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [brightPink setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [brightPink setValue:[NSNumber numberWithFloat:0.5f] forKey:@"blueComponent"];
    return brightPink;
}

+ (UIColor *)brightTurquoise {
    UIColor *brightTurquoise = [UIColor colorWithRed:3.0f/100.0f green:91.0f/100.0f blue:87.0f/100.0f alpha:1.0f];
    [brightTurquoise setValue:[NSNumber numberWithFloat:3.0f/100.0f] forKey:@"redComponent"];
    [brightTurquoise setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"greenComponent"];
    [brightTurquoise setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"blueComponent"];
    return brightTurquoise;
}

+ (UIColor *)brightUbe {
    UIColor *brightUbe = [UIColor colorWithRed:82.0f/100.0f green:62.0f/100.0f blue:91.0f/100.0f alpha:1.0f];
    [brightUbe setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"redComponent"];
    [brightUbe setValue:[NSNumber numberWithFloat:62.0f/100.0f] forKey:@"greenComponent"];
    [brightUbe setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"blueComponent"];
    return brightUbe;
}

+ (UIColor *)brilliantAzure {
    UIColor *brilliantAzure = [UIColor colorWithRed:2.0f/10.0f green:6.0f/10.0f blue:1.0f alpha:1.0f];
    [brilliantAzure setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"redComponent"];
    [brilliantAzure setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [brilliantAzure setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return brilliantAzure;
}

+ (UIColor *)brilliantLavender {
    UIColor *brilliantLavender = [UIColor colorWithRed:96.0f/100.0f green:73.0f/100.0f blue:1.0f alpha:1.0f];
    [brilliantLavender setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"redComponent"];
    [brilliantLavender setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"greenComponent"];
    [brilliantLavender setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return brilliantLavender;
}

+ (UIColor *)brilliantRose {
    UIColor *brilliantRose = [UIColor colorWithRed:1.0f green:0.333f blue:64.0f/100.0f alpha:1.0f];
    [brilliantRose setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [brilliantRose setValue:[NSNumber numberWithFloat:0.333f] forKey:@"greenComponent"];
    [brilliantRose setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"blueComponent"];
    return brilliantRose;
}

+ (UIColor *)brinkPink {
    UIColor *brinkPink = [UIColor colorWithRed:98.0f/100.0f green:38.0f/100.0f blue:0.5f alpha:1.0f];
    [brinkPink setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [brinkPink setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"greenComponent"];
    [brinkPink setValue:[NSNumber numberWithFloat:0.5f] forKey:@"blueComponent"];
    return brinkPink;
}

+ (UIColor *)britishRacingGreen {
    UIColor *britishRacingGreen = [UIColor colorWithRed:0.0f green:26.0f/100.0f blue:15.0f/100.0f alpha:1.0f];
    [britishRacingGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [britishRacingGreen setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"greenComponent"];
    [britishRacingGreen setValue:[NSNumber numberWithFloat:15.0f/100.0f] forKey:@"blueComponent"];
    return britishRacingGreen;
}

+ (UIColor *)bronze {
    UIColor *bronze = [UIColor colorWithRed:8.0f/10.0f green:0.5f blue:2.0f/10.0f alpha:1.0f];
    [bronze setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [bronze setValue:[NSNumber numberWithFloat:0.5f] forKey:@"greenComponent"];
    [bronze setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"blueComponent"];
    return bronze;
}

+ (UIColor *)bronzeYellow {
    UIColor *bronzeYellow = [UIColor colorWithRed:45.0f/100.0f green:44.0f/100.0f blue:0.0f alpha:1.0f];
    [bronzeYellow setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"redComponent"];
    [bronzeYellow setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"greenComponent"];
    [bronzeYellow setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return bronzeYellow;
}

+ (UIColor *)brownTraditional {
    UIColor *brownTraditional = [UIColor colorWithRed:59.0f/100.0f green:29.0f/100.0f blue:0.0f alpha:1.0f];
    [brownTraditional setValue:[NSNumber numberWithFloat:59.0f/100.0f] forKey:@"redComponent"];
    [brownTraditional setValue:[NSNumber numberWithFloat:29.0f/100.0f] forKey:@"greenComponent"];
    [brownTraditional setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return brownTraditional;
}

+ (UIColor *)brownWeb {
    UIColor *brownWeb = [UIColor colorWithRed:65.0f/100.0f green:16.0f/100.0f blue:16.0f/100.0f alpha:1.0f];
    [brownWeb setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"redComponent"];
    [brownWeb setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"greenComponent"];
    [brownWeb setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"blueComponent"];
    return brownWeb;
}

+ (UIColor *)brownNose {
    UIColor *brownNose = [UIColor colorWithRed:42.0f/100.0f green:27.0f/100.0f blue:14.0f/100.0f alpha:1.0f];
    [brownNose setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"redComponent"];
    [brownNose setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"greenComponent"];
    [brownNose setValue:[NSNumber numberWithFloat:14.0f/100.0f] forKey:@"blueComponent"];
    return brownNose;
}

+ (UIColor *)brownYellow {
    UIColor *brownYellow = [UIColor colorWithRed:8.0f/10.0f green:6.0f/10.0f blue:4.0f/10.0f alpha:1.0f];
    [brownYellow setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [brownYellow setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [brownYellow setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"blueComponent"];
    return brownYellow;
}

+ (UIColor *)brunswickGreen {
    UIColor *brunswickGreen = [UIColor colorWithRed:11.0f/100.0f green:3.0f/10.0f blue:24.0f/100.0f alpha:1.0f];
    [brunswickGreen setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"redComponent"];
    [brunswickGreen setValue:[NSNumber numberWithFloat:3.0f/10.0f] forKey:@"greenComponent"];
    [brunswickGreen setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"blueComponent"];
    return brunswickGreen;
}

+ (UIColor *)bubbleGum {
    UIColor *bubbleGum = [UIColor colorWithRed:1.0f green:76.0f/100.0f blue:8.0f/10.0f alpha:1.0f];
    [bubbleGum setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [bubbleGum setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"greenComponent"];
    [bubbleGum setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"blueComponent"];
    return bubbleGum;
}

+ (UIColor *)bubbles {
    UIColor *bubbles = [UIColor colorWithRed:91.0f/100.0f green:1.0f blue:1.0f alpha:1.0f];
    [bubbles setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"redComponent"];
    [bubbles setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [bubbles setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return bubbles;
}

+ (UIColor *)buff {
    UIColor *buff = [UIColor colorWithRed:94.0f/100.0f green:86.0f/100.0f blue:51.0f/100.0f alpha:1.0f];
    [buff setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"redComponent"];
    [buff setValue:[NSNumber numberWithFloat:86.0f/100.0f] forKey:@"greenComponent"];
    [buff setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"blueComponent"];
    return buff;
}

+ (UIColor *)budGreen {
    UIColor *budGreen = [UIColor colorWithRed:48.0f/100.0f green:71.0f/100.0f blue:38.0f/100.0f alpha:1.0f];
    [budGreen setValue:[NSNumber numberWithFloat:48.0f/100.0f] forKey:@"redComponent"];
    [budGreen setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"greenComponent"];
    [budGreen setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"blueComponent"];
    return budGreen;
}

+ (UIColor *)bulgarianRose {
    UIColor *bulgarianRose = [UIColor colorWithRed:28.0f/100.0f green:2.0f/100.0f blue:3.0f/100.0f alpha:1.0f];
    [bulgarianRose setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"redComponent"];
    [bulgarianRose setValue:[NSNumber numberWithFloat:2.0f/100.0f] forKey:@"greenComponent"];
    [bulgarianRose setValue:[NSNumber numberWithFloat:3.0f/100.0f] forKey:@"blueComponent"];
    return bulgarianRose;
}

+ (UIColor *)burgundy {
    UIColor *burgundy = [UIColor colorWithRed:0.5f green:0.0f blue:13.0f/100.0f alpha:1.0f];
    [burgundy setValue:[NSNumber numberWithFloat:0.5f] forKey:@"redComponent"];
    [burgundy setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [burgundy setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"blueComponent"];
    return burgundy;
}

+ (UIColor *)burlywood {
    UIColor *burlywood = [UIColor colorWithRed:87.0f/100.0f green:72.0f/100.0f blue:53.0f/100.0f alpha:1.0f];
    [burlywood setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"redComponent"];
    [burlywood setValue:[NSNumber numberWithFloat:72.0f/100.0f] forKey:@"greenComponent"];
    [burlywood setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"blueComponent"];
    return burlywood;
}

+ (UIColor *)burntOrange {
    UIColor *burntOrange = [UIColor colorWithRed:8.0f/10.0f green:0.333f blue:0.0f alpha:1.0f];
    [burntOrange setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [burntOrange setValue:[NSNumber numberWithFloat:0.333f] forKey:@"greenComponent"];
    [burntOrange setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return burntOrange;
}

+ (UIColor *)burntSienna {
    UIColor *burntSienna = [UIColor colorWithRed:91.0f/100.0f green:45.0f/100.0f blue:32.0f/100.0f alpha:1.0f];
    [burntSienna setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"redComponent"];
    [burntSienna setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"greenComponent"];
    [burntSienna setValue:[NSNumber numberWithFloat:32.0f/100.0f] forKey:@"blueComponent"];
    return burntSienna;
}

+ (UIColor *)burntUmber {
    UIColor *burntUmber = [UIColor colorWithRed:54.0f/100.0f green:2.0f/10.0f blue:14.0f/100.0f alpha:1.0f];
    [burntUmber setValue:[NSNumber numberWithFloat:54.0f/100.0f] forKey:@"redComponent"];
    [burntUmber setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"greenComponent"];
    [burntUmber setValue:[NSNumber numberWithFloat:14.0f/100.0f] forKey:@"blueComponent"];
    return burntUmber;
}

+ (UIColor *)byzantine {
    UIColor *byzantine = [UIColor colorWithRed:74.0f/100.0f green:2.0f/10.0f blue:64.0f/100.0f alpha:1.0f];
    [byzantine setValue:[NSNumber numberWithFloat:74.0f/100.0f] forKey:@"redComponent"];
    [byzantine setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"greenComponent"];
    [byzantine setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"blueComponent"];
    return byzantine;
}

+ (UIColor *)byzantium {
    UIColor *byzantium = [UIColor colorWithRed:44.0f/100.0f green:16.0f/100.0f blue:39.0f/100.0f alpha:1.0f];
    [byzantium setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"redComponent"];
    [byzantium setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"greenComponent"];
    [byzantium setValue:[NSNumber numberWithFloat:39.0f/100.0f] forKey:@"blueComponent"];
    return byzantium;
}

+ (UIColor *)cadet {
    UIColor *cadet = [UIColor colorWithRed:0.333f green:41.0f/100.0f blue:45.0f/100.0f alpha:1.0f];
    [cadet setValue:[NSNumber numberWithFloat:0.333f] forKey:@"redComponent"];
    [cadet setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"greenComponent"];
    [cadet setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"blueComponent"];
    return cadet;
}

+ (UIColor *)cadetBlue {
    UIColor *cadetBlue = [UIColor colorWithRed:37.0f/100.0f green:62.0f/100.0f blue:63.0f/100.0f alpha:1.0f];
    [cadetBlue setValue:[NSNumber numberWithFloat:37.0f/100.0f] forKey:@"redComponent"];
    [cadetBlue setValue:[NSNumber numberWithFloat:62.0f/100.0f] forKey:@"greenComponent"];
    [cadetBlue setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"blueComponent"];
    return cadetBlue;
}

+ (UIColor *)cadetGrey {
    UIColor *cadetGrey = [UIColor colorWithRed:57.0f/100.0f green:64.0f/100.0f blue:69.0f/100.0f alpha:1.0f];
    [cadetGrey setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"redComponent"];
    [cadetGrey setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"greenComponent"];
    [cadetGrey setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"blueComponent"];
    return cadetGrey;
}

+ (UIColor *)cadmiumGreen {
    UIColor *cadmiumGreen = [UIColor colorWithRed:0.0f green:42.0f/100.0f blue:24.0f/100.0f alpha:1.0f];
    [cadmiumGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [cadmiumGreen setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"greenComponent"];
    [cadmiumGreen setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"blueComponent"];
    return cadmiumGreen;
}

+ (UIColor *)cadmiumOrange {
    UIColor *cadmiumOrange = [UIColor colorWithRed:93.0f/100.0f green:53.0f/100.0f blue:18.0f/100.0f alpha:1.0f];
    [cadmiumOrange setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"redComponent"];
    [cadmiumOrange setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"greenComponent"];
    [cadmiumOrange setValue:[NSNumber numberWithFloat:18.0f/100.0f] forKey:@"blueComponent"];
    return cadmiumOrange;
}

+ (UIColor *)cadmiumRed {
    UIColor *cadmiumRed = [UIColor colorWithRed:89.0f/100.0f green:0.0f blue:13.0f/100.0f alpha:1.0f];
    [cadmiumRed setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"redComponent"];
    [cadmiumRed setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [cadmiumRed setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"blueComponent"];
    return cadmiumRed;
}

+ (UIColor *)cadmiumYellow {
    UIColor *cadmiumYellow = [UIColor colorWithRed:1.0f green:96.0f/100.0f blue:0.0f alpha:1.0f];
    [cadmiumYellow setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [cadmiumYellow setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"greenComponent"];
    [cadmiumYellow setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return cadmiumYellow;
}

+ (UIColor *)caféAuLait {
    UIColor *caféAuLait = [UIColor colorWithRed:65.0f/100.0f green:48.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
    [caféAuLait setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"redComponent"];
    [caféAuLait setValue:[NSNumber numberWithFloat:48.0f/100.0f] forKey:@"greenComponent"];
    [caféAuLait setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"blueComponent"];
    return caféAuLait;
}

+ (UIColor *)caféNoir {
    UIColor *caféNoir = [UIColor colorWithRed:29.0f/100.0f green:21.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
    [caféNoir setValue:[NSNumber numberWithFloat:29.0f/100.0f] forKey:@"redComponent"];
    [caféNoir setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"greenComponent"];
    [caféNoir setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"blueComponent"];
    return caféNoir;
}

+ (UIColor *)calPolyGreen {
    UIColor *calPolyGreen = [UIColor colorWithRed:12.0f/100.0f green:3.0f/10.0f blue:0.1667f alpha:1.0f];
    [calPolyGreen setValue:[NSNumber numberWithFloat:12.0f/100.0f] forKey:@"redComponent"];
    [calPolyGreen setValue:[NSNumber numberWithFloat:3.0f/10.0f] forKey:@"greenComponent"];
    [calPolyGreen setValue:[NSNumber numberWithFloat:0.1667f] forKey:@"blueComponent"];
    return calPolyGreen;
}

+ (UIColor *)cambridgeBlue {
    UIColor *cambridgeBlue = [UIColor colorWithRed:64.0f/100.0f green:76.0f/100.0f blue:68.0f/100.0f alpha:1.0f];
    [cambridgeBlue setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"redComponent"];
    [cambridgeBlue setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"greenComponent"];
    [cambridgeBlue setValue:[NSNumber numberWithFloat:68.0f/100.0f] forKey:@"blueComponent"];
    return cambridgeBlue;
}

+ (UIColor *)camel {
    UIColor *camel = [UIColor colorWithRed:76.0f/100.0f green:6.0f/10.0f blue:42.0f/100.0f alpha:1.0f];
    [camel setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"redComponent"];
    [camel setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [camel setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"blueComponent"];
    return camel;
}

+ (UIColor *)cameoPink {
    UIColor *cameoPink = [UIColor colorWithRed:94.0f/100.0f green:73.0f/100.0f blue:8.0f/10.0f alpha:1.0f];
    [cameoPink setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"redComponent"];
    [cameoPink setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"greenComponent"];
    [cameoPink setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"blueComponent"];
    return cameoPink;
}

+ (UIColor *)camouflageGreen {
    UIColor *camouflageGreen = [UIColor colorWithRed:47.0f/100.0f green:53.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
    [camouflageGreen setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"redComponent"];
    [camouflageGreen setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"greenComponent"];
    [camouflageGreen setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"blueComponent"];
    return camouflageGreen;
}

+ (UIColor *)canaryYellow {
    UIColor *canaryYellow = [UIColor colorWithRed:1.0f green:94.0f/100.0f blue:0.0f alpha:1.0f];
    [canaryYellow setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [canaryYellow setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"greenComponent"];
    [canaryYellow setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return canaryYellow;
}

+ (UIColor *)candyAppleRed {
    UIColor *candyAppleRed = [UIColor colorWithRed:1.0f green:3.0f/100.0f blue:0.0f alpha:1.0f];
    [candyAppleRed setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [candyAppleRed setValue:[NSNumber numberWithFloat:3.0f/100.0f] forKey:@"greenComponent"];
    [candyAppleRed setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return candyAppleRed;
}

+ (UIColor *)candyPink {
    UIColor *candyPink = [UIColor colorWithRed:89.0f/100.0f green:44.0f/100.0f blue:48.0f/100.0f alpha:1.0f];
    [candyPink setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"redComponent"];
    [candyPink setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"greenComponent"];
    [candyPink setValue:[NSNumber numberWithFloat:48.0f/100.0f] forKey:@"blueComponent"];
    return candyPink;
}

+ (UIColor *)capri {
    UIColor *capri = [UIColor colorWithRed:0.0f green:0.75f blue:1.0f alpha:1.0f];
    [capri setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [capri setValue:[NSNumber numberWithFloat:0.75f] forKey:@"greenComponent"];
    [capri setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return capri;
}

+ (UIColor *)caputMortuum {
    UIColor *caputMortuum = [UIColor colorWithRed:35.0f/100.0f green:15.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
    [caputMortuum setValue:[NSNumber numberWithFloat:35.0f/100.0f] forKey:@"redComponent"];
    [caputMortuum setValue:[NSNumber numberWithFloat:15.0f/100.0f] forKey:@"greenComponent"];
    [caputMortuum setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"blueComponent"];
    return caputMortuum;
}

+ (UIColor *)cardinal {
    UIColor *cardinal = [UIColor colorWithRed:77.0f/100.0f green:12.0f/100.0f blue:23.0f/100.0f alpha:1.0f];
    [cardinal setValue:[NSNumber numberWithFloat:77.0f/100.0f] forKey:@"redComponent"];
    [cardinal setValue:[NSNumber numberWithFloat:12.0f/100.0f] forKey:@"greenComponent"];
    [cardinal setValue:[NSNumber numberWithFloat:23.0f/100.0f] forKey:@"blueComponent"];
    return cardinal;
}

+ (UIColor *)caribbeanGreen {
    UIColor *caribbeanGreen = [UIColor colorWithRed:0.0f green:8.0f/10.0f blue:6.0f/10.0f alpha:1.0f];
    [caribbeanGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [caribbeanGreen setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"greenComponent"];
    [caribbeanGreen setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"blueComponent"];
    return caribbeanGreen;
}

+ (UIColor *)carmine {
    UIColor *carmine = [UIColor colorWithRed:59.0f/100.0f green:0.0f blue:9.0f/100.0f alpha:1.0f];
    [carmine setValue:[NSNumber numberWithFloat:59.0f/100.0f] forKey:@"redComponent"];
    [carmine setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [carmine setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"blueComponent"];
    return carmine;
}

+ (UIColor *)carmineMP {
    UIColor *carmineMP = [UIColor colorWithRed:84.0f/100.0f green:0.0f blue:0.25f alpha:1.0f];
    [carmineMP setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"redComponent"];
    [carmineMP setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [carmineMP setValue:[NSNumber numberWithFloat:0.25f] forKey:@"blueComponent"];
    return carmineMP;
}

+ (UIColor *)carminePink {
    UIColor *carminePink = [UIColor colorWithRed:92.0f/100.0f green:3.0f/10.0f blue:26.0f/100.0f alpha:1.0f];
    [carminePink setValue:[NSNumber numberWithFloat:92.0f/100.0f] forKey:@"redComponent"];
    [carminePink setValue:[NSNumber numberWithFloat:3.0f/10.0f] forKey:@"greenComponent"];
    [carminePink setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"blueComponent"];
    return carminePink;
}

+ (UIColor *)carmineRed {
    UIColor *carmineRed = [UIColor colorWithRed:1.0f green:0.0f blue:22.0f/100.0f alpha:1.0f];
    [carmineRed setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [carmineRed setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [carmineRed setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"blueComponent"];
    return carmineRed;
}

+ (UIColor *)carnationPink {
    UIColor *carnationPink = [UIColor colorWithRed:1.0f green:65.0f/100.0f blue:79.0f/100.0f alpha:1.0f];
    [carnationPink setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [carnationPink setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"greenComponent"];
    [carnationPink setValue:[NSNumber numberWithFloat:79.0f/100.0f] forKey:@"blueComponent"];
    return carnationPink;
}

+ (UIColor *)carnelian {
    UIColor *carnelian = [UIColor colorWithRed:7.0f/10.0f green:11.0f/100.0f blue:11.0f/100.0f alpha:1.0f];
    [carnelian setValue:[NSNumber numberWithFloat:7.0f/10.0f] forKey:@"redComponent"];
    [carnelian setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"greenComponent"];
    [carnelian setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"blueComponent"];
    return carnelian;
}

+ (UIColor *)carolinaBlue {
    UIColor *carolinaBlue = [UIColor colorWithRed:34.0f/100.0f green:63.0f/100.0f blue:83.0f/100.0f alpha:1.0f];
    [carolinaBlue setValue:[NSNumber numberWithFloat:34.0f/100.0f] forKey:@"redComponent"];
    [carolinaBlue setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"greenComponent"];
    [carolinaBlue setValue:[NSNumber numberWithFloat:83.0f/100.0f] forKey:@"blueComponent"];
    return carolinaBlue;
}

+ (UIColor *)carrotOrange {
    UIColor *carrotOrange = [UIColor colorWithRed:93.0f/100.0f green:57.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
    [carrotOrange setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"redComponent"];
    [carrotOrange setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"greenComponent"];
    [carrotOrange setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"blueComponent"];
    return carrotOrange;
}

+ (UIColor *)castletonGreen {
    UIColor *castletonGreen = [UIColor colorWithRed:0.0f green:34.0f/100.0f blue:0.25f alpha:1.0f];
    [castletonGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [castletonGreen setValue:[NSNumber numberWithFloat:34.0f/100.0f] forKey:@"greenComponent"];
    [castletonGreen setValue:[NSNumber numberWithFloat:0.25f] forKey:@"blueComponent"];
    return castletonGreen;
}

+ (UIColor *)catalinaBlue {
    UIColor *catalinaBlue = [UIColor colorWithRed:2.0f/100.0f green:16.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
    [catalinaBlue setValue:[NSNumber numberWithFloat:2.0f/100.0f] forKey:@"redComponent"];
    [catalinaBlue setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"greenComponent"];
    [catalinaBlue setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"blueComponent"];
    return catalinaBlue;
}

+ (UIColor *)catawba {
    UIColor *catawba = [UIColor colorWithRed:44.0f/100.0f green:21.0f/100.0f blue:26.0f/100.0f alpha:1.0f];
    [catawba setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"redComponent"];
    [catawba setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"greenComponent"];
    [catawba setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"blueComponent"];
    return catawba;
}

+ (UIColor *)cedarChest {
    UIColor *cedarChest = [UIColor colorWithRed:79.0f/100.0f green:35.0f/100.0f blue:29.0f/100.0f alpha:1.0f];
    [cedarChest setValue:[NSNumber numberWithFloat:79.0f/100.0f] forKey:@"redComponent"];
    [cedarChest setValue:[NSNumber numberWithFloat:35.0f/100.0f] forKey:@"greenComponent"];
    [cedarChest setValue:[NSNumber numberWithFloat:29.0f/100.0f] forKey:@"blueComponent"];
    return cedarChest;
}

+ (UIColor *)ceil {
    UIColor *ceil = [UIColor colorWithRed:57.0f/100.0f green:63.0f/100.0f blue:81.0f/100.0f alpha:1.0f];
    [ceil setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"redComponent"];
    [ceil setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"greenComponent"];
    [ceil setValue:[NSNumber numberWithFloat:81.0f/100.0f] forKey:@"blueComponent"];
    return ceil;
}

+ (UIColor *)celadon {
    UIColor *celadon = [UIColor colorWithRed:0.667f green:88.0f/100.0f blue:69.0f/100.0f alpha:1.0f];
    [celadon setValue:[NSNumber numberWithFloat:0.667f] forKey:@"redComponent"];
    [celadon setValue:[NSNumber numberWithFloat:88.0f/100.0f] forKey:@"greenComponent"];
    [celadon setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"blueComponent"];
    return celadon;
}

+ (UIColor *)celadonBlue {
    UIColor *celadonBlue = [UIColor colorWithRed:0.0f green:48.0f/100.0f blue:65.0f/100.0f alpha:1.0f];
    [celadonBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [celadonBlue setValue:[NSNumber numberWithFloat:48.0f/100.0f] forKey:@"greenComponent"];
    [celadonBlue setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"blueComponent"];
    return celadonBlue;
}

+ (UIColor *)celadonGreen {
    UIColor *celadonGreen = [UIColor colorWithRed:18.0f/100.0f green:52.0f/100.0f blue:49.0f/100.0f alpha:1.0f];
    [celadonGreen setValue:[NSNumber numberWithFloat:18.0f/100.0f] forKey:@"redComponent"];
    [celadonGreen setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"greenComponent"];
    [celadonGreen setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"blueComponent"];
    return celadonGreen;
}

+ (UIColor *)celeste {
    UIColor *celeste = [UIColor colorWithRed:7.0f/10.0f green:1.0f blue:1.0f alpha:1.0f];
    [celeste setValue:[NSNumber numberWithFloat:7.0f/10.0f] forKey:@"redComponent"];
    [celeste setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [celeste setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return celeste;
}

+ (UIColor *)celestialBlue {
    UIColor *celestialBlue = [UIColor colorWithRed:29.0f/100.0f green:59.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
    [celestialBlue setValue:[NSNumber numberWithFloat:29.0f/100.0f] forKey:@"redComponent"];
    [celestialBlue setValue:[NSNumber numberWithFloat:59.0f/100.0f] forKey:@"greenComponent"];
    [celestialBlue setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"blueComponent"];
    return celestialBlue;
}

+ (UIColor *)cerise {
    UIColor *cerise = [UIColor colorWithRed:87.0f/100.0f green:19.0f/100.0f blue:39.0f/100.0f alpha:1.0f];
    [cerise setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"redComponent"];
    [cerise setValue:[NSNumber numberWithFloat:19.0f/100.0f] forKey:@"greenComponent"];
    [cerise setValue:[NSNumber numberWithFloat:39.0f/100.0f] forKey:@"blueComponent"];
    return cerise;
}

+ (UIColor *)cerisePink {
    UIColor *cerisePink = [UIColor colorWithRed:93.0f/100.0f green:23.0f/100.0f blue:51.0f/100.0f alpha:1.0f];
    [cerisePink setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"redComponent"];
    [cerisePink setValue:[NSNumber numberWithFloat:23.0f/100.0f] forKey:@"greenComponent"];
    [cerisePink setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"blueComponent"];
    return cerisePink;
}

+ (UIColor *)cerulean {
    UIColor *cerulean = [UIColor colorWithRed:0.0f green:48.0f/100.0f blue:65.0f/100.0f alpha:1.0f];
    [cerulean setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [cerulean setValue:[NSNumber numberWithFloat:48.0f/100.0f] forKey:@"greenComponent"];
    [cerulean setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"blueComponent"];
    return cerulean;
}

+ (UIColor *)ceruleanBlue {
    UIColor *ceruleanBlue = [UIColor colorWithRed:16.0f/100.0f green:32.0f/100.0f blue:0.75f alpha:1.0f];
    [ceruleanBlue setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"redComponent"];
    [ceruleanBlue setValue:[NSNumber numberWithFloat:32.0f/100.0f] forKey:@"greenComponent"];
    [ceruleanBlue setValue:[NSNumber numberWithFloat:0.75f] forKey:@"blueComponent"];
    return ceruleanBlue;
}

+ (UIColor *)ceruleanFrost {
    UIColor *ceruleanFrost = [UIColor colorWithRed:43.0f/100.0f green:61.0f/100.0f blue:76.0f/100.0f alpha:1.0f];
    [ceruleanFrost setValue:[NSNumber numberWithFloat:43.0f/100.0f] forKey:@"redComponent"];
    [ceruleanFrost setValue:[NSNumber numberWithFloat:61.0f/100.0f] forKey:@"greenComponent"];
    [ceruleanFrost setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"blueComponent"];
    return ceruleanFrost;
}

+ (UIColor *)cGBlue {
    UIColor *cGBlue = [UIColor colorWithRed:0.0f green:48.0f/100.0f blue:65.0f/100.0f alpha:1.0f];
    [cGBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [cGBlue setValue:[NSNumber numberWithFloat:48.0f/100.0f] forKey:@"greenComponent"];
    [cGBlue setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"blueComponent"];
    return cGBlue;
}

+ (UIColor *)cGRed {
    UIColor *cGRed = [UIColor colorWithRed:88.0f/100.0f green:24.0f/100.0f blue:19.0f/100.0f alpha:1.0f];
    [cGRed setValue:[NSNumber numberWithFloat:88.0f/100.0f] forKey:@"redComponent"];
    [cGRed setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"greenComponent"];
    [cGRed setValue:[NSNumber numberWithFloat:19.0f/100.0f] forKey:@"blueComponent"];
    return cGRed;
}

+ (UIColor *)chamoisee {
    UIColor *chamoisee = [UIColor colorWithRed:63.0f/100.0f green:47.0f/100.0f blue:35.0f/100.0f alpha:1.0f];
    [chamoisee setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"redComponent"];
    [chamoisee setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"greenComponent"];
    [chamoisee setValue:[NSNumber numberWithFloat:35.0f/100.0f] forKey:@"blueComponent"];
    return chamoisee;
}

+ (UIColor *)champagne {
    UIColor *champagne = [UIColor colorWithRed:97.0f/100.0f green:91.0f/100.0f blue:81.0f/100.0f alpha:1.0f];
    [champagne setValue:[NSNumber numberWithFloat:97.0f/100.0f] forKey:@"redComponent"];
    [champagne setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"greenComponent"];
    [champagne setValue:[NSNumber numberWithFloat:81.0f/100.0f] forKey:@"blueComponent"];
    return champagne;
}

+ (UIColor *)charcoal {
    UIColor *charcoal = [UIColor colorWithRed:21.0f/100.0f green:27.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
    [charcoal setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"redComponent"];
    [charcoal setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"greenComponent"];
    [charcoal setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"blueComponent"];
    return charcoal;
}

+ (UIColor *)charlestonGreen {
    UIColor *charlestonGreen = [UIColor colorWithRed:14.0f/100.0f green:0.1667f blue:0.1667f alpha:1.0f];
    [charlestonGreen setValue:[NSNumber numberWithFloat:14.0f/100.0f] forKey:@"redComponent"];
    [charlestonGreen setValue:[NSNumber numberWithFloat:0.1667f] forKey:@"greenComponent"];
    [charlestonGreen setValue:[NSNumber numberWithFloat:0.1667f] forKey:@"blueComponent"];
    return charlestonGreen;
}

+ (UIColor *)charmPink {
    UIColor *charmPink = [UIColor colorWithRed:9.0f/10.0f green:56.0f/100.0f blue:0.667f alpha:1.0f];
    [charmPink setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"redComponent"];
    [charmPink setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"greenComponent"];
    [charmPink setValue:[NSNumber numberWithFloat:0.667f] forKey:@"blueComponent"];
    return charmPink;
}

+ (UIColor *)chartreuseTraditional {
    UIColor *chartreuseTraditional = [UIColor colorWithRed:87.0f/100.0f green:1.0f blue:0.0f alpha:1.0f];
    [chartreuseTraditional setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"redComponent"];
    [chartreuseTraditional setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [chartreuseTraditional setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return chartreuseTraditional;
}

+ (UIColor *)chartreuseWeb {
    UIColor *chartreuseWeb = [UIColor colorWithRed:0.5f green:1.0f blue:0.0f alpha:1.0f];
    [chartreuseWeb setValue:[NSNumber numberWithFloat:0.5f] forKey:@"redComponent"];
    [chartreuseWeb setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [chartreuseWeb setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return chartreuseWeb;
}

+ (UIColor *)cherry {
    UIColor *cherry = [UIColor colorWithRed:87.0f/100.0f green:19.0f/100.0f blue:39.0f/100.0f alpha:1.0f];
    [cherry setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"redComponent"];
    [cherry setValue:[NSNumber numberWithFloat:19.0f/100.0f] forKey:@"greenComponent"];
    [cherry setValue:[NSNumber numberWithFloat:39.0f/100.0f] forKey:@"blueComponent"];
    return cherry;
}

+ (UIColor *)cherryBlossomPink {
    UIColor *cherryBlossomPink = [UIColor colorWithRed:1.0f green:72.0f/100.0f blue:77.0f/100.0f alpha:1.0f];
    [cherryBlossomPink setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [cherryBlossomPink setValue:[NSNumber numberWithFloat:72.0f/100.0f] forKey:@"greenComponent"];
    [cherryBlossomPink setValue:[NSNumber numberWithFloat:77.0f/100.0f] forKey:@"blueComponent"];
    return cherryBlossomPink;
}

+ (UIColor *)chestnut {
    UIColor *chestnut = [UIColor colorWithRed:58.0f/100.0f green:27.0f/100.0f blue:21.0f/100.0f alpha:1.0f];
    [chestnut setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"redComponent"];
    [chestnut setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"greenComponent"];
    [chestnut setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"blueComponent"];
    return chestnut;
}

+ (UIColor *)chinaPink {
    UIColor *chinaPink = [UIColor colorWithRed:87.0f/100.0f green:44.0f/100.0f blue:63.0f/100.0f alpha:1.0f];
    [chinaPink setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"redComponent"];
    [chinaPink setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"greenComponent"];
    [chinaPink setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"blueComponent"];
    return chinaPink;
}

+ (UIColor *)chinaRose {
    UIColor *chinaRose = [UIColor colorWithRed:66.0f/100.0f green:32.0f/100.0f blue:43.0f/100.0f alpha:1.0f];
    [chinaRose setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"redComponent"];
    [chinaRose setValue:[NSNumber numberWithFloat:32.0f/100.0f] forKey:@"greenComponent"];
    [chinaRose setValue:[NSNumber numberWithFloat:43.0f/100.0f] forKey:@"blueComponent"];
    return chinaRose;
}

+ (UIColor *)chineseRed {
    UIColor *chineseRed = [UIColor colorWithRed:0.667f green:22.0f/100.0f blue:12.0f/100.0f alpha:1.0f];
    [chineseRed setValue:[NSNumber numberWithFloat:0.667f] forKey:@"redComponent"];
    [chineseRed setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"greenComponent"];
    [chineseRed setValue:[NSNumber numberWithFloat:12.0f/100.0f] forKey:@"blueComponent"];
    return chineseRed;
}

+ (UIColor *)chineseViolet {
    UIColor *chineseViolet = [UIColor colorWithRed:52.0f/100.0f green:38.0f/100.0f blue:53.0f/100.0f alpha:1.0f];
    [chineseViolet setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"redComponent"];
    [chineseViolet setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"greenComponent"];
    [chineseViolet setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"blueComponent"];
    return chineseViolet;
}

+ (UIColor *)chocolateTraditional {
    UIColor *chocolateTraditional = [UIColor colorWithRed:48.0f/100.0f green:0.25f blue:0.0f alpha:1.0f];
    [chocolateTraditional setValue:[NSNumber numberWithFloat:48.0f/100.0f] forKey:@"redComponent"];
    [chocolateTraditional setValue:[NSNumber numberWithFloat:0.25f] forKey:@"greenComponent"];
    [chocolateTraditional setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return chocolateTraditional;
}

+ (UIColor *)chocolateWeb {
    UIColor *chocolateWeb = [UIColor colorWithRed:82.0f/100.0f green:41.0f/100.0f blue:12.0f/100.0f alpha:1.0f];
    [chocolateWeb setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"redComponent"];
    [chocolateWeb setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"greenComponent"];
    [chocolateWeb setValue:[NSNumber numberWithFloat:12.0f/100.0f] forKey:@"blueComponent"];
    return chocolateWeb;
}

+ (UIColor *)chromeYellow {
    UIColor *chromeYellow = [UIColor colorWithRed:1.0f green:65.0f/100.0f blue:0.0f alpha:1.0f];
    [chromeYellow setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [chromeYellow setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"greenComponent"];
    [chromeYellow setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return chromeYellow;
}

+ (UIColor *)cinereous {
    UIColor *cinereous = [UIColor colorWithRed:6.0f/10.0f green:51.0f/100.0f blue:48.0f/100.0f alpha:1.0f];
    [cinereous setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"redComponent"];
    [cinereous setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"greenComponent"];
    [cinereous setValue:[NSNumber numberWithFloat:48.0f/100.0f] forKey:@"blueComponent"];
    return cinereous;
}

+ (UIColor *)cinnabar {
    UIColor *cinnabar = [UIColor colorWithRed:89.0f/100.0f green:26.0f/100.0f blue:2.0f/10.0f alpha:1.0f];
    [cinnabar setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"redComponent"];
    [cinnabar setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"greenComponent"];
    [cinnabar setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"blueComponent"];
    return cinnabar;
}

+ (UIColor *)cinnamonCitationNeeded {
    UIColor *cinnamonCitationNeeded = [UIColor colorWithRed:82.0f/100.0f green:41.0f/100.0f blue:12.0f/100.0f alpha:1.0f];
    [cinnamonCitationNeeded setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"redComponent"];
    [cinnamonCitationNeeded setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"greenComponent"];
    [cinnamonCitationNeeded setValue:[NSNumber numberWithFloat:12.0f/100.0f] forKey:@"blueComponent"];
    return cinnamonCitationNeeded;
}

+ (UIColor *)citrine {
    UIColor *citrine = [UIColor colorWithRed:89.0f/100.0f green:82.0f/100.0f blue:4.0f/100.0f alpha:1.0f];
    [citrine setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"redComponent"];
    [citrine setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"greenComponent"];
    [citrine setValue:[NSNumber numberWithFloat:4.0f/100.0f] forKey:@"blueComponent"];
    return citrine;
}

+ (UIColor *)citron {
    UIColor *citron = [UIColor colorWithRed:62.0f/100.0f green:66.0f/100.0f blue:12.0f/100.0f alpha:1.0f];
    [citron setValue:[NSNumber numberWithFloat:62.0f/100.0f] forKey:@"redComponent"];
    [citron setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"greenComponent"];
    [citron setValue:[NSNumber numberWithFloat:12.0f/100.0f] forKey:@"blueComponent"];
    return citron;
}

+ (UIColor *)claret {
    UIColor *claret = [UIColor colorWithRed:0.5f green:9.0f/100.0f blue:2.0f/10.0f alpha:1.0f];
    [claret setValue:[NSNumber numberWithFloat:0.5f] forKey:@"redComponent"];
    [claret setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"greenComponent"];
    [claret setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"blueComponent"];
    return claret;
}

+ (UIColor *)classicRose {
    UIColor *classicRose = [UIColor colorWithRed:98.0f/100.0f green:8.0f/10.0f blue:91.0f/100.0f alpha:1.0f];
    [classicRose setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [classicRose setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"greenComponent"];
    [classicRose setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"blueComponent"];
    return classicRose;
}

+ (UIColor *)cobaltBlue {
    UIColor *cobaltBlue = [UIColor colorWithRed:0.0f green:28.0f/100.0f blue:0.667f alpha:1.0f];
    [cobaltBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [cobaltBlue setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"greenComponent"];
    [cobaltBlue setValue:[NSNumber numberWithFloat:0.667f] forKey:@"blueComponent"];
    return cobaltBlue;
}

+ (UIColor *)cocoaBrown {
    UIColor *cocoaBrown = [UIColor colorWithRed:82.0f/100.0f green:41.0f/100.0f blue:12.0f/100.0f alpha:1.0f];
    [cocoaBrown setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"redComponent"];
    [cocoaBrown setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"greenComponent"];
    [cocoaBrown setValue:[NSNumber numberWithFloat:12.0f/100.0f] forKey:@"blueComponent"];
    return cocoaBrown;
}

+ (UIColor *)coconut {
    UIColor *coconut = [UIColor colorWithRed:59.0f/100.0f green:35.0f/100.0f blue:24.0f/100.0f alpha:1.0f];
    [coconut setValue:[NSNumber numberWithFloat:59.0f/100.0f] forKey:@"redComponent"];
    [coconut setValue:[NSNumber numberWithFloat:35.0f/100.0f] forKey:@"greenComponent"];
    [coconut setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"blueComponent"];
    return coconut;
}

+ (UIColor *)coffee {
    UIColor *coffee = [UIColor colorWithRed:44.0f/100.0f green:31.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
    [coffee setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"redComponent"];
    [coffee setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"greenComponent"];
    [coffee setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"blueComponent"];
    return coffee;
}

+ (UIColor *)columbiaBlue {
    UIColor *columbiaBlue = [UIColor colorWithRed:77.0f/100.0f green:85.0f/100.0f blue:89.0f/100.0f alpha:1.0f];
    [columbiaBlue setValue:[NSNumber numberWithFloat:77.0f/100.0f] forKey:@"redComponent"];
    [columbiaBlue setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"greenComponent"];
    [columbiaBlue setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"blueComponent"];
    return columbiaBlue;
}

+ (UIColor *)congoPink {
    UIColor *congoPink = [UIColor colorWithRed:97.0f/100.0f green:51.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
    [congoPink setValue:[NSNumber numberWithFloat:97.0f/100.0f] forKey:@"redComponent"];
    [congoPink setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"greenComponent"];
    [congoPink setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"blueComponent"];
    return congoPink;
}

+ (UIColor *)coolBlack {
    UIColor *coolBlack = [UIColor colorWithRed:0.0f green:18.0f/100.0f blue:39.0f/100.0f alpha:1.0f];
    [coolBlack setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [coolBlack setValue:[NSNumber numberWithFloat:18.0f/100.0f] forKey:@"greenComponent"];
    [coolBlack setValue:[NSNumber numberWithFloat:39.0f/100.0f] forKey:@"blueComponent"];
    return coolBlack;
}

+ (UIColor *)coolGrey {
    UIColor *coolGrey = [UIColor colorWithRed:55.0f/100.0f green:57.0f/100.0f blue:0.667f alpha:1.0f];
    [coolGrey setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"redComponent"];
    [coolGrey setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"greenComponent"];
    [coolGrey setValue:[NSNumber numberWithFloat:0.667f] forKey:@"blueComponent"];
    return coolGrey;
}

+ (UIColor *)copper {
    UIColor *copper = [UIColor colorWithRed:72.0f/100.0f green:45.0f/100.0f blue:2.0f/10.0f alpha:1.0f];
    [copper setValue:[NSNumber numberWithFloat:72.0f/100.0f] forKey:@"redComponent"];
    [copper setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"greenComponent"];
    [copper setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"blueComponent"];
    return copper;
}

+ (UIColor *)copperCrayola {
    UIColor *copperCrayola = [UIColor colorWithRed:85.0f/100.0f green:54.0f/100.0f blue:4.0f/10.0f alpha:1.0f];
    [copperCrayola setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"redComponent"];
    [copperCrayola setValue:[NSNumber numberWithFloat:54.0f/100.0f] forKey:@"greenComponent"];
    [copperCrayola setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"blueComponent"];
    return copperCrayola;
}

+ (UIColor *)copperPenny {
    UIColor *copperPenny = [UIColor colorWithRed:68.0f/100.0f green:44.0f/100.0f blue:41.0f/100.0f alpha:1.0f];
    [copperPenny setValue:[NSNumber numberWithFloat:68.0f/100.0f] forKey:@"redComponent"];
    [copperPenny setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"greenComponent"];
    [copperPenny setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"blueComponent"];
    return copperPenny;
}

+ (UIColor *)copperRed {
    UIColor *copperRed = [UIColor colorWithRed:8.0f/10.0f green:43.0f/100.0f blue:32.0f/100.0f alpha:1.0f];
    [copperRed setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [copperRed setValue:[NSNumber numberWithFloat:43.0f/100.0f] forKey:@"greenComponent"];
    [copperRed setValue:[NSNumber numberWithFloat:32.0f/100.0f] forKey:@"blueComponent"];
    return copperRed;
}

+ (UIColor *)copperRose {
    UIColor *copperRose = [UIColor colorWithRed:6.0f/10.0f green:4.0f/10.0f blue:4.0f/10.0f alpha:1.0f];
    [copperRose setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"redComponent"];
    [copperRose setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"greenComponent"];
    [copperRose setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"blueComponent"];
    return copperRose;
}

+ (UIColor *)coquelicot {
    UIColor *coquelicot = [UIColor colorWithRed:1.0f green:22.0f/100.0f blue:0.0f alpha:1.0f];
    [coquelicot setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [coquelicot setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"greenComponent"];
    [coquelicot setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return coquelicot;
}

+ (UIColor *)coral {
    UIColor *coral = [UIColor colorWithRed:1.0f green:0.5f blue:31.0f/100.0f alpha:1.0f];
    [coral setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [coral setValue:[NSNumber numberWithFloat:0.5f] forKey:@"greenComponent"];
    [coral setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"blueComponent"];
    return coral;
}

+ (UIColor *)coralPink {
    UIColor *coralPink = [UIColor colorWithRed:97.0f/100.0f green:51.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
    [coralPink setValue:[NSNumber numberWithFloat:97.0f/100.0f] forKey:@"redComponent"];
    [coralPink setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"greenComponent"];
    [coralPink setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"blueComponent"];
    return coralPink;
}

+ (UIColor *)coralRed {
    UIColor *coralRed = [UIColor colorWithRed:1.0f green:0.25f blue:0.25f alpha:1.0f];
    [coralRed setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [coralRed setValue:[NSNumber numberWithFloat:0.25f] forKey:@"greenComponent"];
    [coralRed setValue:[NSNumber numberWithFloat:0.25f] forKey:@"blueComponent"];
    return coralRed;
}

+ (UIColor *)cordovan {
    UIColor *cordovan = [UIColor colorWithRed:54.0f/100.0f green:0.25f blue:27.0f/100.0f alpha:1.0f];
    [cordovan setValue:[NSNumber numberWithFloat:54.0f/100.0f] forKey:@"redComponent"];
    [cordovan setValue:[NSNumber numberWithFloat:0.25f] forKey:@"greenComponent"];
    [cordovan setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"blueComponent"];
    return cordovan;
}

+ (UIColor *)corn {
    UIColor *corn = [UIColor colorWithRed:98.0f/100.0f green:93.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
    [corn setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [corn setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"greenComponent"];
    [corn setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"blueComponent"];
    return corn;
}

+ (UIColor *)cornellRed {
    UIColor *cornellRed = [UIColor colorWithRed:7.0f/10.0f green:11.0f/100.0f blue:11.0f/100.0f alpha:1.0f];
    [cornellRed setValue:[NSNumber numberWithFloat:7.0f/10.0f] forKey:@"redComponent"];
    [cornellRed setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"greenComponent"];
    [cornellRed setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"blueComponent"];
    return cornellRed;
}

+ (UIColor *)cornflowerBlue {
    UIColor *cornflowerBlue = [UIColor colorWithRed:39.0f/100.0f green:58.0f/100.0f blue:93.0f/100.0f alpha:1.0f];
    [cornflowerBlue setValue:[NSNumber numberWithFloat:39.0f/100.0f] forKey:@"redComponent"];
    [cornflowerBlue setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"greenComponent"];
    [cornflowerBlue setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"blueComponent"];
    return cornflowerBlue;
}

+ (UIColor *)cornsilk {
    UIColor *cornsilk = [UIColor colorWithRed:1.0f green:97.0f/100.0f blue:86.0f/100.0f alpha:1.0f];
    [cornsilk setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [cornsilk setValue:[NSNumber numberWithFloat:97.0f/100.0f] forKey:@"greenComponent"];
    [cornsilk setValue:[NSNumber numberWithFloat:86.0f/100.0f] forKey:@"blueComponent"];
    return cornsilk;
}

+ (UIColor *)cosmicLatte {
    UIColor *cosmicLatte = [UIColor colorWithRed:1.0f green:97.0f/100.0f blue:91.0f/100.0f alpha:1.0f];
    [cosmicLatte setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [cosmicLatte setValue:[NSNumber numberWithFloat:97.0f/100.0f] forKey:@"greenComponent"];
    [cosmicLatte setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"blueComponent"];
    return cosmicLatte;
}

+ (UIColor *)coyoteBrown {
    UIColor *coyoteBrown = [UIColor colorWithRed:51.0f/100.0f green:38.0f/100.0f blue:24.0f/100.0f alpha:1.0f];
    [coyoteBrown setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"redComponent"];
    [coyoteBrown setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"greenComponent"];
    [coyoteBrown setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"blueComponent"];
    return coyoteBrown;
}

+ (UIColor *)cottonCandy {
    UIColor *cottonCandy = [UIColor colorWithRed:1.0f green:74.0f/100.0f blue:85.0f/100.0f alpha:1.0f];
    [cottonCandy setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [cottonCandy setValue:[NSNumber numberWithFloat:74.0f/100.0f] forKey:@"greenComponent"];
    [cottonCandy setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"blueComponent"];
    return cottonCandy;
}

+ (UIColor *)cream {
    UIColor *cream = [UIColor colorWithRed:1.0f green:99.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
    [cream setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [cream setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"greenComponent"];
    [cream setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"blueComponent"];
    return cream;
}

+ (UIColor *)crimson {
    UIColor *crimson = [UIColor colorWithRed:86.0f/100.0f green:8.0f/100.0f blue:24.0f/100.0f alpha:1.0f];
    [crimson setValue:[NSNumber numberWithFloat:86.0f/100.0f] forKey:@"redComponent"];
    [crimson setValue:[NSNumber numberWithFloat:8.0f/100.0f] forKey:@"greenComponent"];
    [crimson setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"blueComponent"];
    return crimson;
}

+ (UIColor *)crimsonGlory {
    UIColor *crimsonGlory = [UIColor colorWithRed:0.75f green:0.0f blue:2.0f/10.0f alpha:1.0f];
    [crimsonGlory setValue:[NSNumber numberWithFloat:0.75f] forKey:@"redComponent"];
    [crimsonGlory setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [crimsonGlory setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"blueComponent"];
    return crimsonGlory;
}

+ (UIColor *)crimsonRed {
    UIColor *crimsonRed = [UIColor colorWithRed:6.0f/10.0f green:0.0f blue:0.0f alpha:1.0f];
    [crimsonRed setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"redComponent"];
    [crimsonRed setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [crimsonRed setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return crimsonRed;
}

+ (UIColor *)cyan {
    UIColor *cyan = [UIColor colorWithRed:0.0f green:1.0f blue:1.0f alpha:1.0f];
    [cyan setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [cyan setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [cyan setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return cyan;
}

+ (UIColor *)cyanAzure {
    UIColor *cyanAzure = [UIColor colorWithRed:31.0f/100.0f green:51.0f/100.0f blue:71.0f/100.0f alpha:1.0f];
    [cyanAzure setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"redComponent"];
    [cyanAzure setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"greenComponent"];
    [cyanAzure setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"blueComponent"];
    return cyanAzure;
}

+ (UIColor *)cyanBlueAzure {
    UIColor *cyanBlueAzure = [UIColor colorWithRed:27.0f/100.0f green:51.0f/100.0f blue:0.75f alpha:1.0f];
    [cyanBlueAzure setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"redComponent"];
    [cyanBlueAzure setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"greenComponent"];
    [cyanBlueAzure setValue:[NSNumber numberWithFloat:0.75f] forKey:@"blueComponent"];
    return cyanBlueAzure;
}

+ (UIColor *)cyanCobaltBlue {
    UIColor *cyanCobaltBlue = [UIColor colorWithRed:16.0f/100.0f green:35.0f/100.0f blue:61.0f/100.0f alpha:1.0f];
    [cyanCobaltBlue setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"redComponent"];
    [cyanCobaltBlue setValue:[NSNumber numberWithFloat:35.0f/100.0f] forKey:@"greenComponent"];
    [cyanCobaltBlue setValue:[NSNumber numberWithFloat:61.0f/100.0f] forKey:@"blueComponent"];
    return cyanCobaltBlue;
}

+ (UIColor *)cyanCornflowerBlue {
    UIColor *cyanCornflowerBlue = [UIColor colorWithRed:9.0f/100.0f green:55.0f/100.0f blue:76.0f/100.0f alpha:1.0f];
    [cyanCornflowerBlue setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"redComponent"];
    [cyanCornflowerBlue setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"greenComponent"];
    [cyanCornflowerBlue setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"blueComponent"];
    return cyanCornflowerBlue;
}

+ (UIColor *)cyanProcess {
    UIColor *cyanProcess = [UIColor colorWithRed:0.0f green:72.0f/100.0f blue:92.0f/100.0f alpha:1.0f];
    [cyanProcess setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [cyanProcess setValue:[NSNumber numberWithFloat:72.0f/100.0f] forKey:@"greenComponent"];
    [cyanProcess setValue:[NSNumber numberWithFloat:92.0f/100.0f] forKey:@"blueComponent"];
    return cyanProcess;
}

+ (UIColor *)cyberGrape {
    UIColor *cyberGrape = [UIColor colorWithRed:35.0f/100.0f green:26.0f/100.0f blue:49.0f/100.0f alpha:1.0f];
    [cyberGrape setValue:[NSNumber numberWithFloat:35.0f/100.0f] forKey:@"redComponent"];
    [cyberGrape setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"greenComponent"];
    [cyberGrape setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"blueComponent"];
    return cyberGrape;
}

+ (UIColor *)cyberYellow {
    UIColor *cyberYellow = [UIColor colorWithRed:1.0f green:83.0f/100.0f blue:0.0f alpha:1.0f];
    [cyberYellow setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [cyberYellow setValue:[NSNumber numberWithFloat:83.0f/100.0f] forKey:@"greenComponent"];
    [cyberYellow setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return cyberYellow;
}

+ (UIColor *)daffodil {
    UIColor *daffodil = [UIColor colorWithRed:1.0f green:1.0f blue:19.0f/100.0f alpha:1.0f];
    [daffodil setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [daffodil setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [daffodil setValue:[NSNumber numberWithFloat:19.0f/100.0f] forKey:@"blueComponent"];
    return daffodil;
}

+ (UIColor *)dandelion {
    UIColor *dandelion = [UIColor colorWithRed:94.0f/100.0f green:88.0f/100.0f blue:19.0f/100.0f alpha:1.0f];
    [dandelion setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"redComponent"];
    [dandelion setValue:[NSNumber numberWithFloat:88.0f/100.0f] forKey:@"greenComponent"];
    [dandelion setValue:[NSNumber numberWithFloat:19.0f/100.0f] forKey:@"blueComponent"];
    return dandelion;
}

+ (UIColor *)darkBlue {
    UIColor *darkBlue = [UIColor colorWithRed:0.0f green:0.0f blue:55.0f/100.0f alpha:1.0f];
    [darkBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [darkBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [darkBlue setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"blueComponent"];
    return darkBlue;
}

+ (UIColor *)darkBlueGray {
    UIColor *darkBlueGray = [UIColor colorWithRed:4.0f/10.0f green:4.0f/10.0f blue:6.0f/10.0f alpha:1.0f];
    [darkBlueGray setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"redComponent"];
    [darkBlueGray setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"greenComponent"];
    [darkBlueGray setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"blueComponent"];
    return darkBlueGray;
}

+ (UIColor *)darkBrown {
    UIColor *darkBrown = [UIColor colorWithRed:4.0f/10.0f green:26.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
    [darkBrown setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"redComponent"];
    [darkBrown setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"greenComponent"];
    [darkBrown setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"blueComponent"];
    return darkBrown;
}

+ (UIColor *)darkBrownTangelo {
    UIColor *darkBrownTangelo = [UIColor colorWithRed:53.0f/100.0f green:4.0f/10.0f blue:31.0f/100.0f alpha:1.0f];
    [darkBrownTangelo setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"redComponent"];
    [darkBrownTangelo setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"greenComponent"];
    [darkBrownTangelo setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"blueComponent"];
    return darkBrownTangelo;
}

+ (UIColor *)darkByzantium {
    UIColor *darkByzantium = [UIColor colorWithRed:36.0f/100.0f green:22.0f/100.0f blue:0.333f alpha:1.0f];
    [darkByzantium setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"redComponent"];
    [darkByzantium setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"greenComponent"];
    [darkByzantium setValue:[NSNumber numberWithFloat:0.333f] forKey:@"blueComponent"];
    return darkByzantium;
}

+ (UIColor *)darkCandyAppleRed {
    UIColor *darkCandyAppleRed = [UIColor colorWithRed:64.0f/100.0f green:0.0f blue:0.0f alpha:1.0f];
    [darkCandyAppleRed setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"redComponent"];
    [darkCandyAppleRed setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [darkCandyAppleRed setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return darkCandyAppleRed;
}

+ (UIColor *)darkCerulean {
    UIColor *darkCerulean = [UIColor colorWithRed:3.0f/100.0f green:27.0f/100.0f blue:49.0f/100.0f alpha:1.0f];
    [darkCerulean setValue:[NSNumber numberWithFloat:3.0f/100.0f] forKey:@"redComponent"];
    [darkCerulean setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"greenComponent"];
    [darkCerulean setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"blueComponent"];
    return darkCerulean;
}

+ (UIColor *)darkChestnut {
    UIColor *darkChestnut = [UIColor colorWithRed:6.0f/10.0f green:41.0f/100.0f blue:38.0f/100.0f alpha:1.0f];
    [darkChestnut setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"redComponent"];
    [darkChestnut setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"greenComponent"];
    [darkChestnut setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"blueComponent"];
    return darkChestnut;
}

+ (UIColor *)darkCoral {
    UIColor *darkCoral = [UIColor colorWithRed:8.0f/10.0f green:36.0f/100.0f blue:27.0f/100.0f alpha:1.0f];
    [darkCoral setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [darkCoral setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"greenComponent"];
    [darkCoral setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"blueComponent"];
    return darkCoral;
}

+ (UIColor *)darkCyan {
    UIColor *darkCyan = [UIColor colorWithRed:0.0f green:55.0f/100.0f blue:55.0f/100.0f alpha:1.0f];
    [darkCyan setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [darkCyan setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"greenComponent"];
    [darkCyan setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"blueComponent"];
    return darkCyan;
}

+ (UIColor *)darkElectricBlue {
    UIColor *darkElectricBlue = [UIColor colorWithRed:0.333f green:41.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
    [darkElectricBlue setValue:[NSNumber numberWithFloat:0.333f] forKey:@"redComponent"];
    [darkElectricBlue setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"greenComponent"];
    [darkElectricBlue setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"blueComponent"];
    return darkElectricBlue;
}

+ (UIColor *)darkGoldenrod {
    UIColor *darkGoldenrod = [UIColor colorWithRed:72.0f/100.0f green:53.0f/100.0f blue:4.0f/100.0f alpha:1.0f];
    [darkGoldenrod setValue:[NSNumber numberWithFloat:72.0f/100.0f] forKey:@"redComponent"];
    [darkGoldenrod setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"greenComponent"];
    [darkGoldenrod setValue:[NSNumber numberWithFloat:4.0f/100.0f] forKey:@"blueComponent"];
    return darkGoldenrod;
}

+ (UIColor *)darkGrayX11 {
    UIColor *darkGrayX11 = [UIColor colorWithRed:66.0f/100.0f green:66.0f/100.0f blue:66.0f/100.0f alpha:1.0f];
    [darkGrayX11 setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"redComponent"];
    [darkGrayX11 setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"greenComponent"];
    [darkGrayX11 setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"blueComponent"];
    return darkGrayX11;
}

+ (UIColor *)darkGreen {
    UIColor *darkGreen = [UIColor colorWithRed:0.0f green:2.0f/10.0f blue:13.0f/100.0f alpha:1.0f];
    [darkGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [darkGreen setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"greenComponent"];
    [darkGreen setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"blueComponent"];
    return darkGreen;
}

+ (UIColor *)darkGreenX11 {
    UIColor *darkGreenX11 = [UIColor colorWithRed:0.0f green:39.0f/100.0f blue:0.0f alpha:1.0f];
    [darkGreenX11 setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [darkGreenX11 setValue:[NSNumber numberWithFloat:39.0f/100.0f] forKey:@"greenComponent"];
    [darkGreenX11 setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return darkGreenX11;
}

+ (UIColor *)darkImperialBlue {
    UIColor *darkImperialBlue = [UIColor colorWithRed:0.0f green:0.25f blue:42.0f/100.0f alpha:1.0f];
    [darkImperialBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [darkImperialBlue setValue:[NSNumber numberWithFloat:0.25f] forKey:@"greenComponent"];
    [darkImperialBlue setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"blueComponent"];
    return darkImperialBlue;
}

+ (UIColor *)darkImperialBlue2 {
    UIColor *darkImperialBlue = [UIColor colorWithRed:0.0f green:8.0f/100.0f blue:49.0f/100.0f alpha:1.0f];
    [darkImperialBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [darkImperialBlue setValue:[NSNumber numberWithFloat:8.0f/100.0f] forKey:@"greenComponent"];
    [darkImperialBlue setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"blueComponent"];
    return darkImperialBlue;
}

+ (UIColor *)darkJungleGreen {
    UIColor *darkJungleGreen = [UIColor colorWithRed:1.0f/10.0f green:14.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
    [darkJungleGreen setValue:[NSNumber numberWithFloat:1.0f/10.0f] forKey:@"redComponent"];
    [darkJungleGreen setValue:[NSNumber numberWithFloat:14.0f/100.0f] forKey:@"greenComponent"];
    [darkJungleGreen setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"blueComponent"];
    return darkJungleGreen;
}

+ (UIColor *)darkKhaki {
    UIColor *darkKhaki = [UIColor colorWithRed:74.0f/100.0f green:72.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
    [darkKhaki setValue:[NSNumber numberWithFloat:74.0f/100.0f] forKey:@"redComponent"];
    [darkKhaki setValue:[NSNumber numberWithFloat:72.0f/100.0f] forKey:@"greenComponent"];
    [darkKhaki setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"blueComponent"];
    return darkKhaki;
}

+ (UIColor *)darkLava {
    UIColor *darkLava = [UIColor colorWithRed:28.0f/100.0f green:24.0f/100.0f blue:2.0f/10.0f alpha:1.0f];
    [darkLava setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"redComponent"];
    [darkLava setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"greenComponent"];
    [darkLava setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"blueComponent"];
    return darkLava;
}

+ (UIColor *)darkLavender {
    UIColor *darkLavender = [UIColor colorWithRed:45.0f/100.0f green:31.0f/100.0f blue:59.0f/100.0f alpha:1.0f];
    [darkLavender setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"redComponent"];
    [darkLavender setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"greenComponent"];
    [darkLavender setValue:[NSNumber numberWithFloat:59.0f/100.0f] forKey:@"blueComponent"];
    return darkLavender;
}

+ (UIColor *)darkLiver {
    UIColor *darkLiver = [UIColor colorWithRed:0.333f green:29.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
    [darkLiver setValue:[NSNumber numberWithFloat:0.333f] forKey:@"redComponent"];
    [darkLiver setValue:[NSNumber numberWithFloat:29.0f/100.0f] forKey:@"greenComponent"];
    [darkLiver setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"blueComponent"];
    return darkLiver;
}

+ (UIColor *)darkLiverHorses {
    UIColor *darkLiverHorses = [UIColor colorWithRed:0.333f green:24.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
    [darkLiverHorses setValue:[NSNumber numberWithFloat:0.333f] forKey:@"redComponent"];
    [darkLiverHorses setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"greenComponent"];
    [darkLiverHorses setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"blueComponent"];
    return darkLiverHorses;
}

+ (UIColor *)darkMagenta {
    UIColor *darkMagenta = [UIColor colorWithRed:55.0f/100.0f green:0.0f blue:55.0f/100.0f alpha:1.0f];
    [darkMagenta setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"redComponent"];
    [darkMagenta setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [darkMagenta setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"blueComponent"];
    return darkMagenta;
}

+ (UIColor *)darkMediumGray {
    UIColor *darkMediumGray = [UIColor colorWithRed:66.0f/100.0f green:66.0f/100.0f blue:66.0f/100.0f alpha:1.0f];
    [darkMediumGray setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"redComponent"];
    [darkMediumGray setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"greenComponent"];
    [darkMediumGray setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"blueComponent"];
    return darkMediumGray;
}

+ (UIColor *)darkMidnightBlue {
    UIColor *darkMidnightBlue = [UIColor colorWithRed:0.0f green:2.0f/10.0f blue:4.0f/10.0f alpha:1.0f];
    [darkMidnightBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [darkMidnightBlue setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"greenComponent"];
    [darkMidnightBlue setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"blueComponent"];
    return darkMidnightBlue;
}

+ (UIColor *)darkMossGreen {
    UIColor *darkMossGreen = [UIColor colorWithRed:29.0f/100.0f green:36.0f/100.0f blue:14.0f/100.0f alpha:1.0f];
    [darkMossGreen setValue:[NSNumber numberWithFloat:29.0f/100.0f] forKey:@"redComponent"];
    [darkMossGreen setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"greenComponent"];
    [darkMossGreen setValue:[NSNumber numberWithFloat:14.0f/100.0f] forKey:@"blueComponent"];
    return darkMossGreen;
}

+ (UIColor *)darkOliveGreen {
    UIColor *darkOliveGreen = [UIColor colorWithRed:0.333f green:42.0f/100.0f blue:18.0f/100.0f alpha:1.0f];
    [darkOliveGreen setValue:[NSNumber numberWithFloat:0.333f] forKey:@"redComponent"];
    [darkOliveGreen setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"greenComponent"];
    [darkOliveGreen setValue:[NSNumber numberWithFloat:18.0f/100.0f] forKey:@"blueComponent"];
    return darkOliveGreen;
}

+ (UIColor *)darkOrange {
    UIColor *darkOrange = [UIColor colorWithRed:1.0f green:55.0f/100.0f blue:0.0f alpha:1.0f];
    [darkOrange setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [darkOrange setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"greenComponent"];
    [darkOrange setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return darkOrange;
}

+ (UIColor *)darkOrchid {
    UIColor *darkOrchid = [UIColor colorWithRed:6.0f/10.0f green:2.0f/10.0f blue:8.0f/10.0f alpha:1.0f];
    [darkOrchid setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"redComponent"];
    [darkOrchid setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"greenComponent"];
    [darkOrchid setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"blueComponent"];
    return darkOrchid;
}

+ (UIColor *)darkPastelBlue {
    UIColor *darkPastelBlue = [UIColor colorWithRed:47.0f/100.0f green:62.0f/100.0f blue:8.0f/10.0f alpha:1.0f];
    [darkPastelBlue setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"redComponent"];
    [darkPastelBlue setValue:[NSNumber numberWithFloat:62.0f/100.0f] forKey:@"greenComponent"];
    [darkPastelBlue setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"blueComponent"];
    return darkPastelBlue;
}

+ (UIColor *)darkPastelGreen {
    UIColor *darkPastelGreen = [UIColor colorWithRed:1.0f/100.0f green:0.75f blue:24.0f/100.0f alpha:1.0f];
    [darkPastelGreen setValue:[NSNumber numberWithFloat:1.0f/100.0f] forKey:@"redComponent"];
    [darkPastelGreen setValue:[NSNumber numberWithFloat:0.75f] forKey:@"greenComponent"];
    [darkPastelGreen setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"blueComponent"];
    return darkPastelGreen;
}

+ (UIColor *)darkPastelPurple {
    UIColor *darkPastelPurple = [UIColor colorWithRed:59.0f/100.0f green:44.0f/100.0f blue:84.0f/100.0f alpha:1.0f];
    [darkPastelPurple setValue:[NSNumber numberWithFloat:59.0f/100.0f] forKey:@"redComponent"];
    [darkPastelPurple setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"greenComponent"];
    [darkPastelPurple setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"blueComponent"];
    return darkPastelPurple;
}

+ (UIColor *)darkPastelRed {
    UIColor *darkPastelRed = [UIColor colorWithRed:76.0f/100.0f green:23.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
    [darkPastelRed setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"redComponent"];
    [darkPastelRed setValue:[NSNumber numberWithFloat:23.0f/100.0f] forKey:@"greenComponent"];
    [darkPastelRed setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"blueComponent"];
    return darkPastelRed;
}

+ (UIColor *)darkPink {
    UIColor *darkPink = [UIColor colorWithRed:91.0f/100.0f green:0.333f blue:0.5f alpha:1.0f];
    [darkPink setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"redComponent"];
    [darkPink setValue:[NSNumber numberWithFloat:0.333f] forKey:@"greenComponent"];
    [darkPink setValue:[NSNumber numberWithFloat:0.5f] forKey:@"blueComponent"];
    return darkPink;
}

+ (UIColor *)darkPowderBlue {
    UIColor *darkPowderBlue = [UIColor colorWithRed:0.0f green:2.0f/10.0f blue:6.0f/10.0f alpha:1.0f];
    [darkPowderBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [darkPowderBlue setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"greenComponent"];
    [darkPowderBlue setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"blueComponent"];
    return darkPowderBlue;
}

+ (UIColor *)darkPuce {
    UIColor *darkPuce = [UIColor colorWithRed:31.0f/100.0f green:23.0f/100.0f blue:24.0f/100.0f alpha:1.0f];
    [darkPuce setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"redComponent"];
    [darkPuce setValue:[NSNumber numberWithFloat:23.0f/100.0f] forKey:@"greenComponent"];
    [darkPuce setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"blueComponent"];
    return darkPuce;
}

+ (UIColor *)darkPurple {
    UIColor *darkPurple = [UIColor colorWithRed:19.0f/100.0f green:1.0f/10.0f blue:2.0f/10.0f alpha:1.0f];
    [darkPurple setValue:[NSNumber numberWithFloat:19.0f/100.0f] forKey:@"redComponent"];
    [darkPurple setValue:[NSNumber numberWithFloat:1.0f/10.0f] forKey:@"greenComponent"];
    [darkPurple setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"blueComponent"];
    return darkPurple;
}

+ (UIColor *)darkRaspberry {
    UIColor *darkRaspberry = [UIColor colorWithRed:53.0f/100.0f green:15.0f/100.0f blue:34.0f/100.0f alpha:1.0f];
    [darkRaspberry setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"redComponent"];
    [darkRaspberry setValue:[NSNumber numberWithFloat:15.0f/100.0f] forKey:@"greenComponent"];
    [darkRaspberry setValue:[NSNumber numberWithFloat:34.0f/100.0f] forKey:@"blueComponent"];
    return darkRaspberry;
}

+ (UIColor *)darkRed {
    UIColor *darkRed = [UIColor colorWithRed:55.0f/100.0f green:0.0f blue:0.0f alpha:1.0f];
    [darkRed setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"redComponent"];
    [darkRed setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [darkRed setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return darkRed;
}

+ (UIColor *)darkSalmon {
    UIColor *darkSalmon = [UIColor colorWithRed:91.0f/100.0f green:59.0f/100.0f blue:48.0f/100.0f alpha:1.0f];
    [darkSalmon setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"redComponent"];
    [darkSalmon setValue:[NSNumber numberWithFloat:59.0f/100.0f] forKey:@"greenComponent"];
    [darkSalmon setValue:[NSNumber numberWithFloat:48.0f/100.0f] forKey:@"blueComponent"];
    return darkSalmon;
}

+ (UIColor *)darkScarlet {
    UIColor *darkScarlet = [UIColor colorWithRed:34.0f/100.0f green:1.0f/100.0f blue:1.0f/10.0f alpha:1.0f];
    [darkScarlet setValue:[NSNumber numberWithFloat:34.0f/100.0f] forKey:@"redComponent"];
    [darkScarlet setValue:[NSNumber numberWithFloat:1.0f/100.0f] forKey:@"greenComponent"];
    [darkScarlet setValue:[NSNumber numberWithFloat:1.0f/10.0f] forKey:@"blueComponent"];
    return darkScarlet;
}

+ (UIColor *)darkSeaGreen {
    UIColor *darkSeaGreen = [UIColor colorWithRed:56.0f/100.0f green:74.0f/100.0f blue:56.0f/100.0f alpha:1.0f];
    [darkSeaGreen setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"redComponent"];
    [darkSeaGreen setValue:[NSNumber numberWithFloat:74.0f/100.0f] forKey:@"greenComponent"];
    [darkSeaGreen setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"blueComponent"];
    return darkSeaGreen;
}

+ (UIColor *)darkSienna {
    UIColor *darkSienna = [UIColor colorWithRed:24.0f/100.0f green:8.0f/100.0f blue:8.0f/100.0f alpha:1.0f];
    [darkSienna setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"redComponent"];
    [darkSienna setValue:[NSNumber numberWithFloat:8.0f/100.0f] forKey:@"greenComponent"];
    [darkSienna setValue:[NSNumber numberWithFloat:8.0f/100.0f] forKey:@"blueComponent"];
    return darkSienna;
}

+ (UIColor *)darkSkyBlue {
    UIColor *darkSkyBlue = [UIColor colorWithRed:55.0f/100.0f green:0.75f blue:84.0f/100.0f alpha:1.0f];
    [darkSkyBlue setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"redComponent"];
    [darkSkyBlue setValue:[NSNumber numberWithFloat:0.75f] forKey:@"greenComponent"];
    [darkSkyBlue setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"blueComponent"];
    return darkSkyBlue;
}

+ (UIColor *)darkSlateBlue {
    UIColor *darkSlateBlue = [UIColor colorWithRed:28.0f/100.0f green:24.0f/100.0f blue:55.0f/100.0f alpha:1.0f];
    [darkSlateBlue setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"redComponent"];
    [darkSlateBlue setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"greenComponent"];
    [darkSlateBlue setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"blueComponent"];
    return darkSlateBlue;
}

+ (UIColor *)darkSlateGray {
    UIColor *darkSlateGray = [UIColor colorWithRed:18.0f/100.0f green:31.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
    [darkSlateGray setValue:[NSNumber numberWithFloat:18.0f/100.0f] forKey:@"redComponent"];
    [darkSlateGray setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"greenComponent"];
    [darkSlateGray setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"blueComponent"];
    return darkSlateGray;
}

+ (UIColor *)darkSpringGreen {
    UIColor *darkSpringGreen = [UIColor colorWithRed:9.0f/100.0f green:45.0f/100.0f blue:27.0f/100.0f alpha:1.0f];
    [darkSpringGreen setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"redComponent"];
    [darkSpringGreen setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"greenComponent"];
    [darkSpringGreen setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"blueComponent"];
    return darkSpringGreen;
}

+ (UIColor *)darkTan {
    UIColor *darkTan = [UIColor colorWithRed:57.0f/100.0f green:51.0f/100.0f blue:32.0f/100.0f alpha:1.0f];
    [darkTan setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"redComponent"];
    [darkTan setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"greenComponent"];
    [darkTan setValue:[NSNumber numberWithFloat:32.0f/100.0f] forKey:@"blueComponent"];
    return darkTan;
}

+ (UIColor *)darkTangerine {
    UIColor *darkTangerine = [UIColor colorWithRed:1.0f green:66.0f/100.0f blue:7.0f/100.0f alpha:1.0f];
    [darkTangerine setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [darkTangerine setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"greenComponent"];
    [darkTangerine setValue:[NSNumber numberWithFloat:7.0f/100.0f] forKey:@"blueComponent"];
    return darkTangerine;
}

+ (UIColor *)darkTaupe {
    UIColor *darkTaupe = [UIColor colorWithRed:28.0f/100.0f green:24.0f/100.0f blue:2.0f/10.0f alpha:1.0f];
    [darkTaupe setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"redComponent"];
    [darkTaupe setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"greenComponent"];
    [darkTaupe setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"blueComponent"];
    return darkTaupe;
}

+ (UIColor *)darkTerraCotta {
    UIColor *darkTerraCotta = [UIColor colorWithRed:8.0f/10.0f green:31.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
    [darkTerraCotta setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [darkTerraCotta setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"greenComponent"];
    [darkTerraCotta setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"blueComponent"];
    return darkTerraCotta;
}

+ (UIColor *)darkTurquoise {
    UIColor *darkTurquoise = [UIColor colorWithRed:0.0f green:81.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
    [darkTurquoise setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [darkTurquoise setValue:[NSNumber numberWithFloat:81.0f/100.0f] forKey:@"greenComponent"];
    [darkTurquoise setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"blueComponent"];
    return darkTurquoise;
}

+ (UIColor *)darkVanilla {
    UIColor *darkVanilla = [UIColor colorWithRed:82.0f/100.0f green:0.75f blue:66.0f/100.0f alpha:1.0f];
    [darkVanilla setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"redComponent"];
    [darkVanilla setValue:[NSNumber numberWithFloat:0.75f] forKey:@"greenComponent"];
    [darkVanilla setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"blueComponent"];
    return darkVanilla;
}

+ (UIColor *)darkViolet {
    UIColor *darkViolet = [UIColor colorWithRed:58.0f/100.0f green:0.0f blue:83.0f/100.0f alpha:1.0f];
    [darkViolet setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"redComponent"];
    [darkViolet setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [darkViolet setValue:[NSNumber numberWithFloat:83.0f/100.0f] forKey:@"blueComponent"];
    return darkViolet;
}

+ (UIColor *)darkYellow {
    UIColor *darkYellow = [UIColor colorWithRed:61.0f/100.0f green:53.0f/100.0f blue:5.0f/100.0f alpha:1.0f];
    [darkYellow setValue:[NSNumber numberWithFloat:61.0f/100.0f] forKey:@"redComponent"];
    [darkYellow setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"greenComponent"];
    [darkYellow setValue:[NSNumber numberWithFloat:5.0f/100.0f] forKey:@"blueComponent"];
    return darkYellow;
}

+ (UIColor *)dartmouthGreen {
    UIColor *dartmouthGreen = [UIColor colorWithRed:0.0f green:44.0f/100.0f blue:24.0f/100.0f alpha:1.0f];
    [dartmouthGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [dartmouthGreen setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"greenComponent"];
    [dartmouthGreen setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"blueComponent"];
    return dartmouthGreen;
}

+ (UIColor *)davysGrey {
    UIColor *davysGrey = [UIColor colorWithRed:0.333f green:0.333f blue:0.333f alpha:1.0f];
    [davysGrey setValue:[NSNumber numberWithFloat:0.333f] forKey:@"redComponent"];
    [davysGrey setValue:[NSNumber numberWithFloat:0.333f] forKey:@"greenComponent"];
    [davysGrey setValue:[NSNumber numberWithFloat:0.333f] forKey:@"blueComponent"];
    return davysGrey;
}

+ (UIColor *)debianRed {
    UIColor *debianRed = [UIColor colorWithRed:84.0f/100.0f green:4.0f/100.0f blue:0.333f alpha:1.0f];
    [debianRed setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"redComponent"];
    [debianRed setValue:[NSNumber numberWithFloat:4.0f/100.0f] forKey:@"greenComponent"];
    [debianRed setValue:[NSNumber numberWithFloat:0.333f] forKey:@"blueComponent"];
    return debianRed;
}

+ (UIColor *)deepAquamarine {
    UIColor *deepAquamarine = [UIColor colorWithRed:0.25f green:51.0f/100.0f blue:43.0f/100.0f alpha:1.0f];
    [deepAquamarine setValue:[NSNumber numberWithFloat:0.25f] forKey:@"redComponent"];
    [deepAquamarine setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"greenComponent"];
    [deepAquamarine setValue:[NSNumber numberWithFloat:43.0f/100.0f] forKey:@"blueComponent"];
    return deepAquamarine;
}

+ (UIColor *)deepCarmine {
    UIColor *deepCarmine = [UIColor colorWithRed:66.0f/100.0f green:13.0f/100.0f blue:24.0f/100.0f alpha:1.0f];
    [deepCarmine setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"redComponent"];
    [deepCarmine setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"greenComponent"];
    [deepCarmine setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"blueComponent"];
    return deepCarmine;
}

+ (UIColor *)deepCarminePink {
    UIColor *deepCarminePink = [UIColor colorWithRed:94.0f/100.0f green:19.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
    [deepCarminePink setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"redComponent"];
    [deepCarminePink setValue:[NSNumber numberWithFloat:19.0f/100.0f] forKey:@"greenComponent"];
    [deepCarminePink setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"blueComponent"];
    return deepCarminePink;
}

+ (UIColor *)deepCarrotOrange {
    UIColor *deepCarrotOrange = [UIColor colorWithRed:91.0f/100.0f green:41.0f/100.0f blue:0.1667f alpha:1.0f];
    [deepCarrotOrange setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"redComponent"];
    [deepCarrotOrange setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"greenComponent"];
    [deepCarrotOrange setValue:[NSNumber numberWithFloat:0.1667f] forKey:@"blueComponent"];
    return deepCarrotOrange;
}

+ (UIColor *)deepCerise {
    UIColor *deepCerise = [UIColor colorWithRed:85.0f/100.0f green:2.0f/10.0f blue:53.0f/100.0f alpha:1.0f];
    [deepCerise setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"redComponent"];
    [deepCerise setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"greenComponent"];
    [deepCerise setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"blueComponent"];
    return deepCerise;
}

+ (UIColor *)deepChampagne {
    UIColor *deepChampagne = [UIColor colorWithRed:98.0f/100.0f green:84.0f/100.0f blue:65.0f/100.0f alpha:1.0f];
    [deepChampagne setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [deepChampagne setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"greenComponent"];
    [deepChampagne setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"blueComponent"];
    return deepChampagne;
}

+ (UIColor *)deepChestnut {
    UIColor *deepChestnut = [UIColor colorWithRed:73.0f/100.0f green:31.0f/100.0f blue:28.0f/100.0f alpha:1.0f];
    [deepChestnut setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"redComponent"];
    [deepChestnut setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"greenComponent"];
    [deepChestnut setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"blueComponent"];
    return deepChestnut;
}

+ (UIColor *)deepCoffee {
    UIColor *deepCoffee = [UIColor colorWithRed:44.0f/100.0f green:26.0f/100.0f blue:0.25f alpha:1.0f];
    [deepCoffee setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"redComponent"];
    [deepCoffee setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"greenComponent"];
    [deepCoffee setValue:[NSNumber numberWithFloat:0.25f] forKey:@"blueComponent"];
    return deepCoffee;
}

+ (UIColor *)deepFuchsia {
    UIColor *deepFuchsia = [UIColor colorWithRed:76.0f/100.0f green:0.333f blue:76.0f/100.0f alpha:1.0f];
    [deepFuchsia setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"redComponent"];
    [deepFuchsia setValue:[NSNumber numberWithFloat:0.333f] forKey:@"greenComponent"];
    [deepFuchsia setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"blueComponent"];
    return deepFuchsia;
}

+ (UIColor *)deepGreen {
    UIColor *deepGreen = [UIColor colorWithRed:2.0f/100.0f green:4.0f/10.0f blue:3.0f/100.0f alpha:1.0f];
    [deepGreen setValue:[NSNumber numberWithFloat:2.0f/100.0f] forKey:@"redComponent"];
    [deepGreen setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"greenComponent"];
    [deepGreen setValue:[NSNumber numberWithFloat:3.0f/100.0f] forKey:@"blueComponent"];
    return deepGreen;
}

+ (UIColor *)deepGreenCyanTurquoise {
    UIColor *deepGreenCyanTurquoise = [UIColor colorWithRed:5.0f/100.0f green:49.0f/100.0f blue:38.0f/100.0f alpha:1.0f];
    [deepGreenCyanTurquoise setValue:[NSNumber numberWithFloat:5.0f/100.0f] forKey:@"redComponent"];
    [deepGreenCyanTurquoise setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"greenComponent"];
    [deepGreenCyanTurquoise setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"blueComponent"];
    return deepGreenCyanTurquoise;
}

+ (UIColor *)deepJungleGreen {
    UIColor *deepJungleGreen = [UIColor colorWithRed:0.0f green:29.0f/100.0f blue:29.0f/100.0f alpha:1.0f];
    [deepJungleGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [deepJungleGreen setValue:[NSNumber numberWithFloat:29.0f/100.0f] forKey:@"greenComponent"];
    [deepJungleGreen setValue:[NSNumber numberWithFloat:29.0f/100.0f] forKey:@"blueComponent"];
    return deepJungleGreen;
}

+ (UIColor *)deepKoamaru {
    UIColor *deepKoamaru = [UIColor colorWithRed:2.0f/10.0f green:2.0f/10.0f blue:4.0f/10.0f alpha:1.0f];
    [deepKoamaru setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"redComponent"];
    [deepKoamaru setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"greenComponent"];
    [deepKoamaru setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"blueComponent"];
    return deepKoamaru;
}

+ (UIColor *)deepLemon {
    UIColor *deepLemon = [UIColor colorWithRed:96.0f/100.0f green:78.0f/100.0f blue:1.0f/10.0f alpha:1.0f];
    [deepLemon setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"redComponent"];
    [deepLemon setValue:[NSNumber numberWithFloat:78.0f/100.0f] forKey:@"greenComponent"];
    [deepLemon setValue:[NSNumber numberWithFloat:1.0f/10.0f] forKey:@"blueComponent"];
    return deepLemon;
}

+ (UIColor *)deepLilac {
    UIColor *deepLilac = [UIColor colorWithRed:6.0f/10.0f green:0.333f blue:73.0f/100.0f alpha:1.0f];
    [deepLilac setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"redComponent"];
    [deepLilac setValue:[NSNumber numberWithFloat:0.333f] forKey:@"greenComponent"];
    [deepLilac setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"blueComponent"];
    return deepLilac;
}

+ (UIColor *)deepMagenta {
    UIColor *deepMagenta = [UIColor colorWithRed:8.0f/10.0f green:0.0f blue:8.0f/10.0f alpha:1.0f];
    [deepMagenta setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [deepMagenta setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [deepMagenta setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"blueComponent"];
    return deepMagenta;
}

+ (UIColor *)deepMaroon {
    UIColor *deepMaroon = [UIColor colorWithRed:51.0f/100.0f green:0.0f blue:0.0f alpha:1.0f];
    [deepMaroon setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"redComponent"];
    [deepMaroon setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [deepMaroon setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return deepMaroon;
}

+ (UIColor *)deepMauve {
    UIColor *deepMauve = [UIColor colorWithRed:83.0f/100.0f green:45.0f/100.0f blue:83.0f/100.0f alpha:1.0f];
    [deepMauve setValue:[NSNumber numberWithFloat:83.0f/100.0f] forKey:@"redComponent"];
    [deepMauve setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"greenComponent"];
    [deepMauve setValue:[NSNumber numberWithFloat:83.0f/100.0f] forKey:@"blueComponent"];
    return deepMauve;
}

+ (UIColor *)deepMossGreen {
    UIColor *deepMossGreen = [UIColor colorWithRed:21.0f/100.0f green:37.0f/100.0f blue:23.0f/100.0f alpha:1.0f];
    [deepMossGreen setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"redComponent"];
    [deepMossGreen setValue:[NSNumber numberWithFloat:37.0f/100.0f] forKey:@"greenComponent"];
    [deepMossGreen setValue:[NSNumber numberWithFloat:23.0f/100.0f] forKey:@"blueComponent"];
    return deepMossGreen;
}

+ (UIColor *)deepPeach {
    UIColor *deepPeach = [UIColor colorWithRed:1.0f green:8.0f/10.0f blue:64.0f/100.0f alpha:1.0f];
    [deepPeach setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [deepPeach setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"greenComponent"];
    [deepPeach setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"blueComponent"];
    return deepPeach;
}

+ (UIColor *)deepPink {
    UIColor *deepPink = [UIColor colorWithRed:1.0f green:8.0f/100.0f blue:58.0f/100.0f alpha:1.0f];
    [deepPink setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [deepPink setValue:[NSNumber numberWithFloat:8.0f/100.0f] forKey:@"greenComponent"];
    [deepPink setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"blueComponent"];
    return deepPink;
}

+ (UIColor *)deepPuce {
    UIColor *deepPuce = [UIColor colorWithRed:66.0f/100.0f green:36.0f/100.0f blue:41.0f/100.0f alpha:1.0f];
    [deepPuce setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"redComponent"];
    [deepPuce setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"greenComponent"];
    [deepPuce setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"blueComponent"];
    return deepPuce;
}

+ (UIColor *)deepRed {
    UIColor *deepRed = [UIColor colorWithRed:52.0f/100.0f green:0.0f blue:0.0f alpha:1.0f];
    [deepRed setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"redComponent"];
    [deepRed setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [deepRed setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return deepRed;
}

+ (UIColor *)deepRuby {
    UIColor *deepRuby = [UIColor colorWithRed:52.0f/100.0f green:0.25f blue:36.0f/100.0f alpha:1.0f];
    [deepRuby setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"redComponent"];
    [deepRuby setValue:[NSNumber numberWithFloat:0.25f] forKey:@"greenComponent"];
    [deepRuby setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"blueComponent"];
    return deepRuby;
}

+ (UIColor *)deepSaffron {
    UIColor *deepSaffron = [UIColor colorWithRed:1.0f green:6.0f/10.0f blue:2.0f/10.0f alpha:1.0f];
    [deepSaffron setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [deepSaffron setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [deepSaffron setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"blueComponent"];
    return deepSaffron;
}

+ (UIColor *)deepSkyBlue {
    UIColor *deepSkyBlue = [UIColor colorWithRed:0.0f green:0.75f blue:1.0f alpha:1.0f];
    [deepSkyBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [deepSkyBlue setValue:[NSNumber numberWithFloat:0.75f] forKey:@"greenComponent"];
    [deepSkyBlue setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return deepSkyBlue;
}

+ (UIColor *)deepSpaceSparkle {
    UIColor *deepSpaceSparkle = [UIColor colorWithRed:29.0f/100.0f green:39.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
    [deepSpaceSparkle setValue:[NSNumber numberWithFloat:29.0f/100.0f] forKey:@"redComponent"];
    [deepSpaceSparkle setValue:[NSNumber numberWithFloat:39.0f/100.0f] forKey:@"greenComponent"];
    [deepSpaceSparkle setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"blueComponent"];
    return deepSpaceSparkle;
}

+ (UIColor *)deepSpringBud {
    UIColor *deepSpringBud = [UIColor colorWithRed:0.333f green:42.0f/100.0f blue:18.0f/100.0f alpha:1.0f];
    [deepSpringBud setValue:[NSNumber numberWithFloat:0.333f] forKey:@"redComponent"];
    [deepSpringBud setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"greenComponent"];
    [deepSpringBud setValue:[NSNumber numberWithFloat:18.0f/100.0f] forKey:@"blueComponent"];
    return deepSpringBud;
}

+ (UIColor *)deepTaupe {
    UIColor *deepTaupe = [UIColor colorWithRed:49.0f/100.0f green:37.0f/100.0f blue:38.0f/100.0f alpha:1.0f];
    [deepTaupe setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"redComponent"];
    [deepTaupe setValue:[NSNumber numberWithFloat:37.0f/100.0f] forKey:@"greenComponent"];
    [deepTaupe setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"blueComponent"];
    return deepTaupe;
}

+ (UIColor *)deepTuscanRed {
    UIColor *deepTuscanRed = [UIColor colorWithRed:4.0f/10.0f green:26.0f/100.0f blue:3.0f/10.0f alpha:1.0f];
    [deepTuscanRed setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"redComponent"];
    [deepTuscanRed setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"greenComponent"];
    [deepTuscanRed setValue:[NSNumber numberWithFloat:3.0f/10.0f] forKey:@"blueComponent"];
    return deepTuscanRed;
}

+ (UIColor *)deepViolet {
    UIColor *deepViolet = [UIColor colorWithRed:2.0f/10.0f green:0.0f blue:4.0f/10.0f alpha:1.0f];
    [deepViolet setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"redComponent"];
    [deepViolet setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [deepViolet setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"blueComponent"];
    return deepViolet;
}

+ (UIColor *)deer {
    UIColor *deer = [UIColor colorWithRed:73.0f/100.0f green:53.0f/100.0f blue:35.0f/100.0f alpha:1.0f];
    [deer setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"redComponent"];
    [deer setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"greenComponent"];
    [deer setValue:[NSNumber numberWithFloat:35.0f/100.0f] forKey:@"blueComponent"];
    return deer;
}

+ (UIColor *)denim {
    UIColor *denim = [UIColor colorWithRed:8.0f/100.0f green:38.0f/100.0f blue:74.0f/100.0f alpha:1.0f];
    [denim setValue:[NSNumber numberWithFloat:8.0f/100.0f] forKey:@"redComponent"];
    [denim setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"greenComponent"];
    [denim setValue:[NSNumber numberWithFloat:74.0f/100.0f] forKey:@"blueComponent"];
    return denim;
}

+ (UIColor *)desaturatedCyan {
    UIColor *desaturatedCyan = [UIColor colorWithRed:4.0f/10.0f green:6.0f/10.0f blue:6.0f/10.0f alpha:1.0f];
    [desaturatedCyan setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"redComponent"];
    [desaturatedCyan setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [desaturatedCyan setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"blueComponent"];
    return desaturatedCyan;
}

+ (UIColor *)desert {
    UIColor *desert = [UIColor colorWithRed:76.0f/100.0f green:6.0f/10.0f blue:42.0f/100.0f alpha:1.0f];
    [desert setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"redComponent"];
    [desert setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [desert setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"blueComponent"];
    return desert;
}

+ (UIColor *)desertSand {
    UIColor *desertSand = [UIColor colorWithRed:93.0f/100.0f green:79.0f/100.0f blue:69.0f/100.0f alpha:1.0f];
    [desertSand setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"redComponent"];
    [desertSand setValue:[NSNumber numberWithFloat:79.0f/100.0f] forKey:@"greenComponent"];
    [desertSand setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"blueComponent"];
    return desertSand;
}

+ (UIColor *)desire {
    UIColor *desire = [UIColor colorWithRed:92.0f/100.0f green:24.0f/100.0f blue:0.333f alpha:1.0f];
    [desire setValue:[NSNumber numberWithFloat:92.0f/100.0f] forKey:@"redComponent"];
    [desire setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"greenComponent"];
    [desire setValue:[NSNumber numberWithFloat:0.333f] forKey:@"blueComponent"];
    return desire;
}

+ (UIColor *)diamond {
    UIColor *diamond = [UIColor colorWithRed:73.0f/100.0f green:95.0f/100.0f blue:1.0f alpha:1.0f];
    [diamond setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"redComponent"];
    [diamond setValue:[NSNumber numberWithFloat:95.0f/100.0f] forKey:@"greenComponent"];
    [diamond setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return diamond;
}

+ (UIColor *)dimGray {
    UIColor *dimGray = [UIColor colorWithRed:41.0f/100.0f green:41.0f/100.0f blue:41.0f/100.0f alpha:1.0f];
    [dimGray setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"redComponent"];
    [dimGray setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"greenComponent"];
    [dimGray setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"blueComponent"];
    return dimGray;
}

+ (UIColor *)dirt {
    UIColor *dirt = [UIColor colorWithRed:61.0f/100.0f green:46.0f/100.0f blue:0.333f alpha:1.0f];
    [dirt setValue:[NSNumber numberWithFloat:61.0f/100.0f] forKey:@"redComponent"];
    [dirt setValue:[NSNumber numberWithFloat:46.0f/100.0f] forKey:@"greenComponent"];
    [dirt setValue:[NSNumber numberWithFloat:0.333f] forKey:@"blueComponent"];
    return dirt;
}

+ (UIColor *)dodgerBlue {
    UIColor *dodgerBlue = [UIColor colorWithRed:12.0f/100.0f green:56.0f/100.0f blue:1.0f alpha:1.0f];
    [dodgerBlue setValue:[NSNumber numberWithFloat:12.0f/100.0f] forKey:@"redComponent"];
    [dodgerBlue setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"greenComponent"];
    [dodgerBlue setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return dodgerBlue;
}

+ (UIColor *)dogwoodRose {
    UIColor *dogwoodRose = [UIColor colorWithRed:84.0f/100.0f green:9.0f/100.0f blue:41.0f/100.0f alpha:1.0f];
    [dogwoodRose setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"redComponent"];
    [dogwoodRose setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"greenComponent"];
    [dogwoodRose setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"blueComponent"];
    return dogwoodRose;
}

+ (UIColor *)dollarBill {
    UIColor *dollarBill = [UIColor colorWithRed:52.0f/100.0f green:73.0f/100.0f blue:4.0f/10.0f alpha:1.0f];
    [dollarBill setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"redComponent"];
    [dollarBill setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"greenComponent"];
    [dollarBill setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"blueComponent"];
    return dollarBill;
}

+ (UIColor *)donkeyBrown {
    UIColor *donkeyBrown = [UIColor colorWithRed:4.0f/10.0f green:3.0f/10.0f blue:16.0f/100.0f alpha:1.0f];
    [donkeyBrown setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"redComponent"];
    [donkeyBrown setValue:[NSNumber numberWithFloat:3.0f/10.0f] forKey:@"greenComponent"];
    [donkeyBrown setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"blueComponent"];
    return donkeyBrown;
}

+ (UIColor *)drab {
    UIColor *drab = [UIColor colorWithRed:59.0f/100.0f green:44.0f/100.0f blue:9.0f/100.0f alpha:1.0f];
    [drab setValue:[NSNumber numberWithFloat:59.0f/100.0f] forKey:@"redComponent"];
    [drab setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"greenComponent"];
    [drab setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"blueComponent"];
    return drab;
}

+ (UIColor *)dukeBlue {
    UIColor *dukeBlue = [UIColor colorWithRed:0.0f green:0.0f blue:61.0f/100.0f alpha:1.0f];
    [dukeBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [dukeBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [dukeBlue setValue:[NSNumber numberWithFloat:61.0f/100.0f] forKey:@"blueComponent"];
    return dukeBlue;
}

+ (UIColor *)dustStorm {
    UIColor *dustStorm = [UIColor colorWithRed:9.0f/10.0f green:8.0f/10.0f blue:79.0f/100.0f alpha:1.0f];
    [dustStorm setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"redComponent"];
    [dustStorm setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"greenComponent"];
    [dustStorm setValue:[NSNumber numberWithFloat:79.0f/100.0f] forKey:@"blueComponent"];
    return dustStorm;
}

+ (UIColor *)dutchWhite {
    UIColor *dutchWhite = [UIColor colorWithRed:94.0f/100.0f green:87.0f/100.0f blue:73.0f/100.0f alpha:1.0f];
    [dutchWhite setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"redComponent"];
    [dutchWhite setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"greenComponent"];
    [dutchWhite setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"blueComponent"];
    return dutchWhite;
}

+ (UIColor *)earthYellow {
    UIColor *earthYellow = [UIColor colorWithRed:88.0f/100.0f green:66.0f/100.0f blue:37.0f/100.0f alpha:1.0f];
    [earthYellow setValue:[NSNumber numberWithFloat:88.0f/100.0f] forKey:@"redComponent"];
    [earthYellow setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"greenComponent"];
    [earthYellow setValue:[NSNumber numberWithFloat:37.0f/100.0f] forKey:@"blueComponent"];
    return earthYellow;
}

+ (UIColor *)ebony {
    UIColor *ebony = [UIColor colorWithRed:0.333f green:36.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
    [ebony setValue:[NSNumber numberWithFloat:0.333f] forKey:@"redComponent"];
    [ebony setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"greenComponent"];
    [ebony setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"blueComponent"];
    return ebony;
}

+ (UIColor *)ecru {
    UIColor *ecru = [UIColor colorWithRed:76.0f/100.0f green:7.0f/10.0f blue:0.5f alpha:1.0f];
    [ecru setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"redComponent"];
    [ecru setValue:[NSNumber numberWithFloat:7.0f/10.0f] forKey:@"greenComponent"];
    [ecru setValue:[NSNumber numberWithFloat:0.5f] forKey:@"blueComponent"];
    return ecru;
}

+ (UIColor *)eerieBlack {
    UIColor *eerieBlack = [UIColor colorWithRed:11.0f/100.0f green:11.0f/100.0f blue:11.0f/100.0f alpha:1.0f];
    [eerieBlack setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"redComponent"];
    [eerieBlack setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"greenComponent"];
    [eerieBlack setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"blueComponent"];
    return eerieBlack;
}

+ (UIColor *)eggplant {
    UIColor *eggplant = [UIColor colorWithRed:38.0f/100.0f green:0.25f blue:32.0f/100.0f alpha:1.0f];
    [eggplant setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"redComponent"];
    [eggplant setValue:[NSNumber numberWithFloat:0.25f] forKey:@"greenComponent"];
    [eggplant setValue:[NSNumber numberWithFloat:32.0f/100.0f] forKey:@"blueComponent"];
    return eggplant;
}

+ (UIColor *)eggshell {
    UIColor *eggshell = [UIColor colorWithRed:94.0f/100.0f green:92.0f/100.0f blue:84.0f/100.0f alpha:1.0f];
    [eggshell setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"redComponent"];
    [eggshell setValue:[NSNumber numberWithFloat:92.0f/100.0f] forKey:@"greenComponent"];
    [eggshell setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"blueComponent"];
    return eggshell;
}

+ (UIColor *)egyptianBlue {
    UIColor *egyptianBlue = [UIColor colorWithRed:6.0f/100.0f green:2.0f/10.0f blue:65.0f/100.0f alpha:1.0f];
    [egyptianBlue setValue:[NSNumber numberWithFloat:6.0f/100.0f] forKey:@"redComponent"];
    [egyptianBlue setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"greenComponent"];
    [egyptianBlue setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"blueComponent"];
    return egyptianBlue;
}

+ (UIColor *)electricBlue {
    UIColor *electricBlue = [UIColor colorWithRed:49.0f/100.0f green:98.0f/100.0f blue:1.0f alpha:1.0f];
    [electricBlue setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"redComponent"];
    [electricBlue setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"greenComponent"];
    [electricBlue setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return electricBlue;
}

+ (UIColor *)electricCrimson {
    UIColor *electricCrimson = [UIColor colorWithRed:1.0f green:0.0f blue:0.25f alpha:1.0f];
    [electricCrimson setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [electricCrimson setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [electricCrimson setValue:[NSNumber numberWithFloat:0.25f] forKey:@"blueComponent"];
    return electricCrimson;
}

+ (UIColor *)electricCyan {
    UIColor *electricCyan = [UIColor colorWithRed:0.0f green:1.0f blue:1.0f alpha:1.0f];
    [electricCyan setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [electricCyan setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [electricCyan setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return electricCyan;
}

+ (UIColor *)electricGreen {
    UIColor *electricGreen = [UIColor colorWithRed:0.0f green:1.0f blue:0.0f alpha:1.0f];
    [electricGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [electricGreen setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [electricGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return electricGreen;
}

+ (UIColor *)electricIndigo {
    UIColor *electricIndigo = [UIColor colorWithRed:44.0f/100.0f green:0.0f blue:1.0f alpha:1.0f];
    [electricIndigo setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"redComponent"];
    [electricIndigo setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [electricIndigo setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return electricIndigo;
}

+ (UIColor *)electricLavender {
    UIColor *electricLavender = [UIColor colorWithRed:96.0f/100.0f green:73.0f/100.0f blue:1.0f alpha:1.0f];
    [electricLavender setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"redComponent"];
    [electricLavender setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"greenComponent"];
    [electricLavender setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return electricLavender;
}

+ (UIColor *)electricLime {
    UIColor *electricLime = [UIColor colorWithRed:8.0f/10.0f green:1.0f blue:0.0f alpha:1.0f];
    [electricLime setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [electricLime setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [electricLime setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return electricLime;
}

+ (UIColor *)electricPurple {
    UIColor *electricPurple = [UIColor colorWithRed:0.75f green:0.0f blue:1.0f alpha:1.0f];
    [electricPurple setValue:[NSNumber numberWithFloat:0.75f] forKey:@"redComponent"];
    [electricPurple setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [electricPurple setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return electricPurple;
}

+ (UIColor *)electricUltramarine {
    UIColor *electricUltramarine = [UIColor colorWithRed:0.25f green:0.0f blue:1.0f alpha:1.0f];
    [electricUltramarine setValue:[NSNumber numberWithFloat:0.25f] forKey:@"redComponent"];
    [electricUltramarine setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [electricUltramarine setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return electricUltramarine;
}

+ (UIColor *)electricViolet {
    UIColor *electricViolet = [UIColor colorWithRed:56.0f/100.0f green:0.0f blue:1.0f alpha:1.0f];
    [electricViolet setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"redComponent"];
    [electricViolet setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [electricViolet setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return electricViolet;
}

+ (UIColor *)electricYellow {
    UIColor *electricYellow = [UIColor colorWithRed:1.0f green:1.0f blue:2.0f/10.0f alpha:1.0f];
    [electricYellow setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [electricYellow setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [electricYellow setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"blueComponent"];
    return electricYellow;
}

+ (UIColor *)emerald {
    UIColor *emerald = [UIColor colorWithRed:31.0f/100.0f green:78.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
    [emerald setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"redComponent"];
    [emerald setValue:[NSNumber numberWithFloat:78.0f/100.0f] forKey:@"greenComponent"];
    [emerald setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"blueComponent"];
    return emerald;
}

+ (UIColor *)eminence {
    UIColor *eminence = [UIColor colorWithRed:42.0f/100.0f green:19.0f/100.0f blue:51.0f/100.0f alpha:1.0f];
    [eminence setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"redComponent"];
    [eminence setValue:[NSNumber numberWithFloat:19.0f/100.0f] forKey:@"greenComponent"];
    [eminence setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"blueComponent"];
    return eminence;
}

+ (UIColor *)englishGreen {
    UIColor *englishGreen = [UIColor colorWithRed:11.0f/100.0f green:3.0f/10.0f blue:24.0f/100.0f alpha:1.0f];
    [englishGreen setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"redComponent"];
    [englishGreen setValue:[NSNumber numberWithFloat:3.0f/10.0f] forKey:@"greenComponent"];
    [englishGreen setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"blueComponent"];
    return englishGreen;
}

+ (UIColor *)englishLavender {
    UIColor *englishLavender = [UIColor colorWithRed:71.0f/100.0f green:51.0f/100.0f blue:58.0f/100.0f alpha:1.0f];
    [englishLavender setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"redComponent"];
    [englishLavender setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"greenComponent"];
    [englishLavender setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"blueComponent"];
    return englishLavender;
}

+ (UIColor *)englishRed {
    UIColor *englishRed = [UIColor colorWithRed:0.667f green:29.0f/100.0f blue:32.0f/100.0f alpha:1.0f];
    [englishRed setValue:[NSNumber numberWithFloat:0.667f] forKey:@"redComponent"];
    [englishRed setValue:[NSNumber numberWithFloat:29.0f/100.0f] forKey:@"greenComponent"];
    [englishRed setValue:[NSNumber numberWithFloat:32.0f/100.0f] forKey:@"blueComponent"];
    return englishRed;
}

+ (UIColor *)englishViolet {
    UIColor *englishViolet = [UIColor colorWithRed:34.0f/100.0f green:24.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
    [englishViolet setValue:[NSNumber numberWithFloat:34.0f/100.0f] forKey:@"redComponent"];
    [englishViolet setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"greenComponent"];
    [englishViolet setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"blueComponent"];
    return englishViolet;
}

+ (UIColor *)etonBlue {
    UIColor *etonBlue = [UIColor colorWithRed:59.0f/100.0f green:78.0f/100.0f blue:64.0f/100.0f alpha:1.0f];
    [etonBlue setValue:[NSNumber numberWithFloat:59.0f/100.0f] forKey:@"redComponent"];
    [etonBlue setValue:[NSNumber numberWithFloat:78.0f/100.0f] forKey:@"greenComponent"];
    [etonBlue setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"blueComponent"];
    return etonBlue;
}

+ (UIColor *)eucalyptus {
    UIColor *eucalyptus = [UIColor colorWithRed:27.0f/100.0f green:84.0f/100.0f blue:66.0f/100.0f alpha:1.0f];
    [eucalyptus setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"redComponent"];
    [eucalyptus setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"greenComponent"];
    [eucalyptus setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"blueComponent"];
    return eucalyptus;
}

+ (UIColor *)fallow {
    UIColor *fallow = [UIColor colorWithRed:76.0f/100.0f green:6.0f/10.0f blue:42.0f/100.0f alpha:1.0f];
    [fallow setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"redComponent"];
    [fallow setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [fallow setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"blueComponent"];
    return fallow;
}

+ (UIColor *)faluRed {
    UIColor *faluRed = [UIColor colorWithRed:0.5f green:9.0f/100.0f blue:9.0f/100.0f alpha:1.0f];
    [faluRed setValue:[NSNumber numberWithFloat:0.5f] forKey:@"redComponent"];
    [faluRed setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"greenComponent"];
    [faluRed setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"blueComponent"];
    return faluRed;
}

+ (UIColor *)fandango {
    UIColor *fandango = [UIColor colorWithRed:71.0f/100.0f green:2.0f/10.0f blue:54.0f/100.0f alpha:1.0f];
    [fandango setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"redComponent"];
    [fandango setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"greenComponent"];
    [fandango setValue:[NSNumber numberWithFloat:54.0f/100.0f] forKey:@"blueComponent"];
    return fandango;
}

+ (UIColor *)fandangoPink {
    UIColor *fandangoPink = [UIColor colorWithRed:87.0f/100.0f green:32.0f/100.0f blue:52.0f/100.0f alpha:1.0f];
    [fandangoPink setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"redComponent"];
    [fandangoPink setValue:[NSNumber numberWithFloat:32.0f/100.0f] forKey:@"greenComponent"];
    [fandangoPink setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"blueComponent"];
    return fandangoPink;
}

+ (UIColor *)fashionFuchsia {
    UIColor *fashionFuchsia = [UIColor colorWithRed:96.0f/100.0f green:0.0f blue:63.0f/100.0f alpha:1.0f];
    [fashionFuchsia setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"redComponent"];
    [fashionFuchsia setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [fashionFuchsia setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"blueComponent"];
    return fashionFuchsia;
}

+ (UIColor *)fawn {
    UIColor *fawn = [UIColor colorWithRed:9.0f/10.0f green:0.667f blue:44.0f/100.0f alpha:1.0f];
    [fawn setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"redComponent"];
    [fawn setValue:[NSNumber numberWithFloat:0.667f] forKey:@"greenComponent"];
    [fawn setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"blueComponent"];
    return fawn;
}

+ (UIColor *)feldgrau {
    UIColor *feldgrau = [UIColor colorWithRed:3.0f/10.0f green:36.0f/100.0f blue:0.333f alpha:1.0f];
    [feldgrau setValue:[NSNumber numberWithFloat:3.0f/10.0f] forKey:@"redComponent"];
    [feldgrau setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"greenComponent"];
    [feldgrau setValue:[NSNumber numberWithFloat:0.333f] forKey:@"blueComponent"];
    return feldgrau;
}

+ (UIColor *)feldspar {
    UIColor *feldspar = [UIColor colorWithRed:99.0f/100.0f green:84.0f/100.0f blue:69.0f/100.0f alpha:1.0f];
    [feldspar setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"redComponent"];
    [feldspar setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"greenComponent"];
    [feldspar setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"blueComponent"];
    return feldspar;
}

+ (UIColor *)fernGreen {
    UIColor *fernGreen = [UIColor colorWithRed:31.0f/100.0f green:47.0f/100.0f blue:26.0f/100.0f alpha:1.0f];
    [fernGreen setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"redComponent"];
    [fernGreen setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"greenComponent"];
    [fernGreen setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"blueComponent"];
    return fernGreen;
}

+ (UIColor *)ferrariRed {
    UIColor *ferrariRed = [UIColor colorWithRed:1.0f green:16.0f/100.0f blue:0.0f alpha:1.0f];
    [ferrariRed setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [ferrariRed setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"greenComponent"];
    [ferrariRed setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return ferrariRed;
}

+ (UIColor *)fieldDrab {
    UIColor *fieldDrab = [UIColor colorWithRed:42.0f/100.0f green:0.333f blue:12.0f/100.0f alpha:1.0f];
    [fieldDrab setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"redComponent"];
    [fieldDrab setValue:[NSNumber numberWithFloat:0.333f] forKey:@"greenComponent"];
    [fieldDrab setValue:[NSNumber numberWithFloat:12.0f/100.0f] forKey:@"blueComponent"];
    return fieldDrab;
}

+ (UIColor *)firebrick {
    UIColor *firebrick = [UIColor colorWithRed:7.0f/10.0f green:13.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
    [firebrick setValue:[NSNumber numberWithFloat:7.0f/10.0f] forKey:@"redComponent"];
    [firebrick setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"greenComponent"];
    [firebrick setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"blueComponent"];
    return firebrick;
}

+ (UIColor *)fireEngineRed {
    UIColor *fireEngineRed = [UIColor colorWithRed:81.0f/100.0f green:13.0f/100.0f blue:16.0f/100.0f alpha:1.0f];
    [fireEngineRed setValue:[NSNumber numberWithFloat:81.0f/100.0f] forKey:@"redComponent"];
    [fireEngineRed setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"greenComponent"];
    [fireEngineRed setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"blueComponent"];
    return fireEngineRed;
}

+ (UIColor *)flame {
    UIColor *flame = [UIColor colorWithRed:89.0f/100.0f green:35.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
    [flame setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"redComponent"];
    [flame setValue:[NSNumber numberWithFloat:35.0f/100.0f] forKey:@"greenComponent"];
    [flame setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"blueComponent"];
    return flame;
}

+ (UIColor *)flamingoPink {
    UIColor *flamingoPink = [UIColor colorWithRed:99.0f/100.0f green:56.0f/100.0f blue:0.667f alpha:1.0f];
    [flamingoPink setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"redComponent"];
    [flamingoPink setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"greenComponent"];
    [flamingoPink setValue:[NSNumber numberWithFloat:0.667f] forKey:@"blueComponent"];
    return flamingoPink;
}

+ (UIColor *)flattery {
    UIColor *flattery = [UIColor colorWithRed:42.0f/100.0f green:27.0f/100.0f blue:14.0f/100.0f alpha:1.0f];
    [flattery setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"redComponent"];
    [flattery setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"greenComponent"];
    [flattery setValue:[NSNumber numberWithFloat:14.0f/100.0f] forKey:@"blueComponent"];
    return flattery;
}

+ (UIColor *)flavescent {
    UIColor *flavescent = [UIColor colorWithRed:97.0f/100.0f green:91.0f/100.0f blue:56.0f/100.0f alpha:1.0f];
    [flavescent setValue:[NSNumber numberWithFloat:97.0f/100.0f] forKey:@"redComponent"];
    [flavescent setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"greenComponent"];
    [flavescent setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"blueComponent"];
    return flavescent;
}

+ (UIColor *)flax {
    UIColor *flax = [UIColor colorWithRed:93.0f/100.0f green:86.0f/100.0f blue:51.0f/100.0f alpha:1.0f];
    [flax setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"redComponent"];
    [flax setValue:[NSNumber numberWithFloat:86.0f/100.0f] forKey:@"greenComponent"];
    [flax setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"blueComponent"];
    return flax;
}

+ (UIColor *)flirt {
    UIColor *flirt = [UIColor colorWithRed:64.0f/100.0f green:0.0f blue:43.0f/100.0f alpha:1.0f];
    [flirt setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"redComponent"];
    [flirt setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [flirt setValue:[NSNumber numberWithFloat:43.0f/100.0f] forKey:@"blueComponent"];
    return flirt;
}

+ (UIColor *)floralWhite {
    UIColor *floralWhite = [UIColor colorWithRed:1.0f green:98.0f/100.0f blue:94.0f/100.0f alpha:1.0f];
    [floralWhite setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [floralWhite setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"greenComponent"];
    [floralWhite setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"blueComponent"];
    return floralWhite;
}

+ (UIColor *)fluorescentOrange {
    UIColor *fluorescentOrange = [UIColor colorWithRed:1.0f green:0.75f blue:0.0f alpha:1.0f];
    [fluorescentOrange setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [fluorescentOrange setValue:[NSNumber numberWithFloat:0.75f] forKey:@"greenComponent"];
    [fluorescentOrange setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return fluorescentOrange;
}

+ (UIColor *)fluorescentPink {
    UIColor *fluorescentPink = [UIColor colorWithRed:1.0f green:8.0f/100.0f blue:58.0f/100.0f alpha:1.0f];
    [fluorescentPink setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [fluorescentPink setValue:[NSNumber numberWithFloat:8.0f/100.0f] forKey:@"greenComponent"];
    [fluorescentPink setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"blueComponent"];
    return fluorescentPink;
}

+ (UIColor *)fluorescentYellow {
    UIColor *fluorescentYellow = [UIColor colorWithRed:8.0f/10.0f green:1.0f blue:0.0f alpha:1.0f];
    [fluorescentYellow setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [fluorescentYellow setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [fluorescentYellow setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return fluorescentYellow;
}

+ (UIColor *)folly {
    UIColor *folly = [UIColor colorWithRed:1.0f green:0.0f blue:31.0f/100.0f alpha:1.0f];
    [folly setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [folly setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [folly setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"blueComponent"];
    return folly;
}

+ (UIColor *)forestGreenTraditional {
    UIColor *forestGreenTraditional = [UIColor colorWithRed:0.0f green:27.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
    [forestGreenTraditional setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [forestGreenTraditional setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"greenComponent"];
    [forestGreenTraditional setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"blueComponent"];
    return forestGreenTraditional;
}

+ (UIColor *)forestGreenWeb {
    UIColor *forestGreenWeb = [UIColor colorWithRed:13.0f/100.0f green:55.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
    [forestGreenWeb setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"redComponent"];
    [forestGreenWeb setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"greenComponent"];
    [forestGreenWeb setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"blueComponent"];
    return forestGreenWeb;
}

+ (UIColor *)frenchBeige {
    UIColor *frenchBeige = [UIColor colorWithRed:65.0f/100.0f green:48.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
    [frenchBeige setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"redComponent"];
    [frenchBeige setValue:[NSNumber numberWithFloat:48.0f/100.0f] forKey:@"greenComponent"];
    [frenchBeige setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"blueComponent"];
    return frenchBeige;
}

+ (UIColor *)frenchBistre {
    UIColor *frenchBistre = [UIColor colorWithRed:52.0f/100.0f green:43.0f/100.0f blue:3.0f/10.0f alpha:1.0f];
    [frenchBistre setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"redComponent"];
    [frenchBistre setValue:[NSNumber numberWithFloat:43.0f/100.0f] forKey:@"greenComponent"];
    [frenchBistre setValue:[NSNumber numberWithFloat:3.0f/10.0f] forKey:@"blueComponent"];
    return frenchBistre;
}

+ (UIColor *)frenchBlue {
    UIColor *frenchBlue = [UIColor colorWithRed:0.0f green:45.0f/100.0f blue:73.0f/100.0f alpha:1.0f];
    [frenchBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [frenchBlue setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"greenComponent"];
    [frenchBlue setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"blueComponent"];
    return frenchBlue;
}

+ (UIColor *)frenchFuchsia {
    UIColor *frenchFuchsia = [UIColor colorWithRed:99.0f/100.0f green:0.25f blue:57.0f/100.0f alpha:1.0f];
    [frenchFuchsia setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"redComponent"];
    [frenchFuchsia setValue:[NSNumber numberWithFloat:0.25f] forKey:@"greenComponent"];
    [frenchFuchsia setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"blueComponent"];
    return frenchFuchsia;
}

+ (UIColor *)frenchLilac {
    UIColor *frenchLilac = [UIColor colorWithRed:53.0f/100.0f green:38.0f/100.0f blue:56.0f/100.0f alpha:1.0f];
    [frenchLilac setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"redComponent"];
    [frenchLilac setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"greenComponent"];
    [frenchLilac setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"blueComponent"];
    return frenchLilac;
}

+ (UIColor *)frenchLime {
    UIColor *frenchLime = [UIColor colorWithRed:62.0f/100.0f green:99.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
    [frenchLime setValue:[NSNumber numberWithFloat:62.0f/100.0f] forKey:@"redComponent"];
    [frenchLime setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"greenComponent"];
    [frenchLime setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"blueComponent"];
    return frenchLime;
}

+ (UIColor *)frenchMauve {
    UIColor *frenchMauve = [UIColor colorWithRed:83.0f/100.0f green:45.0f/100.0f blue:83.0f/100.0f alpha:1.0f];
    [frenchMauve setValue:[NSNumber numberWithFloat:83.0f/100.0f] forKey:@"redComponent"];
    [frenchMauve setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"greenComponent"];
    [frenchMauve setValue:[NSNumber numberWithFloat:83.0f/100.0f] forKey:@"blueComponent"];
    return frenchMauve;
}

+ (UIColor *)frenchPink {
    UIColor *frenchPink = [UIColor colorWithRed:99.0f/100.0f green:42.0f/100.0f blue:62.0f/100.0f alpha:1.0f];
    [frenchPink setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"redComponent"];
    [frenchPink setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"greenComponent"];
    [frenchPink setValue:[NSNumber numberWithFloat:62.0f/100.0f] forKey:@"blueComponent"];
    return frenchPink;
}

+ (UIColor *)frenchPlum {
    UIColor *frenchPlum = [UIColor colorWithRed:51.0f/100.0f green:8.0f/100.0f blue:0.333f alpha:1.0f];
    [frenchPlum setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"redComponent"];
    [frenchPlum setValue:[NSNumber numberWithFloat:8.0f/100.0f] forKey:@"greenComponent"];
    [frenchPlum setValue:[NSNumber numberWithFloat:0.333f] forKey:@"blueComponent"];
    return frenchPlum;
}

+ (UIColor *)frenchPuce {
    UIColor *frenchPuce = [UIColor colorWithRed:31.0f/100.0f green:9.0f/100.0f blue:4.0f/100.0f alpha:1.0f];
    [frenchPuce setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"redComponent"];
    [frenchPuce setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"greenComponent"];
    [frenchPuce setValue:[NSNumber numberWithFloat:4.0f/100.0f] forKey:@"blueComponent"];
    return frenchPuce;
}

+ (UIColor *)frenchRaspberry {
    UIColor *frenchRaspberry = [UIColor colorWithRed:78.0f/100.0f green:0.1667f blue:28.0f/100.0f alpha:1.0f];
    [frenchRaspberry setValue:[NSNumber numberWithFloat:78.0f/100.0f] forKey:@"redComponent"];
    [frenchRaspberry setValue:[NSNumber numberWithFloat:0.1667f] forKey:@"greenComponent"];
    [frenchRaspberry setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"blueComponent"];
    return frenchRaspberry;
}

+ (UIColor *)frenchRose {
    UIColor *frenchRose = [UIColor colorWithRed:96.0f/100.0f green:29.0f/100.0f blue:54.0f/100.0f alpha:1.0f];
    [frenchRose setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"redComponent"];
    [frenchRose setValue:[NSNumber numberWithFloat:29.0f/100.0f] forKey:@"greenComponent"];
    [frenchRose setValue:[NSNumber numberWithFloat:54.0f/100.0f] forKey:@"blueComponent"];
    return frenchRose;
}

+ (UIColor *)frenchSkyBlue {
    UIColor *frenchSkyBlue = [UIColor colorWithRed:47.0f/100.0f green:71.0f/100.0f blue:1.0f alpha:1.0f];
    [frenchSkyBlue setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"redComponent"];
    [frenchSkyBlue setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"greenComponent"];
    [frenchSkyBlue setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return frenchSkyBlue;
}

+ (UIColor *)frenchViolet {
    UIColor *frenchViolet = [UIColor colorWithRed:53.0f/100.0f green:2.0f/100.0f blue:81.0f/100.0f alpha:1.0f];
    [frenchViolet setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"redComponent"];
    [frenchViolet setValue:[NSNumber numberWithFloat:2.0f/100.0f] forKey:@"greenComponent"];
    [frenchViolet setValue:[NSNumber numberWithFloat:81.0f/100.0f] forKey:@"blueComponent"];
    return frenchViolet;
}

+ (UIColor *)frenchWine {
    UIColor *frenchWine = [UIColor colorWithRed:0.667f green:12.0f/100.0f blue:27.0f/100.0f alpha:1.0f];
    [frenchWine setValue:[NSNumber numberWithFloat:0.667f] forKey:@"redComponent"];
    [frenchWine setValue:[NSNumber numberWithFloat:12.0f/100.0f] forKey:@"greenComponent"];
    [frenchWine setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"blueComponent"];
    return frenchWine;
}

+ (UIColor *)freshAir {
    UIColor *freshAir = [UIColor colorWithRed:65.0f/100.0f green:91.0f/100.0f blue:1.0f alpha:1.0f];
    [freshAir setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"redComponent"];
    [freshAir setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"greenComponent"];
    [freshAir setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return freshAir;
}

+ (UIColor *)fuchsia {
    UIColor *fuchsia = [UIColor colorWithRed:1.0f green:0.0f blue:1.0f alpha:1.0f];
    [fuchsia setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [fuchsia setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [fuchsia setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return fuchsia;
}

+ (UIColor *)fuchsiaCrayola {
    UIColor *fuchsiaCrayola = [UIColor colorWithRed:76.0f/100.0f green:0.333f blue:76.0f/100.0f alpha:1.0f];
    [fuchsiaCrayola setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"redComponent"];
    [fuchsiaCrayola setValue:[NSNumber numberWithFloat:0.333f] forKey:@"greenComponent"];
    [fuchsiaCrayola setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"blueComponent"];
    return fuchsiaCrayola;
}

+ (UIColor *)fuchsiaPink {
    UIColor *fuchsiaPink = [UIColor colorWithRed:1.0f green:47.0f/100.0f blue:1.0f alpha:1.0f];
    [fuchsiaPink setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [fuchsiaPink setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"greenComponent"];
    [fuchsiaPink setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return fuchsiaPink;
}

+ (UIColor *)fuchsiaPurple {
    UIColor *fuchsiaPurple = [UIColor colorWithRed:8.0f/10.0f green:22.0f/100.0f blue:48.0f/100.0f alpha:1.0f];
    [fuchsiaPurple setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [fuchsiaPurple setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"greenComponent"];
    [fuchsiaPurple setValue:[NSNumber numberWithFloat:48.0f/100.0f] forKey:@"blueComponent"];
    return fuchsiaPurple;
}

+ (UIColor *)fuchsiaRose {
    UIColor *fuchsiaRose = [UIColor colorWithRed:78.0f/100.0f green:26.0f/100.0f blue:46.0f/100.0f alpha:1.0f];
    [fuchsiaRose setValue:[NSNumber numberWithFloat:78.0f/100.0f] forKey:@"redComponent"];
    [fuchsiaRose setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"greenComponent"];
    [fuchsiaRose setValue:[NSNumber numberWithFloat:46.0f/100.0f] forKey:@"blueComponent"];
    return fuchsiaRose;
}

+ (UIColor *)fulvous {
    UIColor *fulvous = [UIColor colorWithRed:89.0f/100.0f green:52.0f/100.0f blue:0.0f alpha:1.0f];
    [fulvous setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"redComponent"];
    [fulvous setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"greenComponent"];
    [fulvous setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return fulvous;
}

+ (UIColor *)fuzzyWuzzy {
    UIColor *fuzzyWuzzy = [UIColor colorWithRed:8.0f/10.0f green:4.0f/10.0f blue:4.0f/10.0f alpha:1.0f];
    [fuzzyWuzzy setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [fuzzyWuzzy setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"greenComponent"];
    [fuzzyWuzzy setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"blueComponent"];
    return fuzzyWuzzy;
}

+ (UIColor *)gamboge {
    UIColor *gamboge = [UIColor colorWithRed:89.0f/100.0f green:61.0f/100.0f blue:6.0f/100.0f alpha:1.0f];
    [gamboge setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"redComponent"];
    [gamboge setValue:[NSNumber numberWithFloat:61.0f/100.0f] forKey:@"greenComponent"];
    [gamboge setValue:[NSNumber numberWithFloat:6.0f/100.0f] forKey:@"blueComponent"];
    return gamboge;
}

+ (UIColor *)gambogeOrangeBrown {
    UIColor *gambogeOrangeBrown = [UIColor colorWithRed:6.0f/10.0f green:4.0f/10.0f blue:0.0f alpha:1.0f];
    [gambogeOrangeBrown setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"redComponent"];
    [gambogeOrangeBrown setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"greenComponent"];
    [gambogeOrangeBrown setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return gambogeOrangeBrown;
}

+ (UIColor *)genericViridian {
    UIColor *genericViridian = [UIColor colorWithRed:0.0f green:0.5f blue:4.0f/10.0f alpha:1.0f];
    [genericViridian setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [genericViridian setValue:[NSNumber numberWithFloat:0.5f] forKey:@"greenComponent"];
    [genericViridian setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"blueComponent"];
    return genericViridian;
}

+ (UIColor *)ghostWhite {
    UIColor *ghostWhite = [UIColor colorWithRed:97.0f/100.0f green:97.0f/100.0f blue:1.0f alpha:1.0f];
    [ghostWhite setValue:[NSNumber numberWithFloat:97.0f/100.0f] forKey:@"redComponent"];
    [ghostWhite setValue:[NSNumber numberWithFloat:97.0f/100.0f] forKey:@"greenComponent"];
    [ghostWhite setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return ghostWhite;
}

+ (UIColor *)giantsOrange {
    UIColor *giantsOrange = [UIColor colorWithRed:1.0f green:35.0f/100.0f blue:11.0f/100.0f alpha:1.0f];
    [giantsOrange setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [giantsOrange setValue:[NSNumber numberWithFloat:35.0f/100.0f] forKey:@"greenComponent"];
    [giantsOrange setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"blueComponent"];
    return giantsOrange;
}

+ (UIColor *)grussrel {
    UIColor *grussrel = [UIColor colorWithRed:69.0f/100.0f green:4.0f/10.0f blue:0.0f alpha:1.0f];
    [grussrel setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"redComponent"];
    [grussrel setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"greenComponent"];
    [grussrel setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return grussrel;
}

+ (UIColor *)glaucous {
    UIColor *glaucous = [UIColor colorWithRed:38.0f/100.0f green:51.0f/100.0f blue:71.0f/100.0f alpha:1.0f];
    [glaucous setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"redComponent"];
    [glaucous setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"greenComponent"];
    [glaucous setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"blueComponent"];
    return glaucous;
}

+ (UIColor *)glitter {
    UIColor *glitter = [UIColor colorWithRed:9.0f/10.0f green:91.0f/100.0f blue:98.0f/100.0f alpha:1.0f];
    [glitter setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"redComponent"];
    [glitter setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"greenComponent"];
    [glitter setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"blueComponent"];
    return glitter;
}

+ (UIColor *)gOGreen {
    UIColor *gOGreen = [UIColor colorWithRed:0.0f green:0.667f blue:4.0f/10.0f alpha:1.0f];
    [gOGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [gOGreen setValue:[NSNumber numberWithFloat:0.667f] forKey:@"greenComponent"];
    [gOGreen setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"blueComponent"];
    return gOGreen;
}

+ (UIColor *)goldMetallic {
    UIColor *goldMetallic = [UIColor colorWithRed:83.0f/100.0f green:69.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
    [goldMetallic setValue:[NSNumber numberWithFloat:83.0f/100.0f] forKey:@"redComponent"];
    [goldMetallic setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"greenComponent"];
    [goldMetallic setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"blueComponent"];
    return goldMetallic;
}

+ (UIColor *)goldWebGolden {
    UIColor *goldWebGolden = [UIColor colorWithRed:1.0f green:84.0f/100.0f blue:0.0f alpha:1.0f];
    [goldWebGolden setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [goldWebGolden setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"greenComponent"];
    [goldWebGolden setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return goldWebGolden;
}

+ (UIColor *)goldFusion {
    UIColor *goldFusion = [UIColor colorWithRed:52.0f/100.0f green:46.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
    [goldFusion setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"redComponent"];
    [goldFusion setValue:[NSNumber numberWithFloat:46.0f/100.0f] forKey:@"greenComponent"];
    [goldFusion setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"blueComponent"];
    return goldFusion;
}

+ (UIColor *)goldenBrown {
    UIColor *goldenBrown = [UIColor colorWithRed:6.0f/10.0f green:4.0f/10.0f blue:8.0f/100.0f alpha:1.0f];
    [goldenBrown setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"redComponent"];
    [goldenBrown setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"greenComponent"];
    [goldenBrown setValue:[NSNumber numberWithFloat:8.0f/100.0f] forKey:@"blueComponent"];
    return goldenBrown;
}

+ (UIColor *)goldenPoppy {
    UIColor *goldenPoppy = [UIColor colorWithRed:99.0f/100.0f green:76.0f/100.0f blue:0.0f alpha:1.0f];
    [goldenPoppy setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"redComponent"];
    [goldenPoppy setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"greenComponent"];
    [goldenPoppy setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return goldenPoppy;
}

+ (UIColor *)goldenYellow {
    UIColor *goldenYellow = [UIColor colorWithRed:1.0f green:87.0f/100.0f blue:0.0f alpha:1.0f];
    [goldenYellow setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [goldenYellow setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"greenComponent"];
    [goldenYellow setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return goldenYellow;
}

+ (UIColor *)goldenrod {
    UIColor *goldenrod = [UIColor colorWithRed:85.0f/100.0f green:65.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
    [goldenrod setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"redComponent"];
    [goldenrod setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"greenComponent"];
    [goldenrod setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"blueComponent"];
    return goldenrod;
}

+ (UIColor *)grannySmithApple {
    UIColor *grannySmithApple = [UIColor colorWithRed:66.0f/100.0f green:89.0f/100.0f blue:63.0f/100.0f alpha:1.0f];
    [grannySmithApple setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"redComponent"];
    [grannySmithApple setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"greenComponent"];
    [grannySmithApple setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"blueComponent"];
    return grannySmithApple;
}

+ (UIColor *)grape {
    UIColor *grape = [UIColor colorWithRed:44.0f/100.0f green:18.0f/100.0f blue:66.0f/100.0f alpha:1.0f];
    [grape setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"redComponent"];
    [grape setValue:[NSNumber numberWithFloat:18.0f/100.0f] forKey:@"greenComponent"];
    [grape setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"blueComponent"];
    return grape;
}

+ (UIColor *)gray {
    UIColor *gray = [UIColor colorWithRed:0.5f green:0.5f blue:0.5f alpha:1.0f];
    [gray setValue:[NSNumber numberWithFloat:0.5f] forKey:@"redComponent"];
    [gray setValue:[NSNumber numberWithFloat:0.5f] forKey:@"greenComponent"];
    [gray setValue:[NSNumber numberWithFloat:0.5f] forKey:@"blueComponent"];
    return gray;
}

+ (UIColor *)grayHTMLCSSGray {
    UIColor *grayHTMLCSSGray = [UIColor colorWithRed:0.5f green:0.5f blue:0.5f alpha:1.0f];
    [grayHTMLCSSGray setValue:[NSNumber numberWithFloat:0.5f] forKey:@"redComponent"];
    [grayHTMLCSSGray setValue:[NSNumber numberWithFloat:0.5f] forKey:@"greenComponent"];
    [grayHTMLCSSGray setValue:[NSNumber numberWithFloat:0.5f] forKey:@"blueComponent"];
    return grayHTMLCSSGray;
}

+ (UIColor *)grayX11Gray {
    UIColor *grayX11Gray = [UIColor colorWithRed:0.75f green:0.75f blue:0.75f alpha:1.0f];
    [grayX11Gray setValue:[NSNumber numberWithFloat:0.75f] forKey:@"redComponent"];
    [grayX11Gray setValue:[NSNumber numberWithFloat:0.75f] forKey:@"greenComponent"];
    [grayX11Gray setValue:[NSNumber numberWithFloat:0.75f] forKey:@"blueComponent"];
    return grayX11Gray;
}

+ (UIColor *)grayAsparagus {
    UIColor *grayAsparagus = [UIColor colorWithRed:27.0f/100.0f green:35.0f/100.0f blue:27.0f/100.0f alpha:1.0f];
    [grayAsparagus setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"redComponent"];
    [grayAsparagus setValue:[NSNumber numberWithFloat:35.0f/100.0f] forKey:@"greenComponent"];
    [grayAsparagus setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"blueComponent"];
    return grayAsparagus;
}

+ (UIColor *)grayBlue {
    UIColor *grayBlue = [UIColor colorWithRed:55.0f/100.0f green:57.0f/100.0f blue:0.667f alpha:1.0f];
    [grayBlue setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"redComponent"];
    [grayBlue setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"greenComponent"];
    [grayBlue setValue:[NSNumber numberWithFloat:0.667f] forKey:@"blueComponent"];
    return grayBlue;
}

+ (UIColor *)greenColorWheelX11Green {
    UIColor *greenColorWheelX11Green = [UIColor colorWithRed:0.0f green:1.0f blue:0.0f alpha:1.0f];
    [greenColorWheelX11Green setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [greenColorWheelX11Green setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [greenColorWheelX11Green setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return greenColorWheelX11Green;
}

+ (UIColor *)greenCrayola {
    UIColor *greenCrayola = [UIColor colorWithRed:11.0f/100.0f green:0.667f blue:47.0f/100.0f alpha:1.0f];
    [greenCrayola setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"redComponent"];
    [greenCrayola setValue:[NSNumber numberWithFloat:0.667f] forKey:@"greenComponent"];
    [greenCrayola setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"blueComponent"];
    return greenCrayola;
}

+ (UIColor *)greenHTMLCSSColor {
    UIColor *greenHTMLCSSColor = [UIColor colorWithRed:0.0f green:0.5f blue:0.0f alpha:1.0f];
    [greenHTMLCSSColor setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [greenHTMLCSSColor setValue:[NSNumber numberWithFloat:0.5f] forKey:@"greenComponent"];
    [greenHTMLCSSColor setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return greenHTMLCSSColor;
}

+ (UIColor *)greenMunsell {
    UIColor *greenMunsell = [UIColor colorWithRed:0.0f green:66.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
    [greenMunsell setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [greenMunsell setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"greenComponent"];
    [greenMunsell setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"blueComponent"];
    return greenMunsell;
}

+ (UIColor *)greenNCS {
    UIColor *greenNCS = [UIColor colorWithRed:0.0f green:62.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
    [greenNCS setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [greenNCS setValue:[NSNumber numberWithFloat:62.0f/100.0f] forKey:@"greenComponent"];
    [greenNCS setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"blueComponent"];
    return greenNCS;
}

+ (UIColor *)greenPantone {
    UIColor *greenPantone = [UIColor colorWithRed:0.0f green:68.0f/100.0f blue:26.0f/100.0f alpha:1.0f];
    [greenPantone setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [greenPantone setValue:[NSNumber numberWithFloat:68.0f/100.0f] forKey:@"greenComponent"];
    [greenPantone setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"blueComponent"];
    return greenPantone;
}

+ (UIColor *)greenPigment {
    UIColor *greenPigment = [UIColor colorWithRed:0.0f green:65.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
    [greenPigment setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [greenPigment setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"greenComponent"];
    [greenPigment setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"blueComponent"];
    return greenPigment;
}

+ (UIColor *)greenRYB {
    UIColor *greenRYB = [UIColor colorWithRed:4.0f/10.0f green:69.0f/100.0f blue:2.0f/10.0f alpha:1.0f];
    [greenRYB setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"redComponent"];
    [greenRYB setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"greenComponent"];
    [greenRYB setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"blueComponent"];
    return greenRYB;
}

+ (UIColor *)greenBlue {
    UIColor *greenBlue = [UIColor colorWithRed:7.0f/100.0f green:39.0f/100.0f blue:71.0f/100.0f alpha:1.0f];
    [greenBlue setValue:[NSNumber numberWithFloat:7.0f/100.0f] forKey:@"redComponent"];
    [greenBlue setValue:[NSNumber numberWithFloat:39.0f/100.0f] forKey:@"greenComponent"];
    [greenBlue setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"blueComponent"];
    return greenBlue;
}

+ (UIColor *)greenCyan {
    UIColor *greenCyan = [UIColor colorWithRed:0.0f green:6.0f/10.0f blue:4.0f/10.0f alpha:1.0f];
    [greenCyan setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [greenCyan setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [greenCyan setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"blueComponent"];
    return greenCyan;
}

+ (UIColor *)greenYellow {
    UIColor *greenYellow = [UIColor colorWithRed:68.0f/100.0f green:1.0f blue:18.0f/100.0f alpha:1.0f];
    [greenYellow setValue:[NSNumber numberWithFloat:68.0f/100.0f] forKey:@"redComponent"];
    [greenYellow setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [greenYellow setValue:[NSNumber numberWithFloat:18.0f/100.0f] forKey:@"blueComponent"];
    return greenYellow;
}

+ (UIColor *)grizzly {
    UIColor *grizzly = [UIColor colorWithRed:53.0f/100.0f green:35.0f/100.0f blue:9.0f/100.0f alpha:1.0f];
    [grizzly setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"redComponent"];
    [grizzly setValue:[NSNumber numberWithFloat:35.0f/100.0f] forKey:@"greenComponent"];
    [grizzly setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"blueComponent"];
    return grizzly;
}

+ (UIColor *)grullo {
    UIColor *grullo = [UIColor colorWithRed:66.0f/100.0f green:6.0f/10.0f blue:53.0f/100.0f alpha:1.0f];
    [grullo setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"redComponent"];
    [grullo setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [grullo setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"blueComponent"];
    return grullo;
}

+ (UIColor *)guppieGreen {
    UIColor *guppieGreen = [UIColor colorWithRed:0.0f green:1.0f blue:0.5f alpha:1.0f];
    [guppieGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [guppieGreen setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [guppieGreen setValue:[NSNumber numberWithFloat:0.5f] forKey:@"blueComponent"];
    return guppieGreen;
}

+ (UIColor *)halayàÚbe {
    UIColor *halayàÚbe = [UIColor colorWithRed:4.0f/10.0f green:22.0f/100.0f blue:0.333f alpha:1.0f];
    [halayàÚbe setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"redComponent"];
    [halayàÚbe setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"greenComponent"];
    [halayàÚbe setValue:[NSNumber numberWithFloat:0.333f] forKey:@"blueComponent"];
    return halayàÚbe;
}

+ (UIColor *)hanBlue {
    UIColor *hanBlue = [UIColor colorWithRed:27.0f/100.0f green:42.0f/100.0f blue:81.0f/100.0f alpha:1.0f];
    [hanBlue setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"redComponent"];
    [hanBlue setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"greenComponent"];
    [hanBlue setValue:[NSNumber numberWithFloat:81.0f/100.0f] forKey:@"blueComponent"];
    return hanBlue;
}

+ (UIColor *)hanPurple {
    UIColor *hanPurple = [UIColor colorWithRed:32.0f/100.0f green:9.0f/100.0f blue:98.0f/100.0f alpha:1.0f];
    [hanPurple setValue:[NSNumber numberWithFloat:32.0f/100.0f] forKey:@"redComponent"];
    [hanPurple setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"greenComponent"];
    [hanPurple setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"blueComponent"];
    return hanPurple;
}

+ (UIColor *)hansaYellow {
    UIColor *hansaYellow = [UIColor colorWithRed:91.0f/100.0f green:84.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
    [hansaYellow setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"redComponent"];
    [hansaYellow setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"greenComponent"];
    [hansaYellow setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"blueComponent"];
    return hansaYellow;
}

+ (UIColor *)harlequin {
    UIColor *harlequin = [UIColor colorWithRed:0.25f green:1.0f blue:0.0f alpha:1.0f];
    [harlequin setValue:[NSNumber numberWithFloat:0.25f] forKey:@"redComponent"];
    [harlequin setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [harlequin setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return harlequin;
}

+ (UIColor *)harlequinGreen {
    UIColor *harlequinGreen = [UIColor colorWithRed:27.0f/100.0f green:8.0f/10.0f blue:9.0f/100.0f alpha:1.0f];
    [harlequinGreen setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"redComponent"];
    [harlequinGreen setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"greenComponent"];
    [harlequinGreen setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"blueComponent"];
    return harlequinGreen;
}

+ (UIColor *)harvardCrimson {
    UIColor *harvardCrimson = [UIColor colorWithRed:79.0f/100.0f green:0.0f blue:9.0f/100.0f alpha:1.0f];
    [harvardCrimson setValue:[NSNumber numberWithFloat:79.0f/100.0f] forKey:@"redComponent"];
    [harvardCrimson setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [harvardCrimson setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"blueComponent"];
    return harvardCrimson;
}

+ (UIColor *)harvestGold {
    UIColor *harvestGold = [UIColor colorWithRed:85.0f/100.0f green:57.0f/100.0f blue:0.0f alpha:1.0f];
    [harvestGold setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"redComponent"];
    [harvestGold setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"greenComponent"];
    [harvestGold setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return harvestGold;
}

+ (UIColor *)heartGold {
    UIColor *heartGold = [UIColor colorWithRed:0.5f green:0.5f blue:0.0f alpha:1.0f];
    [heartGold setValue:[NSNumber numberWithFloat:0.5f] forKey:@"redComponent"];
    [heartGold setValue:[NSNumber numberWithFloat:0.5f] forKey:@"greenComponent"];
    [heartGold setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return heartGold;
}

+ (UIColor *)heliotrope {
    UIColor *heliotrope = [UIColor colorWithRed:87.0f/100.0f green:45.0f/100.0f blue:1.0f alpha:1.0f];
    [heliotrope setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"redComponent"];
    [heliotrope setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"greenComponent"];
    [heliotrope setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return heliotrope;
}

+ (UIColor *)heliotropeGray {
    UIColor *heliotropeGray = [UIColor colorWithRed:0.667f green:6.0f/10.0f blue:66.0f/100.0f alpha:1.0f];
    [heliotropeGray setValue:[NSNumber numberWithFloat:0.667f] forKey:@"redComponent"];
    [heliotropeGray setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [heliotropeGray setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"blueComponent"];
    return heliotropeGray;
}

+ (UIColor *)heliotropeMagenta {
    UIColor *heliotropeMagenta = [UIColor colorWithRed:0.667f green:0.0f blue:73.0f/100.0f alpha:1.0f];
    [heliotropeMagenta setValue:[NSNumber numberWithFloat:0.667f] forKey:@"redComponent"];
    [heliotropeMagenta setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [heliotropeMagenta setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"blueComponent"];
    return heliotropeMagenta;
}

+ (UIColor *)hollywoodCerise {
    UIColor *hollywoodCerise = [UIColor colorWithRed:96.0f/100.0f green:0.0f blue:63.0f/100.0f alpha:1.0f];
    [hollywoodCerise setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"redComponent"];
    [hollywoodCerise setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [hollywoodCerise setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"blueComponent"];
    return hollywoodCerise;
}

+ (UIColor *)honeydew {
    UIColor *honeydew = [UIColor colorWithRed:94.0f/100.0f green:1.0f blue:94.0f/100.0f alpha:1.0f];
    [honeydew setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"redComponent"];
    [honeydew setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [honeydew setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"blueComponent"];
    return honeydew;
}

+ (UIColor *)honoluluBlue {
    UIColor *honoluluBlue = [UIColor colorWithRed:0.0f green:43.0f/100.0f blue:69.0f/100.0f alpha:1.0f];
    [honoluluBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [honoluluBlue setValue:[NSNumber numberWithFloat:43.0f/100.0f] forKey:@"greenComponent"];
    [honoluluBlue setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"blueComponent"];
    return honoluluBlue;
}

+ (UIColor *)hookersGreen {
    UIColor *hookersGreen = [UIColor colorWithRed:29.0f/100.0f green:47.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
    [hookersGreen setValue:[NSNumber numberWithFloat:29.0f/100.0f] forKey:@"redComponent"];
    [hookersGreen setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"greenComponent"];
    [hookersGreen setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"blueComponent"];
    return hookersGreen;
}

+ (UIColor *)hotMagenta {
    UIColor *hotMagenta = [UIColor colorWithRed:1.0f green:11.0f/100.0f blue:81.0f/100.0f alpha:1.0f];
    [hotMagenta setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [hotMagenta setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"greenComponent"];
    [hotMagenta setValue:[NSNumber numberWithFloat:81.0f/100.0f] forKey:@"blueComponent"];
    return hotMagenta;
}

+ (UIColor *)hotPink {
    UIColor *hotPink = [UIColor colorWithRed:1.0f green:41.0f/100.0f blue:71.0f/100.0f alpha:1.0f];
    [hotPink setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [hotPink setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"greenComponent"];
    [hotPink setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"blueComponent"];
    return hotPink;
}

+ (UIColor *)hunterGreen {
    UIColor *hunterGreen = [UIColor colorWithRed:21.0f/100.0f green:37.0f/100.0f blue:23.0f/100.0f alpha:1.0f];
    [hunterGreen setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"redComponent"];
    [hunterGreen setValue:[NSNumber numberWithFloat:37.0f/100.0f] forKey:@"greenComponent"];
    [hunterGreen setValue:[NSNumber numberWithFloat:23.0f/100.0f] forKey:@"blueComponent"];
    return hunterGreen;
}

+ (UIColor *)iceberg {
    UIColor *iceberg = [UIColor colorWithRed:44.0f/100.0f green:65.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
    [iceberg setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"redComponent"];
    [iceberg setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"greenComponent"];
    [iceberg setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"blueComponent"];
    return iceberg;
}

+ (UIColor *)icterine {
    UIColor *icterine = [UIColor colorWithRed:99.0f/100.0f green:97.0f/100.0f blue:37.0f/100.0f alpha:1.0f];
    [icterine setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"redComponent"];
    [icterine setValue:[NSNumber numberWithFloat:97.0f/100.0f] forKey:@"greenComponent"];
    [icterine setValue:[NSNumber numberWithFloat:37.0f/100.0f] forKey:@"blueComponent"];
    return icterine;
}

+ (UIColor *)illuminatingEmerald {
    UIColor *illuminatingEmerald = [UIColor colorWithRed:19.0f/100.0f green:57.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
    [illuminatingEmerald setValue:[NSNumber numberWithFloat:19.0f/100.0f] forKey:@"redComponent"];
    [illuminatingEmerald setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"greenComponent"];
    [illuminatingEmerald setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"blueComponent"];
    return illuminatingEmerald;
}

+ (UIColor *)imperial {
    UIColor *imperial = [UIColor colorWithRed:38.0f/100.0f green:18.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
    [imperial setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"redComponent"];
    [imperial setValue:[NSNumber numberWithFloat:18.0f/100.0f] forKey:@"greenComponent"];
    [imperial setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"blueComponent"];
    return imperial;
}

+ (UIColor *)imperialBlue {
    UIColor *imperialBlue = [UIColor colorWithRed:0.0f green:14.0f/100.0f blue:58.0f/100.0f alpha:1.0f];
    [imperialBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [imperialBlue setValue:[NSNumber numberWithFloat:14.0f/100.0f] forKey:@"greenComponent"];
    [imperialBlue setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"blueComponent"];
    return imperialBlue;
}

+ (UIColor *)imperialPurple {
    UIColor *imperialPurple = [UIColor colorWithRed:4.0f/10.0f green:1.0f/100.0f blue:24.0f/100.0f alpha:1.0f];
    [imperialPurple setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"redComponent"];
    [imperialPurple setValue:[NSNumber numberWithFloat:1.0f/100.0f] forKey:@"greenComponent"];
    [imperialPurple setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"blueComponent"];
    return imperialPurple;
}

+ (UIColor *)imperialRed {
    UIColor *imperialRed = [UIColor colorWithRed:93.0f/100.0f green:16.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
    [imperialRed setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"redComponent"];
    [imperialRed setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"greenComponent"];
    [imperialRed setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"blueComponent"];
    return imperialRed;
}

+ (UIColor *)inchworm {
    UIColor *inchworm = [UIColor colorWithRed:7.0f/10.0f green:93.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
    [inchworm setValue:[NSNumber numberWithFloat:7.0f/10.0f] forKey:@"redComponent"];
    [inchworm setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"greenComponent"];
    [inchworm setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"blueComponent"];
    return inchworm;
}

+ (UIColor *)independence {
    UIColor *independence = [UIColor colorWithRed:3.0f/10.0f green:32.0f/100.0f blue:43.0f/100.0f alpha:1.0f];
    [independence setValue:[NSNumber numberWithFloat:3.0f/10.0f] forKey:@"redComponent"];
    [independence setValue:[NSNumber numberWithFloat:32.0f/100.0f] forKey:@"greenComponent"];
    [independence setValue:[NSNumber numberWithFloat:43.0f/100.0f] forKey:@"blueComponent"];
    return independence;
}

+ (UIColor *)indiaGreen {
    UIColor *indiaGreen = [UIColor colorWithRed:7.0f/100.0f green:53.0f/100.0f blue:3.0f/100.0f alpha:1.0f];
    [indiaGreen setValue:[NSNumber numberWithFloat:7.0f/100.0f] forKey:@"redComponent"];
    [indiaGreen setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"greenComponent"];
    [indiaGreen setValue:[NSNumber numberWithFloat:3.0f/100.0f] forKey:@"blueComponent"];
    return indiaGreen;
}

+ (UIColor *)indianRed {
    UIColor *indianRed = [UIColor colorWithRed:8.0f/10.0f green:36.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
    [indianRed setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [indianRed setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"greenComponent"];
    [indianRed setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"blueComponent"];
    return indianRed;
}

+ (UIColor *)indianYellow {
    UIColor *indianYellow = [UIColor colorWithRed:89.0f/100.0f green:66.0f/100.0f blue:34.0f/100.0f alpha:1.0f];
    [indianYellow setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"redComponent"];
    [indianYellow setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"greenComponent"];
    [indianYellow setValue:[NSNumber numberWithFloat:34.0f/100.0f] forKey:@"blueComponent"];
    return indianYellow;
}

+ (UIColor *)indigo {
    UIColor *indigo = [UIColor colorWithRed:44.0f/100.0f green:0.0f blue:1.0f alpha:1.0f];
    [indigo setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"redComponent"];
    [indigo setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [indigo setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return indigo;
}

+ (UIColor *)indigoDye {
    UIColor *indigoDye = [UIColor colorWithRed:4.0f/100.0f green:12.0f/100.0f blue:57.0f/100.0f alpha:1.0f];
    [indigoDye setValue:[NSNumber numberWithFloat:4.0f/100.0f] forKey:@"redComponent"];
    [indigoDye setValue:[NSNumber numberWithFloat:12.0f/100.0f] forKey:@"greenComponent"];
    [indigoDye setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"blueComponent"];
    return indigoDye;
}

+ (UIColor *)indigoWeb {
    UIColor *indigoWeb = [UIColor colorWithRed:29.0f/100.0f green:0.0f blue:51.0f/100.0f alpha:1.0f];
    [indigoWeb setValue:[NSNumber numberWithFloat:29.0f/100.0f] forKey:@"redComponent"];
    [indigoWeb setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [indigoWeb setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"blueComponent"];
    return indigoWeb;
}

+ (UIColor *)internationalKleinBlue {
    UIColor *internationalKleinBlue = [UIColor colorWithRed:0.0f green:18.0f/100.0f blue:65.0f/100.0f alpha:1.0f];
    [internationalKleinBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [internationalKleinBlue setValue:[NSNumber numberWithFloat:18.0f/100.0f] forKey:@"greenComponent"];
    [internationalKleinBlue setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"blueComponent"];
    return internationalKleinBlue;
}

+ (UIColor *)internationalOrangeAerospace {
    UIColor *internationalOrangeAerospace = [UIColor colorWithRed:1.0f green:31.0f/100.0f blue:0.0f alpha:1.0f];
    [internationalOrangeAerospace setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [internationalOrangeAerospace setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"greenComponent"];
    [internationalOrangeAerospace setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return internationalOrangeAerospace;
}

+ (UIColor *)internationalOrangeEngineering {
    UIColor *internationalOrangeEngineering = [UIColor colorWithRed:73.0f/100.0f green:9.0f/100.0f blue:5.0f/100.0f alpha:1.0f];
    [internationalOrangeEngineering setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"redComponent"];
    [internationalOrangeEngineering setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"greenComponent"];
    [internationalOrangeEngineering setValue:[NSNumber numberWithFloat:5.0f/100.0f] forKey:@"blueComponent"];
    return internationalOrangeEngineering;
}

+ (UIColor *)internationalOrangeGoldenGateBridge {
    UIColor *internationalOrangeGoldenGateBridge = [UIColor colorWithRed:0.75f green:21.0f/100.0f blue:0.1667f alpha:1.0f];
    [internationalOrangeGoldenGateBridge setValue:[NSNumber numberWithFloat:0.75f] forKey:@"redComponent"];
    [internationalOrangeGoldenGateBridge setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"greenComponent"];
    [internationalOrangeGoldenGateBridge setValue:[NSNumber numberWithFloat:0.1667f] forKey:@"blueComponent"];
    return internationalOrangeGoldenGateBridge;
}

+ (UIColor *)iris {
    UIColor *iris = [UIColor colorWithRed:35.0f/100.0f green:31.0f/100.0f blue:81.0f/100.0f alpha:1.0f];
    [iris setValue:[NSNumber numberWithFloat:35.0f/100.0f] forKey:@"redComponent"];
    [iris setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"greenComponent"];
    [iris setValue:[NSNumber numberWithFloat:81.0f/100.0f] forKey:@"blueComponent"];
    return iris;
}

+ (UIColor *)irresistible {
    UIColor *irresistible = [UIColor colorWithRed:7.0f/10.0f green:27.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
    [irresistible setValue:[NSNumber numberWithFloat:7.0f/10.0f] forKey:@"redComponent"];
    [irresistible setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"greenComponent"];
    [irresistible setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"blueComponent"];
    return irresistible;
}

+ (UIColor *)isabelline {
    UIColor *isabelline = [UIColor colorWithRed:96.0f/100.0f green:94.0f/100.0f blue:93.0f/100.0f alpha:1.0f];
    [isabelline setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"redComponent"];
    [isabelline setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"greenComponent"];
    [isabelline setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"blueComponent"];
    return isabelline;
}

+ (UIColor *)islamicGreen {
    UIColor *islamicGreen = [UIColor colorWithRed:0.0f green:56.0f/100.0f blue:0.0f alpha:1.0f];
    [islamicGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [islamicGreen setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"greenComponent"];
    [islamicGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return islamicGreen;
}

+ (UIColor *)italianSkyBlue {
    UIColor *italianSkyBlue = [UIColor colorWithRed:7.0f/10.0f green:1.0f blue:1.0f alpha:1.0f];
    [italianSkyBlue setValue:[NSNumber numberWithFloat:7.0f/10.0f] forKey:@"redComponent"];
    [italianSkyBlue setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [italianSkyBlue setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return italianSkyBlue;
}

+ (UIColor *)ivory {
    UIColor *ivory = [UIColor colorWithRed:1.0f green:1.0f blue:94.0f/100.0f alpha:1.0f];
    [ivory setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [ivory setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [ivory setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"blueComponent"];
    return ivory;
}

+ (UIColor *)jade {
    UIColor *jade = [UIColor colorWithRed:0.0f green:66.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
    [jade setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [jade setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"greenComponent"];
    [jade setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"blueComponent"];
    return jade;
}

+ (UIColor *)japaneseCarmine {
    UIColor *japaneseCarmine = [UIColor colorWithRed:62.0f/100.0f green:16.0f/100.0f blue:2.0f/10.0f alpha:1.0f];
    [japaneseCarmine setValue:[NSNumber numberWithFloat:62.0f/100.0f] forKey:@"redComponent"];
    [japaneseCarmine setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"greenComponent"];
    [japaneseCarmine setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"blueComponent"];
    return japaneseCarmine;
}

+ (UIColor *)japaneseIndigo {
    UIColor *japaneseIndigo = [UIColor colorWithRed:15.0f/100.0f green:26.0f/100.0f blue:28.0f/100.0f alpha:1.0f];
    [japaneseIndigo setValue:[NSNumber numberWithFloat:15.0f/100.0f] forKey:@"redComponent"];
    [japaneseIndigo setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"greenComponent"];
    [japaneseIndigo setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"blueComponent"];
    return japaneseIndigo;
}

+ (UIColor *)japaneseViolet {
    UIColor *japaneseViolet = [UIColor colorWithRed:36.0f/100.0f green:2.0f/10.0f blue:34.0f/100.0f alpha:1.0f];
    [japaneseViolet setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"redComponent"];
    [japaneseViolet setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"greenComponent"];
    [japaneseViolet setValue:[NSNumber numberWithFloat:34.0f/100.0f] forKey:@"blueComponent"];
    return japaneseViolet;
}

+ (UIColor *)jasmine {
    UIColor *jasmine = [UIColor colorWithRed:97.0f/100.0f green:87.0f/100.0f blue:49.0f/100.0f alpha:1.0f];
    [jasmine setValue:[NSNumber numberWithFloat:97.0f/100.0f] forKey:@"redComponent"];
    [jasmine setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"greenComponent"];
    [jasmine setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"blueComponent"];
    return jasmine;
}

+ (UIColor *)jasper {
    UIColor *jasper = [UIColor colorWithRed:84.0f/100.0f green:23.0f/100.0f blue:24.0f/100.0f alpha:1.0f];
    [jasper setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"redComponent"];
    [jasper setValue:[NSNumber numberWithFloat:23.0f/100.0f] forKey:@"greenComponent"];
    [jasper setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"blueComponent"];
    return jasper;
}

+ (UIColor *)jazzberryJam {
    UIColor *jazzberryJam = [UIColor colorWithRed:65.0f/100.0f green:4.0f/100.0f blue:37.0f/100.0f alpha:1.0f];
    [jazzberryJam setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"redComponent"];
    [jazzberryJam setValue:[NSNumber numberWithFloat:4.0f/100.0f] forKey:@"greenComponent"];
    [jazzberryJam setValue:[NSNumber numberWithFloat:37.0f/100.0f] forKey:@"blueComponent"];
    return jazzberryJam;
}

+ (UIColor *)jellyBean {
    UIColor *jellyBean = [UIColor colorWithRed:85.0f/100.0f green:38.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
    [jellyBean setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"redComponent"];
    [jellyBean setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"greenComponent"];
    [jellyBean setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"blueComponent"];
    return jellyBean;
}

+ (UIColor *)jet {
    UIColor *jet = [UIColor colorWithRed:2.0f/10.0f green:2.0f/10.0f blue:2.0f/10.0f alpha:1.0f];
    [jet setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"redComponent"];
    [jet setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"greenComponent"];
    [jet setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"blueComponent"];
    return jet;
}

+ (UIColor *)jonquil {
    UIColor *jonquil = [UIColor colorWithRed:96.0f/100.0f green:79.0f/100.0f blue:9.0f/100.0f alpha:1.0f];
    [jonquil setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"redComponent"];
    [jonquil setValue:[NSNumber numberWithFloat:79.0f/100.0f] forKey:@"greenComponent"];
    [jonquil setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"blueComponent"];
    return jonquil;
}

+ (UIColor *)jordyBlue {
    UIColor *jordyBlue = [UIColor colorWithRed:54.0f/100.0f green:73.0f/100.0f blue:95.0f/100.0f alpha:1.0f];
    [jordyBlue setValue:[NSNumber numberWithFloat:54.0f/100.0f] forKey:@"redComponent"];
    [jordyBlue setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"greenComponent"];
    [jordyBlue setValue:[NSNumber numberWithFloat:95.0f/100.0f] forKey:@"blueComponent"];
    return jordyBlue;
}

+ (UIColor *)juneBud {
    UIColor *juneBud = [UIColor colorWithRed:74.0f/100.0f green:85.0f/100.0f blue:34.0f/100.0f alpha:1.0f];
    [juneBud setValue:[NSNumber numberWithFloat:74.0f/100.0f] forKey:@"redComponent"];
    [juneBud setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"greenComponent"];
    [juneBud setValue:[NSNumber numberWithFloat:34.0f/100.0f] forKey:@"blueComponent"];
    return juneBud;
}

+ (UIColor *)jungleGreen {
    UIColor *jungleGreen = [UIColor colorWithRed:16.0f/100.0f green:0.667f blue:53.0f/100.0f alpha:1.0f];
    [jungleGreen setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"redComponent"];
    [jungleGreen setValue:[NSNumber numberWithFloat:0.667f] forKey:@"greenComponent"];
    [jungleGreen setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"blueComponent"];
    return jungleGreen;
}

+ (UIColor *)kellyGreen {
    UIColor *kellyGreen = [UIColor colorWithRed:3.0f/10.0f green:73.0f/100.0f blue:9.0f/100.0f alpha:1.0f];
    [kellyGreen setValue:[NSNumber numberWithFloat:3.0f/10.0f] forKey:@"redComponent"];
    [kellyGreen setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"greenComponent"];
    [kellyGreen setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"blueComponent"];
    return kellyGreen;
}

+ (UIColor *)kenyanCopper {
    UIColor *kenyanCopper = [UIColor colorWithRed:49.0f/100.0f green:11.0f/100.0f blue:2.0f/100.0f alpha:1.0f];
    [kenyanCopper setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"redComponent"];
    [kenyanCopper setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"greenComponent"];
    [kenyanCopper setValue:[NSNumber numberWithFloat:2.0f/100.0f] forKey:@"blueComponent"];
    return kenyanCopper;
}

+ (UIColor *)keppel {
    UIColor *keppel = [UIColor colorWithRed:23.0f/100.0f green:69.0f/100.0f blue:62.0f/100.0f alpha:1.0f];
    [keppel setValue:[NSNumber numberWithFloat:23.0f/100.0f] forKey:@"redComponent"];
    [keppel setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"greenComponent"];
    [keppel setValue:[NSNumber numberWithFloat:62.0f/100.0f] forKey:@"blueComponent"];
    return keppel;
}

+ (UIColor *)jawadChickenColorHTMLCSSKhaki {
    UIColor *jawadChickenColorHTMLCSSKhaki = [UIColor colorWithRed:76.0f/100.0f green:69.0f/100.0f blue:57.0f/100.0f alpha:1.0f];
    [jawadChickenColorHTMLCSSKhaki setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"redComponent"];
    [jawadChickenColorHTMLCSSKhaki setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"greenComponent"];
    [jawadChickenColorHTMLCSSKhaki setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"blueComponent"];
    return jawadChickenColorHTMLCSSKhaki;
}

+ (UIColor *)khakiX11LightKhaki {
    UIColor *khakiX11LightKhaki = [UIColor colorWithRed:94.0f/100.0f green:9.0f/10.0f blue:55.0f/100.0f alpha:1.0f];
    [khakiX11LightKhaki setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"redComponent"];
    [khakiX11LightKhaki setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"greenComponent"];
    [khakiX11LightKhaki setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"blueComponent"];
    return khakiX11LightKhaki;
}

+ (UIColor *)kobe {
    UIColor *kobe = [UIColor colorWithRed:53.0f/100.0f green:18.0f/100.0f blue:9.0f/100.0f alpha:1.0f];
    [kobe setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"redComponent"];
    [kobe setValue:[NSNumber numberWithFloat:18.0f/100.0f] forKey:@"greenComponent"];
    [kobe setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"blueComponent"];
    return kobe;
}

+ (UIColor *)kobi {
    UIColor *kobi = [UIColor colorWithRed:91.0f/100.0f green:62.0f/100.0f blue:77.0f/100.0f alpha:1.0f];
    [kobi setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"redComponent"];
    [kobi setValue:[NSNumber numberWithFloat:62.0f/100.0f] forKey:@"greenComponent"];
    [kobi setValue:[NSNumber numberWithFloat:77.0f/100.0f] forKey:@"blueComponent"];
    return kobi;
}

+ (UIColor *)kombuGreen {
    UIColor *kombuGreen = [UIColor colorWithRed:21.0f/100.0f green:26.0f/100.0f blue:19.0f/100.0f alpha:1.0f];
    [kombuGreen setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"redComponent"];
    [kombuGreen setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"greenComponent"];
    [kombuGreen setValue:[NSNumber numberWithFloat:19.0f/100.0f] forKey:@"blueComponent"];
    return kombuGreen;
}

+ (UIColor *)kUCrimson {
    UIColor *kUCrimson = [UIColor colorWithRed:91.0f/100.0f green:0.0f blue:5.0f/100.0f alpha:1.0f];
    [kUCrimson setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"redComponent"];
    [kUCrimson setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [kUCrimson setValue:[NSNumber numberWithFloat:5.0f/100.0f] forKey:@"blueComponent"];
    return kUCrimson;
}

+ (UIColor *)laSalleGreen {
    UIColor *laSalleGreen = [UIColor colorWithRed:3.0f/100.0f green:47.0f/100.0f blue:19.0f/100.0f alpha:1.0f];
    [laSalleGreen setValue:[NSNumber numberWithFloat:3.0f/100.0f] forKey:@"redComponent"];
    [laSalleGreen setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"greenComponent"];
    [laSalleGreen setValue:[NSNumber numberWithFloat:19.0f/100.0f] forKey:@"blueComponent"];
    return laSalleGreen;
}

+ (UIColor *)languidLavender {
    UIColor *languidLavender = [UIColor colorWithRed:84.0f/100.0f green:79.0f/100.0f blue:87.0f/100.0f alpha:1.0f];
    [languidLavender setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"redComponent"];
    [languidLavender setValue:[NSNumber numberWithFloat:79.0f/100.0f] forKey:@"greenComponent"];
    [languidLavender setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"blueComponent"];
    return languidLavender;
}

+ (UIColor *)lapisLazuli {
    UIColor *lapisLazuli = [UIColor colorWithRed:15.0f/100.0f green:38.0f/100.0f blue:61.0f/100.0f alpha:1.0f];
    [lapisLazuli setValue:[NSNumber numberWithFloat:15.0f/100.0f] forKey:@"redComponent"];
    [lapisLazuli setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"greenComponent"];
    [lapisLazuli setValue:[NSNumber numberWithFloat:61.0f/100.0f] forKey:@"blueComponent"];
    return lapisLazuli;
}

+ (UIColor *)laserLemon {
    UIColor *laserLemon = [UIColor colorWithRed:1.0f green:1.0f blue:4.0f/10.0f alpha:1.0f];
    [laserLemon setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [laserLemon setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [laserLemon setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"blueComponent"];
    return laserLemon;
}

+ (UIColor *)laurelGreen {
    UIColor *laurelGreen = [UIColor colorWithRed:66.0f/100.0f green:73.0f/100.0f blue:62.0f/100.0f alpha:1.0f];
    [laurelGreen setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"redComponent"];
    [laurelGreen setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"greenComponent"];
    [laurelGreen setValue:[NSNumber numberWithFloat:62.0f/100.0f] forKey:@"blueComponent"];
    return laurelGreen;
}

+ (UIColor *)lava {
    UIColor *lava = [UIColor colorWithRed:81.0f/100.0f green:6.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
    [lava setValue:[NSNumber numberWithFloat:81.0f/100.0f] forKey:@"redComponent"];
    [lava setValue:[NSNumber numberWithFloat:6.0f/100.0f] forKey:@"greenComponent"];
    [lava setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"blueComponent"];
    return lava;
}

+ (UIColor *)lavenderFloral {
    UIColor *lavenderFloral = [UIColor colorWithRed:71.0f/100.0f green:49.0f/100.0f blue:86.0f/100.0f alpha:1.0f];
    [lavenderFloral setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"redComponent"];
    [lavenderFloral setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"greenComponent"];
    [lavenderFloral setValue:[NSNumber numberWithFloat:86.0f/100.0f] forKey:@"blueComponent"];
    return lavenderFloral;
}

+ (UIColor *)lavenderWeb {
    UIColor *lavenderWeb = [UIColor colorWithRed:9.0f/10.0f green:9.0f/10.0f blue:98.0f/100.0f alpha:1.0f];
    [lavenderWeb setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"redComponent"];
    [lavenderWeb setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"greenComponent"];
    [lavenderWeb setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"blueComponent"];
    return lavenderWeb;
}

+ (UIColor *)lavenderBlue {
    UIColor *lavenderBlue = [UIColor colorWithRed:8.0f/10.0f green:8.0f/10.0f blue:1.0f alpha:1.0f];
    [lavenderBlue setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [lavenderBlue setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"greenComponent"];
    [lavenderBlue setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return lavenderBlue;
}

+ (UIColor *)lavenderBlush {
    UIColor *lavenderBlush = [UIColor colorWithRed:1.0f green:94.0f/100.0f blue:96.0f/100.0f alpha:1.0f];
    [lavenderBlush setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [lavenderBlush setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"greenComponent"];
    [lavenderBlush setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"blueComponent"];
    return lavenderBlush;
}

+ (UIColor *)lavenderGray {
    UIColor *lavenderGray = [UIColor colorWithRed:77.0f/100.0f green:76.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
    [lavenderGray setValue:[NSNumber numberWithFloat:77.0f/100.0f] forKey:@"redComponent"];
    [lavenderGray setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"greenComponent"];
    [lavenderGray setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"blueComponent"];
    return lavenderGray;
}

+ (UIColor *)lavenderIndigo {
    UIColor *lavenderIndigo = [UIColor colorWithRed:58.0f/100.0f green:34.0f/100.0f blue:92.0f/100.0f alpha:1.0f];
    [lavenderIndigo setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"redComponent"];
    [lavenderIndigo setValue:[NSNumber numberWithFloat:34.0f/100.0f] forKey:@"greenComponent"];
    [lavenderIndigo setValue:[NSNumber numberWithFloat:92.0f/100.0f] forKey:@"blueComponent"];
    return lavenderIndigo;
}

+ (UIColor *)lavenderMagenta {
    UIColor *lavenderMagenta = [UIColor colorWithRed:93.0f/100.0f green:51.0f/100.0f blue:93.0f/100.0f alpha:1.0f];
    [lavenderMagenta setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"redComponent"];
    [lavenderMagenta setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"greenComponent"];
    [lavenderMagenta setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"blueComponent"];
    return lavenderMagenta;
}

+ (UIColor *)lavenderMist {
    UIColor *lavenderMist = [UIColor colorWithRed:9.0f/10.0f green:9.0f/10.0f blue:98.0f/100.0f alpha:1.0f];
    [lavenderMist setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"redComponent"];
    [lavenderMist setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"greenComponent"];
    [lavenderMist setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"blueComponent"];
    return lavenderMist;
}

+ (UIColor *)lavenderPink {
    UIColor *lavenderPink = [UIColor colorWithRed:98.0f/100.0f green:68.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
    [lavenderPink setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [lavenderPink setValue:[NSNumber numberWithFloat:68.0f/100.0f] forKey:@"greenComponent"];
    [lavenderPink setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"blueComponent"];
    return lavenderPink;
}

+ (UIColor *)lavenderPurple {
    UIColor *lavenderPurple = [UIColor colorWithRed:59.0f/100.0f green:48.0f/100.0f blue:71.0f/100.0f alpha:1.0f];
    [lavenderPurple setValue:[NSNumber numberWithFloat:59.0f/100.0f] forKey:@"redComponent"];
    [lavenderPurple setValue:[NSNumber numberWithFloat:48.0f/100.0f] forKey:@"greenComponent"];
    [lavenderPurple setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"blueComponent"];
    return lavenderPurple;
}

+ (UIColor *)lavenderRose {
    UIColor *lavenderRose = [UIColor colorWithRed:98.0f/100.0f green:63.0f/100.0f blue:89.0f/100.0f alpha:1.0f];
    [lavenderRose setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [lavenderRose setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"greenComponent"];
    [lavenderRose setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"blueComponent"];
    return lavenderRose;
}

+ (UIColor *)lawnGreen {
    UIColor *lawnGreen = [UIColor colorWithRed:49.0f/100.0f green:99.0f/100.0f blue:0.0f alpha:1.0f];
    [lawnGreen setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"redComponent"];
    [lawnGreen setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"greenComponent"];
    [lawnGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return lawnGreen;
}

+ (UIColor *)lemon {
    UIColor *lemon = [UIColor colorWithRed:1.0f green:97.0f/100.0f blue:0.0f alpha:1.0f];
    [lemon setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [lemon setValue:[NSNumber numberWithFloat:97.0f/100.0f] forKey:@"greenComponent"];
    [lemon setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return lemon;
}

+ (UIColor *)lemonChiffon {
    UIColor *lemonChiffon = [UIColor colorWithRed:1.0f green:98.0f/100.0f blue:8.0f/10.0f alpha:1.0f];
    [lemonChiffon setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [lemonChiffon setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"greenComponent"];
    [lemonChiffon setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"blueComponent"];
    return lemonChiffon;
}

+ (UIColor *)lemonCurry {
    UIColor *lemonCurry = [UIColor colorWithRed:8.0f/10.0f green:63.0f/100.0f blue:11.0f/100.0f alpha:1.0f];
    [lemonCurry setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [lemonCurry setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"greenComponent"];
    [lemonCurry setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"blueComponent"];
    return lemonCurry;
}

+ (UIColor *)lemonGlacier {
    UIColor *lemonGlacier = [UIColor colorWithRed:99.0f/100.0f green:1.0f blue:0.0f alpha:1.0f];
    [lemonGlacier setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"redComponent"];
    [lemonGlacier setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [lemonGlacier setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return lemonGlacier;
}

+ (UIColor *)lemonLime {
    UIColor *lemonLime = [UIColor colorWithRed:89.0f/100.0f green:1.0f blue:0.0f alpha:1.0f];
    [lemonLime setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"redComponent"];
    [lemonLime setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [lemonLime setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return lemonLime;
}

+ (UIColor *)lemonMeringue {
    UIColor *lemonMeringue = [UIColor colorWithRed:96.0f/100.0f green:92.0f/100.0f blue:0.75f alpha:1.0f];
    [lemonMeringue setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"redComponent"];
    [lemonMeringue setValue:[NSNumber numberWithFloat:92.0f/100.0f] forKey:@"greenComponent"];
    [lemonMeringue setValue:[NSNumber numberWithFloat:0.75f] forKey:@"blueComponent"];
    return lemonMeringue;
}

+ (UIColor *)lemonYellow {
    UIColor *lemonYellow = [UIColor colorWithRed:1.0f green:96.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
    [lemonYellow setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [lemonYellow setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"greenComponent"];
    [lemonYellow setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"blueComponent"];
    return lemonYellow;
}

+ (UIColor *)lenurple {
    UIColor *lenurple = [UIColor colorWithRed:73.0f/100.0f green:58.0f/100.0f blue:85.0f/100.0f alpha:1.0f];
    [lenurple setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"redComponent"];
    [lenurple setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"greenComponent"];
    [lenurple setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"blueComponent"];
    return lenurple;
}

+ (UIColor *)licorice {
    UIColor *licorice = [UIColor colorWithRed:1.0f/10.0f green:7.0f/100.0f blue:6.0f/100.0f alpha:1.0f];
    [licorice setValue:[NSNumber numberWithFloat:1.0f/10.0f] forKey:@"redComponent"];
    [licorice setValue:[NSNumber numberWithFloat:7.0f/100.0f] forKey:@"greenComponent"];
    [licorice setValue:[NSNumber numberWithFloat:6.0f/100.0f] forKey:@"blueComponent"];
    return licorice;
}

+ (UIColor *)liberty {
    UIColor *liberty = [UIColor colorWithRed:0.333f green:35.0f/100.0f blue:65.0f/100.0f alpha:1.0f];
    [liberty setValue:[NSNumber numberWithFloat:0.333f] forKey:@"redComponent"];
    [liberty setValue:[NSNumber numberWithFloat:35.0f/100.0f] forKey:@"greenComponent"];
    [liberty setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"blueComponent"];
    return liberty;
}

+ (UIColor *)lightApricot {
    UIColor *lightApricot = [UIColor colorWithRed:99.0f/100.0f green:84.0f/100.0f blue:69.0f/100.0f alpha:1.0f];
    [lightApricot setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"redComponent"];
    [lightApricot setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"greenComponent"];
    [lightApricot setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"blueComponent"];
    return lightApricot;
}

+ (UIColor *)lightBlue {
    UIColor *lightBlue = [UIColor colorWithRed:68.0f/100.0f green:85.0f/100.0f blue:9.0f/10.0f alpha:1.0f];
    [lightBlue setValue:[NSNumber numberWithFloat:68.0f/100.0f] forKey:@"redComponent"];
    [lightBlue setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"greenComponent"];
    [lightBlue setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"blueComponent"];
    return lightBlue;
}

+ (UIColor *)lightBrilliantRed {
    UIColor *lightBrilliantRed = [UIColor colorWithRed:1.0f green:18.0f/100.0f blue:18.0f/100.0f alpha:1.0f];
    [lightBrilliantRed setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [lightBrilliantRed setValue:[NSNumber numberWithFloat:18.0f/100.0f] forKey:@"greenComponent"];
    [lightBrilliantRed setValue:[NSNumber numberWithFloat:18.0f/100.0f] forKey:@"blueComponent"];
    return lightBrilliantRed;
}

+ (UIColor *)lightBrown {
    UIColor *lightBrown = [UIColor colorWithRed:71.0f/100.0f green:4.0f/10.0f blue:11.0f/100.0f alpha:1.0f];
    [lightBrown setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"redComponent"];
    [lightBrown setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"greenComponent"];
    [lightBrown setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"blueComponent"];
    return lightBrown;
}

+ (UIColor *)lightCarminePink {
    UIColor *lightCarminePink = [UIColor colorWithRed:9.0f/10.0f green:4.0f/10.0f blue:44.0f/100.0f alpha:1.0f];
    [lightCarminePink setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"redComponent"];
    [lightCarminePink setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"greenComponent"];
    [lightCarminePink setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"blueComponent"];
    return lightCarminePink;
}

+ (UIColor *)lightCobaltBlue {
    UIColor *lightCobaltBlue = [UIColor colorWithRed:53.0f/100.0f green:0.667f blue:88.0f/100.0f alpha:1.0f];
    [lightCobaltBlue setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"redComponent"];
    [lightCobaltBlue setValue:[NSNumber numberWithFloat:0.667f] forKey:@"greenComponent"];
    [lightCobaltBlue setValue:[NSNumber numberWithFloat:88.0f/100.0f] forKey:@"blueComponent"];
    return lightCobaltBlue;
}

+ (UIColor *)lightCoral {
    UIColor *lightCoral = [UIColor colorWithRed:94.0f/100.0f green:0.5f blue:0.5f alpha:1.0f];
    [lightCoral setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"redComponent"];
    [lightCoral setValue:[NSNumber numberWithFloat:0.5f] forKey:@"greenComponent"];
    [lightCoral setValue:[NSNumber numberWithFloat:0.5f] forKey:@"blueComponent"];
    return lightCoral;
}

+ (UIColor *)lightCornflowerBlue {
    UIColor *lightCornflowerBlue = [UIColor colorWithRed:58.0f/100.0f green:8.0f/10.0f blue:92.0f/100.0f alpha:1.0f];
    [lightCornflowerBlue setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"redComponent"];
    [lightCornflowerBlue setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"greenComponent"];
    [lightCornflowerBlue setValue:[NSNumber numberWithFloat:92.0f/100.0f] forKey:@"blueComponent"];
    return lightCornflowerBlue;
}

+ (UIColor *)lightCrimson {
    UIColor *lightCrimson = [UIColor colorWithRed:96.0f/100.0f green:41.0f/100.0f blue:57.0f/100.0f alpha:1.0f];
    [lightCrimson setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"redComponent"];
    [lightCrimson setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"greenComponent"];
    [lightCrimson setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"blueComponent"];
    return lightCrimson;
}

+ (UIColor *)lightCyan {
    UIColor *lightCyan = [UIColor colorWithRed:88.0f/100.0f green:1.0f blue:1.0f alpha:1.0f];
    [lightCyan setValue:[NSNumber numberWithFloat:88.0f/100.0f] forKey:@"redComponent"];
    [lightCyan setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [lightCyan setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return lightCyan;
}

+ (UIColor *)lightDeepPink {
    UIColor *lightDeepPink = [UIColor colorWithRed:1.0f green:36.0f/100.0f blue:8.0f/10.0f alpha:1.0f];
    [lightDeepPink setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [lightDeepPink setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"greenComponent"];
    [lightDeepPink setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"blueComponent"];
    return lightDeepPink;
}

+ (UIColor *)lightFrenchBeige {
    UIColor *lightFrenchBeige = [UIColor colorWithRed:78.0f/100.0f green:68.0f/100.0f blue:0.5f alpha:1.0f];
    [lightFrenchBeige setValue:[NSNumber numberWithFloat:78.0f/100.0f] forKey:@"redComponent"];
    [lightFrenchBeige setValue:[NSNumber numberWithFloat:68.0f/100.0f] forKey:@"greenComponent"];
    [lightFrenchBeige setValue:[NSNumber numberWithFloat:0.5f] forKey:@"blueComponent"];
    return lightFrenchBeige;
}

+ (UIColor *)lightFuchsiaPink {
    UIColor *lightFuchsiaPink = [UIColor colorWithRed:98.0f/100.0f green:52.0f/100.0f blue:94.0f/100.0f alpha:1.0f];
    [lightFuchsiaPink setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [lightFuchsiaPink setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"greenComponent"];
    [lightFuchsiaPink setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"blueComponent"];
    return lightFuchsiaPink;
}

+ (UIColor *)lightGoldenrodYellow {
    UIColor *lightGoldenrodYellow = [UIColor colorWithRed:98.0f/100.0f green:98.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
    [lightGoldenrodYellow setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [lightGoldenrodYellow setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"greenComponent"];
    [lightGoldenrodYellow setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"blueComponent"];
    return lightGoldenrodYellow;
}

+ (UIColor *)lightGray {
    UIColor *lightGray = [UIColor colorWithRed:83.0f/100.0f green:83.0f/100.0f blue:83.0f/100.0f alpha:1.0f];
    [lightGray setValue:[NSNumber numberWithFloat:83.0f/100.0f] forKey:@"redComponent"];
    [lightGray setValue:[NSNumber numberWithFloat:83.0f/100.0f] forKey:@"greenComponent"];
    [lightGray setValue:[NSNumber numberWithFloat:83.0f/100.0f] forKey:@"blueComponent"];
    return lightGray;
}

+ (UIColor *)lightGrayishMagenta {
    UIColor *lightGrayishMagenta = [UIColor colorWithRed:8.0f/10.0f green:6.0f/10.0f blue:8.0f/10.0f alpha:1.0f];
    [lightGrayishMagenta setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [lightGrayishMagenta setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [lightGrayishMagenta setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"blueComponent"];
    return lightGrayishMagenta;
}

+ (UIColor *)lightGreen {
    UIColor *lightGreen = [UIColor colorWithRed:56.0f/100.0f green:93.0f/100.0f blue:56.0f/100.0f alpha:1.0f];
    [lightGreen setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"redComponent"];
    [lightGreen setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"greenComponent"];
    [lightGreen setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"blueComponent"];
    return lightGreen;
}

+ (UIColor *)lightHotPink {
    UIColor *lightHotPink = [UIColor colorWithRed:1.0f green:7.0f/10.0f blue:87.0f/100.0f alpha:1.0f];
    [lightHotPink setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [lightHotPink setValue:[NSNumber numberWithFloat:7.0f/10.0f] forKey:@"greenComponent"];
    [lightHotPink setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"blueComponent"];
    return lightHotPink;
}

+ (UIColor *)lightKhaki {
    UIColor *lightKhaki = [UIColor colorWithRed:94.0f/100.0f green:9.0f/10.0f blue:55.0f/100.0f alpha:1.0f];
    [lightKhaki setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"redComponent"];
    [lightKhaki setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"greenComponent"];
    [lightKhaki setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"blueComponent"];
    return lightKhaki;
}

+ (UIColor *)lightMediumOrchid {
    UIColor *lightMediumOrchid = [UIColor colorWithRed:83.0f/100.0f green:61.0f/100.0f blue:8.0f/10.0f alpha:1.0f];
    [lightMediumOrchid setValue:[NSNumber numberWithFloat:83.0f/100.0f] forKey:@"redComponent"];
    [lightMediumOrchid setValue:[NSNumber numberWithFloat:61.0f/100.0f] forKey:@"greenComponent"];
    [lightMediumOrchid setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"blueComponent"];
    return lightMediumOrchid;
}

+ (UIColor *)lightMossGreen {
    UIColor *lightMossGreen = [UIColor colorWithRed:68.0f/100.0f green:87.0f/100.0f blue:68.0f/100.0f alpha:1.0f];
    [lightMossGreen setValue:[NSNumber numberWithFloat:68.0f/100.0f] forKey:@"redComponent"];
    [lightMossGreen setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"greenComponent"];
    [lightMossGreen setValue:[NSNumber numberWithFloat:68.0f/100.0f] forKey:@"blueComponent"];
    return lightMossGreen;
}

+ (UIColor *)lightOrchid {
    UIColor *lightOrchid = [UIColor colorWithRed:9.0f/10.0f green:66.0f/100.0f blue:84.0f/100.0f alpha:1.0f];
    [lightOrchid setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"redComponent"];
    [lightOrchid setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"greenComponent"];
    [lightOrchid setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"blueComponent"];
    return lightOrchid;
}

+ (UIColor *)lightPastelPurple {
    UIColor *lightPastelPurple = [UIColor colorWithRed:69.0f/100.0f green:61.0f/100.0f blue:85.0f/100.0f alpha:1.0f];
    [lightPastelPurple setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"redComponent"];
    [lightPastelPurple setValue:[NSNumber numberWithFloat:61.0f/100.0f] forKey:@"greenComponent"];
    [lightPastelPurple setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"blueComponent"];
    return lightPastelPurple;
}

+ (UIColor *)lightPink {
    UIColor *lightPink = [UIColor colorWithRed:1.0f green:71.0f/100.0f blue:76.0f/100.0f alpha:1.0f];
    [lightPink setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [lightPink setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"greenComponent"];
    [lightPink setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"blueComponent"];
    return lightPink;
}

+ (UIColor *)lightRedOchre {
    UIColor *lightRedOchre = [UIColor colorWithRed:91.0f/100.0f green:45.0f/100.0f blue:32.0f/100.0f alpha:1.0f];
    [lightRedOchre setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"redComponent"];
    [lightRedOchre setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"greenComponent"];
    [lightRedOchre setValue:[NSNumber numberWithFloat:32.0f/100.0f] forKey:@"blueComponent"];
    return lightRedOchre;
}

+ (UIColor *)lightSalmon {
    UIColor *lightSalmon = [UIColor colorWithRed:1.0f green:63.0f/100.0f blue:48.0f/100.0f alpha:1.0f];
    [lightSalmon setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [lightSalmon setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"greenComponent"];
    [lightSalmon setValue:[NSNumber numberWithFloat:48.0f/100.0f] forKey:@"blueComponent"];
    return lightSalmon;
}

+ (UIColor *)lightSalmonPink {
    UIColor *lightSalmonPink = [UIColor colorWithRed:1.0f green:6.0f/10.0f blue:6.0f/10.0f alpha:1.0f];
    [lightSalmonPink setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [lightSalmonPink setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [lightSalmonPink setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"blueComponent"];
    return lightSalmonPink;
}

+ (UIColor *)lightSeaGreen {
    UIColor *lightSeaGreen = [UIColor colorWithRed:13.0f/100.0f green:7.0f/10.0f blue:0.667f alpha:1.0f];
    [lightSeaGreen setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"redComponent"];
    [lightSeaGreen setValue:[NSNumber numberWithFloat:7.0f/10.0f] forKey:@"greenComponent"];
    [lightSeaGreen setValue:[NSNumber numberWithFloat:0.667f] forKey:@"blueComponent"];
    return lightSeaGreen;
}

+ (UIColor *)lightSkyBlue {
    UIColor *lightSkyBlue = [UIColor colorWithRed:53.0f/100.0f green:81.0f/100.0f blue:98.0f/100.0f alpha:1.0f];
    [lightSkyBlue setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"redComponent"];
    [lightSkyBlue setValue:[NSNumber numberWithFloat:81.0f/100.0f] forKey:@"greenComponent"];
    [lightSkyBlue setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"blueComponent"];
    return lightSkyBlue;
}

+ (UIColor *)lightSlateGray {
    UIColor *lightSlateGray = [UIColor colorWithRed:47.0f/100.0f green:53.0f/100.0f blue:6.0f/10.0f alpha:1.0f];
    [lightSlateGray setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"redComponent"];
    [lightSlateGray setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"greenComponent"];
    [lightSlateGray setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"blueComponent"];
    return lightSlateGray;
}

+ (UIColor *)lightSteelBlue {
    UIColor *lightSteelBlue = [UIColor colorWithRed:69.0f/100.0f green:77.0f/100.0f blue:87.0f/100.0f alpha:1.0f];
    [lightSteelBlue setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"redComponent"];
    [lightSteelBlue setValue:[NSNumber numberWithFloat:77.0f/100.0f] forKey:@"greenComponent"];
    [lightSteelBlue setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"blueComponent"];
    return lightSteelBlue;
}

+ (UIColor *)lightTaupe {
    UIColor *lightTaupe = [UIColor colorWithRed:7.0f/10.0f green:55.0f/100.0f blue:43.0f/100.0f alpha:1.0f];
    [lightTaupe setValue:[NSNumber numberWithFloat:7.0f/10.0f] forKey:@"redComponent"];
    [lightTaupe setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"greenComponent"];
    [lightTaupe setValue:[NSNumber numberWithFloat:43.0f/100.0f] forKey:@"blueComponent"];
    return lightTaupe;
}

+ (UIColor *)lightThulianPink {
    UIColor *lightThulianPink = [UIColor colorWithRed:9.0f/10.0f green:56.0f/100.0f blue:0.667f alpha:1.0f];
    [lightThulianPink setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"redComponent"];
    [lightThulianPink setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"greenComponent"];
    [lightThulianPink setValue:[NSNumber numberWithFloat:0.667f] forKey:@"blueComponent"];
    return lightThulianPink;
}

+ (UIColor *)lightYellow {
    UIColor *lightYellow = [UIColor colorWithRed:1.0f green:1.0f blue:88.0f/100.0f alpha:1.0f];
    [lightYellow setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [lightYellow setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [lightYellow setValue:[NSNumber numberWithFloat:88.0f/100.0f] forKey:@"blueComponent"];
    return lightYellow;
}

+ (UIColor *)lilac {
    UIColor *lilac = [UIColor colorWithRed:78.0f/100.0f green:64.0f/100.0f blue:78.0f/100.0f alpha:1.0f];
    [lilac setValue:[NSNumber numberWithFloat:78.0f/100.0f] forKey:@"redComponent"];
    [lilac setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"greenComponent"];
    [lilac setValue:[NSNumber numberWithFloat:78.0f/100.0f] forKey:@"blueComponent"];
    return lilac;
}

+ (UIColor *)limeColorWheel {
    UIColor *limeColorWheel = [UIColor colorWithRed:0.75f green:1.0f blue:0.0f alpha:1.0f];
    [limeColorWheel setValue:[NSNumber numberWithFloat:0.75f] forKey:@"redComponent"];
    [limeColorWheel setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [limeColorWheel setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return limeColorWheel;
}

+ (UIColor *)limeWebX11Green {
    UIColor *limeWebX11Green = [UIColor colorWithRed:0.0f green:1.0f blue:0.0f alpha:1.0f];
    [limeWebX11Green setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [limeWebX11Green setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [limeWebX11Green setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return limeWebX11Green;
}

+ (UIColor *)limeGreen {
    UIColor *limeGreen = [UIColor colorWithRed:2.0f/10.0f green:8.0f/10.0f blue:2.0f/10.0f alpha:1.0f];
    [limeGreen setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"redComponent"];
    [limeGreen setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"greenComponent"];
    [limeGreen setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"blueComponent"];
    return limeGreen;
}

+ (UIColor *)limerick {
    UIColor *limerick = [UIColor colorWithRed:62.0f/100.0f green:76.0f/100.0f blue:4.0f/100.0f alpha:1.0f];
    [limerick setValue:[NSNumber numberWithFloat:62.0f/100.0f] forKey:@"redComponent"];
    [limerick setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"greenComponent"];
    [limerick setValue:[NSNumber numberWithFloat:4.0f/100.0f] forKey:@"blueComponent"];
    return limerick;
}

+ (UIColor *)lincolnGreen {
    UIColor *lincolnGreen = [UIColor colorWithRed:1.0f/10.0f green:35.0f/100.0f blue:2.0f/100.0f alpha:1.0f];
    [lincolnGreen setValue:[NSNumber numberWithFloat:1.0f/10.0f] forKey:@"redComponent"];
    [lincolnGreen setValue:[NSNumber numberWithFloat:35.0f/100.0f] forKey:@"greenComponent"];
    [lincolnGreen setValue:[NSNumber numberWithFloat:2.0f/100.0f] forKey:@"blueComponent"];
    return lincolnGreen;
}

+ (UIColor *)linen {
    UIColor *linen = [UIColor colorWithRed:98.0f/100.0f green:94.0f/100.0f blue:9.0f/10.0f alpha:1.0f];
    [linen setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [linen setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"greenComponent"];
    [linen setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"blueComponent"];
    return linen;
}

+ (UIColor *)lion {
    UIColor *lion = [UIColor colorWithRed:76.0f/100.0f green:6.0f/10.0f blue:42.0f/100.0f alpha:1.0f];
    [lion setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"redComponent"];
    [lion setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [lion setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"blueComponent"];
    return lion;
}

+ (UIColor *)liseranPurple {
    UIColor *liseranPurple = [UIColor colorWithRed:87.0f/100.0f green:44.0f/100.0f blue:63.0f/100.0f alpha:1.0f];
    [liseranPurple setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"redComponent"];
    [liseranPurple setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"greenComponent"];
    [liseranPurple setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"blueComponent"];
    return liseranPurple;
}

+ (UIColor *)littleBoyBlue {
    UIColor *littleBoyBlue = [UIColor colorWithRed:42.0f/100.0f green:63.0f/100.0f blue:86.0f/100.0f alpha:1.0f];
    [littleBoyBlue setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"redComponent"];
    [littleBoyBlue setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"greenComponent"];
    [littleBoyBlue setValue:[NSNumber numberWithFloat:86.0f/100.0f] forKey:@"blueComponent"];
    return littleBoyBlue;
}

+ (UIColor *)liver {
    UIColor *liver = [UIColor colorWithRed:4.0f/10.0f green:3.0f/10.0f blue:28.0f/100.0f alpha:1.0f];
    [liver setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"redComponent"];
    [liver setValue:[NSNumber numberWithFloat:3.0f/10.0f] forKey:@"greenComponent"];
    [liver setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"blueComponent"];
    return liver;
}

+ (UIColor *)liverDogs {
    UIColor *liverDogs = [UIColor colorWithRed:72.0f/100.0f green:43.0f/100.0f blue:16.0f/100.0f alpha:1.0f];
    [liverDogs setValue:[NSNumber numberWithFloat:72.0f/100.0f] forKey:@"redComponent"];
    [liverDogs setValue:[NSNumber numberWithFloat:43.0f/100.0f] forKey:@"greenComponent"];
    [liverDogs setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"blueComponent"];
    return liverDogs;
}

+ (UIColor *)liverOrgan {
    UIColor *liverOrgan = [UIColor colorWithRed:42.0f/100.0f green:18.0f/100.0f blue:12.0f/100.0f alpha:1.0f];
    [liverOrgan setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"redComponent"];
    [liverOrgan setValue:[NSNumber numberWithFloat:18.0f/100.0f] forKey:@"greenComponent"];
    [liverOrgan setValue:[NSNumber numberWithFloat:12.0f/100.0f] forKey:@"blueComponent"];
    return liverOrgan;
}

+ (UIColor *)liverChestnut {
    UIColor *liverChestnut = [UIColor colorWithRed:6.0f/10.0f green:45.0f/100.0f blue:34.0f/100.0f alpha:1.0f];
    [liverChestnut setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"redComponent"];
    [liverChestnut setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"greenComponent"];
    [liverChestnut setValue:[NSNumber numberWithFloat:34.0f/100.0f] forKey:@"blueComponent"];
    return liverChestnut;
}

+ (UIColor *)livid {
    UIColor *livid = [UIColor colorWithRed:4.0f/10.0f green:6.0f/10.0f blue:8.0f/10.0f alpha:1.0f];
    [livid setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"redComponent"];
    [livid setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [livid setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"blueComponent"];
    return livid;
}

+ (UIColor *)lumber {
    UIColor *lumber = [UIColor colorWithRed:1.0f green:89.0f/100.0f blue:8.0f/10.0f alpha:1.0f];
    [lumber setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [lumber setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"greenComponent"];
    [lumber setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"blueComponent"];
    return lumber;
}

+ (UIColor *)lust {
    UIColor *lust = [UIColor colorWithRed:9.0f/10.0f green:13.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
    [lust setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"redComponent"];
    [lust setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"greenComponent"];
    [lust setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"blueComponent"];
    return lust;
}

+ (UIColor *)magenta {
    UIColor *magenta = [UIColor colorWithRed:1.0f green:0.0f blue:1.0f alpha:1.0f];
    [magenta setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [magenta setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [magenta setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return magenta;
}

+ (UIColor *)magentaCrayola {
    UIColor *magentaCrayola = [UIColor colorWithRed:1.0f green:0.333f blue:64.0f/100.0f alpha:1.0f];
    [magentaCrayola setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [magentaCrayola setValue:[NSNumber numberWithFloat:0.333f] forKey:@"greenComponent"];
    [magentaCrayola setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"blueComponent"];
    return magentaCrayola;
}

+ (UIColor *)magentaDye {
    UIColor *magentaDye = [UIColor colorWithRed:79.0f/100.0f green:12.0f/100.0f blue:48.0f/100.0f alpha:1.0f];
    [magentaDye setValue:[NSNumber numberWithFloat:79.0f/100.0f] forKey:@"redComponent"];
    [magentaDye setValue:[NSNumber numberWithFloat:12.0f/100.0f] forKey:@"greenComponent"];
    [magentaDye setValue:[NSNumber numberWithFloat:48.0f/100.0f] forKey:@"blueComponent"];
    return magentaDye;
}

+ (UIColor *)magentaPantone {
    UIColor *magentaPantone = [UIColor colorWithRed:82.0f/100.0f green:0.25f blue:49.0f/100.0f alpha:1.0f];
    [magentaPantone setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"redComponent"];
    [magentaPantone setValue:[NSNumber numberWithFloat:0.25f] forKey:@"greenComponent"];
    [magentaPantone setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"blueComponent"];
    return magentaPantone;
}

+ (UIColor *)magentaProcess {
    UIColor *magentaProcess = [UIColor colorWithRed:1.0f green:0.0f blue:56.0f/100.0f alpha:1.0f];
    [magentaProcess setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [magentaProcess setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [magentaProcess setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"blueComponent"];
    return magentaProcess;
}

+ (UIColor *)magentaHaze {
    UIColor *magentaHaze = [UIColor colorWithRed:62.0f/100.0f green:27.0f/100.0f blue:46.0f/100.0f alpha:1.0f];
    [magentaHaze setValue:[NSNumber numberWithFloat:62.0f/100.0f] forKey:@"redComponent"];
    [magentaHaze setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"greenComponent"];
    [magentaHaze setValue:[NSNumber numberWithFloat:46.0f/100.0f] forKey:@"blueComponent"];
    return magentaHaze;
}

+ (UIColor *)magentaPink {
    UIColor *magentaPink = [UIColor colorWithRed:8.0f/10.0f green:2.0f/10.0f blue:55.0f/100.0f alpha:1.0f];
    [magentaPink setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [magentaPink setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"greenComponent"];
    [magentaPink setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"blueComponent"];
    return magentaPink;
}

+ (UIColor *)magicMint {
    UIColor *magicMint = [UIColor colorWithRed:0.667f green:94.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
    [magicMint setValue:[NSNumber numberWithFloat:0.667f] forKey:@"redComponent"];
    [magicMint setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"greenComponent"];
    [magicMint setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"blueComponent"];
    return magicMint;
}

+ (UIColor *)magnolia {
    UIColor *magnolia = [UIColor colorWithRed:97.0f/100.0f green:96.0f/100.0f blue:1.0f alpha:1.0f];
    [magnolia setValue:[NSNumber numberWithFloat:97.0f/100.0f] forKey:@"redComponent"];
    [magnolia setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"greenComponent"];
    [magnolia setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return magnolia;
}

+ (UIColor *)mahogany {
    UIColor *mahogany = [UIColor colorWithRed:0.75f green:0.25f blue:0.0f alpha:1.0f];
    [mahogany setValue:[NSNumber numberWithFloat:0.75f] forKey:@"redComponent"];
    [mahogany setValue:[NSNumber numberWithFloat:0.25f] forKey:@"greenComponent"];
    [mahogany setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return mahogany;
}

+ (UIColor *)maize {
    UIColor *maize = [UIColor colorWithRed:98.0f/100.0f green:93.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
    [maize setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [maize setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"greenComponent"];
    [maize setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"blueComponent"];
    return maize;
}

+ (UIColor *)majorelleBlue {
    UIColor *majorelleBlue = [UIColor colorWithRed:38.0f/100.0f green:31.0f/100.0f blue:86.0f/100.0f alpha:1.0f];
    [majorelleBlue setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"redComponent"];
    [majorelleBlue setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"greenComponent"];
    [majorelleBlue setValue:[NSNumber numberWithFloat:86.0f/100.0f] forKey:@"blueComponent"];
    return majorelleBlue;
}

+ (UIColor *)malachite {
    UIColor *malachite = [UIColor colorWithRed:4.0f/100.0f green:85.0f/100.0f blue:32.0f/100.0f alpha:1.0f];
    [malachite setValue:[NSNumber numberWithFloat:4.0f/100.0f] forKey:@"redComponent"];
    [malachite setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"greenComponent"];
    [malachite setValue:[NSNumber numberWithFloat:32.0f/100.0f] forKey:@"blueComponent"];
    return malachite;
}

+ (UIColor *)manatee {
    UIColor *manatee = [UIColor colorWithRed:59.0f/100.0f green:6.0f/10.0f blue:0.667f alpha:1.0f];
    [manatee setValue:[NSNumber numberWithFloat:59.0f/100.0f] forKey:@"redComponent"];
    [manatee setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [manatee setValue:[NSNumber numberWithFloat:0.667f] forKey:@"blueComponent"];
    return manatee;
}

+ (UIColor *)mangoTango {
    UIColor *mangoTango = [UIColor colorWithRed:1.0f green:51.0f/100.0f blue:26.0f/100.0f alpha:1.0f];
    [mangoTango setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [mangoTango setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"greenComponent"];
    [mangoTango setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"blueComponent"];
    return mangoTango;
}

+ (UIColor *)mantis {
    UIColor *mantis = [UIColor colorWithRed:45.0f/100.0f green:76.0f/100.0f blue:4.0f/10.0f alpha:1.0f];
    [mantis setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"redComponent"];
    [mantis setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"greenComponent"];
    [mantis setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"blueComponent"];
    return mantis;
}

+ (UIColor *)mardiGras {
    UIColor *mardiGras = [UIColor colorWithRed:53.0f/100.0f green:0.0f blue:52.0f/100.0f alpha:1.0f];
    [mardiGras setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"redComponent"];
    [mardiGras setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [mardiGras setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"blueComponent"];
    return mardiGras;
}

+ (UIColor *)marigold {
    UIColor *marigold = [UIColor colorWithRed:92.0f/100.0f green:64.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
    [marigold setValue:[NSNumber numberWithFloat:92.0f/100.0f] forKey:@"redComponent"];
    [marigold setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"greenComponent"];
    [marigold setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"blueComponent"];
    return marigold;
}

+ (UIColor *)maroonCrayola {
    UIColor *maroonCrayola = [UIColor colorWithRed:76.0f/100.0f green:13.0f/100.0f blue:28.0f/100.0f alpha:1.0f];
    [maroonCrayola setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"redComponent"];
    [maroonCrayola setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"greenComponent"];
    [maroonCrayola setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"blueComponent"];
    return maroonCrayola;
}

+ (UIColor *)maroonHTMLCSS {
    UIColor *maroonHTMLCSS = [UIColor colorWithRed:0.5f green:0.0f blue:0.0f alpha:1.0f];
    [maroonHTMLCSS setValue:[NSNumber numberWithFloat:0.5f] forKey:@"redComponent"];
    [maroonHTMLCSS setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [maroonHTMLCSS setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return maroonHTMLCSS;
}

+ (UIColor *)maroonX11 {
    UIColor *maroonX11 = [UIColor colorWithRed:69.0f/100.0f green:19.0f/100.0f blue:38.0f/100.0f alpha:1.0f];
    [maroonX11 setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"redComponent"];
    [maroonX11 setValue:[NSNumber numberWithFloat:19.0f/100.0f] forKey:@"greenComponent"];
    [maroonX11 setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"blueComponent"];
    return maroonX11;
}

+ (UIColor *)mauve {
    UIColor *mauve = [UIColor colorWithRed:88.0f/100.0f green:69.0f/100.0f blue:1.0f alpha:1.0f];
    [mauve setValue:[NSNumber numberWithFloat:88.0f/100.0f] forKey:@"redComponent"];
    [mauve setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"greenComponent"];
    [mauve setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return mauve;
}

+ (UIColor *)mauveTaupe {
    UIColor *mauveTaupe = [UIColor colorWithRed:57.0f/100.0f green:37.0f/100.0f blue:43.0f/100.0f alpha:1.0f];
    [mauveTaupe setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"redComponent"];
    [mauveTaupe setValue:[NSNumber numberWithFloat:37.0f/100.0f] forKey:@"greenComponent"];
    [mauveTaupe setValue:[NSNumber numberWithFloat:43.0f/100.0f] forKey:@"blueComponent"];
    return mauveTaupe;
}

+ (UIColor *)mauvelous {
    UIColor *mauvelous = [UIColor colorWithRed:94.0f/100.0f green:6.0f/10.0f blue:0.667f alpha:1.0f];
    [mauvelous setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"redComponent"];
    [mauvelous setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [mauvelous setValue:[NSNumber numberWithFloat:0.667f] forKey:@"blueComponent"];
    return mauvelous;
}

+ (UIColor *)mayGreen {
    UIColor *mayGreen = [UIColor colorWithRed:3.0f/10.0f green:57.0f/100.0f blue:0.25f alpha:1.0f];
    [mayGreen setValue:[NSNumber numberWithFloat:3.0f/10.0f] forKey:@"redComponent"];
    [mayGreen setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"greenComponent"];
    [mayGreen setValue:[NSNumber numberWithFloat:0.25f] forKey:@"blueComponent"];
    return mayGreen;
}

+ (UIColor *)mayaBlue {
    UIColor *mayaBlue = [UIColor colorWithRed:45.0f/100.0f green:76.0f/100.0f blue:98.0f/100.0f alpha:1.0f];
    [mayaBlue setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"redComponent"];
    [mayaBlue setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"greenComponent"];
    [mayaBlue setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"blueComponent"];
    return mayaBlue;
}

+ (UIColor *)meatBrown {
    UIColor *meatBrown = [UIColor colorWithRed:9.0f/10.0f green:72.0f/100.0f blue:23.0f/100.0f alpha:1.0f];
    [meatBrown setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"redComponent"];
    [meatBrown setValue:[NSNumber numberWithFloat:72.0f/100.0f] forKey:@"greenComponent"];
    [meatBrown setValue:[NSNumber numberWithFloat:23.0f/100.0f] forKey:@"blueComponent"];
    return meatBrown;
}

+ (UIColor *)mediumAquamarine {
    UIColor *mediumAquamarine = [UIColor colorWithRed:4.0f/10.0f green:87.0f/100.0f blue:0.667f alpha:1.0f];
    [mediumAquamarine setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"redComponent"];
    [mediumAquamarine setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"greenComponent"];
    [mediumAquamarine setValue:[NSNumber numberWithFloat:0.667f] forKey:@"blueComponent"];
    return mediumAquamarine;
}

+ (UIColor *)mediumBlue {
    UIColor *mediumBlue = [UIColor colorWithRed:0.0f green:0.0f blue:8.0f/10.0f alpha:1.0f];
    [mediumBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [mediumBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [mediumBlue setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"blueComponent"];
    return mediumBlue;
}

+ (UIColor *)mediumCandyAppleRed {
    UIColor *mediumCandyAppleRed = [UIColor colorWithRed:89.0f/100.0f green:2.0f/100.0f blue:0.1667f alpha:1.0f];
    [mediumCandyAppleRed setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"redComponent"];
    [mediumCandyAppleRed setValue:[NSNumber numberWithFloat:2.0f/100.0f] forKey:@"greenComponent"];
    [mediumCandyAppleRed setValue:[NSNumber numberWithFloat:0.1667f] forKey:@"blueComponent"];
    return mediumCandyAppleRed;
}

+ (UIColor *)mediumCarmine {
    UIColor *mediumCarmine = [UIColor colorWithRed:69.0f/100.0f green:0.25f blue:21.0f/100.0f alpha:1.0f];
    [mediumCarmine setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"redComponent"];
    [mediumCarmine setValue:[NSNumber numberWithFloat:0.25f] forKey:@"greenComponent"];
    [mediumCarmine setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"blueComponent"];
    return mediumCarmine;
}

+ (UIColor *)mediumChampagne {
    UIColor *mediumChampagne = [UIColor colorWithRed:95.0f/100.0f green:9.0f/10.0f blue:0.667f alpha:1.0f];
    [mediumChampagne setValue:[NSNumber numberWithFloat:95.0f/100.0f] forKey:@"redComponent"];
    [mediumChampagne setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"greenComponent"];
    [mediumChampagne setValue:[NSNumber numberWithFloat:0.667f] forKey:@"blueComponent"];
    return mediumChampagne;
}

+ (UIColor *)mediumElectricBlue {
    UIColor *mediumElectricBlue = [UIColor colorWithRed:1.0f/100.0f green:31.0f/100.0f blue:59.0f/100.0f alpha:1.0f];
    [mediumElectricBlue setValue:[NSNumber numberWithFloat:1.0f/100.0f] forKey:@"redComponent"];
    [mediumElectricBlue setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"greenComponent"];
    [mediumElectricBlue setValue:[NSNumber numberWithFloat:59.0f/100.0f] forKey:@"blueComponent"];
    return mediumElectricBlue;
}

+ (UIColor *)mediumJungleGreen {
    UIColor *mediumJungleGreen = [UIColor colorWithRed:11.0f/100.0f green:21.0f/100.0f blue:18.0f/100.0f alpha:1.0f];
    [mediumJungleGreen setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"redComponent"];
    [mediumJungleGreen setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"greenComponent"];
    [mediumJungleGreen setValue:[NSNumber numberWithFloat:18.0f/100.0f] forKey:@"blueComponent"];
    return mediumJungleGreen;
}

+ (UIColor *)mediumLavenderMagenta {
    UIColor *mediumLavenderMagenta = [UIColor colorWithRed:87.0f/100.0f green:63.0f/100.0f blue:87.0f/100.0f alpha:1.0f];
    [mediumLavenderMagenta setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"redComponent"];
    [mediumLavenderMagenta setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"greenComponent"];
    [mediumLavenderMagenta setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"blueComponent"];
    return mediumLavenderMagenta;
}

+ (UIColor *)mediumOrchid {
    UIColor *mediumOrchid = [UIColor colorWithRed:73.0f/100.0f green:0.333f blue:83.0f/100.0f alpha:1.0f];
    [mediumOrchid setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"redComponent"];
    [mediumOrchid setValue:[NSNumber numberWithFloat:0.333f] forKey:@"greenComponent"];
    [mediumOrchid setValue:[NSNumber numberWithFloat:83.0f/100.0f] forKey:@"blueComponent"];
    return mediumOrchid;
}

+ (UIColor *)mediumPersianBlue {
    UIColor *mediumPersianBlue = [UIColor colorWithRed:0.0f green:4.0f/10.0f blue:65.0f/100.0f alpha:1.0f];
    [mediumPersianBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [mediumPersianBlue setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"greenComponent"];
    [mediumPersianBlue setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"blueComponent"];
    return mediumPersianBlue;
}

+ (UIColor *)mediumPurple {
    UIColor *mediumPurple = [UIColor colorWithRed:58.0f/100.0f green:44.0f/100.0f blue:86.0f/100.0f alpha:1.0f];
    [mediumPurple setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"redComponent"];
    [mediumPurple setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"greenComponent"];
    [mediumPurple setValue:[NSNumber numberWithFloat:86.0f/100.0f] forKey:@"blueComponent"];
    return mediumPurple;
}

+ (UIColor *)mediumRedViolet {
    UIColor *mediumRedViolet = [UIColor colorWithRed:73.0f/100.0f green:2.0f/10.0f blue:52.0f/100.0f alpha:1.0f];
    [mediumRedViolet setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"redComponent"];
    [mediumRedViolet setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"greenComponent"];
    [mediumRedViolet setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"blueComponent"];
    return mediumRedViolet;
}

+ (UIColor *)mediumRuby {
    UIColor *mediumRuby = [UIColor colorWithRed:0.667f green:0.25f blue:41.0f/100.0f alpha:1.0f];
    [mediumRuby setValue:[NSNumber numberWithFloat:0.667f] forKey:@"redComponent"];
    [mediumRuby setValue:[NSNumber numberWithFloat:0.25f] forKey:@"greenComponent"];
    [mediumRuby setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"blueComponent"];
    return mediumRuby;
}

+ (UIColor *)mediumSeaGreen {
    UIColor *mediumSeaGreen = [UIColor colorWithRed:24.0f/100.0f green:7.0f/10.0f blue:44.0f/100.0f alpha:1.0f];
    [mediumSeaGreen setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"redComponent"];
    [mediumSeaGreen setValue:[NSNumber numberWithFloat:7.0f/10.0f] forKey:@"greenComponent"];
    [mediumSeaGreen setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"blueComponent"];
    return mediumSeaGreen;
}

+ (UIColor *)mediumSkyBlue {
    UIColor *mediumSkyBlue = [UIColor colorWithRed:0.5f green:85.0f/100.0f blue:92.0f/100.0f alpha:1.0f];
    [mediumSkyBlue setValue:[NSNumber numberWithFloat:0.5f] forKey:@"redComponent"];
    [mediumSkyBlue setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"greenComponent"];
    [mediumSkyBlue setValue:[NSNumber numberWithFloat:92.0f/100.0f] forKey:@"blueComponent"];
    return mediumSkyBlue;
}

+ (UIColor *)mediumSlateBlue {
    UIColor *mediumSlateBlue = [UIColor colorWithRed:48.0f/100.0f green:41.0f/100.0f blue:93.0f/100.0f alpha:1.0f];
    [mediumSlateBlue setValue:[NSNumber numberWithFloat:48.0f/100.0f] forKey:@"redComponent"];
    [mediumSlateBlue setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"greenComponent"];
    [mediumSlateBlue setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"blueComponent"];
    return mediumSlateBlue;
}

+ (UIColor *)mediumSpringBud {
    UIColor *mediumSpringBud = [UIColor colorWithRed:79.0f/100.0f green:86.0f/100.0f blue:53.0f/100.0f alpha:1.0f];
    [mediumSpringBud setValue:[NSNumber numberWithFloat:79.0f/100.0f] forKey:@"redComponent"];
    [mediumSpringBud setValue:[NSNumber numberWithFloat:86.0f/100.0f] forKey:@"greenComponent"];
    [mediumSpringBud setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"blueComponent"];
    return mediumSpringBud;
}

+ (UIColor *)mediumSpringGreen {
    UIColor *mediumSpringGreen = [UIColor colorWithRed:0.0f green:98.0f/100.0f blue:6.0f/10.0f alpha:1.0f];
    [mediumSpringGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [mediumSpringGreen setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"greenComponent"];
    [mediumSpringGreen setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"blueComponent"];
    return mediumSpringGreen;
}

+ (UIColor *)mediumTaupe {
    UIColor *mediumTaupe = [UIColor colorWithRed:4.0f/10.0f green:3.0f/10.0f blue:28.0f/100.0f alpha:1.0f];
    [mediumTaupe setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"redComponent"];
    [mediumTaupe setValue:[NSNumber numberWithFloat:3.0f/10.0f] forKey:@"greenComponent"];
    [mediumTaupe setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"blueComponent"];
    return mediumTaupe;
}

+ (UIColor *)mediumTurquoise {
    UIColor *mediumTurquoise = [UIColor colorWithRed:28.0f/100.0f green:82.0f/100.0f blue:8.0f/10.0f alpha:1.0f];
    [mediumTurquoise setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"redComponent"];
    [mediumTurquoise setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"greenComponent"];
    [mediumTurquoise setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"blueComponent"];
    return mediumTurquoise;
}

+ (UIColor *)mediumTuscanRed {
    UIColor *mediumTuscanRed = [UIColor colorWithRed:47.0f/100.0f green:27.0f/100.0f blue:23.0f/100.0f alpha:1.0f];
    [mediumTuscanRed setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"redComponent"];
    [mediumTuscanRed setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"greenComponent"];
    [mediumTuscanRed setValue:[NSNumber numberWithFloat:23.0f/100.0f] forKey:@"blueComponent"];
    return mediumTuscanRed;
}

+ (UIColor *)mediumVermilion {
    UIColor *mediumVermilion = [UIColor colorWithRed:85.0f/100.0f green:38.0f/100.0f blue:23.0f/100.0f alpha:1.0f];
    [mediumVermilion setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"redComponent"];
    [mediumVermilion setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"greenComponent"];
    [mediumVermilion setValue:[NSNumber numberWithFloat:23.0f/100.0f] forKey:@"blueComponent"];
    return mediumVermilion;
}

+ (UIColor *)mediumVioletRed {
    UIColor *mediumVioletRed = [UIColor colorWithRed:78.0f/100.0f green:8.0f/100.0f blue:52.0f/100.0f alpha:1.0f];
    [mediumVioletRed setValue:[NSNumber numberWithFloat:78.0f/100.0f] forKey:@"redComponent"];
    [mediumVioletRed setValue:[NSNumber numberWithFloat:8.0f/100.0f] forKey:@"greenComponent"];
    [mediumVioletRed setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"blueComponent"];
    return mediumVioletRed;
}

+ (UIColor *)mellowApricot {
    UIColor *mellowApricot = [UIColor colorWithRed:97.0f/100.0f green:72.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
    [mellowApricot setValue:[NSNumber numberWithFloat:97.0f/100.0f] forKey:@"redComponent"];
    [mellowApricot setValue:[NSNumber numberWithFloat:72.0f/100.0f] forKey:@"greenComponent"];
    [mellowApricot setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"blueComponent"];
    return mellowApricot;
}

+ (UIColor *)mellowYellow {
    UIColor *mellowYellow = [UIColor colorWithRed:97.0f/100.0f green:87.0f/100.0f blue:49.0f/100.0f alpha:1.0f];
    [mellowYellow setValue:[NSNumber numberWithFloat:97.0f/100.0f] forKey:@"redComponent"];
    [mellowYellow setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"greenComponent"];
    [mellowYellow setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"blueComponent"];
    return mellowYellow;
}

+ (UIColor *)melon {
    UIColor *melon = [UIColor colorWithRed:99.0f/100.0f green:74.0f/100.0f blue:71.0f/100.0f alpha:1.0f];
    [melon setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"redComponent"];
    [melon setValue:[NSNumber numberWithFloat:74.0f/100.0f] forKey:@"greenComponent"];
    [melon setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"blueComponent"];
    return melon;
}

+ (UIColor *)metallicSeaweed {
    UIColor *metallicSeaweed = [UIColor colorWithRed:4.0f/100.0f green:49.0f/100.0f blue:55.0f/100.0f alpha:1.0f];
    [metallicSeaweed setValue:[NSNumber numberWithFloat:4.0f/100.0f] forKey:@"redComponent"];
    [metallicSeaweed setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"greenComponent"];
    [metallicSeaweed setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"blueComponent"];
    return metallicSeaweed;
}

+ (UIColor *)metallicSunburst {
    UIColor *metallicSunburst = [UIColor colorWithRed:61.0f/100.0f green:49.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
    [metallicSunburst setValue:[NSNumber numberWithFloat:61.0f/100.0f] forKey:@"redComponent"];
    [metallicSunburst setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"greenComponent"];
    [metallicSunburst setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"blueComponent"];
    return metallicSunburst;
}

+ (UIColor *)mexicanPink {
    UIColor *mexicanPink = [UIColor colorWithRed:89.0f/100.0f green:0.0f blue:49.0f/100.0f alpha:1.0f];
    [mexicanPink setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"redComponent"];
    [mexicanPink setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [mexicanPink setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"blueComponent"];
    return mexicanPink;
}

+ (UIColor *)midnightBlue {
    UIColor *midnightBlue = [UIColor colorWithRed:1.0f/10.0f green:1.0f/10.0f blue:44.0f/100.0f alpha:1.0f];
    [midnightBlue setValue:[NSNumber numberWithFloat:1.0f/10.0f] forKey:@"redComponent"];
    [midnightBlue setValue:[NSNumber numberWithFloat:1.0f/10.0f] forKey:@"greenComponent"];
    [midnightBlue setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"blueComponent"];
    return midnightBlue;
}

+ (UIColor *)midnightGreenEagleGreen {
    UIColor *midnightGreenEagleGreen = [UIColor colorWithRed:0.0f green:29.0f/100.0f blue:0.333f alpha:1.0f];
    [midnightGreenEagleGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [midnightGreenEagleGreen setValue:[NSNumber numberWithFloat:29.0f/100.0f] forKey:@"greenComponent"];
    [midnightGreenEagleGreen setValue:[NSNumber numberWithFloat:0.333f] forKey:@"blueComponent"];
    return midnightGreenEagleGreen;
}

+ (UIColor *)mikadoYellow {
    UIColor *mikadoYellow = [UIColor colorWithRed:1.0f green:77.0f/100.0f blue:5.0f/100.0f alpha:1.0f];
    [mikadoYellow setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [mikadoYellow setValue:[NSNumber numberWithFloat:77.0f/100.0f] forKey:@"greenComponent"];
    [mikadoYellow setValue:[NSNumber numberWithFloat:5.0f/100.0f] forKey:@"blueComponent"];
    return mikadoYellow;
}

+ (UIColor *)mindaro {
    UIColor *mindaro = [UIColor colorWithRed:89.0f/100.0f green:98.0f/100.0f blue:53.0f/100.0f alpha:1.0f];
    [mindaro setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"redComponent"];
    [mindaro setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"greenComponent"];
    [mindaro setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"blueComponent"];
    return mindaro;
}

+ (UIColor *)ming {
    UIColor *ming = [UIColor colorWithRed:21.0f/100.0f green:45.0f/100.0f blue:49.0f/100.0f alpha:1.0f];
    [ming setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"redComponent"];
    [ming setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"greenComponent"];
    [ming setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"blueComponent"];
    return ming;
}

+ (UIColor *)mint {
    UIColor *mint = [UIColor colorWithRed:24.0f/100.0f green:71.0f/100.0f blue:54.0f/100.0f alpha:1.0f];
    [mint setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"redComponent"];
    [mint setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"greenComponent"];
    [mint setValue:[NSNumber numberWithFloat:54.0f/100.0f] forKey:@"blueComponent"];
    return mint;
}

+ (UIColor *)mintCream {
    UIColor *mintCream = [UIColor colorWithRed:96.0f/100.0f green:1.0f blue:98.0f/100.0f alpha:1.0f];
    [mintCream setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"redComponent"];
    [mintCream setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [mintCream setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"blueComponent"];
    return mintCream;
}

+ (UIColor *)mintGreen {
    UIColor *mintGreen = [UIColor colorWithRed:6.0f/10.0f green:1.0f blue:6.0f/10.0f alpha:1.0f];
    [mintGreen setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"redComponent"];
    [mintGreen setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [mintGreen setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"blueComponent"];
    return mintGreen;
}

+ (UIColor *)mistyRose {
    UIColor *mistyRose = [UIColor colorWithRed:1.0f green:89.0f/100.0f blue:88.0f/100.0f alpha:1.0f];
    [mistyRose setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [mistyRose setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"greenComponent"];
    [mistyRose setValue:[NSNumber numberWithFloat:88.0f/100.0f] forKey:@"blueComponent"];
    return mistyRose;
}

+ (UIColor *)moccasin {
    UIColor *moccasin = [UIColor colorWithRed:98.0f/100.0f green:92.0f/100.0f blue:84.0f/100.0f alpha:1.0f];
    [moccasin setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [moccasin setValue:[NSNumber numberWithFloat:92.0f/100.0f] forKey:@"greenComponent"];
    [moccasin setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"blueComponent"];
    return moccasin;
}

+ (UIColor *)modeBeige {
    UIColor *modeBeige = [UIColor colorWithRed:59.0f/100.0f green:44.0f/100.0f blue:9.0f/100.0f alpha:1.0f];
    [modeBeige setValue:[NSNumber numberWithFloat:59.0f/100.0f] forKey:@"redComponent"];
    [modeBeige setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"greenComponent"];
    [modeBeige setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"blueComponent"];
    return modeBeige;
}

+ (UIColor *)moonstoneBlue {
    UIColor *moonstoneBlue = [UIColor colorWithRed:45.0f/100.0f green:66.0f/100.0f blue:76.0f/100.0f alpha:1.0f];
    [moonstoneBlue setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"redComponent"];
    [moonstoneBlue setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"greenComponent"];
    [moonstoneBlue setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"blueComponent"];
    return moonstoneBlue;
}

+ (UIColor *)mordantRed19 {
    UIColor *mordantRed19 = [UIColor colorWithRed:68.0f/100.0f green:5.0f/100.0f blue:0.0f alpha:1.0f];
    [mordantRed19 setValue:[NSNumber numberWithFloat:68.0f/100.0f] forKey:@"redComponent"];
    [mordantRed19 setValue:[NSNumber numberWithFloat:5.0f/100.0f] forKey:@"greenComponent"];
    [mordantRed19 setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return mordantRed19;
}

+ (UIColor *)mossGreen {
    UIColor *mossGreen = [UIColor colorWithRed:54.0f/100.0f green:6.0f/10.0f blue:36.0f/100.0f alpha:1.0f];
    [mossGreen setValue:[NSNumber numberWithFloat:54.0f/100.0f] forKey:@"redComponent"];
    [mossGreen setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [mossGreen setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"blueComponent"];
    return mossGreen;
}

+ (UIColor *)mountainMeadow {
    UIColor *mountainMeadow = [UIColor colorWithRed:19.0f/100.0f green:73.0f/100.0f blue:56.0f/100.0f alpha:1.0f];
    [mountainMeadow setValue:[NSNumber numberWithFloat:19.0f/100.0f] forKey:@"redComponent"];
    [mountainMeadow setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"greenComponent"];
    [mountainMeadow setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"blueComponent"];
    return mountainMeadow;
}

+ (UIColor *)mountbattenPink {
    UIColor *mountbattenPink = [UIColor colorWithRed:6.0f/10.0f green:48.0f/100.0f blue:55.0f/100.0f alpha:1.0f];
    [mountbattenPink setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"redComponent"];
    [mountbattenPink setValue:[NSNumber numberWithFloat:48.0f/100.0f] forKey:@"greenComponent"];
    [mountbattenPink setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"blueComponent"];
    return mountbattenPink;
}

+ (UIColor *)mSUGreen {
    UIColor *mSUGreen = [UIColor colorWithRed:9.0f/100.0f green:27.0f/100.0f blue:23.0f/100.0f alpha:1.0f];
    [mSUGreen setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"redComponent"];
    [mSUGreen setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"greenComponent"];
    [mSUGreen setValue:[NSNumber numberWithFloat:23.0f/100.0f] forKey:@"blueComponent"];
    return mSUGreen;
}

+ (UIColor *)mughalGreen {
    UIColor *mughalGreen = [UIColor colorWithRed:19.0f/100.0f green:38.0f/100.0f blue:19.0f/100.0f alpha:1.0f];
    [mughalGreen setValue:[NSNumber numberWithFloat:19.0f/100.0f] forKey:@"redComponent"];
    [mughalGreen setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"greenComponent"];
    [mughalGreen setValue:[NSNumber numberWithFloat:19.0f/100.0f] forKey:@"blueComponent"];
    return mughalGreen;
}

+ (UIColor *)mulberry {
    UIColor *mulberry = [UIColor colorWithRed:77.0f/100.0f green:29.0f/100.0f blue:55.0f/100.0f alpha:1.0f];
    [mulberry setValue:[NSNumber numberWithFloat:77.0f/100.0f] forKey:@"redComponent"];
    [mulberry setValue:[NSNumber numberWithFloat:29.0f/100.0f] forKey:@"greenComponent"];
    [mulberry setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"blueComponent"];
    return mulberry;
}

+ (UIColor *)mustard {
    UIColor *mustard = [UIColor colorWithRed:1.0f green:86.0f/100.0f blue:35.0f/100.0f alpha:1.0f];
    [mustard setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [mustard setValue:[NSNumber numberWithFloat:86.0f/100.0f] forKey:@"greenComponent"];
    [mustard setValue:[NSNumber numberWithFloat:35.0f/100.0f] forKey:@"blueComponent"];
    return mustard;
}

+ (UIColor *)myrtleGreen {
    UIColor *myrtleGreen = [UIColor colorWithRed:19.0f/100.0f green:47.0f/100.0f blue:45.0f/100.0f alpha:1.0f];
    [myrtleGreen setValue:[NSNumber numberWithFloat:19.0f/100.0f] forKey:@"redComponent"];
    [myrtleGreen setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"greenComponent"];
    [myrtleGreen setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"blueComponent"];
    return myrtleGreen;
}

+ (UIColor *)nadeshikoPink {
    UIColor *nadeshikoPink = [UIColor colorWithRed:96.0f/100.0f green:68.0f/100.0f blue:78.0f/100.0f alpha:1.0f];
    [nadeshikoPink setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"redComponent"];
    [nadeshikoPink setValue:[NSNumber numberWithFloat:68.0f/100.0f] forKey:@"greenComponent"];
    [nadeshikoPink setValue:[NSNumber numberWithFloat:78.0f/100.0f] forKey:@"blueComponent"];
    return nadeshikoPink;
}

+ (UIColor *)napierGreen {
    UIColor *napierGreen = [UIColor colorWithRed:16.0f/100.0f green:0.5f blue:0.0f alpha:1.0f];
    [napierGreen setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"redComponent"];
    [napierGreen setValue:[NSNumber numberWithFloat:0.5f] forKey:@"greenComponent"];
    [napierGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return napierGreen;
}

+ (UIColor *)naplesYellow {
    UIColor *naplesYellow = [UIColor colorWithRed:98.0f/100.0f green:85.0f/100.0f blue:37.0f/100.0f alpha:1.0f];
    [naplesYellow setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [naplesYellow setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"greenComponent"];
    [naplesYellow setValue:[NSNumber numberWithFloat:37.0f/100.0f] forKey:@"blueComponent"];
    return naplesYellow;
}

+ (UIColor *)navajoWhite {
    UIColor *navajoWhite = [UIColor colorWithRed:1.0f green:87.0f/100.0f blue:68.0f/100.0f alpha:1.0f];
    [navajoWhite setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [navajoWhite setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"greenComponent"];
    [navajoWhite setValue:[NSNumber numberWithFloat:68.0f/100.0f] forKey:@"blueComponent"];
    return navajoWhite;
}

+ (UIColor *)navy {
    UIColor *navy = [UIColor colorWithRed:0.0f green:0.0f blue:0.5f alpha:1.0f];
    [navy setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [navy setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [navy setValue:[NSNumber numberWithFloat:0.5f] forKey:@"blueComponent"];
    return navy;
}

+ (UIColor *)navyPurple {
    UIColor *navyPurple = [UIColor colorWithRed:58.0f/100.0f green:34.0f/100.0f blue:92.0f/100.0f alpha:1.0f];
    [navyPurple setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"redComponent"];
    [navyPurple setValue:[NSNumber numberWithFloat:34.0f/100.0f] forKey:@"greenComponent"];
    [navyPurple setValue:[NSNumber numberWithFloat:92.0f/100.0f] forKey:@"blueComponent"];
    return navyPurple;
}

+ (UIColor *)neonCarrot {
    UIColor *neonCarrot = [UIColor colorWithRed:1.0f green:64.0f/100.0f blue:26.0f/100.0f alpha:1.0f];
    [neonCarrot setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [neonCarrot setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"greenComponent"];
    [neonCarrot setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"blueComponent"];
    return neonCarrot;
}

+ (UIColor *)neonFuchsia {
    UIColor *neonFuchsia = [UIColor colorWithRed:1.0f green:0.25f blue:39.0f/100.0f alpha:1.0f];
    [neonFuchsia setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [neonFuchsia setValue:[NSNumber numberWithFloat:0.25f] forKey:@"greenComponent"];
    [neonFuchsia setValue:[NSNumber numberWithFloat:39.0f/100.0f] forKey:@"blueComponent"];
    return neonFuchsia;
}

+ (UIColor *)neonGreen {
    UIColor *neonGreen = [UIColor colorWithRed:22.0f/100.0f green:1.0f blue:8.0f/100.0f alpha:1.0f];
    [neonGreen setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"redComponent"];
    [neonGreen setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [neonGreen setValue:[NSNumber numberWithFloat:8.0f/100.0f] forKey:@"blueComponent"];
    return neonGreen;
}

+ (UIColor *)newCar {
    UIColor *newCar = [UIColor colorWithRed:13.0f/100.0f green:31.0f/100.0f blue:78.0f/100.0f alpha:1.0f];
    [newCar setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"redComponent"];
    [newCar setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"greenComponent"];
    [newCar setValue:[NSNumber numberWithFloat:78.0f/100.0f] forKey:@"blueComponent"];
    return newCar;
}

+ (UIColor *)newYorkPink {
    UIColor *newYorkPink = [UIColor colorWithRed:84.0f/100.0f green:51.0f/100.0f blue:0.5f alpha:1.0f];
    [newYorkPink setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"redComponent"];
    [newYorkPink setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"greenComponent"];
    [newYorkPink setValue:[NSNumber numberWithFloat:0.5f] forKey:@"blueComponent"];
    return newYorkPink;
}

+ (UIColor *)nonPhotoBlue {
    UIColor *nonPhotoBlue = [UIColor colorWithRed:64.0f/100.0f green:87.0f/100.0f blue:93.0f/100.0f alpha:1.0f];
    [nonPhotoBlue setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"redComponent"];
    [nonPhotoBlue setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"greenComponent"];
    [nonPhotoBlue setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"blueComponent"];
    return nonPhotoBlue;
}

+ (UIColor *)northTexasGreen {
    UIColor *northTexasGreen = [UIColor colorWithRed:2.0f/100.0f green:56.0f/100.0f blue:2.0f/10.0f alpha:1.0f];
    [northTexasGreen setValue:[NSNumber numberWithFloat:2.0f/100.0f] forKey:@"redComponent"];
    [northTexasGreen setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"greenComponent"];
    [northTexasGreen setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"blueComponent"];
    return northTexasGreen;
}

+ (UIColor *)nyanza {
    UIColor *nyanza = [UIColor colorWithRed:91.0f/100.0f green:1.0f blue:86.0f/100.0f alpha:1.0f];
    [nyanza setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"redComponent"];
    [nyanza setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [nyanza setValue:[NSNumber numberWithFloat:86.0f/100.0f] forKey:@"blueComponent"];
    return nyanza;
}

+ (UIColor *)oceanBoatBlue {
    UIColor *oceanBoatBlue = [UIColor colorWithRed:0.0f green:47.0f/100.0f blue:0.75f alpha:1.0f];
    [oceanBoatBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [oceanBoatBlue setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"greenComponent"];
    [oceanBoatBlue setValue:[NSNumber numberWithFloat:0.75f] forKey:@"blueComponent"];
    return oceanBoatBlue;
}

+ (UIColor *)ochre {
    UIColor *ochre = [UIColor colorWithRed:8.0f/10.0f green:47.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
    [ochre setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [ochre setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"greenComponent"];
    [ochre setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"blueComponent"];
    return ochre;
}

+ (UIColor *)officeGreen {
    UIColor *officeGreen = [UIColor colorWithRed:0.0f green:0.5f blue:0.0f alpha:1.0f];
    [officeGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [officeGreen setValue:[NSNumber numberWithFloat:0.5f] forKey:@"greenComponent"];
    [officeGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return officeGreen;
}

+ (UIColor *)oldBurgundy {
    UIColor *oldBurgundy = [UIColor colorWithRed:26.0f/100.0f green:19.0f/100.0f blue:18.0f/100.0f alpha:1.0f];
    [oldBurgundy setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"redComponent"];
    [oldBurgundy setValue:[NSNumber numberWithFloat:19.0f/100.0f] forKey:@"greenComponent"];
    [oldBurgundy setValue:[NSNumber numberWithFloat:18.0f/100.0f] forKey:@"blueComponent"];
    return oldBurgundy;
}

+ (UIColor *)oldGold {
    UIColor *oldGold = [UIColor colorWithRed:81.0f/100.0f green:71.0f/100.0f blue:23.0f/100.0f alpha:1.0f];
    [oldGold setValue:[NSNumber numberWithFloat:81.0f/100.0f] forKey:@"redComponent"];
    [oldGold setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"greenComponent"];
    [oldGold setValue:[NSNumber numberWithFloat:23.0f/100.0f] forKey:@"blueComponent"];
    return oldGold;
}

+ (UIColor *)oldHeliotrope {
    UIColor *oldHeliotrope = [UIColor colorWithRed:34.0f/100.0f green:24.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
    [oldHeliotrope setValue:[NSNumber numberWithFloat:34.0f/100.0f] forKey:@"redComponent"];
    [oldHeliotrope setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"greenComponent"];
    [oldHeliotrope setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"blueComponent"];
    return oldHeliotrope;
}

+ (UIColor *)oldLace {
    UIColor *oldLace = [UIColor colorWithRed:99.0f/100.0f green:96.0f/100.0f blue:9.0f/10.0f alpha:1.0f];
    [oldLace setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"redComponent"];
    [oldLace setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"greenComponent"];
    [oldLace setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"blueComponent"];
    return oldLace;
}

+ (UIColor *)oldLavender {
    UIColor *oldLavender = [UIColor colorWithRed:47.0f/100.0f green:41.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
    [oldLavender setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"redComponent"];
    [oldLavender setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"greenComponent"];
    [oldLavender setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"blueComponent"];
    return oldLavender;
}

+ (UIColor *)oldMauve {
    UIColor *oldMauve = [UIColor colorWithRed:4.0f/10.0f green:19.0f/100.0f blue:28.0f/100.0f alpha:1.0f];
    [oldMauve setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"redComponent"];
    [oldMauve setValue:[NSNumber numberWithFloat:19.0f/100.0f] forKey:@"greenComponent"];
    [oldMauve setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"blueComponent"];
    return oldMauve;
}

+ (UIColor *)oldMossGreen {
    UIColor *oldMossGreen = [UIColor colorWithRed:53.0f/100.0f green:49.0f/100.0f blue:21.0f/100.0f alpha:1.0f];
    [oldMossGreen setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"redComponent"];
    [oldMossGreen setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"greenComponent"];
    [oldMossGreen setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"blueComponent"];
    return oldMossGreen;
}

+ (UIColor *)oldRose {
    UIColor *oldRose = [UIColor colorWithRed:0.75f green:0.5f blue:51.0f/100.0f alpha:1.0f];
    [oldRose setValue:[NSNumber numberWithFloat:0.75f] forKey:@"redComponent"];
    [oldRose setValue:[NSNumber numberWithFloat:0.5f] forKey:@"greenComponent"];
    [oldRose setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"blueComponent"];
    return oldRose;
}

+ (UIColor *)oldSilver {
    UIColor *oldSilver = [UIColor colorWithRed:52.0f/100.0f green:52.0f/100.0f blue:51.0f/100.0f alpha:1.0f];
    [oldSilver setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"redComponent"];
    [oldSilver setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"greenComponent"];
    [oldSilver setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"blueComponent"];
    return oldSilver;
}

+ (UIColor *)olive {
    UIColor *olive = [UIColor colorWithRed:0.5f green:0.5f blue:0.0f alpha:1.0f];
    [olive setValue:[NSNumber numberWithFloat:0.5f] forKey:@"redComponent"];
    [olive setValue:[NSNumber numberWithFloat:0.5f] forKey:@"greenComponent"];
    [olive setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return olive;
}

+ (UIColor *)oliveDrab3 {
    UIColor *oliveDrab3 = [UIColor colorWithRed:42.0f/100.0f green:56.0f/100.0f blue:14.0f/100.0f alpha:1.0f];
    [oliveDrab3 setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"redComponent"];
    [oliveDrab3 setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"greenComponent"];
    [oliveDrab3 setValue:[NSNumber numberWithFloat:14.0f/100.0f] forKey:@"blueComponent"];
    return oliveDrab3;
}

+ (UIColor *)oliveDrab7 {
    UIColor *oliveDrab7 = [UIColor colorWithRed:24.0f/100.0f green:2.0f/10.0f blue:12.0f/100.0f alpha:1.0f];
    [oliveDrab7 setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"redComponent"];
    [oliveDrab7 setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"greenComponent"];
    [oliveDrab7 setValue:[NSNumber numberWithFloat:12.0f/100.0f] forKey:@"blueComponent"];
    return oliveDrab7;
}

+ (UIColor *)olivine {
    UIColor *olivine = [UIColor colorWithRed:6.0f/10.0f green:73.0f/100.0f blue:45.0f/100.0f alpha:1.0f];
    [olivine setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"redComponent"];
    [olivine setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"greenComponent"];
    [olivine setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"blueComponent"];
    return olivine;
}

+ (UIColor *)onyx {
    UIColor *onyx = [UIColor colorWithRed:21.0f/100.0f green:22.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
    [onyx setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"redComponent"];
    [onyx setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"greenComponent"];
    [onyx setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"blueComponent"];
    return onyx;
}

+ (UIColor *)operaMauve {
    UIColor *operaMauve = [UIColor colorWithRed:72.0f/100.0f green:52.0f/100.0f blue:65.0f/100.0f alpha:1.0f];
    [operaMauve setValue:[NSNumber numberWithFloat:72.0f/100.0f] forKey:@"redComponent"];
    [operaMauve setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"greenComponent"];
    [operaMauve setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"blueComponent"];
    return operaMauve;
}

+ (UIColor *)orangeColorWheel {
    UIColor *orangeColorWheel = [UIColor colorWithRed:1.0f green:0.5f blue:0.0f alpha:1.0f];
    [orangeColorWheel setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [orangeColorWheel setValue:[NSNumber numberWithFloat:0.5f] forKey:@"greenComponent"];
    [orangeColorWheel setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return orangeColorWheel;
}

+ (UIColor *)orangeCrayola {
    UIColor *orangeCrayola = [UIColor colorWithRed:1.0f green:46.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
    [orangeCrayola setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [orangeCrayola setValue:[NSNumber numberWithFloat:46.0f/100.0f] forKey:@"greenComponent"];
    [orangeCrayola setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"blueComponent"];
    return orangeCrayola;
}

+ (UIColor *)orangePantone {
    UIColor *orangePantone = [UIColor colorWithRed:1.0f green:35.0f/100.0f blue:0.0f alpha:1.0f];
    [orangePantone setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [orangePantone setValue:[NSNumber numberWithFloat:35.0f/100.0f] forKey:@"greenComponent"];
    [orangePantone setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return orangePantone;
}

+ (UIColor *)orangeRYB {
    UIColor *orangeRYB = [UIColor colorWithRed:98.0f/100.0f green:6.0f/10.0f blue:1.0f/100.0f alpha:1.0f];
    [orangeRYB setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [orangeRYB setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [orangeRYB setValue:[NSNumber numberWithFloat:1.0f/100.0f] forKey:@"blueComponent"];
    return orangeRYB;
}

+ (UIColor *)orangeWeb {
    UIColor *orangeWeb = [UIColor colorWithRed:1.0f green:65.0f/100.0f blue:0.0f alpha:1.0f];
    [orangeWeb setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [orangeWeb setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"greenComponent"];
    [orangeWeb setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return orangeWeb;
}

+ (UIColor *)orangePeel {
    UIColor *orangePeel = [UIColor colorWithRed:1.0f green:62.0f/100.0f blue:0.0f alpha:1.0f];
    [orangePeel setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [orangePeel setValue:[NSNumber numberWithFloat:62.0f/100.0f] forKey:@"greenComponent"];
    [orangePeel setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return orangePeel;
}

+ (UIColor *)orangeRed {
    UIColor *orangeRed = [UIColor colorWithRed:1.0f green:27.0f/100.0f blue:0.0f alpha:1.0f];
    [orangeRed setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [orangeRed setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"greenComponent"];
    [orangeRed setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return orangeRed;
}

+ (UIColor *)orangeYellow {
    UIColor *orangeYellow = [UIColor colorWithRed:97.0f/100.0f green:84.0f/100.0f blue:41.0f/100.0f alpha:1.0f];
    [orangeYellow setValue:[NSNumber numberWithFloat:97.0f/100.0f] forKey:@"redComponent"];
    [orangeYellow setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"greenComponent"];
    [orangeYellow setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"blueComponent"];
    return orangeYellow;
}

+ (UIColor *)orchid {
    UIColor *orchid = [UIColor colorWithRed:85.0f/100.0f green:44.0f/100.0f blue:84.0f/100.0f alpha:1.0f];
    [orchid setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"redComponent"];
    [orchid setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"greenComponent"];
    [orchid setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"blueComponent"];
    return orchid;
}

+ (UIColor *)orchidPink {
    UIColor *orchidPink = [UIColor colorWithRed:95.0f/100.0f green:74.0f/100.0f blue:8.0f/10.0f alpha:1.0f];
    [orchidPink setValue:[NSNumber numberWithFloat:95.0f/100.0f] forKey:@"redComponent"];
    [orchidPink setValue:[NSNumber numberWithFloat:74.0f/100.0f] forKey:@"greenComponent"];
    [orchidPink setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"blueComponent"];
    return orchidPink;
}

+ (UIColor *)oriolesOrange {
    UIColor *oriolesOrange = [UIColor colorWithRed:98.0f/100.0f green:31.0f/100.0f blue:8.0f/100.0f alpha:1.0f];
    [oriolesOrange setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [oriolesOrange setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"greenComponent"];
    [oriolesOrange setValue:[NSNumber numberWithFloat:8.0f/100.0f] forKey:@"blueComponent"];
    return oriolesOrange;
}

+ (UIColor *)otterBrown {
    UIColor *otterBrown = [UIColor colorWithRed:4.0f/10.0f green:26.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
    [otterBrown setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"redComponent"];
    [otterBrown setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"greenComponent"];
    [otterBrown setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"blueComponent"];
    return otterBrown;
}

+ (UIColor *)outerSpace {
    UIColor *outerSpace = [UIColor colorWithRed:0.25f green:29.0f/100.0f blue:3.0f/10.0f alpha:1.0f];
    [outerSpace setValue:[NSNumber numberWithFloat:0.25f] forKey:@"redComponent"];
    [outerSpace setValue:[NSNumber numberWithFloat:29.0f/100.0f] forKey:@"greenComponent"];
    [outerSpace setValue:[NSNumber numberWithFloat:3.0f/10.0f] forKey:@"blueComponent"];
    return outerSpace;
}

+ (UIColor *)outrageousOrange {
    UIColor *outrageousOrange = [UIColor colorWithRed:1.0f green:43.0f/100.0f blue:29.0f/100.0f alpha:1.0f];
    [outrageousOrange setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [outrageousOrange setValue:[NSNumber numberWithFloat:43.0f/100.0f] forKey:@"greenComponent"];
    [outrageousOrange setValue:[NSNumber numberWithFloat:29.0f/100.0f] forKey:@"blueComponent"];
    return outrageousOrange;
}

+ (UIColor *)oxfordBlue {
    UIColor *oxfordBlue = [UIColor colorWithRed:0.0f green:13.0f/100.0f blue:28.0f/100.0f alpha:1.0f];
    [oxfordBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [oxfordBlue setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"greenComponent"];
    [oxfordBlue setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"blueComponent"];
    return oxfordBlue;
}

+ (UIColor *)oUCrimsonRed {
    UIColor *oUCrimsonRed = [UIColor colorWithRed:6.0f/10.0f green:0.0f blue:0.0f alpha:1.0f];
    [oUCrimsonRed setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"redComponent"];
    [oUCrimsonRed setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [oUCrimsonRed setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return oUCrimsonRed;
}

+ (UIColor *)pakistanGreen {
    UIColor *pakistanGreen = [UIColor colorWithRed:0.0f green:4.0f/10.0f blue:0.0f alpha:1.0f];
    [pakistanGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [pakistanGreen setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"greenComponent"];
    [pakistanGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return pakistanGreen;
}

+ (UIColor *)palatinateBlue {
    UIColor *palatinateBlue = [UIColor colorWithRed:15.0f/100.0f green:23.0f/100.0f blue:89.0f/100.0f alpha:1.0f];
    [palatinateBlue setValue:[NSNumber numberWithFloat:15.0f/100.0f] forKey:@"redComponent"];
    [palatinateBlue setValue:[NSNumber numberWithFloat:23.0f/100.0f] forKey:@"greenComponent"];
    [palatinateBlue setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"blueComponent"];
    return palatinateBlue;
}

+ (UIColor *)palatinatePurple {
    UIColor *palatinatePurple = [UIColor colorWithRed:41.0f/100.0f green:16.0f/100.0f blue:38.0f/100.0f alpha:1.0f];
    [palatinatePurple setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"redComponent"];
    [palatinatePurple setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"greenComponent"];
    [palatinatePurple setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"blueComponent"];
    return palatinatePurple;
}

+ (UIColor *)paleAqua {
    UIColor *paleAqua = [UIColor colorWithRed:74.0f/100.0f green:83.0f/100.0f blue:9.0f/10.0f alpha:1.0f];
    [paleAqua setValue:[NSNumber numberWithFloat:74.0f/100.0f] forKey:@"redComponent"];
    [paleAqua setValue:[NSNumber numberWithFloat:83.0f/100.0f] forKey:@"greenComponent"];
    [paleAqua setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"blueComponent"];
    return paleAqua;
}

+ (UIColor *)paleBlue {
    UIColor *paleBlue = [UIColor colorWithRed:69.0f/100.0f green:93.0f/100.0f blue:93.0f/100.0f alpha:1.0f];
    [paleBlue setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"redComponent"];
    [paleBlue setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"greenComponent"];
    [paleBlue setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"blueComponent"];
    return paleBlue;
}

+ (UIColor *)paleBrown {
    UIColor *paleBrown = [UIColor colorWithRed:6.0f/10.0f green:46.0f/100.0f blue:0.333f alpha:1.0f];
    [paleBrown setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"redComponent"];
    [paleBrown setValue:[NSNumber numberWithFloat:46.0f/100.0f] forKey:@"greenComponent"];
    [paleBrown setValue:[NSNumber numberWithFloat:0.333f] forKey:@"blueComponent"];
    return paleBrown;
}

+ (UIColor *)paleCarmine {
    UIColor *paleCarmine = [UIColor colorWithRed:69.0f/100.0f green:0.25f blue:21.0f/100.0f alpha:1.0f];
    [paleCarmine setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"redComponent"];
    [paleCarmine setValue:[NSNumber numberWithFloat:0.25f] forKey:@"greenComponent"];
    [paleCarmine setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"blueComponent"];
    return paleCarmine;
}

+ (UIColor *)paleCerulean {
    UIColor *paleCerulean = [UIColor colorWithRed:61.0f/100.0f green:77.0f/100.0f blue:89.0f/100.0f alpha:1.0f];
    [paleCerulean setValue:[NSNumber numberWithFloat:61.0f/100.0f] forKey:@"redComponent"];
    [paleCerulean setValue:[NSNumber numberWithFloat:77.0f/100.0f] forKey:@"greenComponent"];
    [paleCerulean setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"blueComponent"];
    return paleCerulean;
}

+ (UIColor *)paleChestnut {
    UIColor *paleChestnut = [UIColor colorWithRed:87.0f/100.0f green:68.0f/100.0f blue:69.0f/100.0f alpha:1.0f];
    [paleChestnut setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"redComponent"];
    [paleChestnut setValue:[NSNumber numberWithFloat:68.0f/100.0f] forKey:@"greenComponent"];
    [paleChestnut setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"blueComponent"];
    return paleChestnut;
}

+ (UIColor *)paleCopper {
    UIColor *paleCopper = [UIColor colorWithRed:85.0f/100.0f green:54.0f/100.0f blue:4.0f/10.0f alpha:1.0f];
    [paleCopper setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"redComponent"];
    [paleCopper setValue:[NSNumber numberWithFloat:54.0f/100.0f] forKey:@"greenComponent"];
    [paleCopper setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"blueComponent"];
    return paleCopper;
}

+ (UIColor *)paleCornflowerBlue {
    UIColor *paleCornflowerBlue = [UIColor colorWithRed:0.667f green:8.0f/10.0f blue:94.0f/100.0f alpha:1.0f];
    [paleCornflowerBlue setValue:[NSNumber numberWithFloat:0.667f] forKey:@"redComponent"];
    [paleCornflowerBlue setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"greenComponent"];
    [paleCornflowerBlue setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"blueComponent"];
    return paleCornflowerBlue;
}

+ (UIColor *)paleCyan {
    UIColor *paleCyan = [UIColor colorWithRed:53.0f/100.0f green:83.0f/100.0f blue:97.0f/100.0f alpha:1.0f];
    [paleCyan setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"redComponent"];
    [paleCyan setValue:[NSNumber numberWithFloat:83.0f/100.0f] forKey:@"greenComponent"];
    [paleCyan setValue:[NSNumber numberWithFloat:97.0f/100.0f] forKey:@"blueComponent"];
    return paleCyan;
}

+ (UIColor *)paleGold {
    UIColor *paleGold = [UIColor colorWithRed:9.0f/10.0f green:0.75f blue:54.0f/100.0f alpha:1.0f];
    [paleGold setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"redComponent"];
    [paleGold setValue:[NSNumber numberWithFloat:0.75f] forKey:@"greenComponent"];
    [paleGold setValue:[NSNumber numberWithFloat:54.0f/100.0f] forKey:@"blueComponent"];
    return paleGold;
}

+ (UIColor *)paleGoldenrod {
    UIColor *paleGoldenrod = [UIColor colorWithRed:93.0f/100.0f green:91.0f/100.0f blue:0.667f alpha:1.0f];
    [paleGoldenrod setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"redComponent"];
    [paleGoldenrod setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"greenComponent"];
    [paleGoldenrod setValue:[NSNumber numberWithFloat:0.667f] forKey:@"blueComponent"];
    return paleGoldenrod;
}

+ (UIColor *)paleGreen {
    UIColor *paleGreen = [UIColor colorWithRed:6.0f/10.0f green:98.0f/100.0f blue:6.0f/10.0f alpha:1.0f];
    [paleGreen setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"redComponent"];
    [paleGreen setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"greenComponent"];
    [paleGreen setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"blueComponent"];
    return paleGreen;
}

+ (UIColor *)paleLavender {
    UIColor *paleLavender = [UIColor colorWithRed:86.0f/100.0f green:82.0f/100.0f blue:1.0f alpha:1.0f];
    [paleLavender setValue:[NSNumber numberWithFloat:86.0f/100.0f] forKey:@"redComponent"];
    [paleLavender setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"greenComponent"];
    [paleLavender setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return paleLavender;
}

+ (UIColor *)paleMagenta {
    UIColor *paleMagenta = [UIColor colorWithRed:98.0f/100.0f green:52.0f/100.0f blue:9.0f/10.0f alpha:1.0f];
    [paleMagenta setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [paleMagenta setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"greenComponent"];
    [paleMagenta setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"blueComponent"];
    return paleMagenta;
}

+ (UIColor *)paleMagentaPink {
    UIColor *paleMagentaPink = [UIColor colorWithRed:1.0f green:6.0f/10.0f blue:8.0f/10.0f alpha:1.0f];
    [paleMagentaPink setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [paleMagentaPink setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [paleMagentaPink setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"blueComponent"];
    return paleMagentaPink;
}

+ (UIColor *)palePink {
    UIColor *palePink = [UIColor colorWithRed:98.0f/100.0f green:85.0f/100.0f blue:87.0f/100.0f alpha:1.0f];
    [palePink setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [palePink setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"greenComponent"];
    [palePink setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"blueComponent"];
    return palePink;
}

+ (UIColor *)palePlum {
    UIColor *palePlum = [UIColor colorWithRed:87.0f/100.0f green:63.0f/100.0f blue:87.0f/100.0f alpha:1.0f];
    [palePlum setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"redComponent"];
    [palePlum setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"greenComponent"];
    [palePlum setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"blueComponent"];
    return palePlum;
}

+ (UIColor *)paleRedViolet {
    UIColor *paleRedViolet = [UIColor colorWithRed:86.0f/100.0f green:44.0f/100.0f blue:58.0f/100.0f alpha:1.0f];
    [paleRedViolet setValue:[NSNumber numberWithFloat:86.0f/100.0f] forKey:@"redComponent"];
    [paleRedViolet setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"greenComponent"];
    [paleRedViolet setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"blueComponent"];
    return paleRedViolet;
}

+ (UIColor *)paleRobinEggBlue {
    UIColor *paleRobinEggBlue = [UIColor colorWithRed:59.0f/100.0f green:87.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
    [paleRobinEggBlue setValue:[NSNumber numberWithFloat:59.0f/100.0f] forKey:@"redComponent"];
    [paleRobinEggBlue setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"greenComponent"];
    [paleRobinEggBlue setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"blueComponent"];
    return paleRobinEggBlue;
}

+ (UIColor *)paleSilver {
    UIColor *paleSilver = [UIColor colorWithRed:79.0f/100.0f green:0.75f blue:73.0f/100.0f alpha:1.0f];
    [paleSilver setValue:[NSNumber numberWithFloat:79.0f/100.0f] forKey:@"redComponent"];
    [paleSilver setValue:[NSNumber numberWithFloat:0.75f] forKey:@"greenComponent"];
    [paleSilver setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"blueComponent"];
    return paleSilver;
}

+ (UIColor *)paleSpringBud {
    UIColor *paleSpringBud = [UIColor colorWithRed:93.0f/100.0f green:92.0f/100.0f blue:74.0f/100.0f alpha:1.0f];
    [paleSpringBud setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"redComponent"];
    [paleSpringBud setValue:[NSNumber numberWithFloat:92.0f/100.0f] forKey:@"greenComponent"];
    [paleSpringBud setValue:[NSNumber numberWithFloat:74.0f/100.0f] forKey:@"blueComponent"];
    return paleSpringBud;
}

+ (UIColor *)paleTaupe {
    UIColor *paleTaupe = [UIColor colorWithRed:74.0f/100.0f green:6.0f/10.0f blue:49.0f/100.0f alpha:1.0f];
    [paleTaupe setValue:[NSNumber numberWithFloat:74.0f/100.0f] forKey:@"redComponent"];
    [paleTaupe setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [paleTaupe setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"blueComponent"];
    return paleTaupe;
}

+ (UIColor *)paleTurquoise {
    UIColor *paleTurquoise = [UIColor colorWithRed:69.0f/100.0f green:93.0f/100.0f blue:93.0f/100.0f alpha:1.0f];
    [paleTurquoise setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"redComponent"];
    [paleTurquoise setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"greenComponent"];
    [paleTurquoise setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"blueComponent"];
    return paleTurquoise;
}

+ (UIColor *)paleViolet {
    UIColor *paleViolet = [UIColor colorWithRed:8.0f/10.0f green:6.0f/10.0f blue:1.0f alpha:1.0f];
    [paleViolet setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [paleViolet setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [paleViolet setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return paleViolet;
}

+ (UIColor *)paleVioletRed {
    UIColor *paleVioletRed = [UIColor colorWithRed:86.0f/100.0f green:44.0f/100.0f blue:58.0f/100.0f alpha:1.0f];
    [paleVioletRed setValue:[NSNumber numberWithFloat:86.0f/100.0f] forKey:@"redComponent"];
    [paleVioletRed setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"greenComponent"];
    [paleVioletRed setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"blueComponent"];
    return paleVioletRed;
}

+ (UIColor *)pansyPurple {
    UIColor *pansyPurple = [UIColor colorWithRed:47.0f/100.0f green:9.0f/100.0f blue:29.0f/100.0f alpha:1.0f];
    [pansyPurple setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"redComponent"];
    [pansyPurple setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"greenComponent"];
    [pansyPurple setValue:[NSNumber numberWithFloat:29.0f/100.0f] forKey:@"blueComponent"];
    return pansyPurple;
}

+ (UIColor *)paoloVeroneseGreen {
    UIColor *paoloVeroneseGreen = [UIColor colorWithRed:0.0f green:61.0f/100.0f blue:49.0f/100.0f alpha:1.0f];
    [paoloVeroneseGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [paoloVeroneseGreen setValue:[NSNumber numberWithFloat:61.0f/100.0f] forKey:@"greenComponent"];
    [paoloVeroneseGreen setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"blueComponent"];
    return paoloVeroneseGreen;
}

+ (UIColor *)papayaWhip {
    UIColor *papayaWhip = [UIColor colorWithRed:1.0f green:94.0f/100.0f blue:84.0f/100.0f alpha:1.0f];
    [papayaWhip setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [papayaWhip setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"greenComponent"];
    [papayaWhip setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"blueComponent"];
    return papayaWhip;
}

+ (UIColor *)paradisePink {
    UIColor *paradisePink = [UIColor colorWithRed:9.0f/10.0f green:24.0f/100.0f blue:38.0f/100.0f alpha:1.0f];
    [paradisePink setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"redComponent"];
    [paradisePink setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"greenComponent"];
    [paradisePink setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"blueComponent"];
    return paradisePink;
}

+ (UIColor *)parisGreen {
    UIColor *parisGreen = [UIColor colorWithRed:31.0f/100.0f green:78.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
    [parisGreen setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"redComponent"];
    [parisGreen setValue:[NSNumber numberWithFloat:78.0f/100.0f] forKey:@"greenComponent"];
    [parisGreen setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"blueComponent"];
    return parisGreen;
}

+ (UIColor *)pastelBlue {
    UIColor *pastelBlue = [UIColor colorWithRed:68.0f/100.0f green:78.0f/100.0f blue:81.0f/100.0f alpha:1.0f];
    [pastelBlue setValue:[NSNumber numberWithFloat:68.0f/100.0f] forKey:@"redComponent"];
    [pastelBlue setValue:[NSNumber numberWithFloat:78.0f/100.0f] forKey:@"greenComponent"];
    [pastelBlue setValue:[NSNumber numberWithFloat:81.0f/100.0f] forKey:@"blueComponent"];
    return pastelBlue;
}

+ (UIColor *)pastelBrown {
    UIColor *pastelBrown = [UIColor colorWithRed:51.0f/100.0f green:41.0f/100.0f blue:0.333f alpha:1.0f];
    [pastelBrown setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"redComponent"];
    [pastelBrown setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"greenComponent"];
    [pastelBrown setValue:[NSNumber numberWithFloat:0.333f] forKey:@"blueComponent"];
    return pastelBrown;
}

+ (UIColor *)pastelGray {
    UIColor *pastelGray = [UIColor colorWithRed:81.0f/100.0f green:81.0f/100.0f blue:77.0f/100.0f alpha:1.0f];
    [pastelGray setValue:[NSNumber numberWithFloat:81.0f/100.0f] forKey:@"redComponent"];
    [pastelGray setValue:[NSNumber numberWithFloat:81.0f/100.0f] forKey:@"greenComponent"];
    [pastelGray setValue:[NSNumber numberWithFloat:77.0f/100.0f] forKey:@"blueComponent"];
    return pastelGray;
}

+ (UIColor *)pastelGreen {
    UIColor *pastelGreen = [UIColor colorWithRed:47.0f/100.0f green:87.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
    [pastelGreen setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"redComponent"];
    [pastelGreen setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"greenComponent"];
    [pastelGreen setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"blueComponent"];
    return pastelGreen;
}

+ (UIColor *)pastelMagenta {
    UIColor *pastelMagenta = [UIColor colorWithRed:96.0f/100.0f green:6.0f/10.0f blue:76.0f/100.0f alpha:1.0f];
    [pastelMagenta setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"redComponent"];
    [pastelMagenta setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [pastelMagenta setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"blueComponent"];
    return pastelMagenta;
}

+ (UIColor *)pastelOrange {
    UIColor *pastelOrange = [UIColor colorWithRed:1.0f green:7.0f/10.0f blue:28.0f/100.0f alpha:1.0f];
    [pastelOrange setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [pastelOrange setValue:[NSNumber numberWithFloat:7.0f/10.0f] forKey:@"greenComponent"];
    [pastelOrange setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"blueComponent"];
    return pastelOrange;
}

+ (UIColor *)pastelPink {
    UIColor *pastelPink = [UIColor colorWithRed:87.0f/100.0f green:65.0f/100.0f blue:64.0f/100.0f alpha:1.0f];
    [pastelPink setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"redComponent"];
    [pastelPink setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"greenComponent"];
    [pastelPink setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"blueComponent"];
    return pastelPink;
}

+ (UIColor *)pastelPurple {
    UIColor *pastelPurple = [UIColor colorWithRed:7.0f/10.0f green:62.0f/100.0f blue:71.0f/100.0f alpha:1.0f];
    [pastelPurple setValue:[NSNumber numberWithFloat:7.0f/10.0f] forKey:@"redComponent"];
    [pastelPurple setValue:[NSNumber numberWithFloat:62.0f/100.0f] forKey:@"greenComponent"];
    [pastelPurple setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"blueComponent"];
    return pastelPurple;
}

+ (UIColor *)pastelRed {
    UIColor *pastelRed = [UIColor colorWithRed:1.0f green:41.0f/100.0f blue:38.0f/100.0f alpha:1.0f];
    [pastelRed setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [pastelRed setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"greenComponent"];
    [pastelRed setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"blueComponent"];
    return pastelRed;
}

+ (UIColor *)pastelViolet {
    UIColor *pastelViolet = [UIColor colorWithRed:8.0f/10.0f green:6.0f/10.0f blue:79.0f/100.0f alpha:1.0f];
    [pastelViolet setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [pastelViolet setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [pastelViolet setValue:[NSNumber numberWithFloat:79.0f/100.0f] forKey:@"blueComponent"];
    return pastelViolet;
}

+ (UIColor *)pastelYellow {
    UIColor *pastelYellow = [UIColor colorWithRed:99.0f/100.0f green:99.0f/100.0f blue:59.0f/100.0f alpha:1.0f];
    [pastelYellow setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"redComponent"];
    [pastelYellow setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"greenComponent"];
    [pastelYellow setValue:[NSNumber numberWithFloat:59.0f/100.0f] forKey:@"blueComponent"];
    return pastelYellow;
}

+ (UIColor *)patriarch {
    UIColor *patriarch = [UIColor colorWithRed:0.5f green:0.0f blue:0.5f alpha:1.0f];
    [patriarch setValue:[NSNumber numberWithFloat:0.5f] forKey:@"redComponent"];
    [patriarch setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [patriarch setValue:[NSNumber numberWithFloat:0.5f] forKey:@"blueComponent"];
    return patriarch;
}

+ (UIColor *)paynesGrey {
    UIColor *paynesGrey = [UIColor colorWithRed:0.333f green:41.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
    [paynesGrey setValue:[NSNumber numberWithFloat:0.333f] forKey:@"redComponent"];
    [paynesGrey setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"greenComponent"];
    [paynesGrey setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"blueComponent"];
    return paynesGrey;
}

+ (UIColor *)peach {
    UIColor *peach = [UIColor colorWithRed:1.0f green:9.0f/10.0f blue:71.0f/100.0f alpha:1.0f];
    [peach setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [peach setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"greenComponent"];
    [peach setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"blueComponent"];
    return peach;
}

+ (UIColor *)peach2 {
    UIColor *peach2 = [UIColor colorWithRed:1.0f green:8.0f/10.0f blue:64.0f/100.0f alpha:1.0f];
    [peach2 setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [peach2 setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"greenComponent"];
    [peach2 setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"blueComponent"];
    return peach2;
}

+ (UIColor *)peachOrange {
    UIColor *peachOrange = [UIColor colorWithRed:1.0f green:8.0f/10.0f blue:6.0f/10.0f alpha:1.0f];
    [peachOrange setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [peachOrange setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"greenComponent"];
    [peachOrange setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"blueComponent"];
    return peachOrange;
}

+ (UIColor *)peachPuff {
    UIColor *peachPuff = [UIColor colorWithRed:1.0f green:85.0f/100.0f blue:73.0f/100.0f alpha:1.0f];
    [peachPuff setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [peachPuff setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"greenComponent"];
    [peachPuff setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"blueComponent"];
    return peachPuff;
}

+ (UIColor *)peachYellow {
    UIColor *peachYellow = [UIColor colorWithRed:98.0f/100.0f green:87.0f/100.0f blue:68.0f/100.0f alpha:1.0f];
    [peachYellow setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [peachYellow setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"greenComponent"];
    [peachYellow setValue:[NSNumber numberWithFloat:68.0f/100.0f] forKey:@"blueComponent"];
    return peachYellow;
}

+ (UIColor *)pear {
    UIColor *pear = [UIColor colorWithRed:82.0f/100.0f green:89.0f/100.0f blue:19.0f/100.0f alpha:1.0f];
    [pear setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"redComponent"];
    [pear setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"greenComponent"];
    [pear setValue:[NSNumber numberWithFloat:19.0f/100.0f] forKey:@"blueComponent"];
    return pear;
}

+ (UIColor *)pearl {
    UIColor *pearl = [UIColor colorWithRed:92.0f/100.0f green:88.0f/100.0f blue:78.0f/100.0f alpha:1.0f];
    [pearl setValue:[NSNumber numberWithFloat:92.0f/100.0f] forKey:@"redComponent"];
    [pearl setValue:[NSNumber numberWithFloat:88.0f/100.0f] forKey:@"greenComponent"];
    [pearl setValue:[NSNumber numberWithFloat:78.0f/100.0f] forKey:@"blueComponent"];
    return pearl;
}

+ (UIColor *)pearlAqua {
    UIColor *pearlAqua = [UIColor colorWithRed:53.0f/100.0f green:85.0f/100.0f blue:0.75f alpha:1.0f];
    [pearlAqua setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"redComponent"];
    [pearlAqua setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"greenComponent"];
    [pearlAqua setValue:[NSNumber numberWithFloat:0.75f] forKey:@"blueComponent"];
    return pearlAqua;
}

+ (UIColor *)pearlyPurple {
    UIColor *pearlyPurple = [UIColor colorWithRed:72.0f/100.0f green:41.0f/100.0f blue:64.0f/100.0f alpha:1.0f];
    [pearlyPurple setValue:[NSNumber numberWithFloat:72.0f/100.0f] forKey:@"redComponent"];
    [pearlyPurple setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"greenComponent"];
    [pearlyPurple setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"blueComponent"];
    return pearlyPurple;
}

+ (UIColor *)peridot {
    UIColor *peridot = [UIColor colorWithRed:9.0f/10.0f green:89.0f/100.0f blue:0.0f alpha:1.0f];
    [peridot setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"redComponent"];
    [peridot setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"greenComponent"];
    [peridot setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return peridot;
}

+ (UIColor *)periwinkle {
    UIColor *periwinkle = [UIColor colorWithRed:8.0f/10.0f green:8.0f/10.0f blue:1.0f alpha:1.0f];
    [periwinkle setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [periwinkle setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"greenComponent"];
    [periwinkle setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return periwinkle;
}

+ (UIColor *)persianBlue {
    UIColor *persianBlue = [UIColor colorWithRed:11.0f/100.0f green:22.0f/100.0f blue:73.0f/100.0f alpha:1.0f];
    [persianBlue setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"redComponent"];
    [persianBlue setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"greenComponent"];
    [persianBlue setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"blueComponent"];
    return persianBlue;
}

+ (UIColor *)persianGreen {
    UIColor *persianGreen = [UIColor colorWithRed:0.0f green:65.0f/100.0f blue:58.0f/100.0f alpha:1.0f];
    [persianGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [persianGreen setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"greenComponent"];
    [persianGreen setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"blueComponent"];
    return persianGreen;
}

+ (UIColor *)persianIndigo {
    UIColor *persianIndigo = [UIColor colorWithRed:2.0f/10.0f green:7.0f/100.0f blue:48.0f/100.0f alpha:1.0f];
    [persianIndigo setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"redComponent"];
    [persianIndigo setValue:[NSNumber numberWithFloat:7.0f/100.0f] forKey:@"greenComponent"];
    [persianIndigo setValue:[NSNumber numberWithFloat:48.0f/100.0f] forKey:@"blueComponent"];
    return persianIndigo;
}

+ (UIColor *)persianOrange {
    UIColor *persianOrange = [UIColor colorWithRed:85.0f/100.0f green:56.0f/100.0f blue:35.0f/100.0f alpha:1.0f];
    [persianOrange setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"redComponent"];
    [persianOrange setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"greenComponent"];
    [persianOrange setValue:[NSNumber numberWithFloat:35.0f/100.0f] forKey:@"blueComponent"];
    return persianOrange;
}

+ (UIColor *)persianPink {
    UIColor *persianPink = [UIColor colorWithRed:97.0f/100.0f green:0.5f blue:0.75f alpha:1.0f];
    [persianPink setValue:[NSNumber numberWithFloat:97.0f/100.0f] forKey:@"redComponent"];
    [persianPink setValue:[NSNumber numberWithFloat:0.5f] forKey:@"greenComponent"];
    [persianPink setValue:[NSNumber numberWithFloat:0.75f] forKey:@"blueComponent"];
    return persianPink;
}

+ (UIColor *)persianPlum {
    UIColor *persianPlum = [UIColor colorWithRed:44.0f/100.0f green:11.0f/100.0f blue:11.0f/100.0f alpha:1.0f];
    [persianPlum setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"redComponent"];
    [persianPlum setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"greenComponent"];
    [persianPlum setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"blueComponent"];
    return persianPlum;
}

+ (UIColor *)persianRed {
    UIColor *persianRed = [UIColor colorWithRed:8.0f/10.0f green:2.0f/10.0f blue:2.0f/10.0f alpha:1.0f];
    [persianRed setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [persianRed setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"greenComponent"];
    [persianRed setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"blueComponent"];
    return persianRed;
}

+ (UIColor *)persianRose {
    UIColor *persianRose = [UIColor colorWithRed:1.0f green:16.0f/100.0f blue:64.0f/100.0f alpha:1.0f];
    [persianRose setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [persianRose setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"greenComponent"];
    [persianRose setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"blueComponent"];
    return persianRose;
}

+ (UIColor *)persimmon {
    UIColor *persimmon = [UIColor colorWithRed:93.0f/100.0f green:35.0f/100.0f blue:0.0f alpha:1.0f];
    [persimmon setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"redComponent"];
    [persimmon setValue:[NSNumber numberWithFloat:35.0f/100.0f] forKey:@"greenComponent"];
    [persimmon setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return persimmon;
}

+ (UIColor *)peru {
    UIColor *peru = [UIColor colorWithRed:8.0f/10.0f green:52.0f/100.0f blue:0.25f alpha:1.0f];
    [peru setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [peru setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"greenComponent"];
    [peru setValue:[NSNumber numberWithFloat:0.25f] forKey:@"blueComponent"];
    return peru;
}

+ (UIColor *)phlox {
    UIColor *phlox = [UIColor colorWithRed:87.0f/100.0f green:0.0f blue:1.0f alpha:1.0f];
    [phlox setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"redComponent"];
    [phlox setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [phlox setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return phlox;
}

+ (UIColor *)phthaloBlue {
    UIColor *phthaloBlue = [UIColor colorWithRed:0.0f green:6.0f/100.0f blue:54.0f/100.0f alpha:1.0f];
    [phthaloBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [phthaloBlue setValue:[NSNumber numberWithFloat:6.0f/100.0f] forKey:@"greenComponent"];
    [phthaloBlue setValue:[NSNumber numberWithFloat:54.0f/100.0f] forKey:@"blueComponent"];
    return phthaloBlue;
}

+ (UIColor *)phthaloGreen {
    UIColor *phthaloGreen = [UIColor colorWithRed:7.0f/100.0f green:21.0f/100.0f blue:14.0f/100.0f alpha:1.0f];
    [phthaloGreen setValue:[NSNumber numberWithFloat:7.0f/100.0f] forKey:@"redComponent"];
    [phthaloGreen setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"greenComponent"];
    [phthaloGreen setValue:[NSNumber numberWithFloat:14.0f/100.0f] forKey:@"blueComponent"];
    return phthaloGreen;
}

+ (UIColor *)pictonBlue {
    UIColor *pictonBlue = [UIColor colorWithRed:27.0f/100.0f green:69.0f/100.0f blue:91.0f/100.0f alpha:1.0f];
    [pictonBlue setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"redComponent"];
    [pictonBlue setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"greenComponent"];
    [pictonBlue setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"blueComponent"];
    return pictonBlue;
}

+ (UIColor *)pictorialCarmine {
    UIColor *pictorialCarmine = [UIColor colorWithRed:76.0f/100.0f green:4.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
    [pictorialCarmine setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"redComponent"];
    [pictorialCarmine setValue:[NSNumber numberWithFloat:4.0f/100.0f] forKey:@"greenComponent"];
    [pictorialCarmine setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"blueComponent"];
    return pictorialCarmine;
}

+ (UIColor *)piggyPink {
    UIColor *piggyPink = [UIColor colorWithRed:99.0f/100.0f green:87.0f/100.0f blue:9.0f/10.0f alpha:1.0f];
    [piggyPink setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"redComponent"];
    [piggyPink setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"greenComponent"];
    [piggyPink setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"blueComponent"];
    return piggyPink;
}

+ (UIColor *)pineGreen {
    UIColor *pineGreen = [UIColor colorWithRed:0.0f green:47.0f/100.0f blue:44.0f/100.0f alpha:1.0f];
    [pineGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [pineGreen setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"greenComponent"];
    [pineGreen setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"blueComponent"];
    return pineGreen;
}

+ (UIColor *)pineapple {
    UIColor *pineapple = [UIColor colorWithRed:34.0f/100.0f green:24.0f/100.0f blue:5.0f/100.0f alpha:1.0f];
    [pineapple setValue:[NSNumber numberWithFloat:34.0f/100.0f] forKey:@"redComponent"];
    [pineapple setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"greenComponent"];
    [pineapple setValue:[NSNumber numberWithFloat:5.0f/100.0f] forKey:@"blueComponent"];
    return pineapple;
}

+ (UIColor *)pink {
    UIColor *pink = [UIColor colorWithRed:1.0f green:0.75f blue:8.0f/10.0f alpha:1.0f];
    [pink setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [pink setValue:[NSNumber numberWithFloat:0.75f] forKey:@"greenComponent"];
    [pink setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"blueComponent"];
    return pink;
}

+ (UIColor *)pinkPantone {
    UIColor *pinkPantone = [UIColor colorWithRed:84.0f/100.0f green:28.0f/100.0f blue:58.0f/100.0f alpha:1.0f];
    [pinkPantone setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"redComponent"];
    [pinkPantone setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"greenComponent"];
    [pinkPantone setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"blueComponent"];
    return pinkPantone;
}

+ (UIColor *)pinkLace {
    UIColor *pinkLace = [UIColor colorWithRed:1.0f green:87.0f/100.0f blue:96.0f/100.0f alpha:1.0f];
    [pinkLace setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [pinkLace setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"greenComponent"];
    [pinkLace setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"blueComponent"];
    return pinkLace;
}

+ (UIColor *)pinkLavender {
    UIColor *pinkLavender = [UIColor colorWithRed:85.0f/100.0f green:7.0f/10.0f blue:82.0f/100.0f alpha:1.0f];
    [pinkLavender setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"redComponent"];
    [pinkLavender setValue:[NSNumber numberWithFloat:7.0f/10.0f] forKey:@"greenComponent"];
    [pinkLavender setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"blueComponent"];
    return pinkLavender;
}

+ (UIColor *)pinkOrange {
    UIColor *pinkOrange = [UIColor colorWithRed:1.0f green:6.0f/10.0f blue:4.0f/10.0f alpha:1.0f];
    [pinkOrange setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [pinkOrange setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [pinkOrange setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"blueComponent"];
    return pinkOrange;
}

+ (UIColor *)pinkPearl {
    UIColor *pinkPearl = [UIColor colorWithRed:91.0f/100.0f green:0.667f blue:81.0f/100.0f alpha:1.0f];
    [pinkPearl setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"redComponent"];
    [pinkPearl setValue:[NSNumber numberWithFloat:0.667f] forKey:@"greenComponent"];
    [pinkPearl setValue:[NSNumber numberWithFloat:81.0f/100.0f] forKey:@"blueComponent"];
    return pinkPearl;
}

+ (UIColor *)pinkRaspberry {
    UIColor *pinkRaspberry = [UIColor colorWithRed:6.0f/10.0f green:0.0f blue:21.0f/100.0f alpha:1.0f];
    [pinkRaspberry setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"redComponent"];
    [pinkRaspberry setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [pinkRaspberry setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"blueComponent"];
    return pinkRaspberry;
}

+ (UIColor *)pinkSherbet {
    UIColor *pinkSherbet = [UIColor colorWithRed:97.0f/100.0f green:56.0f/100.0f blue:65.0f/100.0f alpha:1.0f];
    [pinkSherbet setValue:[NSNumber numberWithFloat:97.0f/100.0f] forKey:@"redComponent"];
    [pinkSherbet setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"greenComponent"];
    [pinkSherbet setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"blueComponent"];
    return pinkSherbet;
}

+ (UIColor *)pistachio {
    UIColor *pistachio = [UIColor colorWithRed:58.0f/100.0f green:77.0f/100.0f blue:45.0f/100.0f alpha:1.0f];
    [pistachio setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"redComponent"];
    [pistachio setValue:[NSNumber numberWithFloat:77.0f/100.0f] forKey:@"greenComponent"];
    [pistachio setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"blueComponent"];
    return pistachio;
}

+ (UIColor *)platinum {
    UIColor *platinum = [UIColor colorWithRed:9.0f/10.0f green:89.0f/100.0f blue:89.0f/100.0f alpha:1.0f];
    [platinum setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"redComponent"];
    [platinum setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"greenComponent"];
    [platinum setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"blueComponent"];
    return platinum;
}

+ (UIColor *)plum {
    UIColor *plum = [UIColor colorWithRed:56.0f/100.0f green:27.0f/100.0f blue:52.0f/100.0f alpha:1.0f];
    [plum setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"redComponent"];
    [plum setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"greenComponent"];
    [plum setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"blueComponent"];
    return plum;
}

+ (UIColor *)plumWeb {
    UIColor *plumWeb = [UIColor colorWithRed:87.0f/100.0f green:63.0f/100.0f blue:87.0f/100.0f alpha:1.0f];
    [plumWeb setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"redComponent"];
    [plumWeb setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"greenComponent"];
    [plumWeb setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"blueComponent"];
    return plumWeb;
}

+ (UIColor *)pompAndPower {
    UIColor *pompAndPower = [UIColor colorWithRed:53.0f/100.0f green:38.0f/100.0f blue:56.0f/100.0f alpha:1.0f];
    [pompAndPower setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"redComponent"];
    [pompAndPower setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"greenComponent"];
    [pompAndPower setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"blueComponent"];
    return pompAndPower;
}

+ (UIColor *)popstar {
    UIColor *popstar = [UIColor colorWithRed:0.75f green:31.0f/100.0f blue:38.0f/100.0f alpha:1.0f];
    [popstar setValue:[NSNumber numberWithFloat:0.75f] forKey:@"redComponent"];
    [popstar setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"greenComponent"];
    [popstar setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"blueComponent"];
    return popstar;
}

+ (UIColor *)portlandOrange {
    UIColor *portlandOrange = [UIColor colorWithRed:1.0f green:35.0f/100.0f blue:21.0f/100.0f alpha:1.0f];
    [portlandOrange setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [portlandOrange setValue:[NSNumber numberWithFloat:35.0f/100.0f] forKey:@"greenComponent"];
    [portlandOrange setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"blueComponent"];
    return portlandOrange;
}

+ (UIColor *)powderBlue {
    UIColor *powderBlue = [UIColor colorWithRed:69.0f/100.0f green:88.0f/100.0f blue:9.0f/10.0f alpha:1.0f];
    [powderBlue setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"redComponent"];
    [powderBlue setValue:[NSNumber numberWithFloat:88.0f/100.0f] forKey:@"greenComponent"];
    [powderBlue setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"blueComponent"];
    return powderBlue;
}

+ (UIColor *)princetonOrange {
    UIColor *princetonOrange = [UIColor colorWithRed:96.0f/100.0f green:0.5f blue:15.0f/100.0f alpha:1.0f];
    [princetonOrange setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"redComponent"];
    [princetonOrange setValue:[NSNumber numberWithFloat:0.5f] forKey:@"greenComponent"];
    [princetonOrange setValue:[NSNumber numberWithFloat:15.0f/100.0f] forKey:@"blueComponent"];
    return princetonOrange;
}

+ (UIColor *)prune {
    UIColor *prune = [UIColor colorWithRed:44.0f/100.0f green:11.0f/100.0f blue:11.0f/100.0f alpha:1.0f];
    [prune setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"redComponent"];
    [prune setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"greenComponent"];
    [prune setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"blueComponent"];
    return prune;
}

+ (UIColor *)prussianBlue {
    UIColor *prussianBlue = [UIColor colorWithRed:0.0f green:19.0f/100.0f blue:0.333f alpha:1.0f];
    [prussianBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [prussianBlue setValue:[NSNumber numberWithFloat:19.0f/100.0f] forKey:@"greenComponent"];
    [prussianBlue setValue:[NSNumber numberWithFloat:0.333f] forKey:@"blueComponent"];
    return prussianBlue;
}

+ (UIColor *)psychedelicPurple {
    UIColor *psychedelicPurple = [UIColor colorWithRed:87.0f/100.0f green:0.0f blue:1.0f alpha:1.0f];
    [psychedelicPurple setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"redComponent"];
    [psychedelicPurple setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [psychedelicPurple setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return psychedelicPurple;
}

+ (UIColor *)puce {
    UIColor *puce = [UIColor colorWithRed:8.0f/10.0f green:53.0f/100.0f blue:6.0f/10.0f alpha:1.0f];
    [puce setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [puce setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"greenComponent"];
    [puce setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"blueComponent"];
    return puce;
}

+ (UIColor *)puceRed {
    UIColor *puceRed = [UIColor colorWithRed:45.0f/100.0f green:18.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
    [puceRed setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"redComponent"];
    [puceRed setValue:[NSNumber numberWithFloat:18.0f/100.0f] forKey:@"greenComponent"];
    [puceRed setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"blueComponent"];
    return puceRed;
}

+ (UIColor *)pullmanBrownUPSBrown {
    UIColor *pullmanBrownUPSBrown = [UIColor colorWithRed:39.0f/100.0f green:0.25f blue:9.0f/100.0f alpha:1.0f];
    [pullmanBrownUPSBrown setValue:[NSNumber numberWithFloat:39.0f/100.0f] forKey:@"redComponent"];
    [pullmanBrownUPSBrown setValue:[NSNumber numberWithFloat:0.25f] forKey:@"greenComponent"];
    [pullmanBrownUPSBrown setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"blueComponent"];
    return pullmanBrownUPSBrown;
}

+ (UIColor *)pullmanGreen {
    UIColor *pullmanGreen = [UIColor colorWithRed:23.0f/100.0f green:2.0f/10.0f blue:11.0f/100.0f alpha:1.0f];
    [pullmanGreen setValue:[NSNumber numberWithFloat:23.0f/100.0f] forKey:@"redComponent"];
    [pullmanGreen setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"greenComponent"];
    [pullmanGreen setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"blueComponent"];
    return pullmanGreen;
}

+ (UIColor *)pumpkin {
    UIColor *pumpkin = [UIColor colorWithRed:1.0f green:46.0f/100.0f blue:9.0f/100.0f alpha:1.0f];
    [pumpkin setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [pumpkin setValue:[NSNumber numberWithFloat:46.0f/100.0f] forKey:@"greenComponent"];
    [pumpkin setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"blueComponent"];
    return pumpkin;
}

+ (UIColor *)purpleHTML {
    UIColor *purpleHTML = [UIColor colorWithRed:0.5f green:0.0f blue:0.5f alpha:1.0f];
    [purpleHTML setValue:[NSNumber numberWithFloat:0.5f] forKey:@"redComponent"];
    [purpleHTML setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [purpleHTML setValue:[NSNumber numberWithFloat:0.5f] forKey:@"blueComponent"];
    return purpleHTML;
}

+ (UIColor *)purpleMunsell {
    UIColor *purpleMunsell = [UIColor colorWithRed:62.0f/100.0f green:0.0f blue:77.0f/100.0f alpha:1.0f];
    [purpleMunsell setValue:[NSNumber numberWithFloat:62.0f/100.0f] forKey:@"redComponent"];
    [purpleMunsell setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [purpleMunsell setValue:[NSNumber numberWithFloat:77.0f/100.0f] forKey:@"blueComponent"];
    return purpleMunsell;
}

+ (UIColor *)purpleX11 {
    UIColor *purpleX11 = [UIColor colorWithRed:63.0f/100.0f green:13.0f/100.0f blue:94.0f/100.0f alpha:1.0f];
    [purpleX11 setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"redComponent"];
    [purpleX11 setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"greenComponent"];
    [purpleX11 setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"blueComponent"];
    return purpleX11;
}

+ (UIColor *)purpleHeart {
    UIColor *purpleHeart = [UIColor colorWithRed:41.0f/100.0f green:21.0f/100.0f blue:61.0f/100.0f alpha:1.0f];
    [purpleHeart setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"redComponent"];
    [purpleHeart setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"greenComponent"];
    [purpleHeart setValue:[NSNumber numberWithFloat:61.0f/100.0f] forKey:@"blueComponent"];
    return purpleHeart;
}

+ (UIColor *)purpleMountainMajesty {
    UIColor *purpleMountainMajesty = [UIColor colorWithRed:59.0f/100.0f green:47.0f/100.0f blue:71.0f/100.0f alpha:1.0f];
    [purpleMountainMajesty setValue:[NSNumber numberWithFloat:59.0f/100.0f] forKey:@"redComponent"];
    [purpleMountainMajesty setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"greenComponent"];
    [purpleMountainMajesty setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"blueComponent"];
    return purpleMountainMajesty;
}

+ (UIColor *)purpleNavy {
    UIColor *purpleNavy = [UIColor colorWithRed:31.0f/100.0f green:32.0f/100.0f blue:0.5f alpha:1.0f];
    [purpleNavy setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"redComponent"];
    [purpleNavy setValue:[NSNumber numberWithFloat:32.0f/100.0f] forKey:@"greenComponent"];
    [purpleNavy setValue:[NSNumber numberWithFloat:0.5f] forKey:@"blueComponent"];
    return purpleNavy;
}

+ (UIColor *)purplePizzazz {
    UIColor *purplePizzazz = [UIColor colorWithRed:1.0f green:31.0f/100.0f blue:85.0f/100.0f alpha:1.0f];
    [purplePizzazz setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [purplePizzazz setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"greenComponent"];
    [purplePizzazz setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"blueComponent"];
    return purplePizzazz;
}

+ (UIColor *)purpleTaupe {
    UIColor *purpleTaupe = [UIColor colorWithRed:31.0f/100.0f green:0.25f blue:3.0f/10.0f alpha:1.0f];
    [purpleTaupe setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"redComponent"];
    [purpleTaupe setValue:[NSNumber numberWithFloat:0.25f] forKey:@"greenComponent"];
    [purpleTaupe setValue:[NSNumber numberWithFloat:3.0f/10.0f] forKey:@"blueComponent"];
    return purpleTaupe;
}

+ (UIColor *)purpureus {
    UIColor *purpureus = [UIColor colorWithRed:6.0f/10.0f green:31.0f/100.0f blue:68.0f/100.0f alpha:1.0f];
    [purpureus setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"redComponent"];
    [purpureus setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"greenComponent"];
    [purpureus setValue:[NSNumber numberWithFloat:68.0f/100.0f] forKey:@"blueComponent"];
    return purpureus;
}

+ (UIColor *)quartz {
    UIColor *quartz = [UIColor colorWithRed:32.0f/100.0f green:28.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
    [quartz setValue:[NSNumber numberWithFloat:32.0f/100.0f] forKey:@"redComponent"];
    [quartz setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"greenComponent"];
    [quartz setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"blueComponent"];
    return quartz;
}

+ (UIColor *)queenBlue {
    UIColor *queenBlue = [UIColor colorWithRed:26.0f/100.0f green:42.0f/100.0f blue:58.0f/100.0f alpha:1.0f];
    [queenBlue setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"redComponent"];
    [queenBlue setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"greenComponent"];
    [queenBlue setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"blueComponent"];
    return queenBlue;
}

+ (UIColor *)queenPink {
    UIColor *queenPink = [UIColor colorWithRed:91.0f/100.0f green:8.0f/10.0f blue:84.0f/100.0f alpha:1.0f];
    [queenPink setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"redComponent"];
    [queenPink setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"greenComponent"];
    [queenPink setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"blueComponent"];
    return queenPink;
}

+ (UIColor *)quinacridoneMagenta {
    UIColor *quinacridoneMagenta = [UIColor colorWithRed:56.0f/100.0f green:23.0f/100.0f blue:35.0f/100.0f alpha:1.0f];
    [quinacridoneMagenta setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"redComponent"];
    [quinacridoneMagenta setValue:[NSNumber numberWithFloat:23.0f/100.0f] forKey:@"greenComponent"];
    [quinacridoneMagenta setValue:[NSNumber numberWithFloat:35.0f/100.0f] forKey:@"blueComponent"];
    return quinacridoneMagenta;
}

+ (UIColor *)rackley {
    UIColor *rackley = [UIColor colorWithRed:36.0f/100.0f green:54.0f/100.0f blue:66.0f/100.0f alpha:1.0f];
    [rackley setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"redComponent"];
    [rackley setValue:[NSNumber numberWithFloat:54.0f/100.0f] forKey:@"greenComponent"];
    [rackley setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"blueComponent"];
    return rackley;
}

+ (UIColor *)radicalRed {
    UIColor *radicalRed = [UIColor colorWithRed:1.0f green:21.0f/100.0f blue:37.0f/100.0f alpha:1.0f];
    [radicalRed setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [radicalRed setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"greenComponent"];
    [radicalRed setValue:[NSNumber numberWithFloat:37.0f/100.0f] forKey:@"blueComponent"];
    return radicalRed;
}

+ (UIColor *)rajah {
    UIColor *rajah = [UIColor colorWithRed:98.0f/100.0f green:0.667f blue:38.0f/100.0f alpha:1.0f];
    [rajah setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [rajah setValue:[NSNumber numberWithFloat:0.667f] forKey:@"greenComponent"];
    [rajah setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"blueComponent"];
    return rajah;
}

+ (UIColor *)raspberry {
    UIColor *raspberry = [UIColor colorWithRed:89.0f/100.0f green:4.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
    [raspberry setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"redComponent"];
    [raspberry setValue:[NSNumber numberWithFloat:4.0f/100.0f] forKey:@"greenComponent"];
    [raspberry setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"blueComponent"];
    return raspberry;
}

+ (UIColor *)raspberryGlace {
    UIColor *raspberryGlace = [UIColor colorWithRed:57.0f/100.0f green:37.0f/100.0f blue:43.0f/100.0f alpha:1.0f];
    [raspberryGlace setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"redComponent"];
    [raspberryGlace setValue:[NSNumber numberWithFloat:37.0f/100.0f] forKey:@"greenComponent"];
    [raspberryGlace setValue:[NSNumber numberWithFloat:43.0f/100.0f] forKey:@"blueComponent"];
    return raspberryGlace;
}

+ (UIColor *)raspberryPink {
    UIColor *raspberryPink = [UIColor colorWithRed:89.0f/100.0f green:31.0f/100.0f blue:6.0f/10.0f alpha:1.0f];
    [raspberryPink setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"redComponent"];
    [raspberryPink setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"greenComponent"];
    [raspberryPink setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"blueComponent"];
    return raspberryPink;
}

+ (UIColor *)raspberryRose {
    UIColor *raspberryRose = [UIColor colorWithRed:7.0f/10.0f green:27.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
    [raspberryRose setValue:[NSNumber numberWithFloat:7.0f/10.0f] forKey:@"redComponent"];
    [raspberryRose setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"greenComponent"];
    [raspberryRose setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"blueComponent"];
    return raspberryRose;
}

+ (UIColor *)rawUmber {
    UIColor *rawUmber = [UIColor colorWithRed:51.0f/100.0f green:4.0f/10.0f blue:27.0f/100.0f alpha:1.0f];
    [rawUmber setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"redComponent"];
    [rawUmber setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"greenComponent"];
    [rawUmber setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"blueComponent"];
    return rawUmber;
}

+ (UIColor *)razzleDazzleRose {
    UIColor *razzleDazzleRose = [UIColor colorWithRed:1.0f green:2.0f/10.0f blue:8.0f/10.0f alpha:1.0f];
    [razzleDazzleRose setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [razzleDazzleRose setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"greenComponent"];
    [razzleDazzleRose setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"blueComponent"];
    return razzleDazzleRose;
}

+ (UIColor *)razzmatazz {
    UIColor *razzmatazz = [UIColor colorWithRed:89.0f/100.0f green:15.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
    [razzmatazz setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"redComponent"];
    [razzmatazz setValue:[NSNumber numberWithFloat:15.0f/100.0f] forKey:@"greenComponent"];
    [razzmatazz setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"blueComponent"];
    return razzmatazz;
}

+ (UIColor *)razzmicBerry {
    UIColor *razzmicBerry = [UIColor colorWithRed:55.0f/100.0f green:31.0f/100.0f blue:52.0f/100.0f alpha:1.0f];
    [razzmicBerry setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"redComponent"];
    [razzmicBerry setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"greenComponent"];
    [razzmicBerry setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"blueComponent"];
    return razzmicBerry;
}

+ (UIColor *)rebeccaPurple {
    UIColor *rebeccaPurple = [UIColor colorWithRed:4.0f/10.0f green:2.0f/10.0f blue:6.0f/10.0f alpha:1.0f];
    [rebeccaPurple setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"redComponent"];
    [rebeccaPurple setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"greenComponent"];
    [rebeccaPurple setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"blueComponent"];
    return rebeccaPurple;
}

+ (UIColor *)red {
    UIColor *red = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    [red setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [red setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [red setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return red;
}

+ (UIColor *)redCrayola {
    UIColor *redCrayola = [UIColor colorWithRed:93.0f/100.0f green:13.0f/100.0f blue:3.0f/10.0f alpha:1.0f];
    [redCrayola setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"redComponent"];
    [redCrayola setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"greenComponent"];
    [redCrayola setValue:[NSNumber numberWithFloat:3.0f/10.0f] forKey:@"blueComponent"];
    return redCrayola;
}

+ (UIColor *)redMunsell {
    UIColor *redMunsell = [UIColor colorWithRed:95.0f/100.0f green:0.0f blue:24.0f/100.0f alpha:1.0f];
    [redMunsell setValue:[NSNumber numberWithFloat:95.0f/100.0f] forKey:@"redComponent"];
    [redMunsell setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [redMunsell setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"blueComponent"];
    return redMunsell;
}

+ (UIColor *)redNCS {
    UIColor *redNCS = [UIColor colorWithRed:77.0f/100.0f green:1.0f/100.0f blue:2.0f/10.0f alpha:1.0f];
    [redNCS setValue:[NSNumber numberWithFloat:77.0f/100.0f] forKey:@"redComponent"];
    [redNCS setValue:[NSNumber numberWithFloat:1.0f/100.0f] forKey:@"greenComponent"];
    [redNCS setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"blueComponent"];
    return redNCS;
}

+ (UIColor *)redPantone {
    UIColor *redPantone = [UIColor colorWithRed:93.0f/100.0f green:16.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
    [redPantone setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"redComponent"];
    [redPantone setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"greenComponent"];
    [redPantone setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"blueComponent"];
    return redPantone;
}

+ (UIColor *)redPigment {
    UIColor *redPigment = [UIColor colorWithRed:93.0f/100.0f green:11.0f/100.0f blue:14.0f/100.0f alpha:1.0f];
    [redPigment setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"redComponent"];
    [redPigment setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"greenComponent"];
    [redPigment setValue:[NSNumber numberWithFloat:14.0f/100.0f] forKey:@"blueComponent"];
    return redPigment;
}

+ (UIColor *)redRYB {
    UIColor *redRYB = [UIColor colorWithRed:1.0f green:15.0f/100.0f blue:7.0f/100.0f alpha:1.0f];
    [redRYB setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [redRYB setValue:[NSNumber numberWithFloat:15.0f/100.0f] forKey:@"greenComponent"];
    [redRYB setValue:[NSNumber numberWithFloat:7.0f/100.0f] forKey:@"blueComponent"];
    return redRYB;
}

+ (UIColor *)redBrown {
    UIColor *redBrown = [UIColor colorWithRed:65.0f/100.0f green:16.0f/100.0f blue:16.0f/100.0f alpha:1.0f];
    [redBrown setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"redComponent"];
    [redBrown setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"greenComponent"];
    [redBrown setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"blueComponent"];
    return redBrown;
}

+ (UIColor *)redDevil {
    UIColor *redDevil = [UIColor colorWithRed:53.0f/100.0f green:0.0f blue:7.0f/100.0f alpha:1.0f];
    [redDevil setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"redComponent"];
    [redDevil setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [redDevil setValue:[NSNumber numberWithFloat:7.0f/100.0f] forKey:@"blueComponent"];
    return redDevil;
}

+ (UIColor *)redOrange {
    UIColor *redOrange = [UIColor colorWithRed:1.0f green:0.333f blue:29.0f/100.0f alpha:1.0f];
    [redOrange setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [redOrange setValue:[NSNumber numberWithFloat:0.333f] forKey:@"greenComponent"];
    [redOrange setValue:[NSNumber numberWithFloat:29.0f/100.0f] forKey:@"blueComponent"];
    return redOrange;
}

+ (UIColor *)redPurple {
    UIColor *redPurple = [UIColor colorWithRed:89.0f/100.0f green:0.0f blue:47.0f/100.0f alpha:1.0f];
    [redPurple setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"redComponent"];
    [redPurple setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [redPurple setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"blueComponent"];
    return redPurple;
}

+ (UIColor *)redViolet {
    UIColor *redViolet = [UIColor colorWithRed:78.0f/100.0f green:8.0f/100.0f blue:52.0f/100.0f alpha:1.0f];
    [redViolet setValue:[NSNumber numberWithFloat:78.0f/100.0f] forKey:@"redComponent"];
    [redViolet setValue:[NSNumber numberWithFloat:8.0f/100.0f] forKey:@"greenComponent"];
    [redViolet setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"blueComponent"];
    return redViolet;
}

+ (UIColor *)redwood {
    UIColor *redwood = [UIColor colorWithRed:64.0f/100.0f green:35.0f/100.0f blue:32.0f/100.0f alpha:1.0f];
    [redwood setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"redComponent"];
    [redwood setValue:[NSNumber numberWithFloat:35.0f/100.0f] forKey:@"greenComponent"];
    [redwood setValue:[NSNumber numberWithFloat:32.0f/100.0f] forKey:@"blueComponent"];
    return redwood;
}

+ (UIColor *)regalia {
    UIColor *regalia = [UIColor colorWithRed:32.0f/100.0f green:18.0f/100.0f blue:0.5f alpha:1.0f];
    [regalia setValue:[NSNumber numberWithFloat:32.0f/100.0f] forKey:@"redComponent"];
    [regalia setValue:[NSNumber numberWithFloat:18.0f/100.0f] forKey:@"greenComponent"];
    [regalia setValue:[NSNumber numberWithFloat:0.5f] forKey:@"blueComponent"];
    return regalia;
}

+ (UIColor *)registrationBlack {
    UIColor *registrationBlack = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f];
    [registrationBlack setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [registrationBlack setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [registrationBlack setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return registrationBlack;
}

+ (UIColor *)resolutionBlue {
    UIColor *resolutionBlue = [UIColor colorWithRed:0.0f green:14.0f/100.0f blue:53.0f/100.0f alpha:1.0f];
    [resolutionBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [resolutionBlue setValue:[NSNumber numberWithFloat:14.0f/100.0f] forKey:@"greenComponent"];
    [resolutionBlue setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"blueComponent"];
    return resolutionBlue;
}

+ (UIColor *)rhythm {
    UIColor *rhythm = [UIColor colorWithRed:47.0f/100.0f green:46.0f/100.0f blue:59.0f/100.0f alpha:1.0f];
    [rhythm setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"redComponent"];
    [rhythm setValue:[NSNumber numberWithFloat:46.0f/100.0f] forKey:@"greenComponent"];
    [rhythm setValue:[NSNumber numberWithFloat:59.0f/100.0f] forKey:@"blueComponent"];
    return rhythm;
}

+ (UIColor *)richBlack {
    UIColor *richBlack = [UIColor colorWithRed:0.0f green:0.25f blue:0.25f alpha:1.0f];
    [richBlack setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [richBlack setValue:[NSNumber numberWithFloat:0.25f] forKey:@"greenComponent"];
    [richBlack setValue:[NSNumber numberWithFloat:0.25f] forKey:@"blueComponent"];
    return richBlack;
}

+ (UIColor *)richBlackFOGRA29 {
    UIColor *richBlackFOGRA29 = [UIColor colorWithRed:0.0f green:4.0f/100.0f blue:7.0f/100.0f alpha:1.0f];
    [richBlackFOGRA29 setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [richBlackFOGRA29 setValue:[NSNumber numberWithFloat:4.0f/100.0f] forKey:@"greenComponent"];
    [richBlackFOGRA29 setValue:[NSNumber numberWithFloat:7.0f/100.0f] forKey:@"blueComponent"];
    return richBlackFOGRA29;
}

+ (UIColor *)richBlackFOGRA39 {
    UIColor *richBlackFOGRA39 = [UIColor colorWithRed:0.0f green:1.0f/100.0f blue:1.0f/100.0f alpha:1.0f];
    [richBlackFOGRA39 setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [richBlackFOGRA39 setValue:[NSNumber numberWithFloat:1.0f/100.0f] forKey:@"greenComponent"];
    [richBlackFOGRA39 setValue:[NSNumber numberWithFloat:1.0f/100.0f] forKey:@"blueComponent"];
    return richBlackFOGRA39;
}

+ (UIColor *)richBrilliantLavender {
    UIColor *richBrilliantLavender = [UIColor colorWithRed:95.0f/100.0f green:65.0f/100.0f blue:1.0f alpha:1.0f];
    [richBrilliantLavender setValue:[NSNumber numberWithFloat:95.0f/100.0f] forKey:@"redComponent"];
    [richBrilliantLavender setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"greenComponent"];
    [richBrilliantLavender setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return richBrilliantLavender;
}

+ (UIColor *)richCarmine {
    UIColor *richCarmine = [UIColor colorWithRed:84.0f/100.0f green:0.0f blue:0.25f alpha:1.0f];
    [richCarmine setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"redComponent"];
    [richCarmine setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [richCarmine setValue:[NSNumber numberWithFloat:0.25f] forKey:@"blueComponent"];
    return richCarmine;
}

+ (UIColor *)richElectricBlue {
    UIColor *richElectricBlue = [UIColor colorWithRed:3.0f/100.0f green:57.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
    [richElectricBlue setValue:[NSNumber numberWithFloat:3.0f/100.0f] forKey:@"redComponent"];
    [richElectricBlue setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"greenComponent"];
    [richElectricBlue setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"blueComponent"];
    return richElectricBlue;
}

+ (UIColor *)richLavender {
    UIColor *richLavender = [UIColor colorWithRed:65.0f/100.0f green:42.0f/100.0f blue:81.0f/100.0f alpha:1.0f];
    [richLavender setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"redComponent"];
    [richLavender setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"greenComponent"];
    [richLavender setValue:[NSNumber numberWithFloat:81.0f/100.0f] forKey:@"blueComponent"];
    return richLavender;
}

+ (UIColor *)richLilac {
    UIColor *richLilac = [UIColor colorWithRed:71.0f/100.0f green:4.0f/10.0f blue:82.0f/100.0f alpha:1.0f];
    [richLilac setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"redComponent"];
    [richLilac setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"greenComponent"];
    [richLilac setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"blueComponent"];
    return richLilac;
}

+ (UIColor *)richMaroon {
    UIColor *richMaroon = [UIColor colorWithRed:69.0f/100.0f green:19.0f/100.0f blue:38.0f/100.0f alpha:1.0f];
    [richMaroon setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"redComponent"];
    [richMaroon setValue:[NSNumber numberWithFloat:19.0f/100.0f] forKey:@"greenComponent"];
    [richMaroon setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"blueComponent"];
    return richMaroon;
}

+ (UIColor *)rifleGreen {
    UIColor *rifleGreen = [UIColor colorWithRed:27.0f/100.0f green:3.0f/10.0f blue:22.0f/100.0f alpha:1.0f];
    [rifleGreen setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"redComponent"];
    [rifleGreen setValue:[NSNumber numberWithFloat:3.0f/10.0f] forKey:@"greenComponent"];
    [rifleGreen setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"blueComponent"];
    return rifleGreen;
}

+ (UIColor *)roastCoffee {
    UIColor *roastCoffee = [UIColor colorWithRed:44.0f/100.0f green:26.0f/100.0f blue:0.25f alpha:1.0f];
    [roastCoffee setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"redComponent"];
    [roastCoffee setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"greenComponent"];
    [roastCoffee setValue:[NSNumber numberWithFloat:0.25f] forKey:@"blueComponent"];
    return roastCoffee;
}

+ (UIColor *)robinEggBlue {
    UIColor *robinEggBlue = [UIColor colorWithRed:0.0f green:8.0f/10.0f blue:8.0f/10.0f alpha:1.0f];
    [robinEggBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [robinEggBlue setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"greenComponent"];
    [robinEggBlue setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"blueComponent"];
    return robinEggBlue;
}

+ (UIColor *)rocketMetallic {
    UIColor *rocketMetallic = [UIColor colorWithRed:54.0f/100.0f green:0.5f blue:0.5f alpha:1.0f];
    [rocketMetallic setValue:[NSNumber numberWithFloat:54.0f/100.0f] forKey:@"redComponent"];
    [rocketMetallic setValue:[NSNumber numberWithFloat:0.5f] forKey:@"greenComponent"];
    [rocketMetallic setValue:[NSNumber numberWithFloat:0.5f] forKey:@"blueComponent"];
    return rocketMetallic;
}

+ (UIColor *)romanSilver {
    UIColor *romanSilver = [UIColor colorWithRed:51.0f/100.0f green:54.0f/100.0f blue:59.0f/100.0f alpha:1.0f];
    [romanSilver setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"redComponent"];
    [romanSilver setValue:[NSNumber numberWithFloat:54.0f/100.0f] forKey:@"greenComponent"];
    [romanSilver setValue:[NSNumber numberWithFloat:59.0f/100.0f] forKey:@"blueComponent"];
    return romanSilver;
}

+ (UIColor *)rose {
    UIColor *rose = [UIColor colorWithRed:1.0f green:0.0f blue:0.5f alpha:1.0f];
    [rose setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [rose setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [rose setValue:[NSNumber numberWithFloat:0.5f] forKey:@"blueComponent"];
    return rose;
}

+ (UIColor *)roseBonbon {
    UIColor *roseBonbon = [UIColor colorWithRed:98.0f/100.0f green:26.0f/100.0f blue:62.0f/100.0f alpha:1.0f];
    [roseBonbon setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [roseBonbon setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"greenComponent"];
    [roseBonbon setValue:[NSNumber numberWithFloat:62.0f/100.0f] forKey:@"blueComponent"];
    return roseBonbon;
}

+ (UIColor *)roseEbony {
    UIColor *roseEbony = [UIColor colorWithRed:4.0f/10.0f green:28.0f/100.0f blue:27.0f/100.0f alpha:1.0f];
    [roseEbony setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"redComponent"];
    [roseEbony setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"greenComponent"];
    [roseEbony setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"blueComponent"];
    return roseEbony;
}

+ (UIColor *)roseGold {
    UIColor *roseGold = [UIColor colorWithRed:72.0f/100.0f green:43.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
    [roseGold setValue:[NSNumber numberWithFloat:72.0f/100.0f] forKey:@"redComponent"];
    [roseGold setValue:[NSNumber numberWithFloat:43.0f/100.0f] forKey:@"greenComponent"];
    [roseGold setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"blueComponent"];
    return roseGold;
}

+ (UIColor *)roseMadder {
    UIColor *roseMadder = [UIColor colorWithRed:89.0f/100.0f green:15.0f/100.0f blue:21.0f/100.0f alpha:1.0f];
    [roseMadder setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"redComponent"];
    [roseMadder setValue:[NSNumber numberWithFloat:15.0f/100.0f] forKey:@"greenComponent"];
    [roseMadder setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"blueComponent"];
    return roseMadder;
}

+ (UIColor *)rosePink {
    UIColor *rosePink = [UIColor colorWithRed:1.0f green:4.0f/10.0f blue:8.0f/10.0f alpha:1.0f];
    [rosePink setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [rosePink setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"greenComponent"];
    [rosePink setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"blueComponent"];
    return rosePink;
}

+ (UIColor *)roseQuartz {
    UIColor *roseQuartz = [UIColor colorWithRed:0.667f green:6.0f/10.0f blue:66.0f/100.0f alpha:1.0f];
    [roseQuartz setValue:[NSNumber numberWithFloat:0.667f] forKey:@"redComponent"];
    [roseQuartz setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [roseQuartz setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"blueComponent"];
    return roseQuartz;
}

+ (UIColor *)roseRed {
    UIColor *roseRed = [UIColor colorWithRed:76.0f/100.0f green:12.0f/100.0f blue:34.0f/100.0f alpha:1.0f];
    [roseRed setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"redComponent"];
    [roseRed setValue:[NSNumber numberWithFloat:12.0f/100.0f] forKey:@"greenComponent"];
    [roseRed setValue:[NSNumber numberWithFloat:34.0f/100.0f] forKey:@"blueComponent"];
    return roseRed;
}

+ (UIColor *)roseTaupe {
    UIColor *roseTaupe = [UIColor colorWithRed:56.0f/100.0f green:36.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
    [roseTaupe setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"redComponent"];
    [roseTaupe setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"greenComponent"];
    [roseTaupe setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"blueComponent"];
    return roseTaupe;
}

+ (UIColor *)roseVale {
    UIColor *roseVale = [UIColor colorWithRed:0.667f green:31.0f/100.0f blue:32.0f/100.0f alpha:1.0f];
    [roseVale setValue:[NSNumber numberWithFloat:0.667f] forKey:@"redComponent"];
    [roseVale setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"greenComponent"];
    [roseVale setValue:[NSNumber numberWithFloat:32.0f/100.0f] forKey:@"blueComponent"];
    return roseVale;
}

+ (UIColor *)rosewood {
    UIColor *rosewood = [UIColor colorWithRed:4.0f/10.0f green:0.0f blue:4.0f/100.0f alpha:1.0f];
    [rosewood setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"redComponent"];
    [rosewood setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [rosewood setValue:[NSNumber numberWithFloat:4.0f/100.0f] forKey:@"blueComponent"];
    return rosewood;
}

+ (UIColor *)rossoCorsa {
    UIColor *rossoCorsa = [UIColor colorWithRed:83.0f/100.0f green:0.0f blue:0.0f alpha:1.0f];
    [rossoCorsa setValue:[NSNumber numberWithFloat:83.0f/100.0f] forKey:@"redComponent"];
    [rossoCorsa setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [rossoCorsa setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return rossoCorsa;
}

+ (UIColor *)rosyBrown {
    UIColor *rosyBrown = [UIColor colorWithRed:74.0f/100.0f green:56.0f/100.0f blue:56.0f/100.0f alpha:1.0f];
    [rosyBrown setValue:[NSNumber numberWithFloat:74.0f/100.0f] forKey:@"redComponent"];
    [rosyBrown setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"greenComponent"];
    [rosyBrown setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"blueComponent"];
    return rosyBrown;
}

+ (UIColor *)royalAzure {
    UIColor *royalAzure = [UIColor colorWithRed:0.0f green:22.0f/100.0f blue:66.0f/100.0f alpha:1.0f];
    [royalAzure setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [royalAzure setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"greenComponent"];
    [royalAzure setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"blueComponent"];
    return royalAzure;
}

+ (UIColor *)royalBlue {
    UIColor *royalBlue = [UIColor colorWithRed:0.0f green:14.0f/100.0f blue:4.0f/10.0f alpha:1.0f];
    [royalBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [royalBlue setValue:[NSNumber numberWithFloat:14.0f/100.0f] forKey:@"greenComponent"];
    [royalBlue setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"blueComponent"];
    return royalBlue;
}

+ (UIColor *)royalBlue2 {
    UIColor *royalBlue = [UIColor colorWithRed:0.25f green:41.0f/100.0f blue:88.0f/100.0f alpha:1.0f];
    [royalBlue setValue:[NSNumber numberWithFloat:0.25f] forKey:@"redComponent"];
    [royalBlue setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"greenComponent"];
    [royalBlue setValue:[NSNumber numberWithFloat:88.0f/100.0f] forKey:@"blueComponent"];
    return royalBlue;
}

+ (UIColor *)royalFuchsia {
    UIColor *royalFuchsia = [UIColor colorWithRed:79.0f/100.0f green:0.1667f blue:57.0f/100.0f alpha:1.0f];
    [royalFuchsia setValue:[NSNumber numberWithFloat:79.0f/100.0f] forKey:@"redComponent"];
    [royalFuchsia setValue:[NSNumber numberWithFloat:0.1667f] forKey:@"greenComponent"];
    [royalFuchsia setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"blueComponent"];
    return royalFuchsia;
}

+ (UIColor *)royalPurple {
    UIColor *royalPurple = [UIColor colorWithRed:47.0f/100.0f green:32.0f/100.0f blue:66.0f/100.0f alpha:1.0f];
    [royalPurple setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"redComponent"];
    [royalPurple setValue:[NSNumber numberWithFloat:32.0f/100.0f] forKey:@"greenComponent"];
    [royalPurple setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"blueComponent"];
    return royalPurple;
}

+ (UIColor *)royalYellow {
    UIColor *royalYellow = [UIColor colorWithRed:98.0f/100.0f green:85.0f/100.0f blue:37.0f/100.0f alpha:1.0f];
    [royalYellow setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [royalYellow setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"greenComponent"];
    [royalYellow setValue:[NSNumber numberWithFloat:37.0f/100.0f] forKey:@"blueComponent"];
    return royalYellow;
}

+ (UIColor *)ruber {
    UIColor *ruber = [UIColor colorWithRed:81.0f/100.0f green:27.0f/100.0f blue:46.0f/100.0f alpha:1.0f];
    [ruber setValue:[NSNumber numberWithFloat:81.0f/100.0f] forKey:@"redComponent"];
    [ruber setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"greenComponent"];
    [ruber setValue:[NSNumber numberWithFloat:46.0f/100.0f] forKey:@"blueComponent"];
    return ruber;
}

+ (UIColor *)rubineRed {
    UIColor *rubineRed = [UIColor colorWithRed:82.0f/100.0f green:0.0f blue:34.0f/100.0f alpha:1.0f];
    [rubineRed setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"redComponent"];
    [rubineRed setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [rubineRed setValue:[NSNumber numberWithFloat:34.0f/100.0f] forKey:@"blueComponent"];
    return rubineRed;
}

+ (UIColor *)ruby {
    UIColor *ruby = [UIColor colorWithRed:88.0f/100.0f green:7.0f/100.0f blue:37.0f/100.0f alpha:1.0f];
    [ruby setValue:[NSNumber numberWithFloat:88.0f/100.0f] forKey:@"redComponent"];
    [ruby setValue:[NSNumber numberWithFloat:7.0f/100.0f] forKey:@"greenComponent"];
    [ruby setValue:[NSNumber numberWithFloat:37.0f/100.0f] forKey:@"blueComponent"];
    return ruby;
}

+ (UIColor *)rubyRed {
    UIColor *rubyRed = [UIColor colorWithRed:61.0f/100.0f green:7.0f/100.0f blue:12.0f/100.0f alpha:1.0f];
    [rubyRed setValue:[NSNumber numberWithFloat:61.0f/100.0f] forKey:@"redComponent"];
    [rubyRed setValue:[NSNumber numberWithFloat:7.0f/100.0f] forKey:@"greenComponent"];
    [rubyRed setValue:[NSNumber numberWithFloat:12.0f/100.0f] forKey:@"blueComponent"];
    return rubyRed;
}

+ (UIColor *)ruddy {
    UIColor *ruddy = [UIColor colorWithRed:1.0f green:0.0f blue:16.0f/100.0f alpha:1.0f];
    [ruddy setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [ruddy setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [ruddy setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"blueComponent"];
    return ruddy;
}

+ (UIColor *)ruddyBrown {
    UIColor *ruddyBrown = [UIColor colorWithRed:73.0f/100.0f green:4.0f/10.0f blue:16.0f/100.0f alpha:1.0f];
    [ruddyBrown setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"redComponent"];
    [ruddyBrown setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"greenComponent"];
    [ruddyBrown setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"blueComponent"];
    return ruddyBrown;
}

+ (UIColor *)ruddyPink {
    UIColor *ruddyPink = [UIColor colorWithRed:88.0f/100.0f green:56.0f/100.0f blue:59.0f/100.0f alpha:1.0f];
    [ruddyPink setValue:[NSNumber numberWithFloat:88.0f/100.0f] forKey:@"redComponent"];
    [ruddyPink setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"greenComponent"];
    [ruddyPink setValue:[NSNumber numberWithFloat:59.0f/100.0f] forKey:@"blueComponent"];
    return ruddyPink;
}

+ (UIColor *)rufous {
    UIColor *rufous = [UIColor colorWithRed:66.0f/100.0f green:11.0f/100.0f blue:3.0f/100.0f alpha:1.0f];
    [rufous setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"redComponent"];
    [rufous setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"greenComponent"];
    [rufous setValue:[NSNumber numberWithFloat:3.0f/100.0f] forKey:@"blueComponent"];
    return rufous;
}

+ (UIColor *)russet {
    UIColor *russet = [UIColor colorWithRed:0.5f green:27.0f/100.0f blue:11.0f/100.0f alpha:1.0f];
    [russet setValue:[NSNumber numberWithFloat:0.5f] forKey:@"redComponent"];
    [russet setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"greenComponent"];
    [russet setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"blueComponent"];
    return russet;
}

+ (UIColor *)russianGreen {
    UIColor *russianGreen = [UIColor colorWithRed:4.0f/10.0f green:57.0f/100.0f blue:4.0f/10.0f alpha:1.0f];
    [russianGreen setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"redComponent"];
    [russianGreen setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"greenComponent"];
    [russianGreen setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"blueComponent"];
    return russianGreen;
}

+ (UIColor *)russianViolet {
    UIColor *russianViolet = [UIColor colorWithRed:2.0f/10.0f green:9.0f/100.0f blue:3.0f/10.0f alpha:1.0f];
    [russianViolet setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"redComponent"];
    [russianViolet setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"greenComponent"];
    [russianViolet setValue:[NSNumber numberWithFloat:3.0f/10.0f] forKey:@"blueComponent"];
    return russianViolet;
}

+ (UIColor *)rust {
    UIColor *rust = [UIColor colorWithRed:72.0f/100.0f green:0.25f blue:5.0f/100.0f alpha:1.0f];
    [rust setValue:[NSNumber numberWithFloat:72.0f/100.0f] forKey:@"redComponent"];
    [rust setValue:[NSNumber numberWithFloat:0.25f] forKey:@"greenComponent"];
    [rust setValue:[NSNumber numberWithFloat:5.0f/100.0f] forKey:@"blueComponent"];
    return rust;
}

+ (UIColor *)rustyRed {
    UIColor *rustyRed = [UIColor colorWithRed:85.0f/100.0f green:0.1667f blue:26.0f/100.0f alpha:1.0f];
    [rustyRed setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"redComponent"];
    [rustyRed setValue:[NSNumber numberWithFloat:0.1667f] forKey:@"greenComponent"];
    [rustyRed setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"blueComponent"];
    return rustyRed;
}

+ (UIColor *)sacramentoStateGreen {
    UIColor *sacramentoStateGreen = [UIColor colorWithRed:0.0f green:34.0f/100.0f blue:0.25f alpha:1.0f];
    [sacramentoStateGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [sacramentoStateGreen setValue:[NSNumber numberWithFloat:34.0f/100.0f] forKey:@"greenComponent"];
    [sacramentoStateGreen setValue:[NSNumber numberWithFloat:0.25f] forKey:@"blueComponent"];
    return sacramentoStateGreen;
}

+ (UIColor *)saddleBrown {
    UIColor *saddleBrown = [UIColor colorWithRed:55.0f/100.0f green:27.0f/100.0f blue:7.0f/100.0f alpha:1.0f];
    [saddleBrown setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"redComponent"];
    [saddleBrown setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"greenComponent"];
    [saddleBrown setValue:[NSNumber numberWithFloat:7.0f/100.0f] forKey:@"blueComponent"];
    return saddleBrown;
}

+ (UIColor *)safetyOrange {
    UIColor *safetyOrange = [UIColor colorWithRed:1.0f green:47.0f/100.0f blue:0.0f alpha:1.0f];
    [safetyOrange setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [safetyOrange setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"greenComponent"];
    [safetyOrange setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return safetyOrange;
}

+ (UIColor *)safetyOrangeBlazeOrange {
    UIColor *safetyOrangeBlazeOrange = [UIColor colorWithRed:1.0f green:4.0f/10.0f blue:0.0f alpha:1.0f];
    [safetyOrangeBlazeOrange setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [safetyOrangeBlazeOrange setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"greenComponent"];
    [safetyOrangeBlazeOrange setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return safetyOrangeBlazeOrange;
}

+ (UIColor *)safetyYellow {
    UIColor *safetyYellow = [UIColor colorWithRed:93.0f/100.0f green:82.0f/100.0f blue:1.0f/100.0f alpha:1.0f];
    [safetyYellow setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"redComponent"];
    [safetyYellow setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"greenComponent"];
    [safetyYellow setValue:[NSNumber numberWithFloat:1.0f/100.0f] forKey:@"blueComponent"];
    return safetyYellow;
}

+ (UIColor *)saffron {
    UIColor *saffron = [UIColor colorWithRed:96.0f/100.0f green:77.0f/100.0f blue:19.0f/100.0f alpha:1.0f];
    [saffron setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"redComponent"];
    [saffron setValue:[NSNumber numberWithFloat:77.0f/100.0f] forKey:@"greenComponent"];
    [saffron setValue:[NSNumber numberWithFloat:19.0f/100.0f] forKey:@"blueComponent"];
    return saffron;
}

+ (UIColor *)sage {
    UIColor *sage = [UIColor colorWithRed:74.0f/100.0f green:72.0f/100.0f blue:54.0f/100.0f alpha:1.0f];
    [sage setValue:[NSNumber numberWithFloat:74.0f/100.0f] forKey:@"redComponent"];
    [sage setValue:[NSNumber numberWithFloat:72.0f/100.0f] forKey:@"greenComponent"];
    [sage setValue:[NSNumber numberWithFloat:54.0f/100.0f] forKey:@"blueComponent"];
    return sage;
}

+ (UIColor *)stPatricksBlue {
    UIColor *stPatricksBlue = [UIColor colorWithRed:14.0f/100.0f green:16.0f/100.0f blue:48.0f/100.0f alpha:1.0f];
    [stPatricksBlue setValue:[NSNumber numberWithFloat:14.0f/100.0f] forKey:@"redComponent"];
    [stPatricksBlue setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"greenComponent"];
    [stPatricksBlue setValue:[NSNumber numberWithFloat:48.0f/100.0f] forKey:@"blueComponent"];
    return stPatricksBlue;
}

+ (UIColor *)salmon {
    UIColor *salmon = [UIColor colorWithRed:98.0f/100.0f green:0.5f blue:45.0f/100.0f alpha:1.0f];
    [salmon setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [salmon setValue:[NSNumber numberWithFloat:0.5f] forKey:@"greenComponent"];
    [salmon setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"blueComponent"];
    return salmon;
}

+ (UIColor *)salmonPink {
    UIColor *salmonPink = [UIColor colorWithRed:1.0f green:57.0f/100.0f blue:64.0f/100.0f alpha:1.0f];
    [salmonPink setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [salmonPink setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"greenComponent"];
    [salmonPink setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"blueComponent"];
    return salmonPink;
}

+ (UIColor *)sand {
    UIColor *sand = [UIColor colorWithRed:76.0f/100.0f green:7.0f/10.0f blue:0.5f alpha:1.0f];
    [sand setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"redComponent"];
    [sand setValue:[NSNumber numberWithFloat:7.0f/10.0f] forKey:@"greenComponent"];
    [sand setValue:[NSNumber numberWithFloat:0.5f] forKey:@"blueComponent"];
    return sand;
}

+ (UIColor *)sandDune {
    UIColor *sandDune = [UIColor colorWithRed:59.0f/100.0f green:44.0f/100.0f blue:9.0f/100.0f alpha:1.0f];
    [sandDune setValue:[NSNumber numberWithFloat:59.0f/100.0f] forKey:@"redComponent"];
    [sandDune setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"greenComponent"];
    [sandDune setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"blueComponent"];
    return sandDune;
}

+ (UIColor *)sandstorm {
    UIColor *sandstorm = [UIColor colorWithRed:93.0f/100.0f green:84.0f/100.0f blue:0.25f alpha:1.0f];
    [sandstorm setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"redComponent"];
    [sandstorm setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"greenComponent"];
    [sandstorm setValue:[NSNumber numberWithFloat:0.25f] forKey:@"blueComponent"];
    return sandstorm;
}

+ (UIColor *)sandyBrown {
    UIColor *sandyBrown = [UIColor colorWithRed:96.0f/100.0f green:64.0f/100.0f blue:38.0f/100.0f alpha:1.0f];
    [sandyBrown setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"redComponent"];
    [sandyBrown setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"greenComponent"];
    [sandyBrown setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"blueComponent"];
    return sandyBrown;
}

+ (UIColor *)sandyTaupe {
    UIColor *sandyTaupe = [UIColor colorWithRed:59.0f/100.0f green:44.0f/100.0f blue:9.0f/100.0f alpha:1.0f];
    [sandyTaupe setValue:[NSNumber numberWithFloat:59.0f/100.0f] forKey:@"redComponent"];
    [sandyTaupe setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"greenComponent"];
    [sandyTaupe setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"blueComponent"];
    return sandyTaupe;
}

+ (UIColor *)sangria {
    UIColor *sangria = [UIColor colorWithRed:57.0f/100.0f green:0.0f blue:4.0f/100.0f alpha:1.0f];
    [sangria setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"redComponent"];
    [sangria setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [sangria setValue:[NSNumber numberWithFloat:4.0f/100.0f] forKey:@"blueComponent"];
    return sangria;
}

+ (UIColor *)sapGreen {
    UIColor *sapGreen = [UIColor colorWithRed:31.0f/100.0f green:49.0f/100.0f blue:16.0f/100.0f alpha:1.0f];
    [sapGreen setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"redComponent"];
    [sapGreen setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"greenComponent"];
    [sapGreen setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"blueComponent"];
    return sapGreen;
}

+ (UIColor *)sapphire {
    UIColor *sapphire = [UIColor colorWithRed:6.0f/100.0f green:32.0f/100.0f blue:73.0f/100.0f alpha:1.0f];
    [sapphire setValue:[NSNumber numberWithFloat:6.0f/100.0f] forKey:@"redComponent"];
    [sapphire setValue:[NSNumber numberWithFloat:32.0f/100.0f] forKey:@"greenComponent"];
    [sapphire setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"blueComponent"];
    return sapphire;
}

+ (UIColor *)sapphireBlue {
    UIColor *sapphireBlue = [UIColor colorWithRed:0.0f green:4.0f/10.0f blue:65.0f/100.0f alpha:1.0f];
    [sapphireBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [sapphireBlue setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"greenComponent"];
    [sapphireBlue setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"blueComponent"];
    return sapphireBlue;
}

+ (UIColor *)satinSheenGold {
    UIColor *satinSheenGold = [UIColor colorWithRed:8.0f/10.0f green:63.0f/100.0f blue:21.0f/100.0f alpha:1.0f];
    [satinSheenGold setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [satinSheenGold setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"greenComponent"];
    [satinSheenGold setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"blueComponent"];
    return satinSheenGold;
}

+ (UIColor *)scarlet {
    UIColor *scarlet = [UIColor colorWithRed:1.0f green:14.0f/100.0f blue:0.0f alpha:1.0f];
    [scarlet setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [scarlet setValue:[NSNumber numberWithFloat:14.0f/100.0f] forKey:@"greenComponent"];
    [scarlet setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return scarlet;
}

+ (UIColor *)scarlet2 {
    UIColor *scarlet2 = [UIColor colorWithRed:99.0f/100.0f green:5.0f/100.0f blue:21.0f/100.0f alpha:1.0f];
    [scarlet2 setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"redComponent"];
    [scarlet2 setValue:[NSNumber numberWithFloat:5.0f/100.0f] forKey:@"greenComponent"];
    [scarlet2 setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"blueComponent"];
    return scarlet2;
}

+ (UIColor *)schaussPink {
    UIColor *schaussPink = [UIColor colorWithRed:1.0f green:57.0f/100.0f blue:69.0f/100.0f alpha:1.0f];
    [schaussPink setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [schaussPink setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"greenComponent"];
    [schaussPink setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"blueComponent"];
    return schaussPink;
}

+ (UIColor *)schoolBusYellow {
    UIColor *schoolBusYellow = [UIColor colorWithRed:1.0f green:85.0f/100.0f blue:0.0f alpha:1.0f];
    [schoolBusYellow setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [schoolBusYellow setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"greenComponent"];
    [schoolBusYellow setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return schoolBusYellow;
}

+ (UIColor *)screaminGreen {
    UIColor *screaminGreen = [UIColor colorWithRed:46.0f/100.0f green:1.0f blue:48.0f/100.0f alpha:1.0f];
    [screaminGreen setValue:[NSNumber numberWithFloat:46.0f/100.0f] forKey:@"redComponent"];
    [screaminGreen setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [screaminGreen setValue:[NSNumber numberWithFloat:48.0f/100.0f] forKey:@"blueComponent"];
    return screaminGreen;
}

+ (UIColor *)seaBlue {
    UIColor *seaBlue = [UIColor colorWithRed:0.0f green:41.0f/100.0f blue:58.0f/100.0f alpha:1.0f];
    [seaBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [seaBlue setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"greenComponent"];
    [seaBlue setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"blueComponent"];
    return seaBlue;
}

+ (UIColor *)seaGreen {
    UIColor *seaGreen = [UIColor colorWithRed:18.0f/100.0f green:55.0f/100.0f blue:34.0f/100.0f alpha:1.0f];
    [seaGreen setValue:[NSNumber numberWithFloat:18.0f/100.0f] forKey:@"redComponent"];
    [seaGreen setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"greenComponent"];
    [seaGreen setValue:[NSNumber numberWithFloat:34.0f/100.0f] forKey:@"blueComponent"];
    return seaGreen;
}

+ (UIColor *)sealBrown {
    UIColor *sealBrown = [UIColor colorWithRed:2.0f/10.0f green:8.0f/100.0f blue:8.0f/100.0f alpha:1.0f];
    [sealBrown setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"redComponent"];
    [sealBrown setValue:[NSNumber numberWithFloat:8.0f/100.0f] forKey:@"greenComponent"];
    [sealBrown setValue:[NSNumber numberWithFloat:8.0f/100.0f] forKey:@"blueComponent"];
    return sealBrown;
}

+ (UIColor *)seashell {
    UIColor *seashell = [UIColor colorWithRed:1.0f green:96.0f/100.0f blue:93.0f/100.0f alpha:1.0f];
    [seashell setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [seashell setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"greenComponent"];
    [seashell setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"blueComponent"];
    return seashell;
}

+ (UIColor *)selectiveYellow {
    UIColor *selectiveYellow = [UIColor colorWithRed:1.0f green:73.0f/100.0f blue:0.0f alpha:1.0f];
    [selectiveYellow setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [selectiveYellow setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"greenComponent"];
    [selectiveYellow setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return selectiveYellow;
}

+ (UIColor *)sepia {
    UIColor *sepia = [UIColor colorWithRed:44.0f/100.0f green:26.0f/100.0f blue:8.0f/100.0f alpha:1.0f];
    [sepia setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"redComponent"];
    [sepia setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"greenComponent"];
    [sepia setValue:[NSNumber numberWithFloat:8.0f/100.0f] forKey:@"blueComponent"];
    return sepia;
}

+ (UIColor *)shadow {
    UIColor *shadow = [UIColor colorWithRed:54.0f/100.0f green:47.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
    [shadow setValue:[NSNumber numberWithFloat:54.0f/100.0f] forKey:@"redComponent"];
    [shadow setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"greenComponent"];
    [shadow setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"blueComponent"];
    return shadow;
}

+ (UIColor *)shadowBlue {
    UIColor *shadowBlue = [UIColor colorWithRed:47.0f/100.0f green:55.0f/100.0f blue:65.0f/100.0f alpha:1.0f];
    [shadowBlue setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"redComponent"];
    [shadowBlue setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"greenComponent"];
    [shadowBlue setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"blueComponent"];
    return shadowBlue;
}

+ (UIColor *)shampoo {
    UIColor *shampoo = [UIColor colorWithRed:1.0f green:81.0f/100.0f blue:95.0f/100.0f alpha:1.0f];
    [shampoo setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [shampoo setValue:[NSNumber numberWithFloat:81.0f/100.0f] forKey:@"greenComponent"];
    [shampoo setValue:[NSNumber numberWithFloat:95.0f/100.0f] forKey:@"blueComponent"];
    return shampoo;
}

+ (UIColor *)shamrockGreen {
    UIColor *shamrockGreen = [UIColor colorWithRed:0.0f green:62.0f/100.0f blue:38.0f/100.0f alpha:1.0f];
    [shamrockGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [shamrockGreen setValue:[NSNumber numberWithFloat:62.0f/100.0f] forKey:@"greenComponent"];
    [shamrockGreen setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"blueComponent"];
    return shamrockGreen;
}

+ (UIColor *)sheenGreen {
    UIColor *sheenGreen = [UIColor colorWithRed:56.0f/100.0f green:83.0f/100.0f blue:0.0f alpha:1.0f];
    [sheenGreen setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"redComponent"];
    [sheenGreen setValue:[NSNumber numberWithFloat:83.0f/100.0f] forKey:@"greenComponent"];
    [sheenGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return sheenGreen;
}

+ (UIColor *)shimmeringBlush {
    UIColor *shimmeringBlush = [UIColor colorWithRed:85.0f/100.0f green:53.0f/100.0f blue:58.0f/100.0f alpha:1.0f];
    [shimmeringBlush setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"redComponent"];
    [shimmeringBlush setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"greenComponent"];
    [shimmeringBlush setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"blueComponent"];
    return shimmeringBlush;
}

+ (UIColor *)shockingPink {
    UIColor *shockingPink = [UIColor colorWithRed:99.0f/100.0f green:6.0f/100.0f blue:0.75f alpha:1.0f];
    [shockingPink setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"redComponent"];
    [shockingPink setValue:[NSNumber numberWithFloat:6.0f/100.0f] forKey:@"greenComponent"];
    [shockingPink setValue:[NSNumber numberWithFloat:0.75f] forKey:@"blueComponent"];
    return shockingPink;
}

+ (UIColor *)shockingPinkCrayola {
    UIColor *shockingPinkCrayola = [UIColor colorWithRed:1.0f green:44.0f/100.0f blue:1.0f alpha:1.0f];
    [shockingPinkCrayola setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [shockingPinkCrayola setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"greenComponent"];
    [shockingPinkCrayola setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return shockingPinkCrayola;
}

+ (UIColor *)sienna {
    UIColor *sienna = [UIColor colorWithRed:53.0f/100.0f green:18.0f/100.0f blue:9.0f/100.0f alpha:1.0f];
    [sienna setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"redComponent"];
    [sienna setValue:[NSNumber numberWithFloat:18.0f/100.0f] forKey:@"greenComponent"];
    [sienna setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"blueComponent"];
    return sienna;
}

+ (UIColor *)silver {
    UIColor *silver = [UIColor colorWithRed:0.75f green:0.75f blue:0.75f alpha:1.0f];
    [silver setValue:[NSNumber numberWithFloat:0.75f] forKey:@"redComponent"];
    [silver setValue:[NSNumber numberWithFloat:0.75f] forKey:@"greenComponent"];
    [silver setValue:[NSNumber numberWithFloat:0.75f] forKey:@"blueComponent"];
    return silver;
}

+ (UIColor *)silverChalice {
    UIColor *silverChalice = [UIColor colorWithRed:0.667f green:0.667f blue:0.667f alpha:1.0f];
    [silverChalice setValue:[NSNumber numberWithFloat:0.667f] forKey:@"redComponent"];
    [silverChalice setValue:[NSNumber numberWithFloat:0.667f] forKey:@"greenComponent"];
    [silverChalice setValue:[NSNumber numberWithFloat:0.667f] forKey:@"blueComponent"];
    return silverChalice;
}

+ (UIColor *)silverLakeBlue {
    UIColor *silverLakeBlue = [UIColor colorWithRed:36.0f/100.0f green:54.0f/100.0f blue:73.0f/100.0f alpha:1.0f];
    [silverLakeBlue setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"redComponent"];
    [silverLakeBlue setValue:[NSNumber numberWithFloat:54.0f/100.0f] forKey:@"greenComponent"];
    [silverLakeBlue setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"blueComponent"];
    return silverLakeBlue;
}

+ (UIColor *)silverPink {
    UIColor *silverPink = [UIColor colorWithRed:77.0f/100.0f green:68.0f/100.0f blue:68.0f/100.0f alpha:1.0f];
    [silverPink setValue:[NSNumber numberWithFloat:77.0f/100.0f] forKey:@"redComponent"];
    [silverPink setValue:[NSNumber numberWithFloat:68.0f/100.0f] forKey:@"greenComponent"];
    [silverPink setValue:[NSNumber numberWithFloat:68.0f/100.0f] forKey:@"blueComponent"];
    return silverPink;
}

+ (UIColor *)silverSand {
    UIColor *silverSand = [UIColor colorWithRed:0.75f green:76.0f/100.0f blue:76.0f/100.0f alpha:1.0f];
    [silverSand setValue:[NSNumber numberWithFloat:0.75f] forKey:@"redComponent"];
    [silverSand setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"greenComponent"];
    [silverSand setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"blueComponent"];
    return silverSand;
}

+ (UIColor *)sinopia {
    UIColor *sinopia = [UIColor colorWithRed:8.0f/10.0f green:0.25f blue:4.0f/100.0f alpha:1.0f];
    [sinopia setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [sinopia setValue:[NSNumber numberWithFloat:0.25f] forKey:@"greenComponent"];
    [sinopia setValue:[NSNumber numberWithFloat:4.0f/100.0f] forKey:@"blueComponent"];
    return sinopia;
}

+ (UIColor *)skobeloff {
    UIColor *skobeloff = [UIColor colorWithRed:0.0f green:45.0f/100.0f blue:45.0f/100.0f alpha:1.0f];
    [skobeloff setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [skobeloff setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"greenComponent"];
    [skobeloff setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"blueComponent"];
    return skobeloff;
}

+ (UIColor *)skyBlue {
    UIColor *skyBlue = [UIColor colorWithRed:53.0f/100.0f green:81.0f/100.0f blue:92.0f/100.0f alpha:1.0f];
    [skyBlue setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"redComponent"];
    [skyBlue setValue:[NSNumber numberWithFloat:81.0f/100.0f] forKey:@"greenComponent"];
    [skyBlue setValue:[NSNumber numberWithFloat:92.0f/100.0f] forKey:@"blueComponent"];
    return skyBlue;
}

+ (UIColor *)skyMagenta {
    UIColor *skyMagenta = [UIColor colorWithRed:81.0f/100.0f green:44.0f/100.0f blue:69.0f/100.0f alpha:1.0f];
    [skyMagenta setValue:[NSNumber numberWithFloat:81.0f/100.0f] forKey:@"redComponent"];
    [skyMagenta setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"greenComponent"];
    [skyMagenta setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"blueComponent"];
    return skyMagenta;
}

+ (UIColor *)slateBlue {
    UIColor *slateBlue = [UIColor colorWithRed:42.0f/100.0f green:35.0f/100.0f blue:8.0f/10.0f alpha:1.0f];
    [slateBlue setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"redComponent"];
    [slateBlue setValue:[NSNumber numberWithFloat:35.0f/100.0f] forKey:@"greenComponent"];
    [slateBlue setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"blueComponent"];
    return slateBlue;
}

+ (UIColor *)slateGray {
    UIColor *slateGray = [UIColor colorWithRed:44.0f/100.0f green:0.5f blue:56.0f/100.0f alpha:1.0f];
    [slateGray setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"redComponent"];
    [slateGray setValue:[NSNumber numberWithFloat:0.5f] forKey:@"greenComponent"];
    [slateGray setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"blueComponent"];
    return slateGray;
}

+ (UIColor *)smaltDarkPowderBlue {
    UIColor *smaltDarkPowderBlue = [UIColor colorWithRed:0.0f green:2.0f/10.0f blue:6.0f/10.0f alpha:1.0f];
    [smaltDarkPowderBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [smaltDarkPowderBlue setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"greenComponent"];
    [smaltDarkPowderBlue setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"blueComponent"];
    return smaltDarkPowderBlue;
}

+ (UIColor *)smitten {
    UIColor *smitten = [UIColor colorWithRed:78.0f/100.0f green:0.25f blue:53.0f/100.0f alpha:1.0f];
    [smitten setValue:[NSNumber numberWithFloat:78.0f/100.0f] forKey:@"redComponent"];
    [smitten setValue:[NSNumber numberWithFloat:0.25f] forKey:@"greenComponent"];
    [smitten setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"blueComponent"];
    return smitten;
}

+ (UIColor *)smoke {
    UIColor *smoke = [UIColor colorWithRed:45.0f/100.0f green:51.0f/100.0f blue:46.0f/100.0f alpha:1.0f];
    [smoke setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"redComponent"];
    [smoke setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"greenComponent"];
    [smoke setValue:[NSNumber numberWithFloat:46.0f/100.0f] forKey:@"blueComponent"];
    return smoke;
}

+ (UIColor *)smokyBlack {
    UIColor *smokyBlack = [UIColor colorWithRed:6.0f/100.0f green:5.0f/100.0f blue:3.0f/100.0f alpha:1.0f];
    [smokyBlack setValue:[NSNumber numberWithFloat:6.0f/100.0f] forKey:@"redComponent"];
    [smokyBlack setValue:[NSNumber numberWithFloat:5.0f/100.0f] forKey:@"greenComponent"];
    [smokyBlack setValue:[NSNumber numberWithFloat:3.0f/100.0f] forKey:@"blueComponent"];
    return smokyBlack;
}

+ (UIColor *)smokyTopaz {
    UIColor *smokyTopaz = [UIColor colorWithRed:58.0f/100.0f green:24.0f/100.0f blue:0.25f alpha:1.0f];
    [smokyTopaz setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"redComponent"];
    [smokyTopaz setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"greenComponent"];
    [smokyTopaz setValue:[NSNumber numberWithFloat:0.25f] forKey:@"blueComponent"];
    return smokyTopaz;
}

+ (UIColor *)snow {
    UIColor *snow = [UIColor colorWithRed:1.0f green:98.0f/100.0f blue:98.0f/100.0f alpha:1.0f];
    [snow setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [snow setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"greenComponent"];
    [snow setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"blueComponent"];
    return snow;
}

+ (UIColor *)soap {
    UIColor *soap = [UIColor colorWithRed:81.0f/100.0f green:78.0f/100.0f blue:94.0f/100.0f alpha:1.0f];
    [soap setValue:[NSNumber numberWithFloat:81.0f/100.0f] forKey:@"redComponent"];
    [soap setValue:[NSNumber numberWithFloat:78.0f/100.0f] forKey:@"greenComponent"];
    [soap setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"blueComponent"];
    return soap;
}

+ (UIColor *)solidPink {
    UIColor *solidPink = [UIColor colorWithRed:54.0f/100.0f green:22.0f/100.0f blue:26.0f/100.0f alpha:1.0f];
    [solidPink setValue:[NSNumber numberWithFloat:54.0f/100.0f] forKey:@"redComponent"];
    [solidPink setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"greenComponent"];
    [solidPink setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"blueComponent"];
    return solidPink;
}

+ (UIColor *)sonicSilver {
    UIColor *sonicSilver = [UIColor colorWithRed:46.0f/100.0f green:46.0f/100.0f blue:46.0f/100.0f alpha:1.0f];
    [sonicSilver setValue:[NSNumber numberWithFloat:46.0f/100.0f] forKey:@"redComponent"];
    [sonicSilver setValue:[NSNumber numberWithFloat:46.0f/100.0f] forKey:@"greenComponent"];
    [sonicSilver setValue:[NSNumber numberWithFloat:46.0f/100.0f] forKey:@"blueComponent"];
    return sonicSilver;
}

+ (UIColor *)spartanCrimson {
    UIColor *spartanCrimson = [UIColor colorWithRed:62.0f/100.0f green:7.0f/100.0f blue:9.0f/100.0f alpha:1.0f];
    [spartanCrimson setValue:[NSNumber numberWithFloat:62.0f/100.0f] forKey:@"redComponent"];
    [spartanCrimson setValue:[NSNumber numberWithFloat:7.0f/100.0f] forKey:@"greenComponent"];
    [spartanCrimson setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"blueComponent"];
    return spartanCrimson;
}

+ (UIColor *)spaceCadet {
    UIColor *spaceCadet = [UIColor colorWithRed:11.0f/100.0f green:16.0f/100.0f blue:32.0f/100.0f alpha:1.0f];
    [spaceCadet setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"redComponent"];
    [spaceCadet setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"greenComponent"];
    [spaceCadet setValue:[NSNumber numberWithFloat:32.0f/100.0f] forKey:@"blueComponent"];
    return spaceCadet;
}

+ (UIColor *)spanishBistre {
    UIColor *spanishBistre = [UIColor colorWithRed:0.5f green:46.0f/100.0f blue:2.0f/10.0f alpha:1.0f];
    [spanishBistre setValue:[NSNumber numberWithFloat:0.5f] forKey:@"redComponent"];
    [spanishBistre setValue:[NSNumber numberWithFloat:46.0f/100.0f] forKey:@"greenComponent"];
    [spanishBistre setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"blueComponent"];
    return spanishBistre;
}

+ (UIColor *)spanishBlue {
    UIColor *spanishBlue = [UIColor colorWithRed:0.0f green:44.0f/100.0f blue:72.0f/100.0f alpha:1.0f];
    [spanishBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [spanishBlue setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"greenComponent"];
    [spanishBlue setValue:[NSNumber numberWithFloat:72.0f/100.0f] forKey:@"blueComponent"];
    return spanishBlue;
}

+ (UIColor *)spanishCarmine {
    UIColor *spanishCarmine = [UIColor colorWithRed:82.0f/100.0f green:0.0f blue:28.0f/100.0f alpha:1.0f];
    [spanishCarmine setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"redComponent"];
    [spanishCarmine setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [spanishCarmine setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"blueComponent"];
    return spanishCarmine;
}

+ (UIColor *)spanishCrimson {
    UIColor *spanishCrimson = [UIColor colorWithRed:9.0f/10.0f green:1.0f/10.0f blue:3.0f/10.0f alpha:1.0f];
    [spanishCrimson setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"redComponent"];
    [spanishCrimson setValue:[NSNumber numberWithFloat:1.0f/10.0f] forKey:@"greenComponent"];
    [spanishCrimson setValue:[NSNumber numberWithFloat:3.0f/10.0f] forKey:@"blueComponent"];
    return spanishCrimson;
}

+ (UIColor *)spanishGray {
    UIColor *spanishGray = [UIColor colorWithRed:6.0f/10.0f green:6.0f/10.0f blue:6.0f/10.0f alpha:1.0f];
    [spanishGray setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"redComponent"];
    [spanishGray setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [spanishGray setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"blueComponent"];
    return spanishGray;
}

+ (UIColor *)spanishGreen {
    UIColor *spanishGreen = [UIColor colorWithRed:0.0f green:57.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
    [spanishGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [spanishGreen setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"greenComponent"];
    [spanishGreen setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"blueComponent"];
    return spanishGreen;
}

+ (UIColor *)spanishOrange {
    UIColor *spanishOrange = [UIColor colorWithRed:91.0f/100.0f green:38.0f/100.0f blue:0.0f alpha:1.0f];
    [spanishOrange setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"redComponent"];
    [spanishOrange setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"greenComponent"];
    [spanishOrange setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return spanishOrange;
}

+ (UIColor *)spanishPink {
    UIColor *spanishPink = [UIColor colorWithRed:97.0f/100.0f green:0.75f blue:0.75f alpha:1.0f];
    [spanishPink setValue:[NSNumber numberWithFloat:97.0f/100.0f] forKey:@"redComponent"];
    [spanishPink setValue:[NSNumber numberWithFloat:0.75f] forKey:@"greenComponent"];
    [spanishPink setValue:[NSNumber numberWithFloat:0.75f] forKey:@"blueComponent"];
    return spanishPink;
}

+ (UIColor *)spanishRed {
    UIColor *spanishRed = [UIColor colorWithRed:9.0f/10.0f green:0.0f blue:15.0f/100.0f alpha:1.0f];
    [spanishRed setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"redComponent"];
    [spanishRed setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [spanishRed setValue:[NSNumber numberWithFloat:15.0f/100.0f] forKey:@"blueComponent"];
    return spanishRed;
}

+ (UIColor *)spanishSkyBlue {
    UIColor *spanishSkyBlue = [UIColor colorWithRed:0.0f green:1.0f blue:1.0f alpha:1.0f];
    [spanishSkyBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [spanishSkyBlue setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [spanishSkyBlue setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return spanishSkyBlue;
}

+ (UIColor *)spanishViolet {
    UIColor *spanishViolet = [UIColor colorWithRed:3.0f/10.0f green:16.0f/100.0f blue:51.0f/100.0f alpha:1.0f];
    [spanishViolet setValue:[NSNumber numberWithFloat:3.0f/10.0f] forKey:@"redComponent"];
    [spanishViolet setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"greenComponent"];
    [spanishViolet setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"blueComponent"];
    return spanishViolet;
}

+ (UIColor *)spanishViridian {
    UIColor *spanishViridian = [UIColor colorWithRed:0.0f green:0.5f blue:36.0f/100.0f alpha:1.0f];
    [spanishViridian setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [spanishViridian setValue:[NSNumber numberWithFloat:0.5f] forKey:@"greenComponent"];
    [spanishViridian setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"blueComponent"];
    return spanishViridian;
}

+ (UIColor *)spicyMix {
    UIColor *spicyMix = [UIColor colorWithRed:55.0f/100.0f green:37.0f/100.0f blue:3.0f/10.0f alpha:1.0f];
    [spicyMix setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"redComponent"];
    [spicyMix setValue:[NSNumber numberWithFloat:37.0f/100.0f] forKey:@"greenComponent"];
    [spicyMix setValue:[NSNumber numberWithFloat:3.0f/10.0f] forKey:@"blueComponent"];
    return spicyMix;
}

+ (UIColor *)spiroDiscoBall {
    UIColor *spiroDiscoBall = [UIColor colorWithRed:6.0f/100.0f green:0.75f blue:99.0f/100.0f alpha:1.0f];
    [spiroDiscoBall setValue:[NSNumber numberWithFloat:6.0f/100.0f] forKey:@"redComponent"];
    [spiroDiscoBall setValue:[NSNumber numberWithFloat:0.75f] forKey:@"greenComponent"];
    [spiroDiscoBall setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"blueComponent"];
    return spiroDiscoBall;
}

+ (UIColor *)springBud {
    UIColor *springBud = [UIColor colorWithRed:65.0f/100.0f green:99.0f/100.0f blue:0.0f alpha:1.0f];
    [springBud setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"redComponent"];
    [springBud setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"greenComponent"];
    [springBud setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return springBud;
}

+ (UIColor *)springGreen {
    UIColor *springGreen = [UIColor colorWithRed:0.0f green:1.0f blue:0.5f alpha:1.0f];
    [springGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [springGreen setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [springGreen setValue:[NSNumber numberWithFloat:0.5f] forKey:@"blueComponent"];
    return springGreen;
}

+ (UIColor *)starCommandBlue {
    UIColor *starCommandBlue = [UIColor colorWithRed:0.0f green:48.0f/100.0f blue:72.0f/100.0f alpha:1.0f];
    [starCommandBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [starCommandBlue setValue:[NSNumber numberWithFloat:48.0f/100.0f] forKey:@"greenComponent"];
    [starCommandBlue setValue:[NSNumber numberWithFloat:72.0f/100.0f] forKey:@"blueComponent"];
    return starCommandBlue;
}

+ (UIColor *)steelBlue {
    UIColor *steelBlue = [UIColor colorWithRed:27.0f/100.0f green:51.0f/100.0f blue:71.0f/100.0f alpha:1.0f];
    [steelBlue setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"redComponent"];
    [steelBlue setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"greenComponent"];
    [steelBlue setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"blueComponent"];
    return steelBlue;
}

+ (UIColor *)steelPink {
    UIColor *steelPink = [UIColor colorWithRed:8.0f/10.0f green:2.0f/10.0f blue:8.0f/10.0f alpha:1.0f];
    [steelPink setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [steelPink setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"greenComponent"];
    [steelPink setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"blueComponent"];
    return steelPink;
}

+ (UIColor *)stilDeGrainYellow {
    UIColor *stilDeGrainYellow = [UIColor colorWithRed:98.0f/100.0f green:85.0f/100.0f blue:37.0f/100.0f alpha:1.0f];
    [stilDeGrainYellow setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [stilDeGrainYellow setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"greenComponent"];
    [stilDeGrainYellow setValue:[NSNumber numberWithFloat:37.0f/100.0f] forKey:@"blueComponent"];
    return stilDeGrainYellow;
}

+ (UIColor *)stizza {
    UIColor *stizza = [UIColor colorWithRed:6.0f/10.0f green:0.0f blue:0.0f alpha:1.0f];
    [stizza setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"redComponent"];
    [stizza setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [stizza setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return stizza;
}

+ (UIColor *)stormcloud {
    UIColor *stormcloud = [UIColor colorWithRed:31.0f/100.0f green:4.0f/10.0f blue:42.0f/100.0f alpha:1.0f];
    [stormcloud setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"redComponent"];
    [stormcloud setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"greenComponent"];
    [stormcloud setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"blueComponent"];
    return stormcloud;
}

+ (UIColor *)straw {
    UIColor *straw = [UIColor colorWithRed:89.0f/100.0f green:85.0f/100.0f blue:44.0f/100.0f alpha:1.0f];
    [straw setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"redComponent"];
    [straw setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"greenComponent"];
    [straw setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"blueComponent"];
    return straw;
}

+ (UIColor *)strawberry {
    UIColor *strawberry = [UIColor colorWithRed:99.0f/100.0f green:35.0f/100.0f blue:55.0f/100.0f alpha:1.0f];
    [strawberry setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"redComponent"];
    [strawberry setValue:[NSNumber numberWithFloat:35.0f/100.0f] forKey:@"greenComponent"];
    [strawberry setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"blueComponent"];
    return strawberry;
}

+ (UIColor *)sunglow {
    UIColor *sunglow = [UIColor colorWithRed:1.0f green:8.0f/10.0f blue:2.0f/10.0f alpha:1.0f];
    [sunglow setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [sunglow setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"greenComponent"];
    [sunglow setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"blueComponent"];
    return sunglow;
}

+ (UIColor *)sunray {
    UIColor *sunray = [UIColor colorWithRed:89.0f/100.0f green:0.667f blue:34.0f/100.0f alpha:1.0f];
    [sunray setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"redComponent"];
    [sunray setValue:[NSNumber numberWithFloat:0.667f] forKey:@"greenComponent"];
    [sunray setValue:[NSNumber numberWithFloat:34.0f/100.0f] forKey:@"blueComponent"];
    return sunray;
}

+ (UIColor *)sunset {
    UIColor *sunset = [UIColor colorWithRed:98.0f/100.0f green:84.0f/100.0f blue:65.0f/100.0f alpha:1.0f];
    [sunset setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [sunset setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"greenComponent"];
    [sunset setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"blueComponent"];
    return sunset;
}

+ (UIColor *)sunsetOrange {
    UIColor *sunsetOrange = [UIColor colorWithRed:99.0f/100.0f green:37.0f/100.0f blue:0.333f alpha:1.0f];
    [sunsetOrange setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"redComponent"];
    [sunsetOrange setValue:[NSNumber numberWithFloat:37.0f/100.0f] forKey:@"greenComponent"];
    [sunsetOrange setValue:[NSNumber numberWithFloat:0.333f] forKey:@"blueComponent"];
    return sunsetOrange;
}

+ (UIColor *)superPink {
    UIColor *superPink = [UIColor colorWithRed:81.0f/100.0f green:42.0f/100.0f blue:66.0f/100.0f alpha:1.0f];
    [superPink setValue:[NSNumber numberWithFloat:81.0f/100.0f] forKey:@"redComponent"];
    [superPink setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"greenComponent"];
    [superPink setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"blueComponent"];
    return superPink;
}

+ (UIColor *)tan {
    UIColor *tan = [UIColor colorWithRed:82.0f/100.0f green:71.0f/100.0f blue:55.0f/100.0f alpha:1.0f];
    [tan setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"redComponent"];
    [tan setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"greenComponent"];
    [tan setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"blueComponent"];
    return tan;
}

+ (UIColor *)tangelo {
    UIColor *tangelo = [UIColor colorWithRed:98.0f/100.0f green:3.0f/10.0f blue:0.0f alpha:1.0f];
    [tangelo setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [tangelo setValue:[NSNumber numberWithFloat:3.0f/10.0f] forKey:@"greenComponent"];
    [tangelo setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return tangelo;
}

+ (UIColor *)tangerine {
    UIColor *tangerine = [UIColor colorWithRed:95.0f/100.0f green:52.0f/100.0f blue:0.0f alpha:1.0f];
    [tangerine setValue:[NSNumber numberWithFloat:95.0f/100.0f] forKey:@"redComponent"];
    [tangerine setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"greenComponent"];
    [tangerine setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return tangerine;
}

+ (UIColor *)tangerineYellow {
    UIColor *tangerineYellow = [UIColor colorWithRed:1.0f green:8.0f/10.0f blue:0.0f alpha:1.0f];
    [tangerineYellow setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [tangerineYellow setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"greenComponent"];
    [tangerineYellow setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return tangerineYellow;
}

+ (UIColor *)tangoPink {
    UIColor *tangoPink = [UIColor colorWithRed:89.0f/100.0f green:44.0f/100.0f blue:48.0f/100.0f alpha:1.0f];
    [tangoPink setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"redComponent"];
    [tangoPink setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"greenComponent"];
    [tangoPink setValue:[NSNumber numberWithFloat:48.0f/100.0f] forKey:@"blueComponent"];
    return tangoPink;
}

+ (UIColor *)taupe {
    UIColor *taupe = [UIColor colorWithRed:28.0f/100.0f green:24.0f/100.0f blue:2.0f/10.0f alpha:1.0f];
    [taupe setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"redComponent"];
    [taupe setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"greenComponent"];
    [taupe setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"blueComponent"];
    return taupe;
}

+ (UIColor *)taupeGray {
    UIColor *taupeGray = [UIColor colorWithRed:55.0f/100.0f green:52.0f/100.0f blue:54.0f/100.0f alpha:1.0f];
    [taupeGray setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"redComponent"];
    [taupeGray setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"greenComponent"];
    [taupeGray setValue:[NSNumber numberWithFloat:54.0f/100.0f] forKey:@"blueComponent"];
    return taupeGray;
}

+ (UIColor *)teaGreen {
    UIColor *teaGreen = [UIColor colorWithRed:82.0f/100.0f green:94.0f/100.0f blue:0.75f alpha:1.0f];
    [teaGreen setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"redComponent"];
    [teaGreen setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"greenComponent"];
    [teaGreen setValue:[NSNumber numberWithFloat:0.75f] forKey:@"blueComponent"];
    return teaGreen;
}

+ (UIColor *)teaRose {
    UIColor *teaRose = [UIColor colorWithRed:97.0f/100.0f green:51.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
    [teaRose setValue:[NSNumber numberWithFloat:97.0f/100.0f] forKey:@"redComponent"];
    [teaRose setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"greenComponent"];
    [teaRose setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"blueComponent"];
    return teaRose;
}

+ (UIColor *)teaRose2 {
    UIColor *teaRose = [UIColor colorWithRed:96.0f/100.0f green:76.0f/100.0f blue:76.0f/100.0f alpha:1.0f];
    [teaRose setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"redComponent"];
    [teaRose setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"greenComponent"];
    [teaRose setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"blueComponent"];
    return teaRose;
}

+ (UIColor *)teal {
    UIColor *teal = [UIColor colorWithRed:0.0f green:0.5f blue:0.5f alpha:1.0f];
    [teal setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [teal setValue:[NSNumber numberWithFloat:0.5f] forKey:@"greenComponent"];
    [teal setValue:[NSNumber numberWithFloat:0.5f] forKey:@"blueComponent"];
    return teal;
}

+ (UIColor *)tealBlue {
    UIColor *tealBlue = [UIColor colorWithRed:21.0f/100.0f green:46.0f/100.0f blue:53.0f/100.0f alpha:1.0f];
    [tealBlue setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"redComponent"];
    [tealBlue setValue:[NSNumber numberWithFloat:46.0f/100.0f] forKey:@"greenComponent"];
    [tealBlue setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"blueComponent"];
    return tealBlue;
}

+ (UIColor *)tealDeer {
    UIColor *tealDeer = [UIColor colorWithRed:6.0f/10.0f green:9.0f/10.0f blue:7.0f/10.0f alpha:1.0f];
    [tealDeer setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"redComponent"];
    [tealDeer setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"greenComponent"];
    [tealDeer setValue:[NSNumber numberWithFloat:7.0f/10.0f] forKey:@"blueComponent"];
    return tealDeer;
}

+ (UIColor *)tealGreen {
    UIColor *tealGreen = [UIColor colorWithRed:0.0f green:51.0f/100.0f blue:0.5f alpha:1.0f];
    [tealGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [tealGreen setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"greenComponent"];
    [tealGreen setValue:[NSNumber numberWithFloat:0.5f] forKey:@"blueComponent"];
    return tealGreen;
}

+ (UIColor *)telemagenta {
    UIColor *telemagenta = [UIColor colorWithRed:81.0f/100.0f green:2.0f/10.0f blue:46.0f/100.0f alpha:1.0f];
    [telemagenta setValue:[NSNumber numberWithFloat:81.0f/100.0f] forKey:@"redComponent"];
    [telemagenta setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"greenComponent"];
    [telemagenta setValue:[NSNumber numberWithFloat:46.0f/100.0f] forKey:@"blueComponent"];
    return telemagenta;
}

+ (UIColor *)tenne {
    UIColor *tenne = [UIColor colorWithRed:8.0f/10.0f green:34.0f/100.0f blue:0.0f alpha:1.0f];
    [tenne setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [tenne setValue:[NSNumber numberWithFloat:34.0f/100.0f] forKey:@"greenComponent"];
    [tenne setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return tenne;
}

+ (UIColor *)terraCotta {
    UIColor *terraCotta = [UIColor colorWithRed:89.0f/100.0f green:45.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
    [terraCotta setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"redComponent"];
    [terraCotta setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"greenComponent"];
    [terraCotta setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"blueComponent"];
    return terraCotta;
}

+ (UIColor *)thistle {
    UIColor *thistle = [UIColor colorWithRed:85.0f/100.0f green:0.75f blue:85.0f/100.0f alpha:1.0f];
    [thistle setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"redComponent"];
    [thistle setValue:[NSNumber numberWithFloat:0.75f] forKey:@"greenComponent"];
    [thistle setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"blueComponent"];
    return thistle;
}

+ (UIColor *)thulianPink {
    UIColor *thulianPink = [UIColor colorWithRed:87.0f/100.0f green:44.0f/100.0f blue:63.0f/100.0f alpha:1.0f];
    [thulianPink setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"redComponent"];
    [thulianPink setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"greenComponent"];
    [thulianPink setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"blueComponent"];
    return thulianPink;
}

+ (UIColor *)tickleMePink {
    UIColor *tickleMePink = [UIColor colorWithRed:99.0f/100.0f green:54.0f/100.0f blue:0.667f alpha:1.0f];
    [tickleMePink setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"redComponent"];
    [tickleMePink setValue:[NSNumber numberWithFloat:54.0f/100.0f] forKey:@"greenComponent"];
    [tickleMePink setValue:[NSNumber numberWithFloat:0.667f] forKey:@"blueComponent"];
    return tickleMePink;
}

+ (UIColor *)tiffanyBlue {
    UIColor *tiffanyBlue = [UIColor colorWithRed:4.0f/100.0f green:73.0f/100.0f blue:71.0f/100.0f alpha:1.0f];
    [tiffanyBlue setValue:[NSNumber numberWithFloat:4.0f/100.0f] forKey:@"redComponent"];
    [tiffanyBlue setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"greenComponent"];
    [tiffanyBlue setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"blueComponent"];
    return tiffanyBlue;
}

+ (UIColor *)tigersEye {
    UIColor *tigersEye = [UIColor colorWithRed:88.0f/100.0f green:55.0f/100.0f blue:24.0f/100.0f alpha:1.0f];
    [tigersEye setValue:[NSNumber numberWithFloat:88.0f/100.0f] forKey:@"redComponent"];
    [tigersEye setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"greenComponent"];
    [tigersEye setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"blueComponent"];
    return tigersEye;
}

+ (UIColor *)timberwolf {
    UIColor *timberwolf = [UIColor colorWithRed:86.0f/100.0f green:84.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
    [timberwolf setValue:[NSNumber numberWithFloat:86.0f/100.0f] forKey:@"redComponent"];
    [timberwolf setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"greenComponent"];
    [timberwolf setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"blueComponent"];
    return timberwolf;
}

+ (UIColor *)titaniumYellow {
    UIColor *titaniumYellow = [UIColor colorWithRed:93.0f/100.0f green:9.0f/10.0f blue:0.0f alpha:1.0f];
    [titaniumYellow setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"redComponent"];
    [titaniumYellow setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"greenComponent"];
    [titaniumYellow setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return titaniumYellow;
}

+ (UIColor *)tomato {
    UIColor *tomato = [UIColor colorWithRed:1.0f green:39.0f/100.0f blue:28.0f/100.0f alpha:1.0f];
    [tomato setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [tomato setValue:[NSNumber numberWithFloat:39.0f/100.0f] forKey:@"greenComponent"];
    [tomato setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"blueComponent"];
    return tomato;
}

+ (UIColor *)toolbox {
    UIColor *toolbox = [UIColor colorWithRed:45.0f/100.0f green:42.0f/100.0f blue:0.75f alpha:1.0f];
    [toolbox setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"redComponent"];
    [toolbox setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"greenComponent"];
    [toolbox setValue:[NSNumber numberWithFloat:0.75f] forKey:@"blueComponent"];
    return toolbox;
}

+ (UIColor *)topaz {
    UIColor *topaz = [UIColor colorWithRed:1.0f green:78.0f/100.0f blue:49.0f/100.0f alpha:1.0f];
    [topaz setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [topaz setValue:[NSNumber numberWithFloat:78.0f/100.0f] forKey:@"greenComponent"];
    [topaz setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"blueComponent"];
    return topaz;
}

+ (UIColor *)tractorRed {
    UIColor *tractorRed = [UIColor colorWithRed:99.0f/100.0f green:5.0f/100.0f blue:21.0f/100.0f alpha:1.0f];
    [tractorRed setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"redComponent"];
    [tractorRed setValue:[NSNumber numberWithFloat:5.0f/100.0f] forKey:@"greenComponent"];
    [tractorRed setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"blueComponent"];
    return tractorRed;
}

+ (UIColor *)trolleyGrey {
    UIColor *trolleyGrey = [UIColor colorWithRed:0.5f green:0.5f blue:0.5f alpha:1.0f];
    [trolleyGrey setValue:[NSNumber numberWithFloat:0.5f] forKey:@"redComponent"];
    [trolleyGrey setValue:[NSNumber numberWithFloat:0.5f] forKey:@"greenComponent"];
    [trolleyGrey setValue:[NSNumber numberWithFloat:0.5f] forKey:@"blueComponent"];
    return trolleyGrey;
}

+ (UIColor *)tropicalRainForest {
    UIColor *tropicalRainForest = [UIColor colorWithRed:0.0f green:46.0f/100.0f blue:37.0f/100.0f alpha:1.0f];
    [tropicalRainForest setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [tropicalRainForest setValue:[NSNumber numberWithFloat:46.0f/100.0f] forKey:@"greenComponent"];
    [tropicalRainForest setValue:[NSNumber numberWithFloat:37.0f/100.0f] forKey:@"blueComponent"];
    return tropicalRainForest;
}

+ (UIColor *)trueBlue {
    UIColor *trueBlue = [UIColor colorWithRed:0.0f green:45.0f/100.0f blue:81.0f/100.0f alpha:1.0f];
    [trueBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [trueBlue setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"greenComponent"];
    [trueBlue setValue:[NSNumber numberWithFloat:81.0f/100.0f] forKey:@"blueComponent"];
    return trueBlue;
}

+ (UIColor *)tuftsBlue {
    UIColor *tuftsBlue = [UIColor colorWithRed:0.25f green:49.0f/100.0f blue:76.0f/100.0f alpha:1.0f];
    [tuftsBlue setValue:[NSNumber numberWithFloat:0.25f] forKey:@"redComponent"];
    [tuftsBlue setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"greenComponent"];
    [tuftsBlue setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"blueComponent"];
    return tuftsBlue;
}

+ (UIColor *)tulip {
    UIColor *tulip = [UIColor colorWithRed:1.0f green:53.0f/100.0f blue:55.0f/100.0f alpha:1.0f];
    [tulip setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [tulip setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"greenComponent"];
    [tulip setValue:[NSNumber numberWithFloat:55.0f/100.0f] forKey:@"blueComponent"];
    return tulip;
}

+ (UIColor *)tumbleweed {
    UIColor *tumbleweed = [UIColor colorWithRed:87.0f/100.0f green:0.667f blue:53.0f/100.0f alpha:1.0f];
    [tumbleweed setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"redComponent"];
    [tumbleweed setValue:[NSNumber numberWithFloat:0.667f] forKey:@"greenComponent"];
    [tumbleweed setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"blueComponent"];
    return tumbleweed;
}

+ (UIColor *)turkishRose {
    UIColor *turkishRose = [UIColor colorWithRed:71.0f/100.0f green:45.0f/100.0f blue:51.0f/100.0f alpha:1.0f];
    [turkishRose setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"redComponent"];
    [turkishRose setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"greenComponent"];
    [turkishRose setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"blueComponent"];
    return turkishRose;
}

+ (UIColor *)turquoise {
    UIColor *turquoise = [UIColor colorWithRed:0.25f green:88.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
    [turquoise setValue:[NSNumber numberWithFloat:0.25f] forKey:@"redComponent"];
    [turquoise setValue:[NSNumber numberWithFloat:88.0f/100.0f] forKey:@"greenComponent"];
    [turquoise setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"blueComponent"];
    return turquoise;
}

+ (UIColor *)turquoiseBlue {
    UIColor *turquoiseBlue = [UIColor colorWithRed:0.0f green:1.0f blue:94.0f/100.0f alpha:1.0f];
    [turquoiseBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [turquoiseBlue setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [turquoiseBlue setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"blueComponent"];
    return turquoiseBlue;
}

+ (UIColor *)turquoiseGreen {
    UIColor *turquoiseGreen = [UIColor colorWithRed:63.0f/100.0f green:84.0f/100.0f blue:71.0f/100.0f alpha:1.0f];
    [turquoiseGreen setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"redComponent"];
    [turquoiseGreen setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"greenComponent"];
    [turquoiseGreen setValue:[NSNumber numberWithFloat:71.0f/100.0f] forKey:@"blueComponent"];
    return turquoiseGreen;
}

+ (UIColor *)tuscan {
    UIColor *tuscan = [UIColor colorWithRed:98.0f/100.0f green:84.0f/100.0f blue:65.0f/100.0f alpha:1.0f];
    [tuscan setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"redComponent"];
    [tuscan setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"greenComponent"];
    [tuscan setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"blueComponent"];
    return tuscan;
}

+ (UIColor *)tuscanBrown {
    UIColor *tuscanBrown = [UIColor colorWithRed:44.0f/100.0f green:31.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
    [tuscanBrown setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"redComponent"];
    [tuscanBrown setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"greenComponent"];
    [tuscanBrown setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"blueComponent"];
    return tuscanBrown;
}

+ (UIColor *)tuscanRed {
    UIColor *tuscanRed = [UIColor colorWithRed:49.0f/100.0f green:28.0f/100.0f blue:28.0f/100.0f alpha:1.0f];
    [tuscanRed setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"redComponent"];
    [tuscanRed setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"greenComponent"];
    [tuscanRed setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"blueComponent"];
    return tuscanRed;
}

+ (UIColor *)tuscanTan {
    UIColor *tuscanTan = [UIColor colorWithRed:65.0f/100.0f green:48.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
    [tuscanTan setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"redComponent"];
    [tuscanTan setValue:[NSNumber numberWithFloat:48.0f/100.0f] forKey:@"greenComponent"];
    [tuscanTan setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"blueComponent"];
    return tuscanTan;
}

+ (UIColor *)tuscany {
    UIColor *tuscany = [UIColor colorWithRed:0.75f green:6.0f/10.0f blue:6.0f/10.0f alpha:1.0f];
    [tuscany setValue:[NSNumber numberWithFloat:0.75f] forKey:@"redComponent"];
    [tuscany setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [tuscany setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"blueComponent"];
    return tuscany;
}

+ (UIColor *)twilightLavender {
    UIColor *twilightLavender = [UIColor colorWithRed:54.0f/100.0f green:29.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
    [twilightLavender setValue:[NSNumber numberWithFloat:54.0f/100.0f] forKey:@"redComponent"];
    [twilightLavender setValue:[NSNumber numberWithFloat:29.0f/100.0f] forKey:@"greenComponent"];
    [twilightLavender setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"blueComponent"];
    return twilightLavender;
}

+ (UIColor *)tyrianPurple {
    UIColor *tyrianPurple = [UIColor colorWithRed:4.0f/10.0f green:1.0f/100.0f blue:24.0f/100.0f alpha:1.0f];
    [tyrianPurple setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"redComponent"];
    [tyrianPurple setValue:[NSNumber numberWithFloat:1.0f/100.0f] forKey:@"greenComponent"];
    [tyrianPurple setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"blueComponent"];
    return tyrianPurple;
}

+ (UIColor *)uABlue {
    UIColor *uABlue = [UIColor colorWithRed:0.0f green:2.0f/10.0f blue:0.667f alpha:1.0f];
    [uABlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [uABlue setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"greenComponent"];
    [uABlue setValue:[NSNumber numberWithFloat:0.667f] forKey:@"blueComponent"];
    return uABlue;
}

+ (UIColor *)uARed {
    UIColor *uARed = [UIColor colorWithRed:85.0f/100.0f green:0.0f blue:3.0f/10.0f alpha:1.0f];
    [uARed setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"redComponent"];
    [uARed setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [uARed setValue:[NSNumber numberWithFloat:3.0f/10.0f] forKey:@"blueComponent"];
    return uARed;
}

+ (UIColor *)ube {
    UIColor *ube = [UIColor colorWithRed:53.0f/100.0f green:47.0f/100.0f blue:76.0f/100.0f alpha:1.0f];
    [ube setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"redComponent"];
    [ube setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"greenComponent"];
    [ube setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"blueComponent"];
    return ube;
}

+ (UIColor *)uCLABlue {
    UIColor *uCLABlue = [UIColor colorWithRed:0.333f green:41.0f/100.0f blue:58.0f/100.0f alpha:1.0f];
    [uCLABlue setValue:[NSNumber numberWithFloat:0.333f] forKey:@"redComponent"];
    [uCLABlue setValue:[NSNumber numberWithFloat:41.0f/100.0f] forKey:@"greenComponent"];
    [uCLABlue setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"blueComponent"];
    return uCLABlue;
}

+ (UIColor *)uCLAGold {
    UIColor *uCLAGold = [UIColor colorWithRed:1.0f green:7.0f/10.0f blue:0.0f alpha:1.0f];
    [uCLAGold setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [uCLAGold setValue:[NSNumber numberWithFloat:7.0f/10.0f] forKey:@"greenComponent"];
    [uCLAGold setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return uCLAGold;
}

+ (UIColor *)uFOGreen {
    UIColor *uFOGreen = [UIColor colorWithRed:24.0f/100.0f green:82.0f/100.0f blue:44.0f/100.0f alpha:1.0f];
    [uFOGreen setValue:[NSNumber numberWithFloat:24.0f/100.0f] forKey:@"redComponent"];
    [uFOGreen setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"greenComponent"];
    [uFOGreen setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"blueComponent"];
    return uFOGreen;
}

+ (UIColor *)ultramarine {
    UIColor *ultramarine = [UIColor colorWithRed:7.0f/100.0f green:4.0f/100.0f blue:56.0f/100.0f alpha:1.0f];
    [ultramarine setValue:[NSNumber numberWithFloat:7.0f/100.0f] forKey:@"redComponent"];
    [ultramarine setValue:[NSNumber numberWithFloat:4.0f/100.0f] forKey:@"greenComponent"];
    [ultramarine setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"blueComponent"];
    return ultramarine;
}

+ (UIColor *)ultramarineBlue {
    UIColor *ultramarineBlue = [UIColor colorWithRed:0.25f green:4.0f/10.0f blue:96.0f/100.0f alpha:1.0f];
    [ultramarineBlue setValue:[NSNumber numberWithFloat:0.25f] forKey:@"redComponent"];
    [ultramarineBlue setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"greenComponent"];
    [ultramarineBlue setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"blueComponent"];
    return ultramarineBlue;
}

+ (UIColor *)ultraPink {
    UIColor *ultraPink = [UIColor colorWithRed:1.0f green:44.0f/100.0f blue:1.0f alpha:1.0f];
    [ultraPink setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [ultraPink setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"greenComponent"];
    [ultraPink setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return ultraPink;
}

+ (UIColor *)ultraRed {
    UIColor *ultraRed = [UIColor colorWithRed:99.0f/100.0f green:42.0f/100.0f blue:52.0f/100.0f alpha:1.0f];
    [ultraRed setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"redComponent"];
    [ultraRed setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"greenComponent"];
    [ultraRed setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"blueComponent"];
    return ultraRed;
}

+ (UIColor *)umber {
    UIColor *umber = [UIColor colorWithRed:39.0f/100.0f green:32.0f/100.0f blue:28.0f/100.0f alpha:1.0f];
    [umber setValue:[NSNumber numberWithFloat:39.0f/100.0f] forKey:@"redComponent"];
    [umber setValue:[NSNumber numberWithFloat:32.0f/100.0f] forKey:@"greenComponent"];
    [umber setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"blueComponent"];
    return umber;
}

+ (UIColor *)unbleachedSilk {
    UIColor *unbleachedSilk = [UIColor colorWithRed:1.0f green:87.0f/100.0f blue:79.0f/100.0f alpha:1.0f];
    [unbleachedSilk setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [unbleachedSilk setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"greenComponent"];
    [unbleachedSilk setValue:[NSNumber numberWithFloat:79.0f/100.0f] forKey:@"blueComponent"];
    return unbleachedSilk;
}

+ (UIColor *)unitedNationsBlue {
    UIColor *unitedNationsBlue = [UIColor colorWithRed:36.0f/100.0f green:57.0f/100.0f blue:9.0f/10.0f alpha:1.0f];
    [unitedNationsBlue setValue:[NSNumber numberWithFloat:36.0f/100.0f] forKey:@"redComponent"];
    [unitedNationsBlue setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"greenComponent"];
    [unitedNationsBlue setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"blueComponent"];
    return unitedNationsBlue;
}

+ (UIColor *)universityOfCaliforniaGold {
    UIColor *universityOfCaliforniaGold = [UIColor colorWithRed:72.0f/100.0f green:53.0f/100.0f blue:15.0f/100.0f alpha:1.0f];
    [universityOfCaliforniaGold setValue:[NSNumber numberWithFloat:72.0f/100.0f] forKey:@"redComponent"];
    [universityOfCaliforniaGold setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"greenComponent"];
    [universityOfCaliforniaGold setValue:[NSNumber numberWithFloat:15.0f/100.0f] forKey:@"blueComponent"];
    return universityOfCaliforniaGold;
}

+ (UIColor *)unmellowYellow {
    UIColor *unmellowYellow = [UIColor colorWithRed:1.0f green:1.0f blue:4.0f/10.0f alpha:1.0f];
    [unmellowYellow setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [unmellowYellow setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [unmellowYellow setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"blueComponent"];
    return unmellowYellow;
}

+ (UIColor *)uPForestGreen {
    UIColor *uPForestGreen = [UIColor colorWithRed:0.0f green:27.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
    [uPForestGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [uPForestGreen setValue:[NSNumber numberWithFloat:27.0f/100.0f] forKey:@"greenComponent"];
    [uPForestGreen setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"blueComponent"];
    return uPForestGreen;
}

+ (UIColor *)uPMaroon {
    UIColor *uPMaroon = [UIColor colorWithRed:48.0f/100.0f green:7.0f/100.0f blue:7.0f/100.0f alpha:1.0f];
    [uPMaroon setValue:[NSNumber numberWithFloat:48.0f/100.0f] forKey:@"redComponent"];
    [uPMaroon setValue:[NSNumber numberWithFloat:7.0f/100.0f] forKey:@"greenComponent"];
    [uPMaroon setValue:[NSNumber numberWithFloat:7.0f/100.0f] forKey:@"blueComponent"];
    return uPMaroon;
}

+ (UIColor *)upsdellRed {
    UIColor *upsdellRed = [UIColor colorWithRed:68.0f/100.0f green:13.0f/100.0f blue:16.0f/100.0f alpha:1.0f];
    [upsdellRed setValue:[NSNumber numberWithFloat:68.0f/100.0f] forKey:@"redComponent"];
    [upsdellRed setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"greenComponent"];
    [upsdellRed setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"blueComponent"];
    return upsdellRed;
}

+ (UIColor *)urobilin {
    UIColor *urobilin = [UIColor colorWithRed:88.0f/100.0f green:68.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
    [urobilin setValue:[NSNumber numberWithFloat:88.0f/100.0f] forKey:@"redComponent"];
    [urobilin setValue:[NSNumber numberWithFloat:68.0f/100.0f] forKey:@"greenComponent"];
    [urobilin setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"blueComponent"];
    return urobilin;
}

+ (UIColor *)uSAFABlue {
    UIColor *uSAFABlue = [UIColor colorWithRed:0.0f green:31.0f/100.0f blue:6.0f/10.0f alpha:1.0f];
    [uSAFABlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [uSAFABlue setValue:[NSNumber numberWithFloat:31.0f/100.0f] forKey:@"greenComponent"];
    [uSAFABlue setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"blueComponent"];
    return uSAFABlue;
}

+ (UIColor *)uSCCardinal {
    UIColor *uSCCardinal = [UIColor colorWithRed:6.0f/10.0f green:0.0f blue:0.0f alpha:1.0f];
    [uSCCardinal setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"redComponent"];
    [uSCCardinal setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [uSCCardinal setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return uSCCardinal;
}

+ (UIColor *)uSCGold {
    UIColor *uSCGold = [UIColor colorWithRed:1.0f green:8.0f/10.0f blue:0.0f alpha:1.0f];
    [uSCGold setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [uSCGold setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"greenComponent"];
    [uSCGold setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return uSCGold;
}

+ (UIColor *)universityOfTennesseeOrange {
    UIColor *universityOfTennesseeOrange = [UIColor colorWithRed:97.0f/100.0f green:0.5f blue:0.0f alpha:1.0f];
    [universityOfTennesseeOrange setValue:[NSNumber numberWithFloat:97.0f/100.0f] forKey:@"redComponent"];
    [universityOfTennesseeOrange setValue:[NSNumber numberWithFloat:0.5f] forKey:@"greenComponent"];
    [universityOfTennesseeOrange setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return universityOfTennesseeOrange;
}

+ (UIColor *)utahCrimson {
    UIColor *utahCrimson = [UIColor colorWithRed:83.0f/100.0f green:0.0f blue:0.25f alpha:1.0f];
    [utahCrimson setValue:[NSNumber numberWithFloat:83.0f/100.0f] forKey:@"redComponent"];
    [utahCrimson setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [utahCrimson setValue:[NSNumber numberWithFloat:0.25f] forKey:@"blueComponent"];
    return utahCrimson;
}

+ (UIColor *)vanilla {
    UIColor *vanilla = [UIColor colorWithRed:95.0f/100.0f green:9.0f/10.0f blue:0.667f alpha:1.0f];
    [vanilla setValue:[NSNumber numberWithFloat:95.0f/100.0f] forKey:@"redComponent"];
    [vanilla setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"greenComponent"];
    [vanilla setValue:[NSNumber numberWithFloat:0.667f] forKey:@"blueComponent"];
    return vanilla;
}

+ (UIColor *)vanillaIce {
    UIColor *vanillaIce = [UIColor colorWithRed:95.0f/100.0f green:56.0f/100.0f blue:66.0f/100.0f alpha:1.0f];
    [vanillaIce setValue:[NSNumber numberWithFloat:95.0f/100.0f] forKey:@"redComponent"];
    [vanillaIce setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"greenComponent"];
    [vanillaIce setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"blueComponent"];
    return vanillaIce;
}

+ (UIColor *)vegasGold {
    UIColor *vegasGold = [UIColor colorWithRed:77.0f/100.0f green:7.0f/10.0f blue:35.0f/100.0f alpha:1.0f];
    [vegasGold setValue:[NSNumber numberWithFloat:77.0f/100.0f] forKey:@"redComponent"];
    [vegasGold setValue:[NSNumber numberWithFloat:7.0f/10.0f] forKey:@"greenComponent"];
    [vegasGold setValue:[NSNumber numberWithFloat:35.0f/100.0f] forKey:@"blueComponent"];
    return vegasGold;
}

+ (UIColor *)venetianRed {
    UIColor *venetianRed = [UIColor colorWithRed:78.0f/100.0f green:3.0f/100.0f blue:8.0f/100.0f alpha:1.0f];
    [venetianRed setValue:[NSNumber numberWithFloat:78.0f/100.0f] forKey:@"redComponent"];
    [venetianRed setValue:[NSNumber numberWithFloat:3.0f/100.0f] forKey:@"greenComponent"];
    [venetianRed setValue:[NSNumber numberWithFloat:8.0f/100.0f] forKey:@"blueComponent"];
    return venetianRed;
}

+ (UIColor *)verdigris {
    UIColor *verdigris = [UIColor colorWithRed:26.0f/100.0f green:7.0f/10.0f blue:68.0f/100.0f alpha:1.0f];
    [verdigris setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"redComponent"];
    [verdigris setValue:[NSNumber numberWithFloat:7.0f/10.0f] forKey:@"greenComponent"];
    [verdigris setValue:[NSNumber numberWithFloat:68.0f/100.0f] forKey:@"blueComponent"];
    return verdigris;
}

+ (UIColor *)vermilion {
    UIColor *vermilion = [UIColor colorWithRed:89.0f/100.0f green:26.0f/100.0f blue:2.0f/10.0f alpha:1.0f];
    [vermilion setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"redComponent"];
    [vermilion setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"greenComponent"];
    [vermilion setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"blueComponent"];
    return vermilion;
}

+ (UIColor *)vermilion2 {
    UIColor *vermilion2 = [UIColor colorWithRed:85.0f/100.0f green:22.0f/100.0f blue:12.0f/100.0f alpha:1.0f];
    [vermilion2 setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"redComponent"];
    [vermilion2 setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"greenComponent"];
    [vermilion2 setValue:[NSNumber numberWithFloat:12.0f/100.0f] forKey:@"blueComponent"];
    return vermilion2;
}

+ (UIColor *)veronica {
    UIColor *veronica = [UIColor colorWithRed:63.0f/100.0f green:13.0f/100.0f blue:94.0f/100.0f alpha:1.0f];
    [veronica setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"redComponent"];
    [veronica setValue:[NSNumber numberWithFloat:13.0f/100.0f] forKey:@"greenComponent"];
    [veronica setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"blueComponent"];
    return veronica;
}

+ (UIColor *)veryLightAzure {
    UIColor *veryLightAzure = [UIColor colorWithRed:45.0f/100.0f green:73.0f/100.0f blue:98.0f/100.0f alpha:1.0f];
    [veryLightAzure setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"redComponent"];
    [veryLightAzure setValue:[NSNumber numberWithFloat:73.0f/100.0f] forKey:@"greenComponent"];
    [veryLightAzure setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"blueComponent"];
    return veryLightAzure;
}

+ (UIColor *)veryLightBlue {
    UIColor *veryLightBlue = [UIColor colorWithRed:4.0f/10.0f green:4.0f/10.0f blue:1.0f alpha:1.0f];
    [veryLightBlue setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"redComponent"];
    [veryLightBlue setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"greenComponent"];
    [veryLightBlue setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return veryLightBlue;
}

+ (UIColor *)veryLightMalachiteGreen {
    UIColor *veryLightMalachiteGreen = [UIColor colorWithRed:39.0f/100.0f green:91.0f/100.0f blue:53.0f/100.0f alpha:1.0f];
    [veryLightMalachiteGreen setValue:[NSNumber numberWithFloat:39.0f/100.0f] forKey:@"redComponent"];
    [veryLightMalachiteGreen setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"greenComponent"];
    [veryLightMalachiteGreen setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"blueComponent"];
    return veryLightMalachiteGreen;
}

+ (UIColor *)veryLightTangelo {
    UIColor *veryLightTangelo = [UIColor colorWithRed:1.0f green:69.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
    [veryLightTangelo setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [veryLightTangelo setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"greenComponent"];
    [veryLightTangelo setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"blueComponent"];
    return veryLightTangelo;
}

+ (UIColor *)veryPaleOrange {
    UIColor *veryPaleOrange = [UIColor colorWithRed:1.0f green:87.0f/100.0f blue:0.75f alpha:1.0f];
    [veryPaleOrange setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [veryPaleOrange setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"greenComponent"];
    [veryPaleOrange setValue:[NSNumber numberWithFloat:0.75f] forKey:@"blueComponent"];
    return veryPaleOrange;
}

+ (UIColor *)veryPaleYellow {
    UIColor *veryPaleYellow = [UIColor colorWithRed:1.0f green:1.0f blue:0.75f alpha:1.0f];
    [veryPaleYellow setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [veryPaleYellow setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [veryPaleYellow setValue:[NSNumber numberWithFloat:0.75f] forKey:@"blueComponent"];
    return veryPaleYellow;
}

+ (UIColor *)violet {
    UIColor *violet = [UIColor colorWithRed:56.0f/100.0f green:0.0f blue:1.0f alpha:1.0f];
    [violet setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"redComponent"];
    [violet setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [violet setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return violet;
}

+ (UIColor *)violetColorWheel {
    UIColor *violetColorWheel = [UIColor colorWithRed:0.5f green:0.0f blue:1.0f alpha:1.0f];
    [violetColorWheel setValue:[NSNumber numberWithFloat:0.5f] forKey:@"redComponent"];
    [violetColorWheel setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [violetColorWheel setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return violetColorWheel;
}

+ (UIColor *)violetRYB {
    UIColor *violetRYB = [UIColor colorWithRed:53.0f/100.0f green:0.0f blue:69.0f/100.0f alpha:1.0f];
    [violetRYB setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"redComponent"];
    [violetRYB setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [violetRYB setValue:[NSNumber numberWithFloat:69.0f/100.0f] forKey:@"blueComponent"];
    return violetRYB;
}

+ (UIColor *)violetWeb {
    UIColor *violetWeb = [UIColor colorWithRed:93.0f/100.0f green:51.0f/100.0f blue:93.0f/100.0f alpha:1.0f];
    [violetWeb setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"redComponent"];
    [violetWeb setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"greenComponent"];
    [violetWeb setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"blueComponent"];
    return violetWeb;
}

+ (UIColor *)violetBlue {
    UIColor *violetBlue = [UIColor colorWithRed:2.0f/10.0f green:29.0f/100.0f blue:7.0f/10.0f alpha:1.0f];
    [violetBlue setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"redComponent"];
    [violetBlue setValue:[NSNumber numberWithFloat:29.0f/100.0f] forKey:@"greenComponent"];
    [violetBlue setValue:[NSNumber numberWithFloat:7.0f/10.0f] forKey:@"blueComponent"];
    return violetBlue;
}

+ (UIColor *)violetRed {
    UIColor *violetRed = [UIColor colorWithRed:97.0f/100.0f green:0.333f blue:58.0f/100.0f alpha:1.0f];
    [violetRed setValue:[NSNumber numberWithFloat:97.0f/100.0f] forKey:@"redComponent"];
    [violetRed setValue:[NSNumber numberWithFloat:0.333f] forKey:@"greenComponent"];
    [violetRed setValue:[NSNumber numberWithFloat:58.0f/100.0f] forKey:@"blueComponent"];
    return violetRed;
}

+ (UIColor *)viridian {
    UIColor *viridian = [UIColor colorWithRed:0.25f green:51.0f/100.0f blue:43.0f/100.0f alpha:1.0f];
    [viridian setValue:[NSNumber numberWithFloat:0.25f] forKey:@"redComponent"];
    [viridian setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"greenComponent"];
    [viridian setValue:[NSNumber numberWithFloat:43.0f/100.0f] forKey:@"blueComponent"];
    return viridian;
}

+ (UIColor *)viridianGreen {
    UIColor *viridianGreen = [UIColor colorWithRed:0.0f green:59.0f/100.0f blue:6.0f/10.0f alpha:1.0f];
    [viridianGreen setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [viridianGreen setValue:[NSNumber numberWithFloat:59.0f/100.0f] forKey:@"greenComponent"];
    [viridianGreen setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"blueComponent"];
    return viridianGreen;
}

+ (UIColor *)vistaBlue {
    UIColor *vistaBlue = [UIColor colorWithRed:49.0f/100.0f green:62.0f/100.0f blue:85.0f/100.0f alpha:1.0f];
    [vistaBlue setValue:[NSNumber numberWithFloat:49.0f/100.0f] forKey:@"redComponent"];
    [vistaBlue setValue:[NSNumber numberWithFloat:62.0f/100.0f] forKey:@"greenComponent"];
    [vistaBlue setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"blueComponent"];
    return vistaBlue;
}

+ (UIColor *)vividAmber {
    UIColor *vividAmber = [UIColor colorWithRed:8.0f/10.0f green:6.0f/10.0f blue:0.0f alpha:1.0f];
    [vividAmber setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [vividAmber setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [vividAmber setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return vividAmber;
}

+ (UIColor *)vividAuburn {
    UIColor *vividAuburn = [UIColor colorWithRed:57.0f/100.0f green:15.0f/100.0f blue:14.0f/100.0f alpha:1.0f];
    [vividAuburn setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"redComponent"];
    [vividAuburn setValue:[NSNumber numberWithFloat:15.0f/100.0f] forKey:@"greenComponent"];
    [vividAuburn setValue:[NSNumber numberWithFloat:14.0f/100.0f] forKey:@"blueComponent"];
    return vividAuburn;
}

+ (UIColor *)vividBurgundy {
    UIColor *vividBurgundy = [UIColor colorWithRed:62.0f/100.0f green:11.0f/100.0f blue:21.0f/100.0f alpha:1.0f];
    [vividBurgundy setValue:[NSNumber numberWithFloat:62.0f/100.0f] forKey:@"redComponent"];
    [vividBurgundy setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"greenComponent"];
    [vividBurgundy setValue:[NSNumber numberWithFloat:21.0f/100.0f] forKey:@"blueComponent"];
    return vividBurgundy;
}

+ (UIColor *)vividCerise {
    UIColor *vividCerise = [UIColor colorWithRed:85.0f/100.0f green:11.0f/100.0f blue:51.0f/100.0f alpha:1.0f];
    [vividCerise setValue:[NSNumber numberWithFloat:85.0f/100.0f] forKey:@"redComponent"];
    [vividCerise setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"greenComponent"];
    [vividCerise setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"blueComponent"];
    return vividCerise;
}

+ (UIColor *)vividCerulean {
    UIColor *vividCerulean = [UIColor colorWithRed:0.0f green:0.667f blue:93.0f/100.0f alpha:1.0f];
    [vividCerulean setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [vividCerulean setValue:[NSNumber numberWithFloat:0.667f] forKey:@"greenComponent"];
    [vividCerulean setValue:[NSNumber numberWithFloat:93.0f/100.0f] forKey:@"blueComponent"];
    return vividCerulean;
}

+ (UIColor *)vividCrimson {
    UIColor *vividCrimson = [UIColor colorWithRed:8.0f/10.0f green:0.0f blue:2.0f/10.0f alpha:1.0f];
    [vividCrimson setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [vividCrimson setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [vividCrimson setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"blueComponent"];
    return vividCrimson;
}

+ (UIColor *)vividGamboge {
    UIColor *vividGamboge = [UIColor colorWithRed:1.0f green:6.0f/10.0f blue:0.0f alpha:1.0f];
    [vividGamboge setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [vividGamboge setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [vividGamboge setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return vividGamboge;
}

+ (UIColor *)vividLimeGreen {
    UIColor *vividLimeGreen = [UIColor colorWithRed:65.0f/100.0f green:84.0f/100.0f blue:3.0f/100.0f alpha:1.0f];
    [vividLimeGreen setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"redComponent"];
    [vividLimeGreen setValue:[NSNumber numberWithFloat:84.0f/100.0f] forKey:@"greenComponent"];
    [vividLimeGreen setValue:[NSNumber numberWithFloat:3.0f/100.0f] forKey:@"blueComponent"];
    return vividLimeGreen;
}

+ (UIColor *)vividMalachite {
    UIColor *vividMalachite = [UIColor colorWithRed:0.0f green:8.0f/10.0f blue:2.0f/10.0f alpha:1.0f];
    [vividMalachite setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [vividMalachite setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"greenComponent"];
    [vividMalachite setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"blueComponent"];
    return vividMalachite;
}

+ (UIColor *)vividMulberry {
    UIColor *vividMulberry = [UIColor colorWithRed:72.0f/100.0f green:5.0f/100.0f blue:89.0f/100.0f alpha:1.0f];
    [vividMulberry setValue:[NSNumber numberWithFloat:72.0f/100.0f] forKey:@"redComponent"];
    [vividMulberry setValue:[NSNumber numberWithFloat:5.0f/100.0f] forKey:@"greenComponent"];
    [vividMulberry setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"blueComponent"];
    return vividMulberry;
}

+ (UIColor *)vividOrange {
    UIColor *vividOrange = [UIColor colorWithRed:1.0f green:37.0f/100.0f blue:0.0f alpha:1.0f];
    [vividOrange setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [vividOrange setValue:[NSNumber numberWithFloat:37.0f/100.0f] forKey:@"greenComponent"];
    [vividOrange setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return vividOrange;
}

+ (UIColor *)vividOrangePeel {
    UIColor *vividOrangePeel = [UIColor colorWithRed:1.0f green:63.0f/100.0f blue:0.0f alpha:1.0f];
    [vividOrangePeel setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [vividOrangePeel setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"greenComponent"];
    [vividOrangePeel setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return vividOrangePeel;
}

+ (UIColor *)vividOrchid {
    UIColor *vividOrchid = [UIColor colorWithRed:8.0f/10.0f green:0.0f blue:1.0f alpha:1.0f];
    [vividOrchid setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"redComponent"];
    [vividOrchid setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [vividOrchid setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return vividOrchid;
}

+ (UIColor *)vividRaspberry {
    UIColor *vividRaspberry = [UIColor colorWithRed:1.0f green:0.0f blue:42.0f/100.0f alpha:1.0f];
    [vividRaspberry setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [vividRaspberry setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [vividRaspberry setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"blueComponent"];
    return vividRaspberry;
}

+ (UIColor *)vividRed {
    UIColor *vividRed = [UIColor colorWithRed:97.0f/100.0f green:5.0f/100.0f blue:1.0f/10.0f alpha:1.0f];
    [vividRed setValue:[NSNumber numberWithFloat:97.0f/100.0f] forKey:@"redComponent"];
    [vividRed setValue:[NSNumber numberWithFloat:5.0f/100.0f] forKey:@"greenComponent"];
    [vividRed setValue:[NSNumber numberWithFloat:1.0f/10.0f] forKey:@"blueComponent"];
    return vividRed;
}

+ (UIColor *)vividRedTangelo {
    UIColor *vividRedTangelo = [UIColor colorWithRed:87.0f/100.0f green:38.0f/100.0f blue:14.0f/100.0f alpha:1.0f];
    [vividRedTangelo setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"redComponent"];
    [vividRedTangelo setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"greenComponent"];
    [vividRedTangelo setValue:[NSNumber numberWithFloat:14.0f/100.0f] forKey:@"blueComponent"];
    return vividRedTangelo;
}

+ (UIColor *)vividSkyBlue {
    UIColor *vividSkyBlue = [UIColor colorWithRed:0.0f green:8.0f/10.0f blue:1.0f alpha:1.0f];
    [vividSkyBlue setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [vividSkyBlue setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"greenComponent"];
    [vividSkyBlue setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return vividSkyBlue;
}

+ (UIColor *)vividTangelo {
    UIColor *vividTangelo = [UIColor colorWithRed:94.0f/100.0f green:45.0f/100.0f blue:15.0f/100.0f alpha:1.0f];
    [vividTangelo setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"redComponent"];
    [vividTangelo setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"greenComponent"];
    [vividTangelo setValue:[NSNumber numberWithFloat:15.0f/100.0f] forKey:@"blueComponent"];
    return vividTangelo;
}

+ (UIColor *)vividTangerine {
    UIColor *vividTangerine = [UIColor colorWithRed:1.0f green:63.0f/100.0f blue:54.0f/100.0f alpha:1.0f];
    [vividTangerine setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [vividTangerine setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"greenComponent"];
    [vividTangerine setValue:[NSNumber numberWithFloat:54.0f/100.0f] forKey:@"blueComponent"];
    return vividTangerine;
}

+ (UIColor *)vividVermilion {
    UIColor *vividVermilion = [UIColor colorWithRed:9.0f/10.0f green:38.0f/100.0f blue:14.0f/100.0f alpha:1.0f];
    [vividVermilion setValue:[NSNumber numberWithFloat:9.0f/10.0f] forKey:@"redComponent"];
    [vividVermilion setValue:[NSNumber numberWithFloat:38.0f/100.0f] forKey:@"greenComponent"];
    [vividVermilion setValue:[NSNumber numberWithFloat:14.0f/100.0f] forKey:@"blueComponent"];
    return vividVermilion;
}

+ (UIColor *)vividViolet {
    UIColor *vividViolet = [UIColor colorWithRed:62.0f/100.0f green:0.0f blue:1.0f alpha:1.0f];
    [vividViolet setValue:[NSNumber numberWithFloat:62.0f/100.0f] forKey:@"redComponent"];
    [vividViolet setValue:[NSNumber numberWithFloat:0.0f] forKey:@"greenComponent"];
    [vividViolet setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return vividViolet;
}

+ (UIColor *)vividYellow {
    UIColor *vividYellow = [UIColor colorWithRed:1.0f green:89.0f/100.0f blue:1.0f/100.0f alpha:1.0f];
    [vividYellow setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [vividYellow setValue:[NSNumber numberWithFloat:89.0f/100.0f] forKey:@"greenComponent"];
    [vividYellow setValue:[NSNumber numberWithFloat:1.0f/100.0f] forKey:@"blueComponent"];
    return vividYellow;
}

+ (UIColor *)warmBlack {
    UIColor *warmBlack = [UIColor colorWithRed:0.0f green:26.0f/100.0f blue:26.0f/100.0f alpha:1.0f];
    [warmBlack setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [warmBlack setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"greenComponent"];
    [warmBlack setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"blueComponent"];
    return warmBlack;
}

+ (UIColor *)waterspout {
    UIColor *waterspout = [UIColor colorWithRed:64.0f/100.0f green:96.0f/100.0f blue:98.0f/100.0f alpha:1.0f];
    [waterspout setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"redComponent"];
    [waterspout setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"greenComponent"];
    [waterspout setValue:[NSNumber numberWithFloat:98.0f/100.0f] forKey:@"blueComponent"];
    return waterspout;
}

+ (UIColor *)wenge {
    UIColor *wenge = [UIColor colorWithRed:39.0f/100.0f green:0.333f blue:32.0f/100.0f alpha:1.0f];
    [wenge setValue:[NSNumber numberWithFloat:39.0f/100.0f] forKey:@"redComponent"];
    [wenge setValue:[NSNumber numberWithFloat:0.333f] forKey:@"greenComponent"];
    [wenge setValue:[NSNumber numberWithFloat:32.0f/100.0f] forKey:@"blueComponent"];
    return wenge;
}

+ (UIColor *)wheat {
    UIColor *wheat = [UIColor colorWithRed:96.0f/100.0f green:87.0f/100.0f blue:7.0f/10.0f alpha:1.0f];
    [wheat setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"redComponent"];
    [wheat setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"greenComponent"];
    [wheat setValue:[NSNumber numberWithFloat:7.0f/10.0f] forKey:@"blueComponent"];
    return wheat;
}

+ (UIColor *)white {
    UIColor *white = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f];
    [white setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [white setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [white setValue:[NSNumber numberWithFloat:1.0f] forKey:@"blueComponent"];
    return white;
}

+ (UIColor *)whiteSmoke {
    UIColor *whiteSmoke = [UIColor colorWithRed:96.0f/100.0f green:96.0f/100.0f blue:96.0f/100.0f alpha:1.0f];
    [whiteSmoke setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"redComponent"];
    [whiteSmoke setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"greenComponent"];
    [whiteSmoke setValue:[NSNumber numberWithFloat:96.0f/100.0f] forKey:@"blueComponent"];
    return whiteSmoke;
}

+ (UIColor *)wildBlueYonder {
    UIColor *wildBlueYonder = [UIColor colorWithRed:64.0f/100.0f green:68.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
    [wildBlueYonder setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"redComponent"];
    [wildBlueYonder setValue:[NSNumber numberWithFloat:68.0f/100.0f] forKey:@"greenComponent"];
    [wildBlueYonder setValue:[NSNumber numberWithFloat:82.0f/100.0f] forKey:@"blueComponent"];
    return wildBlueYonder;
}

+ (UIColor *)wildOrchid {
    UIColor *wildOrchid = [UIColor colorWithRed:83.0f/100.0f green:44.0f/100.0f blue:64.0f/100.0f alpha:1.0f];
    [wildOrchid setValue:[NSNumber numberWithFloat:83.0f/100.0f] forKey:@"redComponent"];
    [wildOrchid setValue:[NSNumber numberWithFloat:44.0f/100.0f] forKey:@"greenComponent"];
    [wildOrchid setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"blueComponent"];
    return wildOrchid;
}

+ (UIColor *)wildStrawberry {
    UIColor *wildStrawberry = [UIColor colorWithRed:1.0f green:26.0f/100.0f blue:64.0f/100.0f alpha:1.0f];
    [wildStrawberry setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [wildStrawberry setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"greenComponent"];
    [wildStrawberry setValue:[NSNumber numberWithFloat:64.0f/100.0f] forKey:@"blueComponent"];
    return wildStrawberry;
}

+ (UIColor *)wildWatermelon {
    UIColor *wildWatermelon = [UIColor colorWithRed:99.0f/100.0f green:42.0f/100.0f blue:52.0f/100.0f alpha:1.0f];
    [wildWatermelon setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"redComponent"];
    [wildWatermelon setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"greenComponent"];
    [wildWatermelon setValue:[NSNumber numberWithFloat:52.0f/100.0f] forKey:@"blueComponent"];
    return wildWatermelon;
}

+ (UIColor *)willpowerOrange {
    UIColor *willpowerOrange = [UIColor colorWithRed:99.0f/100.0f green:35.0f/100.0f blue:0.0f alpha:1.0f];
    [willpowerOrange setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"redComponent"];
    [willpowerOrange setValue:[NSNumber numberWithFloat:35.0f/100.0f] forKey:@"greenComponent"];
    [willpowerOrange setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return willpowerOrange;
}

+ (UIColor *)windsorTan {
    UIColor *windsorTan = [UIColor colorWithRed:65.0f/100.0f green:0.333f blue:1.0f/100.0f alpha:1.0f];
    [windsorTan setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"redComponent"];
    [windsorTan setValue:[NSNumber numberWithFloat:0.333f] forKey:@"greenComponent"];
    [windsorTan setValue:[NSNumber numberWithFloat:1.0f/100.0f] forKey:@"blueComponent"];
    return windsorTan;
}

+ (UIColor *)wine {
    UIColor *wine = [UIColor colorWithRed:45.0f/100.0f green:18.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
    [wine setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"redComponent"];
    [wine setValue:[NSNumber numberWithFloat:18.0f/100.0f] forKey:@"greenComponent"];
    [wine setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"blueComponent"];
    return wine;
}

+ (UIColor *)wineDregs {
    UIColor *wineDregs = [UIColor colorWithRed:4.0f/10.0f green:19.0f/100.0f blue:28.0f/100.0f alpha:1.0f];
    [wineDregs setValue:[NSNumber numberWithFloat:4.0f/10.0f] forKey:@"redComponent"];
    [wineDregs setValue:[NSNumber numberWithFloat:19.0f/100.0f] forKey:@"greenComponent"];
    [wineDregs setValue:[NSNumber numberWithFloat:28.0f/100.0f] forKey:@"blueComponent"];
    return wineDregs;
}

+ (UIColor *)wisteria {
    UIColor *wisteria = [UIColor colorWithRed:79.0f/100.0f green:63.0f/100.0f blue:86.0f/100.0f alpha:1.0f];
    [wisteria setValue:[NSNumber numberWithFloat:79.0f/100.0f] forKey:@"redComponent"];
    [wisteria setValue:[NSNumber numberWithFloat:63.0f/100.0f] forKey:@"greenComponent"];
    [wisteria setValue:[NSNumber numberWithFloat:86.0f/100.0f] forKey:@"blueComponent"];
    return wisteria;
}

+ (UIColor *)woodBrown {
    UIColor *woodBrown = [UIColor colorWithRed:76.0f/100.0f green:6.0f/10.0f blue:42.0f/100.0f alpha:1.0f];
    [woodBrown setValue:[NSNumber numberWithFloat:76.0f/100.0f] forKey:@"redComponent"];
    [woodBrown setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"greenComponent"];
    [woodBrown setValue:[NSNumber numberWithFloat:42.0f/100.0f] forKey:@"blueComponent"];
    return woodBrown;
}

+ (UIColor *)xanadu {
    UIColor *xanadu = [UIColor colorWithRed:45.0f/100.0f green:53.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
    [xanadu setValue:[NSNumber numberWithFloat:45.0f/100.0f] forKey:@"redComponent"];
    [xanadu setValue:[NSNumber numberWithFloat:53.0f/100.0f] forKey:@"greenComponent"];
    [xanadu setValue:[NSNumber numberWithFloat:47.0f/100.0f] forKey:@"blueComponent"];
    return xanadu;
}

+ (UIColor *)yaleBlue {
    UIColor *yaleBlue = [UIColor colorWithRed:6.0f/100.0f green:3.0f/10.0f blue:57.0f/100.0f alpha:1.0f];
    [yaleBlue setValue:[NSNumber numberWithFloat:6.0f/100.0f] forKey:@"redComponent"];
    [yaleBlue setValue:[NSNumber numberWithFloat:3.0f/10.0f] forKey:@"greenComponent"];
    [yaleBlue setValue:[NSNumber numberWithFloat:57.0f/100.0f] forKey:@"blueComponent"];
    return yaleBlue;
}

+ (UIColor *)yankeesBlue {
    UIColor *yankeesBlue = [UIColor colorWithRed:11.0f/100.0f green:16.0f/100.0f blue:0.25f alpha:1.0f];
    [yankeesBlue setValue:[NSNumber numberWithFloat:11.0f/100.0f] forKey:@"redComponent"];
    [yankeesBlue setValue:[NSNumber numberWithFloat:16.0f/100.0f] forKey:@"greenComponent"];
    [yankeesBlue setValue:[NSNumber numberWithFloat:0.25f] forKey:@"blueComponent"];
    return yankeesBlue;
}

+ (UIColor *)yellow {
    UIColor *yellow = [UIColor colorWithRed:1.0f green:1.0f blue:0.0f alpha:1.0f];
    [yellow setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [yellow setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [yellow setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return yellow;
}

+ (UIColor *)yellowCrayola {
    UIColor *yellowCrayola = [UIColor colorWithRed:99.0f/100.0f green:91.0f/100.0f blue:51.0f/100.0f alpha:1.0f];
    [yellowCrayola setValue:[NSNumber numberWithFloat:99.0f/100.0f] forKey:@"redComponent"];
    [yellowCrayola setValue:[NSNumber numberWithFloat:91.0f/100.0f] forKey:@"greenComponent"];
    [yellowCrayola setValue:[NSNumber numberWithFloat:51.0f/100.0f] forKey:@"blueComponent"];
    return yellowCrayola;
}

+ (UIColor *)yellowMunsell {
    UIColor *yellowMunsell = [UIColor colorWithRed:94.0f/100.0f green:8.0f/10.0f blue:0.0f alpha:1.0f];
    [yellowMunsell setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"redComponent"];
    [yellowMunsell setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"greenComponent"];
    [yellowMunsell setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return yellowMunsell;
}

+ (UIColor *)yellowNCS {
    UIColor *yellowNCS = [UIColor colorWithRed:1.0f green:83.0f/100.0f blue:0.0f alpha:1.0f];
    [yellowNCS setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [yellowNCS setValue:[NSNumber numberWithFloat:83.0f/100.0f] forKey:@"greenComponent"];
    [yellowNCS setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return yellowNCS;
}

+ (UIColor *)yellowPantone {
    UIColor *yellowPantone = [UIColor colorWithRed:1.0f green:87.0f/100.0f blue:0.0f alpha:1.0f];
    [yellowPantone setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [yellowPantone setValue:[NSNumber numberWithFloat:87.0f/100.0f] forKey:@"greenComponent"];
    [yellowPantone setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return yellowPantone;
}

+ (UIColor *)yellowProcess {
    UIColor *yellowProcess = [UIColor colorWithRed:1.0f green:94.0f/100.0f blue:0.0f alpha:1.0f];
    [yellowProcess setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [yellowProcess setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"greenComponent"];
    [yellowProcess setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return yellowProcess;
}

+ (UIColor *)yellowRYB {
    UIColor *yellowRYB = [UIColor colorWithRed:1.0f green:1.0f blue:2.0f/10.0f alpha:1.0f];
    [yellowRYB setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [yellowRYB setValue:[NSNumber numberWithFloat:1.0f] forKey:@"greenComponent"];
    [yellowRYB setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"blueComponent"];
    return yellowRYB;
}

+ (UIColor *)yellowGreen {
    UIColor *yellowGreen = [UIColor colorWithRed:6.0f/10.0f green:8.0f/10.0f blue:2.0f/10.0f alpha:1.0f];
    [yellowGreen setValue:[NSNumber numberWithFloat:6.0f/10.0f] forKey:@"redComponent"];
    [yellowGreen setValue:[NSNumber numberWithFloat:8.0f/10.0f] forKey:@"greenComponent"];
    [yellowGreen setValue:[NSNumber numberWithFloat:2.0f/10.0f] forKey:@"blueComponent"];
    return yellowGreen;
}

+ (UIColor *)yellowOrange {
    UIColor *yellowOrange = [UIColor colorWithRed:1.0f green:68.0f/100.0f blue:26.0f/100.0f alpha:1.0f];
    [yellowOrange setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [yellowOrange setValue:[NSNumber numberWithFloat:68.0f/100.0f] forKey:@"greenComponent"];
    [yellowOrange setValue:[NSNumber numberWithFloat:26.0f/100.0f] forKey:@"blueComponent"];
    return yellowOrange;
}

+ (UIColor *)yellowRose {
    UIColor *yellowRose = [UIColor colorWithRed:1.0f green:94.0f/100.0f blue:0.0f alpha:1.0f];
    [yellowRose setValue:[NSNumber numberWithFloat:1.0f] forKey:@"redComponent"];
    [yellowRose setValue:[NSNumber numberWithFloat:94.0f/100.0f] forKey:@"greenComponent"];
    [yellowRose setValue:[NSNumber numberWithFloat:0.0f] forKey:@"blueComponent"];
    return yellowRose;
}

+ (UIColor *)zaffre {
    UIColor *zaffre = [UIColor colorWithRed:0.0f green:8.0f/100.0f blue:66.0f/100.0f alpha:1.0f];
    [zaffre setValue:[NSNumber numberWithFloat:0.0f] forKey:@"redComponent"];
    [zaffre setValue:[NSNumber numberWithFloat:8.0f/100.0f] forKey:@"greenComponent"];
    [zaffre setValue:[NSNumber numberWithFloat:66.0f/100.0f] forKey:@"blueComponent"];
    return zaffre;
}

+ (UIColor *)zinnwalditeBrown {
    UIColor *zinnwalditeBrown = [UIColor colorWithRed:0.1667f green:9.0f/100.0f blue:3.0f/100.0f alpha:1.0f];
    [zinnwalditeBrown setValue:[NSNumber numberWithFloat:0.1667f] forKey:@"redComponent"];
    [zinnwalditeBrown setValue:[NSNumber numberWithFloat:9.0f/100.0f] forKey:@"greenComponent"];
    [zinnwalditeBrown setValue:[NSNumber numberWithFloat:3.0f/100.0f] forKey:@"blueComponent"];
    return zinnwalditeBrown;
}

+ (UIColor *)zomp {
    UIColor *zomp = [UIColor colorWithRed:22.0f/100.0f green:65.0f/100.0f blue:56.0f/100.0f alpha:1.0f];
    [zomp setValue:[NSNumber numberWithFloat:22.0f/100.0f] forKey:@"redComponent"];
    [zomp setValue:[NSNumber numberWithFloat:65.0f/100.0f] forKey:@"greenComponent"];
    [zomp setValue:[NSNumber numberWithFloat:56.0f/100.0f] forKey:@"blueComponent"];
    return zomp;
}


// custom colors that I just happen to like

+ (UIColor *)parchment {
    return [UIColor colorWithRed:0.985f green:0.955f blue:0.905f alpha:1.0f];
}

+ (void)parseColors {
    NSLog(@"parseColors");
    // this is a string of colors comprised of Wikipedia's list of colors in three sections: A-F, G-M, N-Z
    NSString *string = @"Acid Green	#B0BF1A	69%	75%	10%	65°	76%	43%	86%	75%\n    Aero	#7CB9E8	49%	73%	91%	206°	70%	70%	47%	91%\n    Aero Blue	#C9FFE5	79%	100%	90%	151°	100%	89%	21%	100%\n    African Violet	#B284BE	70%	52%	75%	288°	31%	63%	31%	75%\n    Air Force Blue (RAF)	#5D8AA8	36%	54%	66%	204°	30%	51%	45%	66%\n    Air Force Blue (USAF)	#00308F	0%	19%	56%	220°	100%	28%	100%	56%\n    Air Superiority Blue	#72A0C1	45%	63%	76%	205°	39%	60%	41%	76%\n    Alabama Crimson	#AF002A	69%	0%	16%	346°	100%	34%	100%	69%\n    Alice Blue	#F0F8FF	94%	97%	100%	208°	100%	97%	6%	100%\n    Alizarin Crimson	#E32636	89%	15%	21%	355°	77%	52%	83%	89%\n    Alloy Orange	#C46210	77%	38%	6%	27°	85%	42%	92%	77%\n    Almond	#EFDECD	94%	87%	80%	30°	52%	87%	14%	94%\n    Amaranth	#E52B50	90%	17%	31%	348°	78%	53%	81%	90%\n    Amaranth Deep Purple	#AB274F	67%	15%	31%	342°	63%	41%	77%	67%\n    Amaranth Pink	#F19CBB	95%	61%	73%	338°	75%	78%	35%	95%\n    Amaranth Purple	#AB274F	67%	15%	31%	342°	63%	41%	77%	67%\n    Amaranth Red	#D3212D	83%	13%	18%	356°	73%	48%	84%	83%\n    Amazon	#3B7A57	23%	48%	34%	147°	35%	35%	52%	48%\n    Amber	#FFBF00	100%	75%	0%	45°	100%	50%	100%	100%\n    Amber (SAE/ECE)	#FF7E00	100%	49%	0%	30°	100%	50%	100%	100%\n    American Rose	#FF033E	100%	1%	24%	346°	100%	51%	99%	100%\n    Amethyst	#9966CC	60%	40%	80%	270°	50%	60%	50%	80%\n    Android Green	#A4C639	64%	78%	22%	74°	55%	50%	71%	78%\n    Anti-Flash White	#F2F3F4	95%	95%	96%	210°	8%	95%	1%	96%\n    Antique Brass	#CD9575	80%	58%	46%	22°	47%	63%	43%	80%\n    Antique Bronze	#665D1E	40%	36%	12%	53°	55%	26%	71%	40%\n    Antique Fuchsia	#915C83	57%	36%	51%	316°	22%	46%	37%	57%\n    Antique Ruby	#841B2D	52%	11%	18%	350°	66%	31%	80%	52%\n    Antique White	#FAEBD7	98%	92%	84%	34°	78%	91%	14%	98%\n    Ao (English)	#008000	0%	50%	0%	120°	100%	25%	100%	50%\n    Apple Green	#8DB600	55%	71%	0%	74°	100%	36%	100%	71%\n    Apricot	#FBCEB1	98%	81%	69%	24°	90%	84%	29%	98%\n    Aqua	#00FFFF	0%	100%	100%	180°	100%	50%	100%	100%\n    Aquamarine	#7FFFD4	50%	100%	83%	160°	100%	75%	50%	100%\n    Army Green	#4B5320	29%	33%	13%	69°	44%	23%	61%	33%\n    Arsenic	#3B444B	23%	27%	29%	206°	12%	26%	21%	29%\n    Artichoke	#8F9779	56%	59%	47%	76°	13%	53%	20%	59%\n    Arylide Yellow	#E9D66B	91%	84%	42%	51°	74%	67%	54%	91%\n    Ash Grey	#B2BEB5	70%	75%	71%	135°	8%	72%	6%	75%\n    Asparagus	#87A96B	53%	66%	42%	93°	26%	54%	37%	66%\n    Atomic Tangerine	#FF9966	100%	60%	40%	20°	100%	70%	60%	100%\n    Auburn	#A52A2A	65%	16%	16%	0°	59%	41%	75%	65%\n    Aureolin	#FDEE00	99%	93%	0%	56°	100%	50%	100%	99%\n    AuroMetalSaurus	#6E7F80	43%	50%	50%	183°	8%	47%	14%	50%\n    Avocado	#568203	34%	51%	1%	81°	95%	26%	98%	51%\n    Azure	#007FFF	0%	50%	100%	210°	100%	50%	100%	100%\n    Azure (Web Color)	#F0FFFF	94%	100%	100%	180°	100%	97%	6%	100%\n    Azure Mist	#F0FFFF	94%	100%	100%	180°	100%	97%	6%	100%\n    Azureish White	#DBE9F4	86%	91%	96%	206°	53%	91%	10%	96%\n    Baby Blue	#89CFF0	54%	81%	94%	199°	77%	74%	43%	94%\n    Baby Blue Eyes	#A1CAF1	63%	79%	95%	209°	74%	79%	33%	95%\n    Baby Pink	#F4C2C2	96%	76%	76%	0°	69%	86%	20%	96%\n    Baby Powder	#FEFEFA	100%	100%	98%	60°	67%	99%	2%	100%\n    Baker-Miller Pink	#FF91AF	100%	57%	69%	344°	100%	78%	43%	100%\n    Ball Blue	#21ABCD	13%	67%	80%	192°	72%	47%	84%	80%\n    Banana Mania	#FAE7B5	98%	91%	71%	43°	87%	85%	28%	98%\n    Banana Yellow	#FFE135	100%	88%	21%	51°	100%	60%	79%	100%\n    Bangladesh Green	#006A4E	0%	42%	31%	164°	100%	21%	100%	42%\n    Barbie Pink	#E0218A	88%	13%	54%	327°	75%	50%	85%	88%\n    Barn Red	#7C0A02	49%	4%	1%	4°	97%	25%	98%	49%\n    Battleship Grey	#848482	52%	52%	51%	60°	1%	51%	2%	52%\n    Bazaar	#98777B	60%	47%	48%	353°	14%	53%	22%	60%\n    Beau Blue	#BCD4E6	74%	83%	90%	206°	46%	82%	18%	90%\n    Beaver	#9F8170	62%	51%	44%	22°	20%	53%	30%	62%\n    Beige	#F5F5DC	96%	96%	86%	60°	56%	91%	10%	96%\n    B'dazzled Blue	#2E5894	18%	35%	58%	215°	53%	38%	69%	58%\n    Big Dip O’ruby	#9C2542	61%	15%	26%	345°	62%	38%	76%	61%\n    Bisque	#FFE4C4	100%	89%	77%	33°	100%	88%	23%	100%\n    Bistre	#3D2B1F	24%	17%	12%	24°	33%	18%	49%	24%\n    Bistre Brown	#967117	59%	44%	9%	43°	73%	34%	85%	59%\n    Bitter Lemon	#CAE00D	79%	88%	5%	66°	89%	46%	94%	88%\n    Bitter Lime	#BFFF00	75%	100%	0%	75°	100%	50%	100%	100%\n    Bittersweet	#FE6F5E	100%	44%	37%	6°	99%	68%	63%	100%\n    Bittersweet Shimmer	#BF4F51	75%	31%	32%	359°	47%	53%	59%	75%\n    Black	#000000	0%	0%	0%	—°	0%	0%	0%	0%\n    Black Bean	#3D0C02	24%	5%	1%	10°	94%	12%	97%	24%\n    Black Leather Jacket	#253529	15%	21%	16%	135°	18%	18%	30%	21%\n    Black Olive	#3B3C36	23%	24%	21%	70°	5%	22%	10%	24%\n    Blanched Almond	#FFEBCD	100%	92%	80%	36°	100%	90%	20%	100%\n    Blast-Off Bronze	#A57164	65%	44%	39%	12°	27%	52%	39%	65%\n    Bleu De France	#318CE7	19%	55%	91%	210°	79%	55%	79%	91%\n    Blizzard Blue	#ACE5EE	67%	90%	93%	188°	66%	80%	28%	93%\n    Blond	#FAF0BE	98%	94%	75%	50°	86%	86%	24%	98%\n    Blue	#0000FF	0%	0%	100%	240°	100%	50%	100%	100%\n    Blue (Crayola)	#1F75FE	12%	46%	100%	217°	99%	56%	88%	100%\n    Blue (Munsell)	#0093AF	0%	58%	69%	190°	100%	34%	100%	69%\n    Blue (NCS)	#0087BD	0%	53%	74%	197°	100%	37%	100%	74%\n    Blue (Pantone)	#0018A8	0%	9%	66%	231°	100%	33%	100%	66%\n    Blue (Pigment)	#333399	20%	20%	60%	240°	50%	40%	67%	60%\n    Blue (RYB)	#0247FE	1%	28%	100%	224°	99%	50%	99%	100%\n    Blue Bell	#A2A2D0	64%	64%	82%	240°	33%	73%	22%	82%\n    Blue-Gray	#6699CC	40%	60%	80%	210°	50%	60%	50%	80%\n    Blue-Green	#0D98BA	5%	60%	73%	192°	87%	39%	93%	73%\n    Blue Lagoon	#5E93A1	37%	58%	63%	193°	26%	50%	41%	63%\n    Blue-Magenta Violet	#553592	33%	21%	57%	261°	47%	39%	64%	57%\n    Blue Sapphire	#126180	7%	38%	50%	197°	75%	29%	86%	50%\n    Blue-Violet	#8A2BE2	54%	17%	89%	271°	76%	53%	81%	89%\n    Blue Yonder	#5072A7	31%	45%	65%	217°	35%	48%	52%	65%\n    Blueberry	#4F86F7	31%	53%	97%	220°	91%	64%	68%	97%\n    Bluebonnet	#1C1CF0	11%	11%	94%	240°	88%	53%	88%	94%\n    Blush	#DE5D83	87%	36%	51%	342°	66%	62%	58%	87%\n    Bole	#79443B	47%	27%	23%	9°	34%	35%	51%	47%\n    Bondi Blue	#0095B6	0%	58%	71%	191°	100%	36%	100%	71%\n    Bone	#E3DAC9	89%	85%	79%	39°	32%	84%	11%	89%\n    Boston University Red	#CC0000	80%	0%	0%	0°	100%	40%	100%	80%\n    Bottle Green	#006A4E	0%	42%	31%	164°	100%	21%	100%	42%\n    Boysenberry	#873260	53%	20%	38%	328°	46%	36%	63%	53%\n    Brandeis Blue	#0070FF	0%	44%	100%	214°	100%	50%	100%	100%\n    Brass	#B5A642	71%	65%	26%	52°	47%	48%	64%	71%\n    Brick Red	#CB4154	80%	25%	33%	352°	57%	53%	68%	80%\n    Bright Cerulean	#1DACD6	11%	67%	84%	194°	76%	48%	86%	84%\n    Bright Green	#66FF00	40%	100%	0%	96°	100%	50%	100%	100%\n    Bright Lavender	#BF94E4	75%	58%	89%	272°	60%	74%	35%	89%\n    Bright Lilac	#D891EF	85%	57%	94%	285°	75%	75%	39%	94%\n    Bright Maroon	#C32148	76%	13%	28%	346°	71%	45%	83%	76%\n    Bright Navy Blue	#1974D2	10%	45%	82%	210°	79%	46%	88%	82%\n    Bright Pink	#FF007F	100%	0%	50%	330°	100%	50%	100%	100%\n    Bright Turquoise	#08E8DE	3%	91%	87%	177°	93%	47%	97%	91%\n    Bright Ube	#D19FE8	82%	62%	91%	281°	61%	77%	31%	91%\n    Brilliant Azure	#3399FF	20%	60%	100%	210°	100%	60%	80%	100%\n    Brilliant Lavender	#F4BBFF	96%	73%	100%	290°	100%	87%	27%	100%\n    Brilliant Rose	#FF55A3	100%	33%	64%	332°	100%	67%	67%	100%\n    Brink Pink	#FB607F	98%	38%	50%	348°	95%	68%	62%	98%\n    British Racing Green	#004225	0%	26%	15%	154°	100%	13%	100%	26%\n    Bronze	#CD7F32	80%	50%	20%	30°	61%	50%	76%	80%\n    Bronze Yellow	#737000	45%	44%	0%	58°	100%	23%	100%	45%\n    Brown (Traditional)	#964B00	59%	29%	0%	30°	100%	29%	100%	59%\n    Brown (Web)	#A52A2A	65%	16%	16%	0°	59%	41%	75%	65%\n    Brown-Nose	#6B4423	42%	27%	14%	28°	51%	28%	67%	42%\n    Brown Yellow	#cc9966	80%	60%	40%	30°	50%	60%	50%	80%\n    Brunswick Green	#1B4D3E	11%	30%	24%	162°	48%	20%	65%	30%\n    Bubble Gum	#FFC1CC	100%	76%	80%	349°	100%	88%	24%	100%\n    Bubbles	#E7FEFF	91%	100%	100%	183°	100%	95%	9%	100%\n    Buff	#F0DC82	94%	86%	51%	49°	79%	73%	46%	94%\n    Bud Green	#7BB661	48%	71%	38%	102°	37%	55%	47%	71%\n    Bulgarian Rose	#480607	28%	2%	3%	359°	85%	15%	92%	28%\n    Burgundy	#800020	50%	0%	13%	345°	100%	25%	100%	50%\n    Burlywood	#DEB887	87%	72%	53%	34°	57%	70%	39%	87%\n    Burnt Orange	#CC5500	80%	33%	0%	25°	100%	40%	100%	80%\n    Burnt Sienna	#E97451	91%	45%	32%	14°	78%	62%	65%	91%\n    Burnt Umber	#8A3324	54%	20%	14%	9°	59%	34%	74%	54%\n    Byzantine	#BD33A4	74%	20%	64%	311°	58%	47%	73%	74%\n    Byzantium	#702963	44%	16%	39%	311°	46%	30%	63%	44%\n    Cadet	#536872	33%	41%	45%	199°	16%	39%	27%	45%\n    Cadet Blue	#5F9EA0	37%	62%	63%	182°	25%	50%	41%	63%\n    Cadet Grey	#91A3B0	57%	64%	69%	205°	16%	63%	18%	69%\n    Cadmium Green	#006B3C	0%	42%	24%	154°	100%	21%	100%	42%\n    Cadmium Orange	#ED872D	93%	53%	18%	28°	84%	55%	81%	93%\n    Cadmium Red	#E30022	89%	0%	13%	351°	100%	45%	100%	89%\n    Cadmium Yellow	#FFF600	100%	96%	0%	58°	100%	50%	100%	100%\n    Café Au Lait	#A67B5B	65%	48%	36%	26°	30%	50%	45%	65%\n    Café Noir	#4B3621	29%	21%	13%	30°	39%	21%	56%	29%\n    Cal Poly Green	#1E4D2B	12%	30%	17%	137°	44%	21%	61%	30%\n    Cambridge Blue	#A3C1AD	64%	76%	68%	140°	19%	70%	16%	76%\n    Camel	#C19A6B	76%	60%	42%	33°	41%	59%	45%	76%\n    Cameo Pink	#EFBBCC	94%	73%	80%	340°	62%	84%	22%	94%\n    Camouflage Green	#78866B	47%	53%	42%	91°	11%	47%	20%	53%\n    Canary Yellow	#FFEF00	100%	94%	0%	56°	100%	50%	100%	100%\n    Candy Apple Red	#FF0800	100%	3%	0%	2°	100%	50%	100%	100%\n    Candy Pink	#E4717A	89%	44%	48%	355°	68%	67%	50%	89%\n    Capri	#00BFFF	0%	75%	100%	195°	100%	50%	100%	100%\n    Caput Mortuum	#592720	35%	15%	13%	7°	47%	24%	64%	35%\n    Cardinal	#C41E3A	77%	12%	23%	350°	73%	44%	85%	77%\n    Caribbean Green	#00CC99	0%	80%	60%	165°	100%	40%	100%	80%\n    Carmine	#960018	59%	0%	9%	350°	100%	29%	100%	59%\n    Carmine (M&P)	#D70040	84%	0%	25%	342°	100%	42%	100%	84%\n    Carmine Pink	#EB4C42	92%	30%	26%	4°	81%	59%	72%	92%\n    Carmine Red	#FF0038	100%	0%	22%	347°	100%	50%	100%	100%\n    Carnation Pink	#FFA6C9	100%	65%	79%	336°	100%	83%	35%	100%\n    Carnelian	#B31B1B	70%	11%	11%	0°	74%	40%	85%	70%\n    Carolina Blue	#56A0D3	34%	63%	83%	204°	59%	58%	59%	83%\n    Carrot Orange	#ED9121	93%	57%	13%	33°	85%	53%	86%	93%\n    Castleton Green	#00563F	0%	34%	25%	164°	100%	17%	100%	34%\n    Catalina Blue	#062A78	2%	16%	47%	221°	90%	25%	95%	47%\n    Catawba	#703642	44%	21%	26%	348°	35%	33%	52%	44%\n    Cedar Chest	#C95A49	79%	35%	29%	8°	54%	54%	64%	79%\n    Ceil	#92A1CF	57%	63%	81%	225°	39%	69%	29%	81%\n    Celadon	#ACE1AF	67%	88%	69%	123°	47%	78%	24%	88%\n    Celadon Blue	#007BA7	0%	48%	65%	196°	100%	33%	100%	65%\n    Celadon Green	#2F847C	18%	52%	49%	174°	47%	35%	64%	52%\n    Celeste	#B2FFFF	70%	100%	100%	180°	100%	85%	30%	100%\n    Celestial Blue	#4997D0	29%	59%	82%	205°	59%	55%	65%	82%\n    Cerise	#DE3163	87%	19%	39%	343°	72%	53%	78%	87%\n    Cerise Pink	#EC3B83	93%	23%	51%	336°	82%	58%	75%	93%\n    Cerulean	#007BA7	0%	48%	65%	196°	100%	33%	100%	65%\n    Cerulean Blue	#2A52BE	16%	32%	75%	224°	64%	45%	78%	75%\n    Cerulean Frost	#6D9BC3	43%	61%	76%	208°	42%	60%	44%	76%\n    CG Blue	#007AA5	0%	48%	65%	196°	100%	32%	100%	65%\n    CG Red	#E03C31	88%	24%	19%	4°	74%	54%	78%	88%\n    Chamoisee	#A0785A	63%	47%	35%	26°	28%	49%	44%	63%\n    Champagne	#F7E7CE	97%	91%	81%	37°	72%	89%	17%	97%\n    Charcoal	#36454F	21%	27%	31%	204°	19%	26%	32%	31%\n    Charleston Green	#232B2B	14%	17%	17%	180°	10%	15%	19%	17%\n    Charm Pink	#E68FAC	90%	56%	67%	340°	64%	73%	38%	90%\n    Chartreuse (Traditional)	#DFFF00	87%	100%	0%	68°	100%	50%	100%	100%\n    Chartreuse (Web)	#7FFF00	50%	100%	0%	90°	100%	50%	100%	100%\n    Cherry	#DE3163	87%	19%	39%	343°	72%	53%	78%	87%\n    Cherry Blossom Pink	#FFB7C5	100%	72%	77%	348°	100%	86%	28%	100%\n    Chestnut	#954535	58%	27%	21%	10°	48%	40%	64%	58%\n    China Pink	#DE6FA1	87%	44%	63%	333°	63%	65%	50%	87%\n    China Rose	#A8516E	66%	32%	43%	340°	35%	49%	52%	66%\n    Chinese Red	#AA381E	67%	22%	12%	11°	70%	39%	82%	67%\n    Chinese Violet	#856088	52%	38%	53%	296°	17%	45%	29%	53%\n    Chocolate (Traditional)	#7B3F00	48%	25%	0%	31°	100%	24%	100%	48%\n    Chocolate (Web)	#D2691E	82%	41%	12%	25°	75%	47%	86%	82%\n    Chrome Yellow	#FFA700	100%	65%	0%	39°	100%	50%	100%	100%\n    Cinereous	#98817B	60%	51%	48%	12°	12%	54%	19%	60%\n    Cinnabar	#E34234	89%	26%	20%	5°	76%	55%	77%	89%\n    Cinnamon[Citation Needed]	#D2691E	82%	41%	12%	25°	75%	47%	86%	82%\n    Citrine	#E4D00A	89%	82%	4%	54°	92%	47%	96%	89%\n    Citron	#9FA91F	62%	66%	12%	64°	69%	39%	82%	66%\n    Claret	#7F1734	50%	9%	20%	343°	69%	29%	82%	50%\n    Classic Rose	#FBCCE7	98%	80%	91%	326°	85%	89%	19%	98%\n    Cobalt Blue	#0047AB	0%	28%	67%	215°	100%	34%	100%	67%\n    Cocoa Brown	#D2691E	82%	41%	12%	25°	75%	47%	86%	82%\n    Coconut	#965A3E	59%	35%	24%	19°	42%	42%	59%	59%\n    Coffee	#6F4E37	44%	31%	22%	25°	34%	33%	50%	44%\n    Columbia Blue	#C4D8E2	77%	85%	89%	200°	34%	83%	13%	89%\n    Congo Pink	#F88379	97%	51%	47%	5°	90%	72%	51%	97%\n    Cool Black	#002E63	0%	18%	39%	212°	100%	19%	100%	38%\n    Cool Grey	#8C92AC	55%	57%	67%	229°	16%	61%	19%	67%\n    Copper	#B87333	72%	45%	20%	29°	57%	46%	72%	72%\n    Copper (Crayola)	#DA8A67	85%	54%	40%	18°	61%	63%	53%	85%\n    Copper Penny	#AD6F69	68%	44%	41%	5°	29%	55%	39%	68%\n    Copper Red	#CB6D51	80%	43%	32%	14°	54%	56%	60%	80%\n    Copper Rose	#996666	60%	40%	40%	0°	20%	50%	33%	60%\n    Coquelicot	#FF3800	100%	22%	0%	13°	100%	50%	100%	100%\n    Coral	#FF7F50	100%	50%	31%	16°	100%	66%	69%	100%\n    Coral Pink	#F88379	97%	51%	47%	5°	90%	72%	51%	97%\n    Coral Red	#FF4040	100%	25%	25%	0°	100%	63%	75%	100%\n    Cordovan	#893F45	54%	25%	27%	355°	37%	39%	54%	54%\n    Corn	#FBEC5D	98%	93%	36%	54°	95%	67%	63%	98%\n    Cornell Red	#B31B1B	70%	11%	11%	0°	74%	40%	85%	70%\n    Cornflower Blue	#6495ED	39%	58%	93%	219°	79%	66%	58%	93%\n    Cornsilk	#FFF8DC	100%	97%	86%	48°	100%	93%	14%	100%\n    Cosmic Latte	#FFF8E7	100%	97%	91%	43°	100%	95%	9%	100%\n    Coyote Brown	#81613e	51%	38%	24%	62°	37%	37%	52%	51%\n    Cotton Candy	#FFBCD9	100%	74%	85%	334°	100%	87%	26%	100%\n    Cream	#FFFDD0	100%	99%	82%	57°	100%	91%	18%	100%\n    Crimson	#DC143C	86%	8%	24%	348°	83%	47%	91%	86%\n    Crimson Glory	#BE0032	75%	0%	20%	344°	100%	37%	100%	75%\n    Crimson Red	#990000	60%	0%	0%	0°	100%	30%	100%	60%\n    Cyan	#00FFFF	0%	100%	100%	180°	100%	50%	100%	100%\n    Cyan Azure	#4E82b4	31%	51%	71%	209°	41%	51%	57%	71%\n    Cyan-Blue Azure	#4682BF	27%	51%	75%	210°	49%	51%	63%	75%\n    Cyan Cobalt Blue	#28589C	16%	35%	61%	215°	59%	38%	74%	61%\n    Cyan Cornflower Blue	#188BC2	9%	55%	76%	199°	78%	43%	88%	76%\n    Cyan (Process)	#00B7EB	0%	72%	92%	193°	100%	46%	100%	92%\n    Cyber Grape	#58427C	35%	26%	49%	263°	31%	37%	47%	49%\n    Cyber Yellow	#FFD300	100%	83%	0%	50°	100%	50%	100%	100%\n    Daffodil	#FFFF31	100%	100%	19%	60°	100%	60%	81%	100%\n    Dandelion	#F0E130	94%	88%	19%	55°	86%	56%	80%	94%\n    Dark Blue	#00008B	0%	0%	55%	240°	100%	27%	100%	55%\n    Dark Blue-Gray	#666699	40%	40%	60%	240°	20%	50%	33%	60%\n    Dark Brown	#654321	40%	26%	13%	30°	51%	26%	67%	40%\n    Dark Brown-Tangelo	#88654E	53%	40%	31%	24°	27%	42%	43%	53%\n    Dark Byzantium	#5D3954	36%	22%	33%	315°	24%	29%	39%	36%\n    Dark Candy Apple Red	#A40000	64%	0%	0%	0°	100%	32%	100%	64%\n    Dark Cerulean	#08457E	3%	27%	49%	209°	88%	26%	94%	49%\n    Dark Chestnut	#986960	60%	41%	38%	10°	23%	49%	37%	60%\n    Dark Coral	#CD5B45	80%	36%	27%	10°	58%	54%	66%	80%\n    Dark Cyan	#008B8B	0%	55%	55%	180°	100%	27%	100%	55%\n    Dark Electric Blue	#536878	33%	41%	47%	206°	18%	40%	31%	47%\n    Dark Goldenrod	#B8860B	72%	53%	4%	43°	89%	38%	94%	72%\n    Dark Gray (X11)	#A9A9A9	66%	66%	66%	—°	0%	66%	0%	66%\n    Dark Green	#013220	0%	20%	13%	158°	96%	10%	98%	20%\n    Dark Green (X11)	#006400	0%	39%	0%	120°	100%	20%	100%	39%\n    Dark Imperial Blue	#00416A	0%	25%	42%	203°	100%	21%	100%	42%\n    Dark Imperial Blue	#6E6EF9	0%	8%	49%	183°	100%	25%	100%	40%\n    Dark Jungle Green	#1A2421	10%	14%	13%	162°	16%	12%	28%	14%\n    Dark Khaki	#BDB76B	74%	72%	42%	56°	38%	58%	43%	74%\n    Dark Lava	#483C32	28%	24%	20%	27°	18%	24%	31%	28%\n    Dark Lavender	#734F96	45%	31%	59%	270°	31%	45%	47%	59%\n    Dark Liver	#534B4F	33%	29%	31%	330°	5%	31%	10%	33%\n    Dark Liver (Horses)	#543D37	33%	24%	22%	12°	21%	27%	35%	33%\n    Dark Magenta	#8B008B	55%	0%	55%	300°	100%	27%	100%	55%\n    Dark Medium Gray	#A9A9A9	66%	66%	66%	—°	0%	66%	0%	66%\n    Dark Midnight Blue	#003366	0%	20%	40%	210°	100%	20%	100%	40%\n    Dark Moss Green	#4A5D23	29%	36%	14%	80°	45%	25%	62%	36%\n    Dark Olive Green	#556B2F	33%	42%	18%	82°	39%	30%	56%	42%\n    Dark Orange	#FF8C00	100%	55%	0%	33°	100%	50%	100%	100%\n    Dark Orchid	#9932CC	60%	20%	80%	280°	61%	50%	75%	80%\n    Dark Pastel Blue	#779ECB	47%	62%	80%	212°	45%	63%	41%	80%\n    Dark Pastel Green	#03C03C	1%	75%	24%	138°	97%	38%	98%	75%\n    Dark Pastel Purple	#966FD6	59%	44%	84%	263°	56%	64%	48%	84%\n    Dark Pastel Red	#C23B22	76%	23%	13%	9°	70%	45%	82%	76%\n    Dark Pink	#E75480	91%	33%	50%	342°	75%	62%	64%	91%\n    Dark Powder Blue	#003399	0%	20%	60%	220°	100%	30%	100%	60%\n    Dark Puce	#4F3A3C	31%	23%	24%	354°	15%	27%	27%	31%\n    Dark Purple	#301934	19%	10%	20%	291°	35%	15%	51%	20%\n    Dark Raspberry	#872657	53%	15%	34%	330°	56%	34%	72%	53%\n    Dark Red	#8B0000	55%	0%	0%	0°	100%	27%	100%	55%\n    Dark Salmon	#E9967A	91%	59%	48%	15°	72%	70%	48%	91%\n    Dark Scarlet	#560319	34%	1%	10%	344°	93%	17%	97%	34%\n    Dark Sea Green	#8FBC8F	56%	74%	56%	120°	25%	65%	24%	74%\n    Dark Sienna	#3C1414	24%	8%	8%	0°	50%	16%	67%	24%\n    Dark Sky Blue	#8CBED6	55%	75%	84%	199°	47%	69%	35%	84%\n    Dark Slate Blue	#483D8B	28%	24%	55%	248°	39%	39%	56%	55%\n    Dark Slate Gray	#2F4F4F	18%	31%	31%	180°	25%	25%	41%	31%\n    Dark Spring Green	#177245	9%	45%	27%	150°	66%	27%	80%	45%\n    Dark Tan	#918151	57%	51%	32%	45°	28%	44%	44%	57%\n    Dark Tangerine	#FFA812	100%	66%	7%	38°	100%	54%	93%	100%\n    Dark Taupe	#483C32	28%	24%	20%	27°	18%	24%	31%	28%\n    Dark Terra Cotta	#CC4E5C	80%	31%	36%	353°	55%	55%	62%	80%\n    Dark Turquoise	#00CED1	0%	81%	82%	181°	100%	41%	100%	82%\n    Dark Vanilla	#D1BEA8	82%	75%	66%	32°	31%	74%	20%	82%\n    Dark Violet	#9400D3	58%	0%	83%	282°	100%	41%	100%	83%\n    Dark Yellow	#9B870C	61%	53%	5%	52°	86%	33%	92%	61%\n    Dartmouth Green	#00703C	0%	44%	24%	152°	100%	22%	100%	44%\n    Davy's Grey	#555555	33%	33%	33%	—°	0%	33%	0%	33%\n    Debian Red	#D70A53	84%	4%	33%	339°	91%	44%	95%	84%\n    Deep Aquamarine	#40826D	25%	51%	43%	161°	34%	38%	51%	51%\n    Deep Carmine	#A9203E	66%	13%	24%	347°	68%	39%	81%	66%\n    Deep Carmine Pink	#EF3038	94%	19%	22%	357°	86%	56%	80%	94%\n    Deep Carrot Orange	#E9692C	91%	41%	17%	19°	81%	54%	81%	91%\n    Deep Cerise	#DA3287	85%	20%	53%	330°	69%	53%	77%	85%\n    Deep Champagne	#FAD6A5	98%	84%	65%	35°	90%	81%	34%	98%\n    Deep Chestnut	#B94E48	73%	31%	28%	3°	45%	50%	61%	73%\n    Deep Coffee	#704241	44%	26%	25%	1°	27%	35%	42%	44%\n    Deep Fuchsia	#C154C1	76%	33%	76%	300°	47%	54%	56%	76%\n    Deep Green	#056608	2%	40%	3%	122°	91%	21%	95%	40%\n    Deep Green-Cyan Turquoise	#0E7C61	5%	49%	38%	165°	80%	27%	89%	49%\n    Deep Jungle Green	#004B49	0%	29%	29%	178°	100%	15%	100%	29%\n    Deep Koamaru	#333366	20%	20%	40%	240°	33%	30%	50%	40%\n    Deep Lemon	#F5C71A	96%	78%	10%	47°	92%	53%	89%	96%\n    Deep Lilac	#9955BB	60%	33%	73%	280°	43%	53%	55%	73%\n    Deep Magenta	#CC00CC	80%	0%	80%	300°	100%	40%	100%	80%\n    Deep Maroon	#820000	51%	0%	0%	0°	100%	26%	100%	51%\n    Deep Mauve	#D473D4	83%	45%	83%	300°	53%	64%	46%	83%\n    Deep Moss Green	#355E3B	21%	37%	23%	129°	28%	29%	44%	37%\n    Deep Peach	#FFCBA4	100%	80%	64%	26°	100%	82%	36%	100%\n    Deep Pink	#FF1493	100%	8%	58%	328°	100%	54%	92%	100%\n    Deep Puce	#A95C68	66%	36%	41%	351°	31%	51%	46%	66%\n    Deep Red	#850101	52%	0%	0%	0°	99%	26%	99%	52%\n    Deep Ruby	#843F5B	52%	25%	36%	336°	35%	38%	52%	52%\n    Deep Saffron	#FF9933	100%	60%	20%	30°	100%	60%	80%	100%\n    Deep Sky Blue	#00BFFF	0%	75%	100%	195°	100%	50%	100%	100%\n    Deep Space Sparkle	#4A646C	29%	39%	42%	194°	19%	36%	31%	42%\n    Deep Spring Bud	#556B2F	33%	42%	18%	82°	39%	30%	56%	42%\n    Deep Taupe	#7E5E60	49%	37%	38%	356°	15%	43%	25%	49%\n    Deep Tuscan Red	#66424D	40%	26%	30%	342°	21%	33%	35%	40%\n    Deep Violet	#330066	20%	0%	40%	270°	100%	20%	100%	40%\n    Deer	#BA8759	73%	53%	35%	28°	41%	54%	52%	73%\n    Denim	#1560BD	8%	38%	74%	213°	80%	41%	89%	74%\n    Desaturated Cyan	#669999	40%	60%	60%	180°	20%	50%	33%	60%\n    Desert	#C19A6B	76%	60%	42%	33°	41%	59%	45%	76%\n    Desert Sand	#EDC9AF	93%	79%	69%	25°	63%	81%	26%	93%\n    Desire	#EA3C53	92%	24%	33%	352°	81%	58%	74%	92%\n    Diamond	#B9F2FF	73%	95%	100%	191°	100%	86%	27%	100%\n    Dim Gray	#696969	41%	41%	41%	—°	0%	41%	0%	41%\n    Dirt	#9B7653	61%	46%	33%	29°	30%	47%	46%	61%\n    Dodger Blue	#1E90FF	12%	56%	100%	210°	100%	56%	88%	100%\n    Dogwood Rose	#D71868	84%	9%	41%	335°	80%	47%	89%	84%\n    Dollar Bill	#85BB65	52%	73%	40%	98°	39%	56%	46%	73%\n    Donkey Brown	#664C28	40%	30%	16%	35°	44%	28%	61%	40%\n    Drab	#967117	59%	44%	9%	43°	73%	34%	85%	59%\n    Duke Blue	#00009C	0%	0%	61%	240°	100%	31%	100%	61%\n    Dust Storm	#E5CCC9	90%	80%	79%	6°	35%	84%	12%	90%\n    Dutch White	#EFDFBB	94%	87%	73%	42°	62%	84%	22%	94%\n    Earth Yellow	#E1A95F	88%	66%	37%	34°	68%	63%	58%	88%\nEbony	#555D50	33%	36%	31%	97°	8%	34%	14%	36%\nEcru	#C2B280	76%	70%	50%	45°	35%	63%	34%	76%\nEerie Black	#1B1B1B	11%	11%	11%	—°	0%	11%	0%	11%\nEggplant	#614051	38%	25%	32%	329°	20%	32%	34%	38%\nEggshell	#F0EAD6	94%	92%	84%	46°	46%	89%	11%	94%\nEgyptian Blue	#1034A6	6%	20%	65%	226°	82%	36%	90%	65%\nElectric Blue	#7DF9FF	49%	98%	100%	183°	100%	75%	51%	100%\nElectric Crimson	#FF003F	100%	0%	25%	345°	100%	50%	100%	100%\nElectric Cyan	#00FFFF	0%	100%	100%	180°	100%	50%	100%	100%\nElectric Green	#00FF00	0%	100%	0%	120°	100%	50%	100%	100%\nElectric Indigo	#6F00FF	44%	0%	100%	266°	100%	50%	100%	100%\nElectric Lavender	#F4BBFF	96%	73%	100%	290°	100%	87%	27%	100%\nElectric Lime	#CCFF00	80%	100%	0%	72°	100%	50%	100%	100%\nElectric Purple	#BF00FF	75%	0%	100%	285°	100%	50%	100%	100%\nElectric Ultramarine	#3F00FF	25%	0%	100%	255°	100%	50%	100%	100%\nElectric Violet	#8F00FF	56%	0%	100%	274°	100%	50%	100%	100%\nElectric Yellow	#FFFF33	100%	100%	20%	60°	100%	60%	80%	100%\nEmerald	#50C878	31%	78%	47%	140°	52%	55%	60%	78%\nEminence	#6C3082	42%	19%	51%	284°	46%	35%	63%	51%\nEnglish Green	#1B4D3E	11%	30%	24%	162°	48%	20%	65%	30%\nEnglish Lavender	#B48395	71%	51%	58%	338°	25%	61%	27%	71%\nEnglish Red	#AB4B52	67%	29%	32%	356°	39%	48%	56%	67%\nEnglish Violet	#563C5C	34%	24%	36%	289°	21%	30%	35%	36%\nEton Blue	#96C8A2	59%	78%	64%	134°	31%	69%	25%	78%\nEucalyptus	#44D7A8	27%	84%	66%	161°	65%	55%	68%	84%\nFallow	#C19A6B	76%	60%	42%	33°	41%	59%	45%	76%\nFalu Red	#801818	50%	9%	9%	0°	68%	30%	81%	50%\nFandango	#B53389	71%	20%	54%	320°	56%	45%	72%	71%\nFandango Pink	#DE5285	87%	32%	52%	338°	68%	60%	63%	87%\nFashion Fuchsia	#F400A1	96%	0%	63%	320°	100%	48%	100%	96%\nFawn	#E5AA70	90%	67%	44%	30°	69%	67%	51%	90%\nFeldgrau	#4D5D53	30%	36%	33%	143°	9%	33%	17%	36%\nFeldspar	#FDD5B1	99%	84%	69%	28°	95%	84%	30%	99%\nFern Green	#4F7942	31%	47%	26%	106°	29%	37%	45%	47%\nFerrari Red	#FF2800	100%	16%	0%	9°	100%	50%	100%	100%\nField Drab	#6C541E	42%	33%	12%	42°	57%	27%	72%	42%\nFirebrick	#B22222	70%	13%	13%	0°	68%	42%	81%	70%\nFire Engine Red	#CE2029	81%	13%	16%	357°	73%	47%	84%	81%\nFlame	#E25822	89%	35%	13%	17°	77%	51%	85%	89%\nFlamingo Pink	#FC8EAC	99%	56%	67%	344°	95%	77%	44%	99%\nFlattery	#6B4423	42%	27%	14%	28°	51%	28%	67%	42%\nFlavescent	#F7E98E	97%	91%	56%	52°	87%	76%	43%	97%\nFlax	#EEDC82	93%	86%	51%	50°	76%	72%	45%	93%\nFlirt	#A2006D	64%	0%	43%	320°	100%	32%	100%	64%\nFloral White	#FFFAF0	100%	98%	94%	40°	100%	97%	6%	100%\nFluorescent Orange	#FFBF00	100%	75%	0%	45°	100%	50%	100%	100%\nFluorescent Pink	#FF1493	100%	8%	58%	328°	100%	54%	92%	100%\nFluorescent Yellow	#CCFF00	80%	100%	0%	72°	100%	50%	100%	100%\nFolly	#FF004F	100%	0%	31%	341°	100%	50%	100%	100%\nForest Green (Traditional)	#014421	0%	27%	13%	149°	97%	14%	99%	27%\nForest Green (Web)	#228B22	13%	55%	13%	120°	61%	34%	76%	55%\nFrench Beige	#A67B5B	65%	48%	36%	26°	30%	50%	45%	65%\nFrench Bistre	#856D4D	52%	43%	30%	34°	27%	41%	42%	52%\nFrench Blue	#0072BB	0%	45%	73%	203°	100%	37%	100%	73%\nFrench Fuchsia	#FD3F92	99%	25%	57%	334°	98%	62%	75%	99%\nFrench Lilac	#86608E	53%	38%	56%	290°	19%	47%	32%	56%\nFrench Lime	#9EFD38	62%	99%	22%	89°	98%	61%	78%	99%\nFrench Mauve	#D473D4	83%	45%	83%	300°	53%	64%	46%	83%\nFrench Pink	#FD6C9E	99%	42%	62%	339°	97%	71%	57%	99%\nFrench Plum	#811453	51%	8%	33%	325°	73%	29%	84%	51%\nFrench Puce	#4E1609	31%	9%	4%	11°	79%	17%	88%	31%\nFrench Raspberry	#C72C48	78%	17%	28%	349°	64%	48%	78%	78%\nFrench Rose	#F64A8A	96%	29%	54%	338°	91%	63%	70%	96%\nFrench Sky Blue	#77B5FE	47%	71%	100%	212°	99%	73%	53%	100%\nFrench Violet	#8806CE	53%	2%	81%	279°	94%	42%	97%	81%\nFrench Wine	#AC1E44	67%	12%	27%	344°	70%	40%	83%	67%\nFresh Air	#A6E7FF	65%	91%	100%	196°	100%	83%	35%	100%\nFuchsia	#FF00FF	100%	0%	100%	300°	100%	50%	100%	100%\nFuchsia (Crayola)	#C154C1	76%	33%	76%	300°	47%	54%	56%	76%\nFuchsia Pink	#FF77FF	100%	47%	100%	300°	100%	73%	53%	100%\nFuchsia Purple	#CC397B	80%	22%	48%	333°	59%	51%	72%	80%\nFuchsia Rose	#C74375	78%	26%	46%	337°	54%	52%	66%	78%\nFulvous	#E48400	89%	52%	0%	35°	100%	45%	100%	89%\nFuzzy Wuzzy	#CC6666	80%	40%	40%	0°	50%	60%	50%	80%Gainsboro	#DCDCDC	86%	86%	86%	0°	0%	86%	0%	86%\nGamboge	#E49B0F	89%	61%	6%	39°	88%	48%	93%	89%\nGamboge Orange (Brown)	#996600	60%	40%	0%	40°	100%	30%	100%	60%\nGeneric Viridian	#007F66	0%	50%	40%	168°	100%	25%	100%	50%\nGhost White	#F8F8FF	97%	97%	100%	240°	100%	99%	3%	100%\nGiants Orange	#FE5A1D	100%	35%	11%	16°	99%	55%	89%	100%\nGrussrel	#B06500	69%	40%	0%	34°	100%	35%	100%	69%\nGlaucous	#6082B6	38%	51%	71%	216°	37%	55%	47%	71%\nGlitter	#E6E8FA	90%	91%	98%	234°	67%	94%	8%	98%\nGO Green	#00AB66	0%	67%	40%	156°	100%	34%	100%	67%\nGold (Metallic)	#D4AF37	83%	69%	22%	46°	65%	52%	74%	83%\nGold (Web) (Golden)	#FFD700	100%	84%	0%	51°	100%	50%	100%	100%\nGold Fusion	#85754E	52%	46%	31%	43°	26%	41%	41%	52%\nGolden Brown	#996515	60%	40%	8%	36°	76%	34%	86%	60%\nGolden Poppy	#FCC200	99%	76%	0%	46°	100%	49%	100%	99%\nGolden Yellow	#FFDF00	100%	87%	0%	52°	100%	50%	100%	100%\nGoldenrod	#DAA520	85%	65%	13%	43°	74%	49%	85%	85%\nGranny Smith Apple	#A8E4A0	66%	89%	63%	113°	56%	76%	30%	89%\nGrape	#6F2DA8	44%	18%	66%	272°	58%	42%	73%	66%\nGray	#808080	50%	50%	50%	0°	0%	50%	0%	50%\nGray (HTML/CSS Gray)	#808080	50%	50%	50%	0°	0%	50%	0%	50%\nGray (X11 Gray)	#BEBEBE	75%	75%	75%	0°	0%	75%	0%	75%\nGray-Asparagus	#465945	27%	35%	27%	117°	13%	31%	22%	35%\nGray-Blue	#8C92AC	55%	57%	67%	229°	16%	61%	19%	67%\nGreen (Color Wheel) (X11 Green)	#00FF00	0%	100%	0%	120°	100%	50%	100%	100%\nGreen (Crayola)	#1CAC78	11%	67%	47%	158°	72%	39%	84%	67%\nGreen (HTML/CSS Color)	#008000	0%	50%	0%	120°	100%	25%	100%	50%\nGreen (Munsell)	#00A877	0%	66%	47%	163°	100%	33%	100%	66%\nGreen (NCS)	#009F6B	0%	62%	42%	160°	100%	31%	100%	62%\nGreen (Pantone)	#00AD43	0%	68%	26%	143°	100%	34%	100%	68%\nGreen (Pigment)	#00A550	0%	65%	31%	149°	100%	32%	100%	65%\nGreen (RYB)	#66B032	40%	69%	20%	95°	56%	44%	72%	69%\nGreen-Blue	#1164B4	7%	39%	71%	209°	83%	39%	91%	71%\nGreen-Cyan	#009966	0%	60%	40%	160°	100%	30%	100%	60%\nGreen-Yellow	#ADFF2F	68%	100%	18%	84°	100%	59%	82%	100%\nGrizzly	#885818	53%	35%	9%	34°	70%	31%	82%	53%\nGrullo	#A99A86	66%	60%	53%	34°	17%	59%	21%	66%\nGuppie Green	#00FF7F	0%	100%	50%	150°	100%	50%	100%	100%\nHalayà Úbe	#663854	40%	22%	33%	323°	29%	31%	45%	40%\nHan Blue	#446CCF	27%	42%	81%	223°	59%	54%	67%	81%\nHan Purple	#5218FA	32%	9%	98%	255°	96%	54%	90%	98%\nHansa Yellow	#E9D66B	91%	84%	42%	51°	74%	67%	54%	91%\nHarlequin	#3FFF00	25%	100%	0%	105°	100%	50%	100%	100%\nHarlequin Green	#46CB18	27%	80%	9%	105°	79%	45%	88%	80%\nHarvard Crimson	#C90016	79%	0%	9%	353°	100%	39%	100%	79%\nHarvest Gold	#DA9100	85%	57%	0%	40°	100%	43%	100%	85%\nHeart Gold	#808000	50%	50%	0%	60°	100%	25%	100%	50%\nHeliotrope	#DF73FF	87%	45%	100%	286°	100%	73%	55%	100%\nHeliotrope Gray	#AA98A9	67%	60%	66%	303°	10%	63%	11%	67%\nHeliotrope Magenta	#AA00BB	67%	0%	73%	295°	100%	37%	100%	73%\nHollywood Cerise	#F400A1	96%	0%	63%	320°	100%	48%	100%	96%\nHoneydew	#F0FFF0	94%	100%	94%	120°	100%	97%	6%	100%\nHonolulu Blue	#006DB0	0%	43%	69%	203°	100%	35%	100%	69%\nHooker's Green	#49796B	29%	47%	42%	163°	25%	38%	40%	47%\nHot Magenta	#FF1DCE	100%	11%	81%	313°	100%	56%	89%	100%\nHot Pink	#FF69B4	100%	41%	71%	330°	100%	71%	59%	100%\nHunter Green	#355E3B	21%	37%	23%	129°	28%	29%	44%	37%\nIceberg	#71A6D2	44%	65%	82%	207°	52%	63%	46%	82%\nIcterine	#FCF75E	99%	97%	37%	58°	96%	68%	63%	99%\nIlluminating Emerald	#319177	19%	57%	47%	164°	49%	38%	66%	57%\nImperial	#602F6B	38%	18%	42%	289°	39%	30%	56%	42%\nImperial Blue	#002395	0%	14%	58%	226°	100%	29%	100%	58%\nImperial Purple	#66023C	40%	1%	24%	325°	96%	20%	98%	40%\nImperial Red	#ED2939	93%	16%	22%	355°	84%	55%	83%	93%\nInchworm	#B2EC5D	70%	93%	36%	84°	79%	65%	61%	93%\nIndependence	#4C516D	30%	32%	43%	231°	18%	36%	30%	43%\nIndia Green	#138808	7%	53%	3%	115°	89%	28%	94%	53%\nIndian Red	#CD5C5C	80%	36%	36%	0°	53%	58%	55%	80%\nIndian Yellow	#E3A857	89%	66%	34%	35°	71%	62%	62%	89%\nIndigo	#6F00FF	44%	0%	100%	266°	100%	50%	100%	100%\nIndigo Dye	#091F92	4%	12%	57%	230°	88%	30%	94%	57%\nIndigo (Web)	#4B0082	29%	0%	51%	275°	100%	25%	100%	51%\nInternational Klein Blue	#002FA7	0%	18%	65%	223°	100%	33%	100%	65%\nInternational Orange (Aerospace)	#FF4F00	100%	31%	0%	19°	100%	50%	100%	100%\nInternational Orange (Engineering)	#BA160C	73%	9%	5%	3°	88%	39%	94%	73%\nInternational Orange (Golden Gate Bridge)	#C0362C	75%	21%	17%	4°	63%	46%	77%	75%\nIris	#5A4FCF	35%	31%	81%	245°	57%	56%	62%	81%\nIrresistible	#B3446C	70%	27%	42%	338°	45%	48%	62%	70%\nIsabelline	#F4F0EC	96%	94%	93%	30°	27%	94%	3%	96%\nIslamic Green	#009000	0%	56%	0%	120°	100%	28%	100%	56%\nItalian Sky Blue	#B2FFFF	70%	100%	100%	180°	100%	85%	30%	100%\nIvory	#FFFFF0	100%	100%	94%	60°	100%	97%	6%	100%\nJade	#00A86B	0%	66%	42%	158°	100%	33%	100%	66%\nJapanese Carmine	#9D2933	62%	16%	20%	355°	59%	39%	74%	62%\nJapanese Indigo	#264348	15%	26%	28%	189°	31%	22%	47%	28%\nJapanese Violet	#5B3256	36%	20%	34%	307°	29%	28%	45%	36%\nJasmine	#F8DE7E	97%	87%	49%	47°	90%	73%	49%	97%\nJasper	#D73B3E	84%	23%	24%	359°	66%	54%	73%	84%\nJazzberry Jam	#A50B5E	65%	4%	37%	328°	88%	35%	93%	65%\nJelly Bean	#DA614E	85%	38%	31%	8°	65%	58%	64%	85%\nJet	#343434	20%	20%	20%	—°	0%	20%	0%	20%\nJonquil	#F4CA16	96%	79%	9%	49°	91%	52%	91%	96%\nJordy Blue	#8AB9F1	54%	73%	95%	213°	79%	74%	43%	95%\nJune Bud	#BDDA57	74%	85%	34%	73°	64%	60%	60%	85%\nJungle Green	#29AB87	16%	67%	53%	163°	61%	42%	76%	67%\nKelly Green	#4CBB17	30%	73%	9%	101°	78%	41%	88%	73%\nKenyan Copper	#7C1C05	49%	11%	2%	12°	92%	25%	96%	49%\nKeppel	#3AB09E	23%	69%	62%	171°	50%	46%	67%	69%\nJawad/Chicken Color (HTML/CSS) (Khaki)	#C3B091	76%	69%	57%	37°	29%	67%	26%	76%\nKhaki (X11) (Light Khaki)	#F0E68C	94%	90%	55%	54°	77%	75%	42%	94%\nKobe	#882D17	53%	18%	9%	12°	71%	31%	83%	53%\nKobi	#E79FC4	91%	62%	77%	329°	60%	76%	31%	91%\nKombu Green	#354230	21%	26%	19%	103°	16%	22%	27%	26%\nKU Crimson	#E8000D	91%	0%	5%	357°	100%	45%	100%	91%\nLa Salle Green	#087830	3%	47%	19%	141°	88%	25%	93%	47%\nLanguid Lavender	#D6CADD	84%	79%	87%	278°	22%	83%	9%	87%\nLapis Lazuli	#26619C	15%	38%	61%	210°	61%	38%	76%	61%\nLaser Lemon	#FFFF66	100%	100%	40%	60°	100%	70%	60%	100%\nLaurel Green	#A9BA9D	66%	73%	62%	95°	17%	67%	16%	73%\nLava	#CF1020	81%	6%	13%	355°	86%	44%	92%	81%\nLavender (Floral)	#B57EDC	71%	49%	86%	275°	57%	68%	43%	86%\nLavender (Web)	#E6E6FA	90%	90%	98%	240°	67%	94%	8%	98%\nLavender Blue	#CCCCFF	80%	80%	100%	240°	100%	90%	20%	100%\nLavender Blush	#FFF0F5	100%	94%	96%	340°	100%	97%	6%	100%\nLavender Gray	#C4C3D0	77%	76%	82%	245°	12%	79%	6%	82%\nLavender Indigo	#9457EB	58%	34%	92%	265°	79%	63%	63%	92%\nLavender Magenta	#EE82EE	93%	51%	93%	300°	76%	72%	45%	93%\nLavender Mist	#E6E6FA	90%	90%	98%	240°	67%	94%	8%	98%\nLavender Pink	#FBAED2	98%	68%	82%	332°	91%	83%	31%	98%\nLavender Purple	#967BB6	59%	48%	71%	267°	29%	60%	32%	71%\nLavender Rose	#FBA0E3	98%	63%	89%	316°	92%	81%	36%	98%\nLawn Green	#7CFC00	49%	99%	0%	90°	100%	49%	100%	99%\nLemon	#FFF700	100%	97%	0%	58°	100%	50%	100%	100%\nLemon Chiffon	#FFFACD	100%	98%	80%	54°	100%	90%	20%	100%\nLemon Curry	#CCA01D	80%	63%	11%	45°	75%	46%	86%	80%\nLemon Glacier	#FDFF00	99%	100%	0%	60°	100%	50%	100%	100%\nLemon Lime	#E3FF00	89%	100%	0%	67°	100%	50%	100%	100%\nLemon Meringue	#F6EABE	96%	92%	75%	47°	76%	85%	23%	96%\nLemon Yellow	#FFF44F	100%	96%	31%	56°	100%	65%	69%	100%\nLenurple	#BA93D8	73%	58%	85%	274°	47%	71%	32%	85%\nLicorice	#1A1110	10%	7%	6%	6°	24%	8%	38%	10%\nLiberty	#545AA7	33%	35%	65%	236°	33%	49%	50%	65%\nLight Apricot	#FDD5B1	99%	84%	69%	28°	95%	84%	30%	99%\nLight Blue	#ADD8E6	68%	85%	90%	195°	53%	79%	25%	90%\nLight Brilliant Red	#fe2e2e	100%	18%	18%	0°	99%	59%	82%	100%\nLight Brown	#B5651D	71%	40%	11%	28°	72%	41%	84%	71%\nLight Carmine Pink	#E66771	90%	40%	44%	355°	72%	65%	55%	90%\nLight Cobalt Blue	#88ACE0	53%	67%	88%	215°	59%	71%	39%	88%\nLight Coral	#F08080	94%	50%	50%	0°	79%	72%	47%	94%\nLight Cornflower Blue	#93CCEA	58%	80%	92%	201°	67%	75%	37%	92%\nLight Crimson	#F56991	96%	41%	57%	343°	88%	69%	57%	96%\nLight Cyan	#E0FFFF	88%	100%	100%	180°	100%	94%	12%	100%\nLight Deep Pink	#FF5CCD	100%	36%	80%	318°	100%	68%	64%	100%\nLight French Beige	#C8AD7F	78%	68%	50%	38°	40%	64%	37%	78%\nLight Fuchsia Pink	#F984EF	98%	52%	94%	305°	91%	75%	47%	98%\nLight Goldenrod Yellow	#FAFAD2	98%	98%	82%	60°	80%	90%	16%	98%\nLight Gray	#D3D3D3	83%	83%	83%	0°	0%	83%	0%	83%\nLight Grayish Magenta	#CC99CC	80%	60%	80%	300°	33%	70%	25%	80%\nLight Green	#90EE90	56%	93%	56%	120°	73%	75%	39%	93%\nLight Hot Pink	#FFB3DE	100%	70%	87%	326°	100%	85%	30%	100%\nLight Khaki	#F0E68C	94%	90%	55%	54°	77%	75%	42%	94%\nLight Medium Orchid	#D39BCB	83%	61%	80%	309°	39%	72%	27%	83%\nLight Moss Green	#ADDFAD	68%	87%	68%	120°	44%	78%	22%	87%\nLight Orchid	#E6A8D7	90%	66%	84%	315°	55%	78%	27%	90%\nLight Pastel Purple	#B19CD9	69%	61%	85%	261°	45%	73%	28%	85%\nLight Pink	#FFB6C1	100%	71%	76%	351°	100%	86%	29%	100%\nLight Red Ochre	#E97451	91%	45%	32%	14°	78%	62%	65%	91%\nLight Salmon	#FFA07A	100%	63%	48%	17°	100%	74%	52%	100%\nLight Salmon Pink	#FF9999	100%	60%	60%	0°	100%	80%	40%	100%\nLight Sea Green	#20B2AA	13%	70%	67%	177°	70%	41%	82%	70%\nLight Sky Blue	#87CEFA	53%	81%	98%	203°	92%	75%	46%	98%\nLight Slate Gray	#778899	47%	53%	60%	210°	14%	53%	22%	60%\nLight Steel Blue	#B0C4DE	69%	77%	87%	214°	41%	78%	21%	87%\nLight Taupe	#B38B6D	70%	55%	43%	26°	32%	56%	39%	70%\nLight Thulian Pink	#E68FAC	90%	56%	67%	340°	64%	73%	38%	90%\nLight Yellow	#FFFFE0	100%	100%	88%	60°	100%	94%	12%	100%\nLilac	#C8A2C8	78%	64%	78%	300°	26%	71%	19%	78%\nLime (Color Wheel)	#BFFF00	75%	100%	0%	75°	100%	50%	100%	100%\nLime (Web) (X11 Green)	#00FF00	0%	100%	0%	120°	100%	50%	100%	100%\nLime Green	#32CD32	20%	80%	20%	120°	61%	50%	76%	80%\nLimerick	#9DC209	62%	76%	4%	72°	91%	40%	95%	76%\nLincoln Green	#195905	10%	35%	2%	106°	89%	18%	94%	35%\nLinen	#FAF0E6	98%	94%	90%	30°	67%	94%	8%	98%\nLion	#C19A6B	76%	60%	42%	33°	41%	59%	45%	76%\nLiseran Purple	#DE6FA1	87%	44%	63%	333°	63%	65%	50%	87%\nLittle Boy Blue	#6CA0DC	42%	63%	86%	212°	62%	64%	51%	86%\nLiver	#674C47	40%	30%	28%	9°	18%	34%	31%	40%\nLiver (Dogs)	#B86D29	72%	43%	16%	29°	64%	44%	78%	72%\nLiver (Organ)	#6C2E1F	42%	18%	12%	12°	55%	27%	71%	42%\nLiver Chestnut	#987456	60%	45%	34%	27°	28%	47%	43%	60%\nLivid	#6699CC	40%	60%	80%	210°	50%	60%	50%	80%\nLumber	#FFE4CD	100%	89%	80%	28°	100%	90%	20%	100%\nLust	#E62020	90%	13%	13%	0°	80%	51%	86%	90%\nMagenta	#FF00FF	100%	0%	100%	300°	100%	50%	100%	100%\nMagenta (Crayola)	#FF55A3	100%	33%	64%	332°	100%	67%	67%	100%\nMagenta (Dye)	#CA1F7B	79%	12%	48%	328°	73%	46%	85%	79%\nMagenta (Pantone)	#D0417E	82%	25%	49%	334°	60%	54%	69%	82%\nMagenta (Process)	#FF0090	100%	0%	56%	326°	100%	50%	100%	100%\nMagenta Haze	#9F4576	62%	27%	46%	327°	39%	45%	57%	62%\nMagenta-Pink	#CC338B	80%	20%	55%	325°	60%	50%	75%	80%\nMagic Mint	#AAF0D1	67%	94%	82%	153°	70%	80%	29%	94%\nMagnolia	#F8F4FF	97%	96%	100%	262°	100%	98%	4%	100%\nMahogany	#C04000	75%	25%	0%	20°	100%	38%	100%	75%\nMaize	#FBEC5D	98%	93%	36%	54°	95%	67%	63%	98%\nMajorelle Blue	#6050DC	38%	31%	86%	247°	67%	59%	64%	86%\nMalachite	#0BDA51	4%	85%	32%	140°	90%	45%	95%	85%\nManatee	#979AAA	59%	60%	67%	231°	10%	63%	11%	67%\nMango Tango	#FF8243	100%	51%	26%	20°	100%	63%	74%	100%\nMantis	#74C365	45%	76%	40%	110°	44%	58%	48%	76%\nMardi Gras	#880085	53%	0%	52%	301°	100%	27%	100%	53%\nMarigold	#EAA221	92%	64%	13%	39°	83%	52%	85%	91%\nMaroon (Crayola)	#C32148	76%	13%	28%	346°	71%	45%	83%	76%\nMaroon (HTML/CSS)	#800000	50%	0%	0%	0°	100%	25%	100%	50%\nMaroon (X11)	#B03060	69%	19%	38%	338°	57%	44%	73%	69%\nMauve	#E0B0FF	88%	69%	100%	276°	100%	85%	31%	100%\nMauve Taupe	#915F6D	57%	37%	43%	343°	21%	47%	34%	57%\nMauvelous	#EF98AA	94%	60%	67%	348°	73%	77%	36%	94%\nMay Green	#4C9141	30%	57%	25%	112°	38%	41%	55%	57%\nMaya Blue	#73C2FB	45%	76%	98%	205°	94%	72%	54%	98%\nMeat Brown	#E5B73B	90%	72%	23%	44°	77%	56%	74%	90%\nMedium Aquamarine	#66DDAA	40%	87%	67%	154°	64%	63%	54%	87%\nMedium Blue	#0000CD	0%	0%	80%	240°	100%	40%	100%	80%\nMedium Candy Apple Red	#E2062C	89%	2%	17%	350°	95%	45%	97%	89%\nMedium Carmine	#AF4035	69%	25%	21%	5°	54%	45%	70%	69%\nMedium Champagne	#F3E5AB	95%	90%	67%	48°	75%	81%	30%	95%\nMedium Electric Blue	#035096	1%	31%	59%	209°	96%	30%	98%	59%\nMedium Jungle Green	#1C352D	11%	21%	18%	161°	31%	16%	47%	21%\nMedium Lavender Magenta	#DDA0DD	87%	63%	87%	300°	47%	75%	28%	87%\nMedium Orchid	#BA55D3	73%	33%	83%	288°	59%	58%	60%	83%\nMedium Persian Blue	#0067A5	0%	40%	65%	203°	100%	32%	100%	65%\nMedium Purple	#9370DB	58%	44%	86%	260°	60%	65%	49%	86%\nMedium Red-Violet	#BB3385	73%	20%	52%	324°	57%	47%	73%	73%\nMedium Ruby	#AA4069	67%	25%	41%	337°	45%	46%	62%	67%\nMedium Sea Green	#3CB371	24%	70%	44%	147°	50%	47%	66%	70%\nMedium Sky Blue	#80DAEB	50%	85%	92%	190°	73%	71%	46%	92%\nMedium Slate Blue	#7B68EE	48%	41%	93%	249°	80%	67%	56%	93%\nMedium Spring Bud	#C9DC87	79%	86%	53%	73°	55%	70%	39%	86%\nMedium Spring Green	#00FA9A	0%	98%	60%	157°	100%	49%	100%	98%\nMedium Taupe	#674C47	40%	30%	28%	9°	18%	34%	31%	40%\nMedium Turquoise	#48D1CC	28%	82%	80%	178°	60%	55%	66%	82%\nMedium Tuscan Red	#79443B	47%	27%	23%	9°	34%	35%	51%	47%\nMedium Vermilion	#D9603B	85%	38%	23%	14°	68%	54%	73%	85%\nMedium Violet-Red	#C71585	78%	8%	52%	322°	81%	43%	89%	78%\nMellow Apricot	#F8B878	97%	72%	47%	30°	90%	72%	52%	97%\nMellow Yellow	#F8DE7E	97%	87%	49%	47°	90%	73%	49%	97%\nMelon	#FDBCB4	99%	74%	71%	7°	95%	85%	29%	99%\nMetallic Seaweed	#0A7E8C	4%	49%	55%	186°	87%	29%	93%	55%\nMetallic Sunburst	#9C7C38	61%	49%	22%	41°	47%	42%	64%	61%\nMexican Pink	#E4007C	89%	0%	49%	327°	100%	45%	100%	89%\nMidnight Blue	#191970	10%	10%	44%	240°	64%	27%	78%	44%\nMidnight Green (Eagle Green)	#004953	0%	29%	33%	187°	100%	16%	100%	33%\nMikado Yellow	#FFC40C	100%	77%	5%	45°	100%	52%	95%	100%\nMindaro	#E3F988	89%	98%	53%	72°	90%	75%	45%	98%\nMing	#36747D	21%	45%	49%	188°	40%	35%	56%	49%\nMint	#3EB489	24%	71%	54%	158°	49%	47%	66%	71%\nMint Cream	#F5FFFA	96%	100%	98%	150°	100%	98%	4%	100%\nMint Green	#98FF98	60%	100%	60%	120°	100%	80%	40%	100%\nMisty Rose	#FFE4E1	100%	89%	88%	6°	100%	94%	12%	100%\nMoccasin	#FAEBD7	98%	92%	84%	34°	78%	91%	14%	98%\nMode Beige	#967117	59%	44%	9%	43°	73%	34%	85%	59%\nMoonstone Blue	#73A9C2	45%	66%	76%	199°	39%	61%	41%	76%\nMordant Red 19	#AE0C00	68%	5%	0%	4°	100%	34%	100%	68%\nMoss Green	#8A9A5B	54%	60%	36%	75°	26%	48%	41%	60%\nMountain Meadow	#30BA8F	19%	73%	56%	161°	59%	46%	74%	73%\nMountbatten Pink	#997A8D	60%	48%	55%	323°	13%	54%	20%	60%\nMSU Green	#18453B	9%	27%	23%	167°	48%	18%	65%	27%\nMughal Green	#306030	19%	38%	19%	120°	33%	28%	50%	38%\nMulberry	#C54B8C	77%	29%	55%	328°	51%	53%	62%	77%\nMustard	#FFDB58	100%	86%	35%	47°	100%	67%	65%	100%\nMyrtle Green	#317873	19%	47%	45%	176°	42%	33%	59%	47%\nNadeshiko Pink	#F6ADC6	96%	68%	78%	339°	80%	82%	30%	96%\nNapier Green	#2A8000	16%	50%	0%	100°	100%	25%	100%	50%\nNaples Yellow	#FADA5E	98%	85%	37%	48°	94%	67%	62%	98%\nNavajo White	#FFDEAD	100%	87%	68%	36°	100%	84%	32%	100%\nNavy	#000080	0%	0%	50%	240°	100%	25%	100%	50%\nNavy Purple	#9457EB	58%	34%	92%	265°	79%	63%	63%	92%\nNeon Carrot	#FFA343	100%	64%	26%	31°	100%	63%	74%	100%\nNeon Fuchsia	#FE4164	100%	25%	39%	349°	99%	63%	74%	100%\nNeon Green	#39FF14	22%	100%	8%	111°	100%	54%	92%	100%\nNew Car	#214FC6	13%	31%	78%	223°	71%	45%	83%	78%\nNew York Pink	#D7837F	84%	51%	50%	3°	52%	67%	41%	84%\nNon-Photo Blue	#A4DDED	64%	87%	93%	193°	67%	79%	31%	93%\nNorth Texas Green	#059033	2%	56%	20%	140°	93%	29%	97%	56%\nNyanza	#E9FFDB	91%	100%	86%	97°	100%	93%	14%	100%\nOcean Boat Blue	#0077BE	0%	47%	75%	202°	100%	37%	100%	75%\nOchre	#CC7722	80%	47%	13%	30°	71%	47%	83%	80%\nOffice Green	#008000	0%	50%	0%	120°	100%	25%	100%	50%\nOld Burgundy	#43302E	26%	19%	18%	6°	19%	22%	31%	26%\nOld Gold	#CFB53B	81%	71%	23%	49°	61%	52%	71%	81%\nOld Heliotrope	#563C5C	34%	24%	36%	289°	21%	30%	35%	36%\nOld Lace	#FDF5E6	99%	96%	90%	39°	85%	95%	9%	99%\nOld Lavender	#796878	47%	41%	47%	304°	8%	44%	14%	47%\nOld Mauve	#673147	40%	19%	28%	336°	36%	30%	52%	40%\nOld Moss Green	#867E36	53%	49%	21%	54°	43%	37%	60%	53%\nOld Rose	#C08081	75%	50%	51%	359°	34%	63%	33%	75%\nOld Silver	#848482	52%	52%	51%	60°	1%	51%	2%	52%\nOlive	#808000	50%	50%	0%	60°	100%	25%	100%	50%\nOlive Drab (#3)	#6B8E23	42%	56%	14%	80°	60%	35%	75%	56%\nOlive Drab #7	#3C341F	24%	20%	12%	43°	32%	18%	48%	24%\nOlivine	#9AB973	60%	73%	45%	87°	33%	59%	38%	73%\nOnyx	#353839	21%	22%	22%	195°	4%	22%	7%	22%\nOpera Mauve	#B784A7	72%	52%	65%	319°	26%	62%	28%	72%\nOrange (Color Wheel)	#FF7F00	100%	50%	0%	30°	100%	50%	100%	100%\nOrange (Crayola)	#FF7538	100%	46%	22%	18°	100%	61%	78%	100%\nOrange (Pantone)	#FF5800	100%	35%	0%	21°	100%	50%	100%	100%\nOrange (RYB)	#FB9902	98%	60%	1%	36°	98%	50%	99%	98%\nOrange (Web)	#FFA500	100%	65%	0%	39°	100%	50%	100%	100%\nOrange Peel	#FF9F00	100%	62%	0%	37°	100%	50%	100%	100%\nOrange-Red	#FF4500	100%	27%	0%	16°	100%	50%	100%	100%\nOrange-Yellow	#F8D568	97%	84%	41%	45°	91%	69%	58%	97%\nOrchid	#DA70D6	85%	44%	84%	302°	59%	65%	49%	85%\nOrchid Pink	#F2BDCD	95%	74%	80%	342°	67%	85%	22%	95%\nOrioles Orange	#FB4F14	98%	31%	8%	15°	97%	53%	92%	98%\nOtter Brown	#654321	40%	26%	13%	30°	51%	26%	67%	40%\nOuter Space	#414A4C	25%	29%	30%	191°	8%	28%	14%	30%\nOutrageous Orange	#FF6E4A	100%	43%	29%	12°	100%	65%	71%	100%\nOxford Blue	#002147	0%	13%	28%	212°	100%	14%	100%	28%\nOU Crimson Red	#990000	60%	0%	0%	0°	100%	30%	100%	60%\nPakistan Green	#006600	0%	40%	0%	120°	100%	20%	100%	40%\nPalatinate Blue	#273BE2	15%	23%	89%	234°	76%	52%	83%	89%\nPalatinate Purple	#682860	41%	16%	38%	308°	44%	28%	62%	41%\nPale Aqua	#BCD4E6	74%	83%	90%	206°	46%	82%	18%	90%\nPale Blue	#AFEEEE	69%	93%	93%	180°	65%	81%	26%	93%\nPale Brown	#987654	60%	46%	33%	30°	29%	46%	45%	60%\nPale Carmine	#AF4035	69%	25%	21%	5°	54%	45%	70%	69%\nPale Cerulean	#9BC4E2	61%	77%	89%	205°	55%	75%	31%	89%\nPale Chestnut	#DDADAF	87%	68%	69%	358°	41%	77%	22%	87%\nPale Copper	#DA8A67	85%	54%	40%	18°	61%	63%	53%	85%\nPale Cornflower Blue	#ABCDEF	67%	80%	94%	210°	68%	80%	28%	94%\nPale Cyan	#87D3F8	53%	83%	97%	200°	89%	75%	46%	97%\nPale Gold	#E6BE8A	90%	75%	54%	34°	65%	72%	40%	90%\nPale Goldenrod	#EEE8AA	93%	91%	67%	55°	67%	80%	29%	93%\nPale Green	#98FB98	60%	98%	60%	120°	93%	79%	39%	98%\nPale Lavender	#DCD0FF	86%	82%	100%	255°	100%	91%	18%	100%\nPale Magenta	#F984E5	98%	52%	90%	310°	91%	75%	47%	98%\nPale Magenta-Pink	#ff99cc	100%	60%	80%	330°	100%	80%	40%	100%\nPale Pink	#FADADD	98%	85%	87%	354°	76%	92%	13%	98%\nPale Plum	#DDA0DD	87%	63%	87%	300°	47%	75%	28%	87%\nPale Red-Violet	#DB7093	86%	44%	58%	340°	60%	65%	49%	86%\nPale Robin Egg Blue	#96DED1	59%	87%	82%	169°	52%	73%	32%	87%\nPale Silver	#C9C0BB	79%	75%	73%	21°	11%	76%	7%	79%\nPale Spring Bud	#ECEBBD	93%	92%	74%	59°	55%	83%	20%	93%\nPale Taupe	#BC987E	74%	60%	49%	25°	32%	62%	33%	74%\nPale Turquoise	#AFEEEE	69%	93%	93%	180°	65%	81%	26%	93%\nPale Violet	#CC99FF	80%	60%	100%	270°	100%	80%	40%	100%\nPale Violet-Red	#DB7093	86%	44%	58%	340°	60%	65%	49%	86%\nPansy Purple	#78184A	47%	9%	29%	329°	67%	28%	80%	47%\nPaolo Veronese Green	#009B7D	0%	61%	49%	168°	100%	30%	100%	61%\nPapaya Whip	#FFEFD5	100%	94%	84%	37°	100%	92%	16%	100%\nParadise Pink	#E63E62	90%	24%	38%	347°	77%	57%	73%	90%\nParis Green	#50C878	31%	78%	47%	140°	52%	55%	60%	78%\nPastel Blue	#AEC6CF	68%	78%	81%	196°	26%	75%	16%	81%\nPastel Brown	#836953	51%	41%	33%	28°	22%	42%	37%	51%\nPastel Gray	#CFCFC4	81%	81%	77%	60°	10%	79%	5%	81%\nPastel Green	#77DD77	47%	87%	47%	120°	60%	67%	46%	87%\nPastel Magenta	#F49AC2	96%	60%	76%	333°	80%	78%	37%	96%\nPastel Orange	#FFB347	100%	70%	28%	35°	100%	64%	72%	100%\nPastel Pink	#DEA5A4	87%	65%	64%	1°	47%	76%	26%	87%\nPastel Purple	#B39EB5	70%	62%	71%	295°	13%	66%	13%	71%\nPastel Red	#FF6961	100%	41%	38%	3°	100%	69%	62%	100%\nPastel Violet	#CB99C9	80%	60%	79%	302°	32%	70%	25%	80%\nPastel Yellow	#FDFD96	99%	99%	59%	60°	96%	79%	41%	99%\nPatriarch	#800080	50%	0%	50%	300°	100%	25%	100%	50%\nPayne's Grey	#536878	33%	41%	47%	206°	18%	40%	31%	47%\nPeach	#FFE5B4	100%	90%	71%	39°	100%	85%	29%	100%\nPeach	#FFCBA4	100%	80%	64%	26°	100%	82%	36%	100%\nPeach-Orange	#FFCC99	100%	80%	60%	30°	100%	80%	40%	100%\nPeach Puff	#FFDAB9	100%	85%	73%	28°	100%	86%	27%	100%\nPeach-Yellow	#FADFAD	98%	87%	68%	39°	89%	83%	31%	98%\nPear	#D1E231	82%	89%	19%	66°	75%	54%	78%	89%\nPearl	#EAE0C8	92%	88%	78%	42°	45%	85%	15%	92%\nPearl Aqua	#88D8C0	53%	85%	75%	162°	51%	69%	37%	85%\nPearly Purple	#B768A2	72%	41%	64%	316°	35%	56%	43%	72%\nPeridot	#E6E200	90%	89%	0%	59°	100%	45%	100%	90%\nPeriwinkle	#CCCCFF	80%	80%	100%	240°	100%	90%	20%	100%\nPersian Blue	#1C39BB	11%	22%	73%	229°	74%	42%	85%	73%\nPersian Green	#00A693	0%	65%	58%	173°	100%	33%	100%	65%\nPersian Indigo	#32127A	20%	7%	48%	258°	74%	27%	85%	48%\nPersian Orange	#D99058	85%	56%	35%	26°	63%	60%	59%	85%\nPersian Pink	#F77FBE	97%	50%	75%	329°	88%	73%	49%	97%\nPersian Plum	#701C1C	44%	11%	11%	0°	60%	27%	75%	44%\nPersian Red	#CC3333	80%	20%	20%	0°	60%	50%	75%	80%\nPersian Rose	#FE28A2	100%	16%	64%	326°	99%	58%	84%	100%\nPersimmon	#EC5800	93%	35%	0%	22°	100%	46%	100%	93%\nPeru	#CD853F	80%	52%	25%	30°	59%	53%	69%	80%\nPhlox	#DF00FF	87%	0%	100%	292°	100%	50%	100%	100%\nPhthalo Blue	#000F89	0%	6%	54%	233°	100%	27%	100%	54%\nPhthalo Green	#123524	7%	21%	14%	151°	49%	14%	66%	21%\nPicton Blue	#45B1E8	27%	69%	91%	200°	78%	59%	70%	91%\nPictorial Carmine	#C30B4E	76%	4%	31%	338°	89%	40%	94%	76%\nPiggy Pink	#FDDDE6	99%	87%	90%	343°	89%	93%	13%	99%\nPine Green	#01796F	0%	47%	44%	175°	98%	24%	99%	47%\nPineapple	#563C5C	34%	24%	5%	289°	74%	19%	35%	36%\nPink	#FFC0CB	100%	75%	80%	350°	100%	88%	25%	100%\nPink (Pantone)	#D74894	84%	28%	58%	328°	64%	56%	67%	84%\nPink Lace	#FFDDF4	100%	87%	96%	319°	100%	93%	13%	100%\nPink Lavender	#D8B2D1	85%	70%	82%	311°	33%	77%	18%	85%\nPink-Orange	#FF9966	100%	60%	40%	20°	100%	70%	60%	100%\nPink Pearl	#E7ACCF	91%	67%	81%	324°	55%	79%	26%	91%\nPink Raspberry	#980036	60%	0%	21%	339°	100%	30%	100%	60%\nPink Sherbet	#F78FA7	97%	56%	65%	346°	87%	76%	42%	97%\nPistachio	#93C572	58%	77%	45%	96°	42%	61%	42%	77%\nPlatinum	#E5E4E2	90%	89%	89%	40°	5%	89%	1%	90%\nPlum	#8E4585	56%	27%	52%	307°	35%	41%	51%	56%\nPlum (Web)	#DDA0DD	87%	63%	87%	300°	47%	75%	28%	87%\nPomp And Power	#86608E	53%	38%	56%	290°	19%	47%	32%	56%\nPopstar	#BE4F62	75%	31%	38%	350°	46%	53%	58%	75%\nPortland Orange	#FF5A36	100%	35%	21%	11°	100%	61%	79%	100%\nPowder Blue	#B0E0E6	69%	88%	90%	187°	52%	80%	23%	90%\nPrinceton Orange	#F58025	96%	50%	15%	26°	91%	55%	85%	96%\nPrune	#701C1C	44%	11%	11%	0°	60%	27%	75%	44%\nPrussian Blue	#003153	0%	19%	33%	205°	100%	16%	100%	33%\nPsychedelic Purple	#DF00FF	87%	0%	100%	292°	100%	50%	100%	100%\nPuce	#CC8899	80%	53%	60%	345°	40%	67%	33%	80%\nPuce Red	#722F37	45%	18%	22%	353°	42%	32%	59%	45%\nPullman Brown (UPS Brown)	#644117	39%	25%	9%	33°	63%	24%	77%	39%\nPullman Green	#3B331C	23%	20%	11%	45°	36%	17%	36%	59%\nPumpkin	#FF7518	100%	46%	9%	24°	100%	55%	91%	100%\nPurple (HTML)	#800080	50%	0%	50%	300°	100%	25%	100%	50%\nPurple (Munsell)	#9F00C5	62%	0%	77%	288°	100%	39%	100%	77%\nPurple (X11)	#A020F0	63%	13%	94%	277°	87%	53%	87%	94%\nPurple Heart	#69359C	41%	21%	61%	270°	49%	41%	66%	61%\nPurple Mountain Majesty	#9678B6	59%	47%	71%	269°	30%	59%	34%	71%\nPurple Navy	#4E5180	31%	32%	50%	236°	24%	40%	39%	50%\nPurple Pizzazz	#FE4EDA	100%	31%	85%	312°	99%	65%	69%	100%\nPurple Taupe	#50404D	31%	25%	30%	311°	11%	28%	20%	31%\nPurpureus	#9A4EAE	60%	31%	68%	288°	38%	49%	55%	68%\nQuartz	#51484F	32%	28%	31%	313°	6%	30%	11%	32%\nQueen Blue	#436B95	26%	42%	58%	211°	38%	42%	55%	58%\nQueen Pink	#E8CCD7	91%	80%	84%	336°	38%	85%	12%	91%\nQuinacridone Magenta	#8E3A59	56%	23%	35%	338°	42%	39%	59%	56%\nRackley	#5D8AA8	36%	54%	66%	204°	30%	51%	45%	66%\nRadical Red	#FF355E	100%	21%	37%	348°	100%	60%	79%	100%\nRajah	#FBAB60	98%	67%	38%	29°	95%	68%	62%	98%\nRaspberry	#E30B5D	89%	4%	36%	337°	91%	47%	95%	89%\nRaspberry Glace	#915F6D	57%	37%	43%	343°	21%	47%	34%	57%\nRaspberry Pink	#E25098	89%	31%	60%	330°	72%	60%	65%	89%\nRaspberry Rose	#B3446C	70%	27%	42%	338°	45%	48%	62%	70%\nRaw Umber	#826644	51%	40%	27%	33°	31%	39%	48%	51%\nRazzle Dazzle Rose	#FF33CC	100%	20%	80%	315°	100%	60%	80%	100%\nRazzmatazz	#E3256B	89%	15%	42%	338°	77%	52%	84%	89%\nRazzmic Berry	#8D4E85	55%	31%	52%	308°	29%	43%	45%	55%\nRebecca Purple	#663399	40%	20%	60%	270°	49%	40%	67%	60%\nRed	#FF0000	100%	0%	0%	0°	100%	50%	100%	100%\nRed (Crayola)	#EE204D	93%	13%	30%	347°	86%	53%	87%	93%\nRed (Munsell)	#F2003C	95%	0%	24%	345°	100%	47%	100%	95%\nRed (NCS)	#C40233	77%	1%	20%	345°	98%	39%	99%	77%\nRed (Pantone)	#ED2939	93%	16%	22%	355°	84%	55%	83%	93%\nRed (Pigment)	#ED1C24	93%	11%	14%	358°	85%	52%	88%	93%\nRed (RYB)	#FE2712	100%	15%	7%	5°	99%	53%	93%	100%\nRed-Brown	#A52A2A	65%	16%	16%	0°	59%	41%	75%	65%\nRed Devil	#860111	53%	0%	7%	353°	99%	26%	99%	53%\nRed-Orange	#FF5349	100%	33%	29%	3°	100%	64%	71%	100%\nRed-Purple	#E40078	89%	0%	47%	328°	100%	45%	100%	89%\nRed-Violet	#C71585	78%	8%	52%	322°	81%	43%	89%	78%\nRedwood	#A45A52	64%	35%	32%	6°	33%	48%	50%	64%\nRegalia	#522D80	32%	18%	50%	267°	48%	34%	65%	50%\nRegistration Black	#000000	0%	0%	0%	—°	0%	0%	0%	0%\nResolution Blue	#002387	0%	14%	53%	224°	100%	26%	100%	53%\nRhythm	#777696	47%	46%	59%	242°	13%	53%	21%	59%\nRich Black	#004040	0%	25%	25%	180°	100%	13%	100%	25%\nRich Black (FOGRA29)	#010B13	0%	4%	7%	207°	90%	4%	95%	8%\nRich Black (FOGRA39)	#010203	0%	1%	1%	210°	50%	1%	67%	1%\nRich Brilliant Lavender	#F1A7FE	95%	65%	100%	291°	98%	83%	34%	100%\nRich Carmine	#D70040	84%	0%	25%	342°	100%	42%	100%	84%\nRich Electric Blue	#0892D0	3%	57%	82%	199°	93%	42%	96%	82%\nRich Lavender	#A76BCF	65%	42%	81%	276°	51%	62%	48%	81%\nRich Lilac	#B666D2	71%	40%	82%	284°	55%	61%	51%	82%\nRich Maroon	#B03060	69%	19%	38%	338°	57%	44%	73%	69%\nRifle Green	#444C38	27%	30%	22%	84°	15%	26%	26%	30%\nRoast Coffee	#704241	44%	26%	25%	1°	27%	35%	42%	44%\nRobin Egg Blue	#00CCCC	0%	80%	80%	180°	100%	40%	100%	80%\nRocket Metallic	#8A7F80	54%	50%	50%	355°	4%	52%	8%	54%\nRoman Silver	#838996	51%	54%	59%	221°	8%	55%	13%	59%\nRose	#FF007F	100%	0%	50%	330°	100%	50%	100%	100%\nRose Bonbon	#F9429E	98%	26%	62%	330°	94%	62%	73%	98%\nRose Ebony	#674846	40%	28%	27%	4°	19%	34%	32%	40%\nRose Gold	#B76E79	72%	43%	47%	351°	34%	57%	40%	72%\nRose Madder	#E32636	89%	15%	21%	355°	77%	52%	83%	89%\nRose Pink	#FF66CC	100%	40%	80%	320°	100%	70%	60%	100%\nRose Quartz	#AA98A9	67%	60%	66%	303°	10%	63%	11%	67%\nRose Red	#C21E56	76%	12%	34%	340°	73%	44%	85%	76%\nRose Taupe	#905D5D	56%	36%	36%	0°	22%	46%	35%	56%\nRose Vale	#AB4E52	67%	31%	32%	357°	37%	49%	54%	67%\nRosewood	#65000B	40%	0%	4%	353°	100%	20%	100%	40%\nRosso Corsa	#D40000	83%	0%	0%	0°	100%	42%	100%	83%\nRosy Brown	#BC8F8F	74%	56%	56%	0°	25%	65%	24%	74%\nRoyal Azure	#0038A8	0%	22%	66%	220°	100%	33%	100%	66%\nRoyal Blue	#002366	0%	14%	40%	219°	100%	20%	100%	40%\nRoyal Blue	#4169E1	25%	41%	88%	225°	73%	57%	71%	88%\nRoyal Fuchsia	#CA2C92	79%	17%	57%	321°	64%	48%	78%	79%\nRoyal Purple	#7851A9	47%	32%	66%	267°	35%	49%	52%	66%\nRoyal Yellow	#FADA5E	98%	85%	37%	48°	94%	67%	62%	98%\nRuber	#CE4676	81%	27%	46%	339°	58%	54%	66%	81%\nRubine Red	#D10056	82%	0%	34%	335°	100%	41%	100%	82%\nRuby	#E0115F	88%	7%	37%	337°	86%	47%	92%	88%\nRuby Red	#9B111E	61%	7%	12%	354°	80%	34%	89%	61%\nRuddy	#FF0028	100%	0%	16%	351°	100%	50%	100%	100%\nRuddy Brown	#BB6528	73%	40%	16%	25°	65%	45%	79%	73%\nRuddy Pink	#E18E96	88%	56%	59%	354°	58%	72%	37%	88%\nRufous	#A81C07	66%	11%	3%	8°	92%	34%	96%	66%\nRusset	#80461B	50%	27%	11%	26°	65%	30%	79%	50%\nRussian Green	#679267	40%	57%	40%	120°	17%	49%	29%	57%\nRussian Violet	#32174D	20%	9%	30%	270°	54%	20%	70%	30%\nRust	#B7410E	72%	25%	5%	18°	86%	39%	92%	72%\nRusty Red	#DA2C43	85%	17%	26%	352°	70%	51%	80%	85%\nSacramento State Green	#00563F	0%	34%	25%	164°	100%	17%	100%	34%\nSaddle Brown	#8B4513	55%	27%	7%	25°	76%	31%	86%	55%\nSafety Orange	#FF7800	100%	47%	0%	28°	100%	50%	100%	100%\nSafety Orange (Blaze Orange)	#FF6700	100%	40%	0%	24°	100%	50%	100%	100%\nSafety Yellow	#EED202	93%	82%	1%	53°	98%	47%	99%	93%\nSaffron	#F4C430	96%	77%	19%	45°	90%	57%	80%	96%\nSage	#BCB88A	74%	72%	54%	55°	27%	64%	27%	74%\nSt. Patrick's Blue	#23297A	14%	16%	48%	236°	55%	31%	71%	48%\nSalmon	#FA8072	98%	50%	45%	6°	93%	71%	54%	98%\nSalmon Pink	#FF91A4	100%	57%	64%	350°	100%	78%	43%	100%\nSand	#C2B280	76%	70%	50%	45°	35%	63%	34%	76%\nSand Dune	#967117	59%	44%	9%	43°	73%	34%	85%	59%\nSandstorm	#ECD540	93%	84%	25%	52°	82%	59%	73%	93%\nSandy Brown	#F4A460	96%	64%	38%	28°	87%	67%	61%	96%\nSandy Taupe	#967117	59%	44%	9%	43°	73%	34%	85%	59%\nSangria	#92000A	57%	0%	4%	356°	100%	29%	100%	57%\nSap Green	#507D2A	31%	49%	16%	93°	50%	33%	66%	49%\nSapphire	#0F52BA	6%	32%	73%	216°	85%	39%	92%	73%\nSapphire Blue	#0067A5	0%	40%	65%	203°	100%	32%	100%	65%\nSatin Sheen Gold	#CBA135	80%	63%	21%	43°	59%	50%	74%	80%\nScarlet	#FF2400	100%	14%	0%	8°	100%	50%	100%	100%\nScarlet	#FD0E35	99%	5%	21%	350°	98%	52%	94%	99%\nSchauss Pink	#FF91AF	100%	57%	69%	344°	100%	78%	43%	100%\nSchool Bus Yellow	#FFD800	100%	85%	0%	51°	100%	50%	100%	100%\nScreamin' Green	#76FF7A	46%	100%	48%	122°	100%	73%	54%	100%\nSea Blue	#006994	0%	41%	58%	197°	100%	29%	100%	58%\nSea Green	#2E8B57	18%	55%	34%	146°	50%	36%	67%	55%\nSeal Brown	#59260B	20%	8%	8%	0°	43%	14%	60%	20%\nSeashell	#FFF5EE	100%	96%	93%	25°	100%	97%	7%	100%\nSelective Yellow	#FFBA00	100%	73%	0%	44°	100%	50%	100%	100%\nSepia	#704214	44%	26%	8%	30°	70%	26%	82%	44%\nShadow	#8A795D	54%	47%	36%	37°	19%	45%	33%	54%\nShadow Blue	#778BA5	47%	55%	65%	214°	20%	56%	28%	65%\nShampoo	#FFCFF1	100%	81%	95%	318°	100%	91%	19%	100%\nShamrock Green	#009E60	0%	62%	38%	156°	100%	31%	100%	62%\nSheen Green	#8FD400	56%	83%	0%	80°	100%	42%	100%	83%\nShimmering Blush	#D98695	85%	53%	58%	349°	52%	69%	38%	85%\nShocking Pink	#FC0FC0	99%	6%	75%	315°	98%	52%	94%	99%\nShocking Pink (Crayola)	#FF6FFF	100%	44%	100%	300°	100%	72%	56%	100%\nSienna	#882D17	53%	18%	9%	12°	71%	31%	83%	53%\nSilver	#C0C0C0	75%	75%	75%	—°	0%	75%	0%	75%\nSilver Chalice	#ACACAC	67%	67%	67%	—°	0%	67%	0%	67%\nSilver Lake Blue	#5D89BA	36%	54%	73%	212°	40%	55%	50%	73%\nSilver Pink	#C4AEAD	77%	68%	68%	3°	16%	72%	12%	77%\nSilver Sand	#BFC1C2	75%	76%	76%	200°	2%	75%	2%	76%\nSinopia	#CB410B	80%	25%	4%	17°	90%	42%	95%	80%\nSkobeloff	#007474	0%	45%	45%	180°	100%	23%	100%	45%\nSky Blue	#87CEEB	53%	81%	92%	197°	71%	73%	43%	92%\nSky Magenta	#CF71AF	81%	44%	69%	320°	49%	63%	45%	81%\nSlate Blue	#6A5ACD	42%	35%	80%	248°	53%	58%	56%	80%\nSlate Gray	#708090	44%	50%	56%	210°	13%	50%	22%	56%\nSmalt (Dark Powder Blue)	#003399	0%	20%	60%	220°	100%	30%	100%	60%\nSmitten	#C84186	78%	25%	53%	329°	55%	52%	68%	78%\nSmoke	#738276	45%	51%	46%	132°	6%	48%	12%	51%\nSmoky Black	#100C08	6%	5%	3%	30°	33%	5%	50%	6%\nSmoky Topaz	#933D41	58%	24%	25%	357°	41%	41%	59%	58%\nSnow	#FFFAFA	100%	98%	98%	0°	100%	99%	2%	100%\nSoap	#CEC8EF	81%	78%	94%	249°	55%	86%	16%	94%\nSolid Pink	#893843	54%	22%	26%	352°	42%	38%	59%	54%\nSonic Silver	#757575	46%	46%	46%	—°	0%	46%	0%	46%\nSpartan Crimson	#9E1316	62%	7%	9%	359°	79%	35%	88%	62%\nSpace Cadet	#1D2951	11%	16%	32%	226°	47%	22%	64%	32%\nSpanish Bistre	#807532	50%	46%	20%	52°	44%	35%	61%	50%\nSpanish Blue	#0070B8	0%	44%	72%	203°	100%	36%	100%	72%\nSpanish Carmine	#D10047	82%	0%	28%	340°	100%	41%	100%	82%\nSpanish Crimson	#E51A4C	90%	10%	30%	345°	80%	50%	89%	90%\nSpanish Gray	#989898	60%	60%	60%	—°	0%	60%	0%	60%\nSpanish Green	#009150	0%	57%	31%	153°	100%	28%	100%	57%\nSpanish Orange	#E86100	91%	38%	0%	25°	100%	45%	100%	91%\nSpanish Pink	#F7BFBE	97%	75%	75%	1°	78%	86%	23%	97%\nSpanish Red	#E60026	90%	0%	15%	350°	100%	45%	100%	90%\nSpanish Sky Blue	#00FFFF	0%	100%	100%	180°	100%	50%	100%	100%\nSpanish Violet	#4C2882	30%	16%	51%	264°	53%	33%	69%	51%\nSpanish Viridian	#007F5C	0%	50%	36%	163°	100%	25%	100%	50%\nSpicy Mix	#8B5f4D	55%	37%	30%	17°	29%	42%	45%	55%\nSpiro Disco Ball	#0FC0FC	6%	75%	99%	195°	98%	52%	94%	99%\nSpring Bud	#A7FC00	65%	99%	0%	80°	100%	49%	100%	99%\nSpring Green	#00FF7F	0%	100%	50%	150°	100%	50%	100%	100%\nStar Command Blue	#007BB8	0%	48%	72%	200°	100%	36%	100%	72%\nSteel Blue	#4682B4	27%	51%	71%	207°	44%	49%	61%	71%\nSteel Pink	#CC33CC	80%	20%	80%	300°	60%	50%	75%	80%\nStil De Grain Yellow	#FADA5E	98%	85%	37%	48°	94%	67%	62%	98%\nStizza	#990000	60%	0%	0%	0°	100%	30%	100%	60%\nStormcloud	#4F666A	31%	40%	42%	189°	15%	36%	25%	42%\nStraw	#E4D96F	89%	85%	44%	54°	68%	66%	51%	89%\nStrawberry	#FC5A8D	99%	35%	55%	341°	96%	67%	64%	99%\nSunglow	#FFCC33	100%	80%	20%	45°	100%	60%	80%	100%\nSunray	#E3AB57	89%	67%	34%	36°	71%	62%	62%	89%\nSunset	#FAD6A5	98%	84%	65%	35°	89%	81%	34%	98%\nSunset Orange	#FD5E53	99%	37%	33%	4°	98%	66%	67%	99%\nSuper Pink	#CF6BA9	81%	42%	66%	323°	51%	62%	48%	81%\nTan	#D2B48C	82%	71%	55%	34°	44%	69%	33%	82%\nTangelo	#F94D00	98%	30%	0%	19°	100%	49%	100%	98%\nTangerine	#F28500	95%	52%	0%	33°	100%	47%	100%	95%\nTangerine Yellow	#FFCC00	100%	80%	0%	48°	100%	50%	100%	100%\nTango Pink	#E4717A	89%	44%	48%	355°	68%	67%	50%	89%\nTaupe	#483C32	28%	24%	20%	27°	18%	24%	31%	28%\nTaupe Gray	#8B8589	55%	52%	54%	320°	3%	53%	4%	55%\nTea Green	#D0F0C0	82%	94%	75%	100°	62%	85%	20%	94%\nTea Rose	#F88379	97%	51%	47%	5°	90%	72%	51%	97%\nTea Rose	#F4C2C2	96%	76%	76%	0°	69%	86%	20%	96%\nTeal	#008080	0%	50%	50%	180°	100%	25%	100%	50%\nTeal Blue	#367588	21%	46%	53%	194°	43%	37%	60%	53%\nTeal Deer	#99E6B3	60%	90%	70%	140°	61%	75%	33%	90%\nTeal Green	#00827F	0%	51%	50%	179°	100%	25%	100%	51%\nTelemagenta	#CF3476	81%	20%	46%	334°	62%	51%	75%	81%\nTenne	#CD5700	80%	34%	0%	25°	100%	40%	100%	80%\nTerra Cotta	#E2725B	89%	45%	36%	10°	70%	62%	60%	89%\nThistle	#D8BFD8	85%	75%	85%	300°	24%	80%	12%	85%\nThulian Pink	#DE6FA1	87%	44%	63%	333°	63%	65%	50%	87%\nTickle Me Pink	#FC89AC	99%	54%	67%	342°	95%	76%	46%	99%\nTiffany Blue	#0ABAB5	4%	73%	71%	178°	90%	38%	95%	73%\nTiger's Eye	#E08D3C	88%	55%	24%	30°	73%	56%	73%	88%\nTimberwolf	#DBD7D2	86%	84%	82%	33°	11%	84%	4%	86%\nTitanium Yellow	#EEE600	93%	90%	0%	58°	100%	47%	100%	93%\nTomato	#FF6347	100%	39%	28%	9°	100%	64%	72%	100%\nToolbox	#746CC0	45%	42%	75%	246°	40%	59%	44%	75%\nTopaz	#FFC87C	100%	78%	49%	35°	100%	74%	51%	100%\nTractor Red	#FD0E35	99%	5%	21%	350°	98%	52%	94%	99%\nTrolley Grey	#808080	50%	50%	50%	—°	0%	50%	0%	50%\nTropical Rain Forest	#00755E	0%	46%	37%	168°	100%	23%	100%	46%\nTrue Blue	#0073CF	0%	45%	81%	207°	100%	41%	100%	81%\nTufts Blue	#417DC1	25%	49%	76%	212°	51%	51%	66%	76%\nTulip	#FF878D	100%	53%	55%	357°	100%	76%	47%	100%\nTumbleweed	#DEAA88	87%	67%	53%	24°	57%	70%	39%	87%\nTurkish Rose	#B57281	71%	45%	51%	347°	31%	58%	37%	71%\nTurquoise	#40E0D0	25%	88%	82%	174°	72%	56%	71%	88%\nTurquoise Blue	#00FFEF	0%	100%	94%	176°	100%	50%	100%	100%\nTurquoise Green	#A0D6B4	63%	84%	71%	142°	40%	73%	25%	84%\nTuscan	#FAD6A5	98%	84%	65%	35°	89%	81%	34%	98%\nTuscan Brown	#6F4E37	44%	31%	22%	25°	34%	33%	50%	44%\nTuscan Red	#7C4848	49%	28%	28%	0°	27%	38%	42%	49%\nTuscan Tan	#A67B5B	65%	48%	36%	26°	30%	50%	45%	65%\nTuscany	#C09999	75%	60%	60%	0°	24%	68%	20%	75%\nTwilight Lavender	#8A496B	54%	29%	42%	329°	31%	41%	47%	54%\nTyrian Purple	#66023C	40%	1%	24%	325°	96%	20%	98%	40%\nUA Blue	#0033AA	0%	20%	67%	222°	100%	33%	100%	67%\nUA Red	#D9004C	85%	0%	30%	339°	100%	43%	100%	85%\nUbe	#8878C3	53%	47%	76%	253°	39%	62%	38%	76%\nUCLA Blue	#536895	33%	41%	58%	221°	28%	46%	44%	58%\nUCLA Gold	#FFB300	100%	70%	0%	42°	100%	50%	100%	100%\nUFO Green	#3CD070	24%	82%	44%	141°	61%	53%	71%	82%\nUltramarine	#3F00FF	7%	4%	56%	244°	87%	30%	93%	56%\nUltramarine Blue	#4166F5	25%	40%	96%	228°	90%	61%	73%	96%\nUltra Pink	#FF6FFF	100%	44%	100%	300°	100%	72%	56%	100%\nUltra Red	#FC6C85	99%	42%	52%	350°	96%	71%	57%	99%\nUmber	#635147	39%	32%	28%	21°	16%	33%	28%	39%\nUnbleached Silk	#FFDDCA	100%	87%	79%	22°	100%	90%	21%	100%\nUnited Nations Blue	#5B92E5	36%	57%	90%	216°	73%	63%	60%	90%\nUniversity Of California Gold	#B78727	72%	53%	15%	40°	65%	44%	79%	72%\nUnmellow Yellow	#FFFF66	100%	100%	40%	60°	100%	70%	60%	100%\nUP Forest Green	#014421	0%	27%	13%	149°	97%	14%	99%	27%\nUP Maroon	#7B1113	48%	7%	7%	359°	76%	27%	86%	48%\nUpsdell Red	#AE2029	68%	13%	16%	356°	69%	40%	82%	68%\nUrobilin	#E1AD21	88%	68%	13%	44°	76%	51%	85%	88%\nUSAFA Blue	#004F98	0%	31%	60%	209°	100%	30%	100%	60%\nUSC Cardinal	#990000	60%	0%	0%	0°	100%	30%	100%	60%\nUSC Gold	#FFCC00	100%	80%	0%	48°	100%	50%	100%	100%\nUniversity Of Tennessee Orange	#F77F00	97%	50%	0%	31°	100%	48%	100%	97%\nUtah Crimson	#D3003F	83%	0%	25%	342°	100%	41%	100%	83%\nVanilla	#F3E5AB	95%	90%	67%	48°	75%	81%	30%	95%\nVanilla Ice	#F38FA9	95%	56%	66%	344°	81%	76%	41%	95%\nVegas Gold	#C5B358	77%	70%	35%	50°	48%	56%	55%	77%\nVenetian Red	#C80815	78%	3%	8%	356°	92%	41%	96%	78%\nVerdigris	#43B3AE	26%	70%	68%	177°	46%	48%	63%	70%\nVermilion	#E34234	89%	26%	20%	5°	76%	55%	77%	89%\nVermilion	#D9381E	85%	22%	12%	8°	76%	48%	86%	85%\nVeronica	#A020F0	63%	13%	94%	277°	87%	53%	87%	94%\nVery Light Azure	#74BBFB	45%	73%	98%	208°	94%	72%	54%	98%\nVery Light Blue	#6666FF	40%	40%	100%	240°	100%	70%	60%	100%\nVery Light Malachite Green	#64E986	39%	91%	53%	135°	75%	65%	57%	91%\nVery Light Tangelo	#FFB077	100%	69%	47%	25°	100%	73%	53%	100%\nVery Pale Orange	#FFDFBF	100%	87%	75%	30°	100%	88%	25%	100%\nVery Pale Yellow	#FFFFBF	100%	100%	75%	60°	100%	88%	25%	100%\nViolet	#8F00FF	56%	0%	100%	274°	100%	50%	100%	100%\nViolet (Color Wheel)	#7F00FF	50%	0%	100%	270°	100%	50%	100%	100%\nViolet (RYB)	#8601AF	53%	0%	69%	286°	99%	35%	99%	69%\nViolet (Web)	#EE82EE	93%	51%	93%	300°	76%	72%	45%	93%\nViolet-Blue	#324AB2	20%	29%	70%	229°	56%	45%	72%	70%\nViolet-Red	#F75394	97%	33%	58%	336°	91%	65%	66%	97%\nViridian	#40826D	25%	51%	43%	161°	34%	38%	51%	51%\nViridian Green	#009698	0%	59%	60%	181°	100%	30%	100%	60%\nVista Blue	#7C9ED9	49%	62%	85%	218°	55%	67%	43%	85%\nVivid Amber	#cc9900	80%	60%	0%	45°	100%	40%	100%	80%\nVivid Auburn	#922724	57%	15%	14%	2°	60%	36%	75%	57%\nVivid Burgundy	#9F1D35	62%	11%	21%	349°	69%	37%	82%	62%\nVivid Cerise	#DA1D81	85%	11%	51%	328°	77%	48%	87%	85%\nVivid Cerulean	#00aaee	0%	67%	93%	197°	100%	47%	100%	93%\nVivid Crimson	#CC0033	80%	0%	20%	345°	100%	40%	100%	80%\nVivid Gamboge	#FF9900	100%	60%	0%	36°	100%	50%	100%	100%\nVivid Lime Green	#a6d608	65%	84%	3%	74°	93%	44%	96%	84%\nVivid Malachite	#00cc33	0%	80%	20%	135°	100%	40%	100%	80%\nVivid Mulberry	#B80CE3	72%	5%	89%	288°	90%	47%	95%	89%\nVivid Orange	#FF5F00	100%	37%	0%	22°	100%	50%	100%	100%\nVivid Orange Peel	#FFA000	100%	63%	0%	18°	100%	50%	100%	100%\nVivid Orchid	#CC00FF	80%	0%	100%	288°	100%	50%	100%	100%\nVivid Raspberry	#FF006C	100%	0%	42%	335°	100%	50%	100%	100%\nVivid Red	#F70D1A	97%	5%	10%	357°	94%	51%	95%	97%\nVivid Red-Tangelo	#DF6124	87%	38%	14%	20°	75%	51%	84%	87%\nVivid Sky Blue	#00CCFF	0%	80%	100%	192°	100%	50%	100%	100%\nVivid Tangelo	#F07427	94%	45%	15%	23°	87%	55%	84%	94%\nVivid Tangerine	#FFA089	100%	63%	54%	12°	100%	77%	46%	100%\nVivid Vermilion	#e56024	90%	38%	14%	19°	79%	52%	84%	90%\nVivid Violet	#9F00FF	62%	0%	100%	277°	100%	50%	100%	100%\nVivid Yellow	#FFE302	100%	89%	1%	53°	100%	50%	99%	100%\nWarm Black	#004242	0%	26%	26%	180°	100%	13%	100%	25%\nWaterspout	#A4F4F9	64%	96%	98%	184°	88%	81%	34%	98%\nWenge	#645452	39%	33%	32%	7°	10%	36%	18%	39%\nWheat	#F5DEB3	96%	87%	70%	39°	77%	83%	27%	96%\nWhite	#FFFFFF	100%	100%	100%	—°	0%	100%	0%	100%\nWhite Smoke	#F5F5F5	96%	96%	96%	—°	0%	96%	0%	96%\nWild Blue Yonder	#A2ADD0	64%	68%	82%	226°	33%	73%	22%	82%\nWild Orchid	#D470A2	83%	44%	64%	330°	54%	64%	47%	83%\nWild Strawberry	#FF43A4	100%	26%	64%	329°	100%	63%	74%	100%\nWild Watermelon	#FC6C85	99%	42%	52%	350°	96%	71%	57%	99%\nWillpower Orange	#FD5800	99%	35%	0%	21°	100%	50%	100%	99%\nWindsor Tan	#A75502	65%	33%	1%	30°	98%	33%	99%	65%\nWine	#722F37	45%	18%	22%	353°	42%	32%	59%	45%\nWine Dregs	#673147	40%	19%	28%	336°	36%	30%	52%	40%\nWisteria	#C9A0DC	79%	63%	86%	281°	46%	75%	27%	86%\nWood Brown	#C19A6B	76%	60%	42%	33°	41%	59%	45%	76%\nXanadu	#738678	45%	53%	47%	136°	8%	49%	14%	53%\nYale Blue	#0F4D92	6%	30%	57%	212°	81%	32%	90%	57%\nYankees Blue	#1C2841	11%	16%	25%	221°	40%	18%	57%	25%\nYellow	#FFFF00	100%	100%	0%	60°	100%	50%	100%	100%\nYellow (Crayola)	#FCE883	99%	91%	51%	50°	95%	75%	48%	99%\nYellow (Munsell)	#EFCC00	94%	80%	0%	51°	100%	47%	100%	94%\nYellow (NCS)	#FFD300	100%	83%	0%	50°	100%	50%	100%	100%\nYellow (Pantone)	#FEDF00	100%	87%	0%	53°	100%	50%	100%	100%\nYellow (Process)	#FFEF00	100%	94%	0%	56°	100%	50%	100%	100%\nYellow (RYB)	#FEFE33	100%	100%	20%	60°	99%	60%	80%	100%\nYellow-Green	#9ACD32	60%	80%	20%	80°	61%	50%	76%	80%\nYellow Orange	#FFAE42	100%	68%	26%	34°	100%	63%	74%	100%\nYellow Rose	#FFF000	100%	94%	0%	56°	100%	50%	100%	100%\nZaffre	#0014A8	0%	8%	66%	233°	100%	33%	100%	66%\nZinnwaldite Brown	#2C1608	17%	9%	3%	23°	69%	10%	82%	17%\nZomp	#39A78E	22%	65%	56%	166°	49%	44%	66%	65%";
    
    
    string = [string stringByReplacingOccurrencesOfString:@"%" withString:@""];
    
    NSArray *array = [string componentsSeparatedByString:@"\n"];
    
    NSMutableString *implementationFileMutableString = [[NSMutableString alloc] initWithString:@"\n\n\n"];
    NSMutableString *headerFileMutableString = [[NSMutableString alloc] initWithString:@"\n\n\n"];
    NSMutableString *allNamesInOneArrayMutableString = [[NSMutableString alloc] initWithString:@"\n\n\n@["];
    NSMutableString *allColorsInADictionaryMutableString = [[NSMutableString alloc] initWithString:@"\n\n\n@{"];
    NSMutableString *properNameDictionaryMutableString = [[NSMutableString alloc] initWithString:@"\n\n\n@{"];
    
    for (NSString *subString in array) {
        NSLog(@"On %@", subString);
        NSArray *smallerArray = [subString componentsSeparatedByString:@"\t"];
        
        if (smallerArray.count < 10) {
            NSLog(@"This string does not have 10 parts: \t%lu\t\t%@", (unsigned long)smallerArray.count, smallerArray);
        }
        
        else {
            // the name of the color in a formatted string
            NSString *nameString = [[[smallerArray objectAtIndex:0] componentsSeparatedByCharactersInSet:[[NSCharacterSet alphanumericCharacterSet] invertedSet]] componentsJoinedByString:@""];
            nameString = [NSString stringWithFormat:@"%@%@", [[nameString substringToIndex:1] lowercaseString], [nameString substringFromIndex:1]];
            
            // the name might be a substring of another name, so surround the name directly with quotes to do a direct comparison
            NSString *tempNameString = [NSString stringWithFormat:@"\"%@\"", nameString];
            if ([implementationFileMutableString rangeOfString:tempNameString].location != NSNotFound || [headerFileMutableString rangeOfString:tempNameString].location != NSNotFound || [allNamesInOneArrayMutableString rangeOfString:tempNameString].location != NSNotFound || [allColorsInADictionaryMutableString rangeOfString:tempNameString].location != NSNotFound) {
                nameString = [NSString stringWithFormat:@"%@2", nameString];
            }
            
            // add the color name to the header file output string
            [headerFileMutableString appendFormat:@"\n+ (UIColor *)%@;\n", nameString];
            // the implementation string for this color
            NSMutableString *tempString = [[NSMutableString alloc] initWithFormat:@"\n+ (UIColor *)%@ {\n\tUIColor *%@ = [UIColor colorWithRed:%@.0f/100.0f green:%@.0f/100.0f blue:%@.0f/100.0f alpha:1.0f];\n\t[%@ setValue:[NSNumber numberWithFloat:%@.0f/100.0f] forKey:@\"redComponent\"];\n\t[%@ setValue:[NSNumber numberWithFloat:%@.0f/100.0f] forKey:@\"greenComponent\"];\n\t[%@ setValue:[NSNumber numberWithFloat:%@.0f/100.0f] forKey:@\"blueComponent\"];\n\treturn %@;\n}\n", nameString, nameString, [smallerArray objectAtIndex:2],[smallerArray objectAtIndex:3],[smallerArray objectAtIndex:4], nameString, [smallerArray objectAtIndex:2], nameString, [smallerArray objectAtIndex:3], nameString, [smallerArray objectAtIndex:4], nameString];
            
            // add the implementation color format
            [implementationFileMutableString appendString:tempString];
            
            // add the color to an array of all colors
            [allNamesInOneArrayMutableString appendFormat:@"[UIColor %@], ", nameString];
            
            // add the color to a dictionary of colors
            [allColorsInADictionaryMutableString appendFormat:@"@\"%@\" : [UIColor %@], ", [nameString lowercaseString], nameString];
            
            // add the unaltered name and the formatted name to a dictionary
            NSString *properName = [smallerArray objectAtIndex:0];
            while (properName.length > 1 && [[NSCharacterSet whitespaceAndNewlineCharacterSet] characterIsMember:[properName characterAtIndex:0]]) {
                properName = [properName substringFromIndex:1];
            }
            
            NSArray *partsOfProperName = [properName componentsSeparatedByString:@" "];
            NSMutableArray *newPartsOfProperName = [[NSMutableArray alloc] initWithCapacity:partsOfProperName.count];
            for (int i = 0; i < partsOfProperName.count; i++) {
                NSString *tempString = [partsOfProperName objectAtIndex:i];
                if (tempString.length > 1 && [[NSCharacterSet lowercaseLetterCharacterSet] characterIsMember:[tempString characterAtIndex:0]]) {
                    tempString = [NSString stringWithFormat:@"%@%@", [[tempString substringToIndex:1] uppercaseString], [tempString substringFromIndex:1]];
                }
                
                [newPartsOfProperName addObject:tempString];
            }
            
            NSMutableString *formattedProperNameString = [[NSMutableString alloc] init];
            for (NSString *word in newPartsOfProperName) {
                [formattedProperNameString appendFormat:@"%@ ", word];
            }
            properName = [formattedProperNameString substringToIndex:properName.length];
            
            [properNameDictionaryMutableString appendFormat:@"@\"%@\" : @\"%@\", ", nameString, properName];
            [properNameDictionaryMutableString appendFormat:@"@\"%@\" : @\"%@\", ", [nameString lowercaseString], properName];
        }
    }
    
    // these are the colors that iOS has by default
    NSArray *defaultIOSColors = @[@"blackColor",
             @"darkGrayColor",
             @"lightGrayColor",
             @"lightGrayColor",
             @"whiteColor",@"grayColor",
             @"redColor",
             @"greenColor",
             @"blueColor",
             @"cyanColor",
             @"yellowColor",
             @"magentaColor",
             @"orangeColor",
             @"purpleColor",
             @"brownColor",
             @"clearColor"];
    
    for (NSString *nameString in defaultIOSColors) {
        // add the color to an array of all colors
        [allNamesInOneArrayMutableString appendFormat:@"[UIColor %@], ", nameString];
        
        // add the color to a dictionary of colors
        [allColorsInADictionaryMutableString appendFormat:@"@\"%@\" : [UIColor %@], ", [nameString lowercaseString], nameString];
        
        // add the unaltered name and the formatted name to a dictionary
        [properNameDictionaryMutableString appendFormat:@"@\"%@\" : @\"%@%@\", ", nameString, [[nameString substringToIndex:1] uppercaseString], [[nameString stringByReplacingOccurrencesOfString:@"Color" withString:@""] substringFromIndex:1]];
        [properNameDictionaryMutableString appendFormat:@"@\"%@\" : @\"%@%@\", ", [nameString lowercaseString], [[nameString substringToIndex:1] uppercaseString], [[nameString stringByReplacingOccurrencesOfString:@"Color" withString:@""] substringFromIndex:1]];
    }
    
    // end the formatting for the array with every color in it
    NSString *allNamesInOneArrayString = [NSString stringWithFormat:@"%@];", [allNamesInOneArrayMutableString substringToIndex:allNamesInOneArrayMutableString.length - 2]];
    
    // end the formatting for the dictionary with every color in it with its name as the key
    NSString *allColorsInADictionaryString = [NSString stringWithFormat:@"%@};", [allColorsInADictionaryMutableString substringToIndex:allColorsInADictionaryMutableString.length - 2]];
    
    // replace the first string with the second string
    NSDictionary *replacementStringDictionary = @{@":0.0f/100.0f":@":0.0f",
                                                  @":67.0f/100.0f":@":0.667f",
                                                  @":100.0f/100.0f":@":1.0f",
                                                  @":75.0f/100.0f":@":0.75f",
                                                  @":50.0f/100.0f":@":0.5f",
                                                  @":25.0f/100.0f":@":0.25f",
                                                  @"0.0f/100.0f":@".0f/10.0f",
                                                  @":17.0f/100.0f":@":0.1667f"};
     NSString *implementationFileString = [implementationFileMutableString stringByReplacingOccurrencesOfString:@":33.0f/100.0f" withString:@":0.333f"];
    
    for (NSString *key in replacementStringDictionary) {
        implementationFileString = [implementationFileString stringByReplacingOccurrencesOfString:key withString:[replacementStringDictionary objectForKey:key]];
    }
    
    
    NSLog(@"%@", implementationFileString);
    NSLog(@"%@", headerFileMutableString);
    NSLog(@"%@", allNamesInOneArrayString);
    NSLog(@"%@", allColorsInADictionaryString);
    NSLog(@"%@", properNameDictionaryMutableString);
}



@end
