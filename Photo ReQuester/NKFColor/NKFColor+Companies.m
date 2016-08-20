//
//  NKFColor+Companies.m
//  Alphabetical List Utility
//
//  Created by HAI on 7/22/15.
//  Copyright (c) 2015 HAI. All rights reserved.
//

#import "NKFColor+Companies.h"
#import "UIColor+AppColors.h"
#import "NKFColor+WikipediaColors.h"
#import "NKFColor+Universities.m"

@implementation NKFColor (Companies)


#pragma mark - Company Colors

+ (NSAttributedString *)attributedStringForCompanyName:(NSString *)companyName {
	NSMutableArray *colors = [NSMutableArray arrayWithArray:[NKFColor colorsForCompanyName:companyName]];
	
	NSMutableAttributedString *finalString = [[NSMutableAttributedString alloc] initWithString:companyName];
	
	NSArray *words = [companyName componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	
	NSArray *copyOfColors = [NSArray arrayWithArray:colors];
	for (NKFColor *testColor in copyOfColors) {
		if ([testColor isLighterThan:0.665f] && colors.count > 1) {
			[colors removeObject:testColor];
		}
	}
	
	if (colors.count > 0 && words.count > 1) {
		finalString = [[NSMutableAttributedString alloc] init];
		NSAttributedString *spaceString = [[NSAttributedString alloc] initWithString:@" "];
		for (int i = 0; i < words.count; i++) {
			NSString *word = [words objectAtIndex:i];
			NKFColor *currentColor = [colors objectAtIndex:i%colors.count];
			
			NSAttributedString *attributedWord;
			if ([currentColor isLighterThan:0.8f]) {
				attributedWord = [[NSAttributedString alloc] initWithString:word attributes:@{NSForegroundColorAttributeName : currentColor, NSBackgroundColorAttributeName : [NKFColor black]}];
			} else {
				attributedWord = [[NSAttributedString alloc] initWithString:word attributes:@{NSForegroundColorAttributeName : currentColor}];
			}
			
			if (finalString.length > 0) {
				[finalString appendAttributedString:spaceString];
			}
			
			[finalString appendAttributedString:attributedWord];
		}
	} else if (colors.count < companyName.length && colors.count > companyName.length / 2 && colors.count > 2) {
		for (int i = 0; i < companyName.length; i++) {
			UIColor *currentColor = [colors objectAtIndex:i%colors.count];
			[finalString addAttribute:NSForegroundColorAttributeName value:[currentColor colorWithAlphaComponent:1.0f] range:NSMakeRange(i, 1)];
		}
	} else if (colors.count > 0) {
		if ([colors.firstObject isLighterThan:0.8f]) {
			[finalString addAttribute:NSBackgroundColorAttributeName value:[NKFColor black] range:NSMakeRange(0, finalString.length)];
		}
		
		[finalString addAttribute:NSForegroundColorAttributeName value:[colors.firstObject colorWithAlphaComponent:1.0f] range:NSMakeRange(0, finalString.length)];
	} else {
		NKFColor *color = [[self colorForCompanyName:companyName] colorWithAlphaComponent:1.0];
		
		if ([colors.firstObject isLighterThan:0.8f]) {
			[finalString addAttribute:NSBackgroundColorAttributeName value:[NKFColor black] range:NSMakeRange(0, finalString.length)];
		}
		
		[finalString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, finalString.length)];
	}
	
	NSArray *bannedwords = [self bannedWords];
	for (NSString *bannedWord in bannedwords) {
		if ([[finalString.string lowercaseString] rangeOfString:bannedWord].location != NSNotFound) {
			NSString *modifiedCompanyName = companyName;
			for (NSString *innerBannedWord in bannedwords) {
				modifiedCompanyName = [modifiedCompanyName stringByReplacingOccurrencesOfString:innerBannedWord withString:@""];
			}
			UIColor *cleanColor = [NKFColor colorForCompanyName:modifiedCompanyName];
			[finalString setAttributedString:[[NSAttributedString alloc] initWithString:companyName attributes:@{NSForegroundColorAttributeName : cleanColor}]];
			return finalString;
		}
	}
	
	return finalString;
}

+ (NKFColor *)colorForCompanyName:(NSString *)companyName {
	NKFColor *color = [NKFColor strictColorForCompanyName:companyName];
	
	if (color) {
		return color;
	}
	
	return [NKFColor randomDarkColorFromString:companyName];
}

+ (NKFColor *)strictColorForCompanyName:(NSString *)companyName {
	if (!companyName || companyName.length == 0) {
		NSLog(@"Company Name must exist to generate color.");
		return [NKFColor randomDarkColor];
	}
	
	NSString *lowerCaseCompanyName = [companyName lowercaseString];
	NSString *formattedCompanyName = [[lowerCaseCompanyName componentsSeparatedByCharactersInSet:[[NSCharacterSet alphanumericCharacterSet] invertedSet]] componentsJoinedByString:@""];
	
	NSDictionary *companyColorsDictionary = [self dictionaryOfCompanyColors];
	if ([companyColorsDictionary objectForKey:formattedCompanyName]) {
		NSString *hexString = [companyColorsDictionary objectForKey:formattedCompanyName];
		NKFColor *companyColor = [NKFColor colorWithHexString:hexString];
		
		if (companyColor) {
			return companyColor;
		}
	}
	
	NSArray *bannedWords = [self bannedWords];
	for (NSString *bannedWord in bannedWords) {
		if ([formattedCompanyName rangeOfString:bannedWord].location != NSNotFound) {
			return [NKFColor black];
		}
	}
	
	if ([self respondsToSelector:NSSelectorFromString(formattedCompanyName)]) {
		return [NKFColor performSelector:NSSelectorFromString(formattedCompanyName) withObject:nil];
	} else if ([lowerCaseCompanyName firstAlphabeticalCharacterIndex]) {
		return [NKFColor strictColorForCompanyName:[lowerCaseCompanyName stringWithoutNumbersInTheBeginning]];
	} else {
		NSArray *words = [lowerCaseCompanyName componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
		for (NSString *word in words) {
			NSString *keyword = [[word componentsSeparatedByCharactersInSet:[[NSCharacterSet alphanumericCharacterSet] invertedSet]] componentsJoinedByString:@""];
			NKFColor *keywordColor = [self colorForKeyword:keyword];
			if (keywordColor) {
				return keywordColor;
			}
		}
		
		for (NSInteger i = words.count - 1; i >= 0; i--) {
			NSString *word = [words objectAtIndex:i];
			
			for (NSString *bannedWord in bannedWords) {
				if ([word rangeOfString:bannedWord].location != NSNotFound) {
					return [NKFColor black];
				}
			}
			
			if ([self respondsToSelector:NSSelectorFromString(word)]) {
				return [NKFColor performSelector:NSSelectorFromString(word) withObject:nil];
			}
		}
		
		// try with a camel case
		// e.g. Cal Poly -> calPoly
		NSMutableString *camelCaseCompanyName = [[NSMutableString alloc] initWithString:words.firstObject];
		for (int i = 1; i < words.count; i++) {
			NSString *nextWord = [[words objectAtIndex:i] capitalizedString];
			[camelCaseCompanyName appendString:nextWord];
		}
		
		if ([self respondsToSelector:NSSelectorFromString(camelCaseCompanyName)]) {
			return [NKFColor performSelector:NSSelectorFromString(camelCaseCompanyName) withObject:nil];
		}
		
		if ([companyName rangeOfString:@"&"].location != NSNotFound) {
			return [NKFColor strictColorForCompanyName:[lowerCaseCompanyName stringByReplacingOccurrencesOfString:@"&" withString:@"and"]];
		}
		
		for (NSString *word in words) {
			if ([word hasSuffix:@"s"] && word.length > 1 && ![word hasSuffix:@"ss"]) {
				NSString *singularWord = [word substringToIndex:word.length - 1];
				NKFColor *singularWordColor = [NKFColor strictColorForCompanyName:singularWord];
				if (singularWordColor) {
					return singularWordColor;
				}
			}
		}
	}
    
    
    NKFColor *universityColor = [NKFColor strictUniversityColorForSchoolName:companyName];
    if (universityColor) {
        return universityColor;
    }
	
	return nil;
}

+ (NSArray *)colorsForCompanyName:(NSString *)companyName {
	NSString *lowerCaseCompanyName = [companyName lowercaseString];
	NSString *initialFormattedCompanyName = [[lowerCaseCompanyName componentsSeparatedByCharactersInSet:[[NSCharacterSet alphanumericCharacterSet] invertedSet]] componentsJoinedByString:@""];
	NSMutableArray *colors = [[NSMutableArray alloc] initWithCapacity:companyName.length];
	NSString *formattedCompanyName = initialFormattedCompanyName;
	
	NSArray *bannedWords = [self bannedWords];
	for (NSString *bannedWord in bannedWords) {
		if ([formattedCompanyName rangeOfString:bannedWord].location != NSNotFound) {
			return @[[NKFColor black]];
		}
	}
	
	while ([self respondsToSelector:NSSelectorFromString(formattedCompanyName)]) {
		[colors addObject:[NKFColor performSelector:NSSelectorFromString(formattedCompanyName) withObject:nil]];
		
		formattedCompanyName = [NSString stringWithFormat:@"%@%zd", initialFormattedCompanyName, colors.count + 1];
	}
	
	if (colors.count > 0) {
		return colors;
	}
	
	NSArray *words = [companyName componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	
	if (words.count > 1) {
		for (NSString *word in words) {
			if ([word rangeOfString:@"&"].location != NSNotFound) {
				[colors addObjectsFromArray:[NKFColor colorsForCompanyName:[word stringByReplacingOccurrencesOfString:@"&" withString:@"and"]]];
			} else {
				[colors addObjectsFromArray:[NKFColor colorsForCompanyName:word]];
			}
		}
	}
	
	if (colors.count > 0) {
		return colors;
	}
	
	for (NSString *word in words) {
		if ([word hasSuffix:@"s"] && word.length > 1 && ![word hasSuffix:@"ss"]) {
			NSString *singularWord = [word substringToIndex:word.length - 1];
			[colors addObjectsFromArray:[self colorsForCompanyName:singularWord]];
		}
	}
	
	if (colors.count > 0) {
		return colors;
	}
	
	return colors;
}

+ (NKFColor *)colorForKeyword:(NSString *)keyword {
	NSDictionary *keywordColors = @{@"tv" : [self hulu],
									@"movies" : [self netflix],
									@"auto" : [self autozone],
									@"autoparts" : [self autozone2],
									@"rx" : [self cvs],
									@"rxs" : [self cvs],
									@"prescription" : [self walgreens],
									@"prescriptions" : [self volcano],
									@"dr" : [self philips],
									@"doctor" : [self philips],
									@"welcome" : [NKFColor appColor]};
	if ([keywordColors objectForKey:keyword]) {
		return [keywordColors objectForKey:keyword];
	}
	
	return nil;
}


#pragma mark - Company names Dictionary

+ (NSDictionary *)dictionaryOfCompanyColors {
	NSDictionary *companyColorsDictionary = @{@"aaa"                         : @"#DA291C",
											  @"aaa2"                        : @"#0072CE",
											  @"aandw"                       : @"#481D0C",
											  @"aandw2"                      : @"#8C4F1A",
											  @"aandw3"                      : @"#CE7B41",
											  @"aandw4"                      : @"#FDFAF9",
											  @"aboutme"                     : @"#00405D",
											  @"aboutme2"                    : @"#062F3C",
											  @"aboutme3"                    : @"#2B82AD",
											  @"aboutme4"                    : @"#CC7A00",
											  @"aboutme5"                    : @"#FFCC33",
											  @"ace"                         : @"#E61938",
											  @"acehardware"                 : @"#E61938",
											  @"acehardwear"                 : @"#E61938",
											  @"acme"                        : @"#EF3B39",
											  @"acmoore"                     : @"#E31937",
											  @"acmooreartsandcrafts"        : @"#E31937",
											  @"addvocate"                   : @"#FF3322",
											  @"adidas"                      : @"#000000",
											  @"adobe"                       : @"#FF0000",
											  @"adobe2"                      : @"#FBB034",
											  @"adobe3"                      : @"#FFDD00",
											  @"adobe4"                      : @"#C1D82F",
											  @"adobe5"                      : @"#00A4E4",
											  @"adobe6"                      : @"#8A7967",
											  @"adobe7"                      : @"#6A737B",
											  @"advancedautoparts"           : @"#EB1B2A",
											  @"aetna"                       : @"#D20962",
											  @"aetna2"                      : @"#F47721",
											  @"aetna3"                      : @"#7AC143",
											  @"aetna4"                      : @"#00A78E",
											  @"aetna5"                      : @"#00BCE4",
											  @"aetna6"                      : @"#7D3F98",
											  @"afnetworking"                : @"#E9552C",
											  @"afnetworking2"               : @"#000000",
											  @"ahold"                       : @"#0662A8",
											  @"aholdusa"                    : @"#0662A8",
											  @"aim"                         : @"#FFD900",
											  @"airbnb"                      : @"#FD5C63",
											  @"ajwright"                    : @"#EB8316",
											  @"alabama"                     : @"#F70018",
											  @"alabama2"                    : @"#FFFFFF",
											  @"albertson"                   : @"#141D6A",
											  @"albertson2"                  : @"#00D501",
											  @"albertsons"                  : @"#141D6A",
											  @"albertsons2"                 : @"#00D501",
											  @"alcon"                       : @"#0079C1",
											  @"alcon2"                      : @"#49176D",
											  @"alcon3"                      : @"#00A0AF",
											  @"alcon4"                      : @"#49A942",
											  @"aldi"                        : @"#002478",
											  @"aldi2"                       : @"#F23600",
											  @"aldi3"                       : @"#FA8901",
											  @"aldi4"                       : @"#0094DB",
											  @"alienware"                   : @"#020202",
											  @"alienware2"                  : @"#2AD2C9",
											  @"alienware3"                  : @"#D0E100",
											  @"alienware4"                  : @"#00F0F0",
											  @"alienware5"                  : @"#00F000",
											  @"alienware6"                  : @"#F0E000",
											  @"alienware7"                  : @"#00A0F0",
											  @"alienware8"                  : @"#9000F0",
											  @"alienware9"                  : @"#F00000",
											  @"amazon"                      : @"#FF9900",
											  @"amazon2"                     : @"#146EB4",
											  @"americanairlines"            : @"#DA2026",
											  @"americanairlines2"           : @"#1D81BD",
											  @"americanredcross"            : @"#ED1B2E",
											  @"americanredcross10"          : @"#0091CD",
											  @"americanredcross11"          : @"#004B79",
											  @"americanredcross12"          : @"#7F181B",
											  @"americanredcross13"          : @"#D7D7D8",
											  @"americanredcross14"          : @"#9F9FA3",
											  @"americanredcross15"          : @"#000000",
											  @"americanredcross2"           : @"#6D6E70",
											  @"americanredcross3"           : @"#D7D7D8",
											  @"americanredcross4"           : @"#B4A996",
											  @"americanredcross5"           : @"#ECB731",
											  @"americanredcross6"           : @"#8EC06C",
											  @"americanredcross7"           : @"#537B35",
											  @"americanredcross8"           : @"#C4DFF6",
											  @"americanredcross9"           : @"#56A0D3",
											  @"android"                     : @"#A4C639",
											  @"angieslist"                  : @"#7FBB00",
											  @"answers"                     : @"#136AD5",
											  @"answers2"                    : @"#FB8A2E",
											  @"aol"                         : @"#FF0B00",
											  @"aol2"                        : @"#00C4FF",
											  @"apple"                       : @"#919CB2",
											  @"applebees"                   : @"#4D7017",
											  @"applebees2"                  : @"#E6112B",
											  @"apu"                         : @"#80282B",
											  @"apu2"                        : @"#FFFFFF",
											  @"apu3"                        : @"#000000",
											  @"arbys"                       : @"#D11D2B",
											  @"archlinux"                   : @"#1793D1",
											  @"archlinux2"                  : @"#333333",
											  @"arizona"                     : @"#1D1E6A",
											  @"arizona2"                    : @"#CEB53A",
											  @"artsandcrafts"               : @"#E31937",
											  @"asana"                       : @"#1F8DD6",
											  @"asana2"                      : @"#34AD00",
											  @"associatedpress"             : @"#FF322E",
											  @"astonmartin"                 : @"#287A4E",
											  @"atandt"                      : @"#FF7200",
											  @"atandt2"                     : @"#FCB314",
											  @"atandt3"                     : @"#067AB4",
											  @"atandt4"                     : @"#3AA5DC",
											  @"atlanticcoast"               : @"#013CA6",
											  @"atlanticcoastconference"     : @"#013CA6",
											  @"atlanticcoastconferenceacc"  : @"#013CA6",
											  @"atlanticcoastconferenceacc2" : @"#A5A9AB",
											  @"atlassian"                   : @"#003366",
											  @"att"                         : @"#FF7200",
											  @"att2"                        : @"#FCB314",
											  @"att3"                        : @"#067AB4",
											  @"att4"                        : @"#3AA5DC",
											  @"aubonpain"                   : @"#F2B53E",
											  @"auntieannes"                 : @"#638499",
											  @"auth0"                       : @"#16214D",
											  @"auth02"                      : @"#44C7F4",
											  @"auth03"                      : @"#EB5424",
											  @"auth04"                      : @"#D0D2D3",
											  @"autozone"                    : @"#FD021B",
											  @"autozone2"                   : @"#FF6600",
											  @"baidu"                       : @"#DE0F17",
											  @"baidu2"                      : @"#2529D8",
											  @"bajafresh"                   : @"#E61110",
											  @"bajafresh2"                  : @"#11A67D",
											  @"bajafresh3"                  : @"#000000",
											  @"bakers"                      : @"#FF0000",
											  @"bananarepublic"              : @"#774F2E",
											  @"bandcamp"                    : @"#629AA9",
											  @"bankofamerica"               : @"#2563B0",
											  @"bankofamerica2"              : @"#DB003B",
											  @"barnesnoble"                 : @"#2A5934",
											  @"baskinrobbins"               : @"#D24C96",
											  @"baskinrobbins2"              : @"#244A87",
											  @"bebo"                        : @"#E04646",
											  @"bedbathandbeyond"            : @"#394B9D",
											  @"bedbathbeyond"               : @"#394B9D",
											  @"behance"                     : @"#1769FF",
											  @"belk"                        : @"#00D501",
											  @"belk2"                       : @"#24408F",
											  @"benandjerrys"                : @"#67B0DD",
											  @"benandjerrys2"               : @"#E1A82C",
											  @"benandjerrys3"               : @"#000000",
											  @"benihana"                    : @"#000000",
											  @"benihana2"                   : @"#EA1B22",
											  @"bernieandphyls"              : @"#986832",
											  @"bernieandphyls2"             : @"#D0C9B9",
											  @"bernieandphyls3"             : @"#000000",
											  @"bertuccis"                   : @"#A81D30",
											  @"bestbuy"                     : @"#003B64",
											  @"bestbuy2"                    : @"#FFF200",
											  @"bevmo"                       : @"#FF0000",
											  @"biblegateway"                : @"#000000",
											  @"big5"                        : @"#333991",
											  @"big5sportinggoods"           : @"#333991",
											  @"big5sports"                  : @"#333991",
											  @"bigboy"                      : @"#DE3539",
											  @"bigboy2"                     : @"#473D38",
											  @"bigboy3"                     : @"#B74446",
											  @"bigcartel"                   : @"#A0AC48",
											  @"bigcartel2"                  : @"#70B29C",
											  @"biglots"                     : @"#FF7900",
											  @"bilo"                        : @"#FE3300",
											  @"bilo2"                       : @"#03973F",
											  @"bing2"                       : @"#FFB900",
											  @"bing22"                      : @"#505050",
											  @"bing23"                      : @"#A3A3A3",
											  @"bitbucket"                   : @"#205081",
											  @"bitly"                       : @"#EE6123",
											  @"bitly2"                      : @"#61B3DE",
											  @"bjs"                         : @"#DA261D",
											  @"bjsrestaurants"              : @"#B11B0D",
											  @"blackberry"                  : @"#005387",
											  @"blackberry2"                 : @"#8CB811",
											  @"blackberry3"                 : @"#FDB813",
											  @"blackberry4"                 : @"#88ACA1",
											  @"blackberry5"                 : @"#000000",
											  @"blackberry6"                 : @"#788CB6",
											  @"blackberry7"                 : @"#A1A1A4",
											  @"blackberry8"                 : @"#8F8F8C",
											  @"blimpie"                     : @"#769A50",
											  @"blimpie2"                    : @"#F4D662",
											  @"blogger"                     : @"#F57D00",
											  @"bmw"                         : @"#4695C7",
											  @"bmw2"                        : @"#FFFFFF",
											  @"bmw3"                        : @"#000000",
											  @"bobevans"                    : @"#B01921",
											  @"boeing"                      : @"#0039A6",
											  @"bofa"                        : @"#2563B0",
											  @"bofa2"                       : @"#DB003B",
											  @"bookingcom"                  : @"#003580",
											  @"bostonmarket"                : @"#D92132",
											  @"bostonmarket2"               : @"#000000",
											  @"boyscouts"                   : @"#CE1126",
											  @"boyscouts2"                  : @"#003F87",
											  @"boyscoutsofamerica"          : @"#CE1126",
											  @"boyscoutsofamerica2"         : @"#003F87",
											  @"britishairways"              : @"#075AAA",
											  @"britishairways2"             : @"#EB2226",
											  @"britishairways3"             : @"#01295C",
											  @"britishairways4"             : @"#EFE9E5",
											  @"britishairways5"             : @"#ACA095",
											  @"britishairways6"             : @"#B9CFED",
											  @"britishairways7"             : @"#A7A9AC",
											  @"bt"                          : @"#D52685",
											  @"bt2"                         : @"#553A99",
											  @"bt3"                         : @"#6CBC35",
											  @"bt4"                         : @"#FD9F3E",
											  @"bt5"                         : @"#08538C",
											  @"bubbagump"                   : @"#11217D",
											  @"bubbagump2"                  : @"#EC0B0E",
											  @"bucadibeppo"                 : @"#D4534B",
											  @"bucadibeppo2"                : @"#7CB297",
											  @"buffalowildwings"            : @"#FFD200",
											  @"buffalowildwings2"           : @"#000000",
											  @"buffalowildwings3"           : @"#AAAAA9",
											  @"buffalowildwings4"           : @"#FFFFFF",
											  @"buffer"                      : @"#168EEA",
											  @"buffer2"                     : @"#EE4F4F",
											  @"buffer3"                     : @"#FFF9EA",
											  @"buffer4"                     : @"#76B852",
											  @"buffer5"                     : @"#323B43",
											  @"buffer6"                     : @"#59626A",
											  @"buffer7"                     : @"#CED7DF",
											  @"buffer8"                     : @"#EFF3F6",
											  @"buffer9"                     : @"#F4F7F9",
											  @"bugatti"                     : @"#B80034",
											  @"bugatti2"                    : @"#000000",
											  @"bugatti3"                    : @"#171717",
											  @"burgerking"                  : @"#EC1C24",
											  @"burgerking2"                 : @"#FDBD10",
											  @"burgerking3"                 : @"#0066B2",
											  @"burgerking4"                 : @"#ED7902",
											  @"burlington"                  : @"#AB1D38",
											  @"burlingtoncoatfactory"       : @"#AB1D38",
											  @"bynder"                      : @"#1CA0DE",
											  @"bynder2"                     : @"#343A4E",
											  @"cabot"                       : @"#EC1C2D",
											  @"cabot2"                      : @"#069766",
											  @"cadillac"                    : @"#BFAC63",
											  @"cadillac2"                   : @"#A50023",
											  @"cadillac3"                   : @"#1D2489",
											  @"california"                  : @"#12007F",
											  @"california2"                 : @"#FADA1F",
											  @"californiaBlue"              : @"#12007F",
											  @"californiaGold"              : @"#FADA1F",
											  @"californiapizzakitchen"      : @"#FEE416",
											  @"californiapizzakitchen2"     : @"#000000",
											  @"canon"                       : @"#BC0024",
											  @"canon2"                      : @"#000000",
											  @"carbonmade"                  : @"#613854",
											  @"carlsjr"                     : @"#EA1719",
											  @"carlsjr2"                    : @"#FBC011",
											  @"carrefour"                   : @"#00387B",
											  @"carrefour2"                  : @"#BB1E10",
											  @"carrefour3"                  : @"#F67828",
											  @"carrefour4"                  : @"#237F52",
											  @"carrows"                     : @"#245EB3",
											  @"carrows2"                    : @"#F6E133",
											  @"carrows3"                    : @"#D33551",
											  @"carrs"                       : @"#E2373F",
											  @"carrssafeway"                : @"#E2373F",
											  @"carvel"                      : @"#AF002A",
											  @"casemate"                    : @"#84754E",
											  @"casemate2"                   : @"#A6192E",
											  @"casemate3"                   : @"#DECBA5",
											  @"casemate4"                   : @"#000000",
											  @"champs"                      : @"#008001",
											  @"champssports"                : @"#008001",
											  @"charitywater"                : @"#FFC907",
											  @"charitywater2"               : @"#2E9DF7",
											  @"charitywater3"               : @"#231F20",
											  @"charterone"                  : @"#009966",
											  @"charterone2"                 : @"#014084",
											  @"checkers"                    : @"#CA211F",
											  @"cheddar"                     : @"#FF7243",
											  @"chevrolet"                   : @"#CBAB5B",
											  @"chevy"                       : @"#CBAB5B",
											  @"chevys"                      : @"#DE4144",
											  @"chickfila"                   : @"#DE003B",
											  @"chilis"                      : @"#0E8866",
											  @"chilis2"                     : @"#EE3625",
											  @"chipotle"                    : @"#A20619",
											  @"chipotle2"                   : @"#431302",
											  @"chipotle3"                   : @"#FFFFFF",
											  @"chrysler"                    : @"#6584D9",
											  @"cinnabon"                    : @"#2A3572",
											  @"cinnabon2"                   : @"#FFFFFF",
											  @"cinnabon3"                   : @"#D88F3F",
											  @"citgo"                       : @"#197DC5",
											  @"citgo2"                      : @"#B52427",
											  @"citgo3"                      : @"#F17116",
											  @"citgo4"                      : @"#E21D22",
											  @"citizensbank"                : @"#009966",
											  @"citizensbank2"               : @"#014084",
											  @"citymarket"                  : @"#ED1C24",
											  @"claimjumper"                 : @"#9C703C",
											  @"claimjumper2"                : @"#AA1726",
											  @"cocacola"                    : @"#ED1C16",
											  @"cocosbakery"                 : @"#FBBF24",
											  @"codecademy"                  : @"#F65A5B",
											  @"codecademy2"                 : @"#204056",
											  @"codeschool"                  : @"#616F67",
											  @"codeschool2"                 : @"#C68143",
											  @"coldstone"                   : @"#A92718",
											  @"coldstone2"                  : @"#C69327",
											  @"coldstonecreamery"           : @"#A92718",
											  @"coldstonecreamery2"          : @"#C69327",
											  @"colonialBlue"                : @"#267AA6",
											  @"costco"                      : @"#E31837",
											  @"costco2"                     : @"#00AA01",
											  @"cpk"                         : @"#FEE416",
											  @"cpk2"                        : @"#000000",
											  @"crackerbarrel"               : @"#724316",
											  @"crackerbarrel2"              : @"#EB9E2F",
											  @"craftcms"                    : @"#DA5A47",
											  @"creativemarket"              : @"#8BA753",
											  @"crunchbase"                  : @"#2292A7",
											  @"cub"                         : @"#FF1925",
											  @"culvers"                     : @"#095694",
											  @"cunard"                      : @"#1D1D1B",
											  @"cunard2"                     : @"#AE9A64",
											  @"cunard3"                     : @"#E42313",
											  @"cunard4"                     : @"#8B8C8D",
											  @"cvs"                         : @"#DE0000",
											  @"daimler"                     : @"#263F6A",
											  @"daimler2"                    : @"#182B45",
											  @"daimler3"                    : @"#6B0F24",
											  @"daimler4"                    : @"#193725",
											  @"daimler5"                    : @"#606061",
											  @"dairyqueen"                  : @"#DE3C49",
											  @"dannon"                      : @"#263A77",
											  @"dannon2"                     : @"#CA1E2A",
											  @"dannon3"                     : @"#42B7E0",
											  @"darntough"                   : @"#831A0B",
											  @"darntough2"                  : @"#312F30",
											  @"darntoughsocks"              : @"#831A0B",
											  @"darntoughsocks2"             : @"#312F30",
											  @"daveandbusters"              : @"#205E90",
											  @"daveandbusters2"             : @"#F39C20",
											  @"delaware"                    : @"#267AA6",
											  @"delaware2"                   : @"#EDDE84",
											  @"delectable"                  : @"#334858",
											  @"delectable2"                 : @"#CD595A",
											  @"delectable3"                 : @"#94938F",
											  @"delectable4"                 : @"#A3A7A6",
											  @"delectable5"                 : @"#DBC5B0",
											  @"delectable6"                 : @"#F8DFC2",
											  @"delectable7"                 : @"#F9EBDF",
											  @"delhaize"                    : @"#F40709",
											  @"delhaze"                     : @"#F40709",
											  @"delicious"                   : @"#3399FF",
											  @"delicious2"                  : @"#222222",
											  @"delicious3"                  : @"#EEEEEE",
											  @"dell"                        : @"#0085C3",
											  @"dell10"                      : @"#009BBB",
											  @"dell11"                      : @"#444444",
											  @"dell12"                      : @"#EEEEEE",
											  @"dell2"                       : @"#7AB800",
											  @"dell3"                       : @"#F2AF00",
											  @"dell4"                       : @"#DC5034",
											  @"dell5"                       : @"#CE1126",
											  @"dell6"                       : @"#B7295A",
											  @"dell7"                       : @"#6E2585",
											  @"dell8"                       : @"#71C6C1",
											  @"dell9"                       : @"#5482AB",
											  @"deltaco"                     : @"#84BE38",
											  @"deltaco2"                    : @"#E0211F",
											  @"deltaco3"                    : @"#FECF05",
											  @"dennys"                      : @"#FDDC25",
											  @"dennys2"                     : @"#E03335",
											  @"dentalplans"                 : @"#F99104",
											  @"dentalplans2"                : @"#00B7C9",
											  @"designernews"                : @"#2D72D9",
											  @"designmoo"                   : @"#E64B50",
											  @"designmoo2"                  : @"#DBC65D",
											  @"deviantart"                  : @"#05CC47",
											  @"deviantart2"                 : @"#4DC47D",
											  @"deviantart3"                 : @"#181A1B",
											  @"devour"                      : @"#FF0000",
											  @"dewalt"                      : @"#FEBD17",
											  @"dhl"                         : @"#BA0C2F",
											  @"dhl2"                        : @"#FFCD00",
											  @"dhl3"                        : @"#C9C9C9",
											  @"dicks"                       : @"#257864",
											  @"dickssportinggoods"          : @"#257864",
											  @"dierbergs"                   : @"#FB0115",
											  @"dierbergs2"                  : @"#C1942F",
											  @"dierbergs3"                  : @"#000000",
											  @"dierbersmarket"              : @"#FB0115",
											  @"digg"                        : @"#555555",
											  @"dillons"                     : @"#CB1626",
											  @"directtv"                    : @"#00A6D6",
											  @"directv"                     : @"#00A6D6",
											  @"directv2"                    : @"#00629B",
											  @"directv3"                    : @"#003865",
											  @"disney"                      : @"#42CAC4",
											  @"disqus"                      : @"#2E9FFF",
											  @"django"                      : @"#092E20",
											  @"dollargeneral"               : @"#FFFF01",
											  @"dollarstore"                 : @"#41AA51",
											  @"dollartree"                  : @"#41AA51",
											  @"dominos"                     : @"#0B648F",
											  @"dominos2"                    : @"#E21737",
											  @"donuts"                      : @"#D81860",
											  @"dow"                         : @"#E80033",
											  @"dow2"                        : @"#FDBB30",
											  @"dow3"                        : @"#ED8B00",
											  @"dow4"                        : @"#F15D22",
											  @"dow5"                        : @"#BF0D3E",
											  @"dow6"                        : @"#910048",
											  @"dow7"                        : @"#D0006F",
											  @"dribbble"                    : @"#444444",
											  @"dribbble2"                   : @"#EA4C89",
											  @"dribbble3"                   : @"#8ABA56",
											  @"dribbble4"                   : @"#FF8833",
											  @"dribbble5"                   : @"#00B6E3",
											  @"dribbble6"                   : @"#9BA5A8",
											  @"dropbox"                     : @"#007EE5",
											  @"dropbox2"                    : @"#7B8994",
											  @"dropbox3"                    : @"#47525D",
											  @"dropbox4"                    : @"#3D464D",
											  @"droplr"                      : @"#5654A4",
											  @"drupal"                      : @"#0077C0",
											  @"drupal2"                     : @"#81CEFF",
											  @"drupal3"                     : @"#00598E",
											  @"dunked"                      : @"#2DA9D7",
											  @"dunked2"                     : @"#212A3E",
											  @"dunkindonuts"                : @"#D81860",
											  @"dunkindonuts2"               : @"#FC772A",
											  @"dunkindonuts3"               : @"#8D6E51",
											  @"dunkindonuts4"               : @"#483030",
											  @"dunkingdonuts"               : @"#D81860",
											  @"easyjet"                     : @"#FF6600",
											  @"easyjet2"                    : @"#000000",
											  @"easyjet3"                    : @"#58595B",
											  @"ebay"                        : @"#E53238",
											  @"ebay2"                       : @"#0064D2",
											  @"ebay3"                       : @"#F5AF02",
											  @"ebay4"                       : @"#86B817",
											  @"elance"                      : @"#0D69AF",
											  @"elephantbar"                 : @"#B40D18",
											  @"elephantbar2"                : @"#EC9E31",
											  @"ello"                        : @"#000000",
											  @"elpolloloco"                 : @"#F8EC10",
											  @"elpolloloco2"                : @"#D72226",
											  @"elpolloloco3"                : @"#F3961B",
											  @"eltorito"                    : @"#BE2633",
											  @"eltorito2"                   : @"#E6B52C",
											  @"eltorito3"                   : @"#18573B",
											  @"ember"                       : @"#F23819",
											  @"engadget"                    : @"#40B3FF",
											  @"envato"                      : @"#82B541",
											  @"ericsson"                    : @"#002561",
											  @"esl"                         : @"#0D9DDB",
											  @"esl2"                        : @"#48B8E7",
											  @"esl3"                        : @"#EFECEA",
											  @"esl4"                        : @"#2C2B2B",
											  @"espn"                        : @"#FF0033",
											  @"etrade"                      : @"#6633CC",
											  @"etrade2"                     : @"#99CC00",
											  @"etsy"                        : @"#D5641C",
											  @"evernote"                    : @"#7AC142",
											  @"evernote2"                   : @"#808084",
											  @"fabcom"                      : @"#DD0017",
											  @"fabcom2"                     : @"#000000",
											  @"facebook"                    : @"#3B5998",
											  @"fairfieldinn"                : @"#6CADDF",
											  @"fairfieldinn2"               : @"#B06010",
											  @"fairfieldinn3"               : @"#004990",
											  @"fairfieldinn4"               : @"#B5099C",
											  @"fairfieldinn5"               : @"#D5E04D",
											  @"fairfieldinn6"               : @"#CFD4D8",
											  @"fairfieldinn7"               : @"#934F46",
											  @"fairfieldinn8"               : @"#056CB6",
											  @"familydollar"                : @"#FD4837",
											  @"familydollar2"               : @"#FFAD3F",
											  @"familyfare"                  : @"#F22D08",
											  @"famous"                      : @"#FA5C4F",
											  @"famous2"                     : @"#333333",
											  @"fancy"                       : @"#3098DC",
											  @"fancy2"                      : @"#494E58",
											  @"farmerboys"                  : @"#145559",
											  @"farmerboys2"                 : @"#F4DFA8",
											  @"farmerboys3"                 : @"#DE6037",
											  @"farmfresh"                   : @"#02642F",
											  @"farmfresh2"                  : @"#1ABB53",
											  @"farmfresh3"                  : @"#F5ED0E",
											  @"farmfresh4"                  : @"#F11926",
											  @"fatburger"                   : @"#F7EF93",
											  @"fatburger2"                  : @"#D23839",
											  @"federalexpress"              : @"#660099",
											  @"fedex"                       : @"#660099",
											  @"fedex2"                      : @"#FF6600",
											  @"fedex3"                      : @"#00CC00",
											  @"fedex4"                      : @"#0099CC",
											  @"fedex5"                      : @"#FF0033",
											  @"fedex6"                      : @"#FFCC00",
											  @"fedex7"                      : @"#999999",
											  @"ferrari"                     : @"#FF2800",
											  @"fiat"                        : @"#96172E",
											  @"fiat2"                       : @"#6D2D41",
											  @"firefox"                     : @"#E66000",
											  @"firefox2"                    : @"#FF9500",
											  @"firefox3"                    : @"#FFCB00",
											  @"firefox4"                    : @"#00539F",
											  @"firefox5"                    : @"#0095DD",
											  @"firefox6"                    : @"#331E54",
											  @"firefox7"                    : @"#002147",
											  @"fitbit"                      : @"#4CC2C4",
											  @"fitbit2"                     : @"#F54785",
											  @"fitbit3"                     : @"#343434",
											  @"fiveguys"                    : @"#ED174F",
											  @"fiveguys2"                   : @"#FBB040",
											  @"fiveguys3"                   : @"#EFC402",
											  @"fiveguys4"                   : @"#D4891C",
											  @"fivehundredpix"              : @"#0099E5",
											  @"fivehundredpx"               : @"#0099E5",
											  @"fivehundredpx2"              : @"#FF4C4C",
											  @"fivehundredpx3"              : @"#34BF49",
											  @"flattr"                      : @"#F67C1A",
											  @"flattr2"                     : @"#338D11",
											  @"flavorsme"                   : @"#F10087",
											  @"flavorsme2"                  : @"#009AE7",
											  @"flickr"                      : @"#0063DC",
											  @"flickr2"                     : @"#FF0084",
											  @"flipboard"                   : @"#E12828",
											  @"flixster"                    : @"#2971B2",
											  @"florida"                     : @"#F87E1A",
											  @"florida2"                    : @"#F70018",
											  @"florida3"                    : @"#FFFFFF",
											  @"floridaOrange"               : @"#F87E1A",
											  @"follr"                       : @"#4DC9F6",
											  @"follr2"                      : @"#F67019",
											  @"follr3"                      : @"#F53794",
											  @"follr4"                      : @"#537BC4",
											  @"follr5"                      : @"#ACC236",
											  @"food4less"                   : @"#000000",
											  @"food4less2"                  : @"#F9E800",
											  @"foodlion"                    : @"#004B82",
											  @"foodlion2"                   : @"#000000",
											  @"foodsco"                     : @"#00A03E",
											  @"footlocker"                  : @"#CC2527",
											  @"ford"                        : @"#317AB4",
											  @"fordmotorcompany"            : @"#317AB4",
											  @"forever21"                   : @"#FFE91A",
											  @"forrst"                      : @"#5B9A68",
											  @"fourormat"                   : @"#FB0A2A",
											  @"foursquare"                  : @"#F94877",
											  @"foursquare2"                 : @"#0732A2",
											  @"foursquare3"                 : @"#2D5BE3",
											  @"fredmeyer"                   : @"#ED1C24",
											  @"fredmeyers"                  : @"#ED1C24",
											  @"friendlys"                   : @"#FD0B02",
											  @"frys"                        : @"#EC1C2C",
											  @"frys2"                       : @"#000000",
											  @"gap"                         : @"#005F01",
											  @"garmin"                      : @"#007CC3",
											  @"geico"                       : @"#002366",
											  @"generalmotors"               : @"#13007F",
											  @"geocaching"                  : @"#4A742C",
											  @"gerbes"                      : @"#CB1626",
											  @"ghost"                       : @"#212425",
											  @"ghost2"                      : @"#718087",
											  @"ghost3"                      : @"#5BA4E5",
											  @"ghost4"                      : @"#9FBB58",
											  @"ghost5"                      : @"#E9E8DD",
											  @"gibson"                      : @"#000000",
											  @"gibson2"                     : @"#436F8E",
											  @"gibson3"                     : @"#887D59",
											  @"gibson4"                     : @"#8F9696",
											  @"gimmebar"                    : @"#D6156C",
											  @"github"                      : @"#4183C4",
											  @"github2"                     : @"#999999",
											  @"github3"                     : @"#666666",
											  @"github4"                     : @"#333333",
											  @"github5"                     : @"#6CC644",
											  @"github6"                     : @"#BD2C00",
											  @"github7"                     : @"#FF9933",
											  @"gittip"                      : @"#663300",
											  @"gittip2"                     : @"#339966",
											  @"godaddy"                     : @"#7DB701",
											  @"godaddy2"                    : @"#FF8A00",
											  @"goldencorral"                : @"#A12720",
											  @"goldencorral2"               : @"#F9CA76",
											  @"goldencorral3"               : @"#F7E3AB",
											  @"goodreads"                   : @"#553B08",
											  @"google"                      : @"#4285F4",
											  @"google2"                     : @"#DB4437",
											  @"google3"                     : @"#F4B400",
											  @"google4"                     : @"#0F9D58",
											  @"google5"                     : @"#E7E6DD",
											  @"googleplus"                  : @"#DD4B39",
											  @"gravatar"                    : @"#1E8CBE",
											  @"greatclips"                  : @"#000000",
											  @"groceries"                   : @"#004521",
											  @"grocery"                     : @"#004521",
											  @"grocerystore"                : @"#004521",
											  @"groupon"                     : @"#82B548",
											  @"guitarcenter"                : @"#F52132",
											  @"hackernews"                  : @"#FF6600",
											  @"handm"                       : @"#FE0001",
											  @"hannaford"                   : @"#EC1B2E",
											  @"hannaford2"                  : @"#2FB456",
											  @"hannaford3"                  : @"#916DAF",
											  @"hannaford4"                  : @"#FEE198",
											  @"hardees"                     : @"#EA1719",
											  @"hardees2"                    : @"#FBC011",
											  @"hardrock"                    : @"#F5B103",
											  @"hardrock2"                   : @"#993520",
											  @"harristeeter"                : @"#DB0205",
											  @"harristeeter2"               : @"#01AD5F",
											  @"harristeeter3"               : @"#256D9F",
											  @"harristeeter4"               : @"#F8B366",
											  @"harristeeter5"               : @"#F6434E",
											  @"harristeeter6"               : @"#01A475",
											  @"heb"                         : @"#FE0002",
											  @"hebplus"                     : @"#0292D0",
											  @"heineken"                    : @"#00A100",
											  @"heineken2"                   : @"#FF2B00",
											  @"heineken3"                   : @"#999999",
											  @"hellowallet"                 : @"#0093D0",
											  @"heroku"                      : @"#C9C3E6",
											  @"heroku2"                     : @"#6762A6",
											  @"hertz"                       : @"#FFD60D",
											  @"hesburger"                   : @"#EB343A",
											  @"hesburger2"                  : @"#0C6FAC",
											  @"hewlettpackard"              : @"#0096D6",
											  @"hewlettpackard2"             : @"#D7410B",
											  @"hi5"                         : @"#FD9827",
											  @"hilander"                    : @"#008000",
											  @"hilton"                      : @"#003150",
											  @"hilton2"                     : @"#000000",
											  @"hilton3"                     : @"#FFFFFF",
											  @"hobbylobby"                  : @"#DE6820",
											  @"homedepot"                   : @"#F96305",
											  @"homegoods"                   : @"#D31241",
											  @"homeimprovement"             : @"#F96305",
											  @"hooters"                     : @"#F94E04",
											  @"hootsuite"                   : @"#003265",
											  @"hootsuite2"                  : @"#F7E8D5",
											  @"hootsuite3"                  : @"#FFBD0A",
											  @"hootsuite4"                  : @"#C6AF92",
											  @"hootsuite5"                  : @"#71685F",
											  @"hootsuite6"                  : @"#54493F",
											  @"hootsuite7"                  : @"#38322D",
											  @"hornbachers"                 : @"#EF3C46",
											  @"hotdogonastick"              : @"#E8002F",
											  @"hotdogonastick2"             : @"#FCFF22",
											  @"hotdogonastick3"             : @"#3049EE",
											  @"houzz"                       : @"#7AC142",
											  @"houzz2"                      : @"#000000",
											  @"hp"                          : @"#0096D6",
											  @"hp2"                         : @"#D7410B",
											  @"hsbc"                        : @"#DB0011",
											  @"html5"                       : @"#E34F26",
											  @"huddlehouse"                 : @"#9D2E2F",
											  @"huddlehouse2"                : @"#662D37",
											  @"huddlehouse3"                : @"#E79D54",
											  @"hulu"                        : @"#A5CD39",
											  @"hulu2"                       : @"#6BB03E",
											  @"hungryjacks"                 : @"#EC1C24",
											  @"hungryjacks2"                : @"#FDBD10",
											  @"hungryjacks3"                : @"#0066B2",
											  @"hungryjacks4"                : @"#ED7902",
											  @"hyundai"                     : @"#2048A1",
											  @"hyundai2"                    : @"#25AA51",
											  @"hyundai3"                    : @"#F8BB25",
											  @"ibm"                         : @"#006699",
											  @"idaho"                       : @"#F70018",
											  @"idaho2"                      : @"#178303",
											  @"idaho3"                      : @"#FADA1F",
											  @"identica"                    : @"#789240",
											  @"identica2"                   : @"#7D0100",
											  @"identica3"                   : @"#8BAAFF",
											  @"ifttt"                       : @"#33CCFF",
											  @"ifttt2"                      : @"#FF4400",
											  @"ifttt3"                      : @"#000000",
											  @"iheartradio"                 : @"#C6002B",
											  @"ihop"                        : @"#178BCD",
											  @"ihop2"                       : @"#EC4135",
											  @"ikea"                        : @"#FFCC00",
											  @"ikea2"                       : @"#003399",
											  @"imdb"                        : @"#F5DE50",
											  @"imgur"                       : @"#85BF25",
											  @"indiana"                     : @"#3000FD",
											  @"indiana2"                    : @"#FADA1F",
											  @"indiegogo"                   : @"#EB1478",
											  @"innout"                      : @"#D00825",
											  @"innout2"                     : @"#FCF65A",
											  @"innout3"                     : @"#000000",
											  @"instacart"                   : @"#60AB59",
											  @"instagram"                   : @"#3F729B",
											  @"instapaper"                  : @"#000000",
											  @"instapaper2"                 : @"#428BCA",
											  @"intel"                       : @"#0F7DC2",
											  @"intuit"                      : @"#365EBF",
											  @"ios"                         : @"#5FC9F8",
											  @"ios2"                        : @"#FECB2E",
											  @"ios3"                        : @"#FD9426",
											  @"ios4"                        : @"#FC3158",
											  @"ios5"                        : @"#147EFB",
											  @"ios6"                        : @"#53D769",
											  @"ios7"                        : @"#FC3D39",
											  @"ios8"                        : @"#8E8E93",
											  @"jackinthebox"                : @"#FF0000",
											  @"jacknthebox"                 : @"#FF0000",
											  @"jambajuice"                  : @"#602C06",
											  @"jawbone"                     : @"#000000",
											  @"jayc"                        : @"#C40000",
											  @"jcpenney"                    : @"#ED1D25",
											  @"jcpenneys"                   : @"#2E3094",
											  @"jcpenny"                     : @"#ED1D25",
											  @"jeep"                        : @"#49612C",
											  @"jerseymikes"                 : @"#1F4873",
											  @"jerseymikes2"                : @"#CE3A33",
											  @"jimmyjohns"                  : @"#DF3740",
											  @"jimmyjohns2"                 : @"#000000",
											  @"jimmyjohns3"                 : @"#FFFFFF",
											  @"joann"                       : @"#0B3B31",
											  @"joannfabric"                 : @"#0B3B31",
											  @"joannfabrics"                : @"#0B3B31",
											  @"joescrabshack"               : @"#5695F7",
											  @"joescrabshack2"              : @"#FD1900",
											  @"johnnyrockets"               : @"#C62034",
											  @"johnnyrockets2"              : @"#F9C652",
											  @"johnnyrockets3"              : @"#C5453B",
                                              @"johnnyrockets4"              : @"#397CA4",
											  @"jordans"                     : @"#31312F",
											  @"jordansfurniture"            : @"#31312F",
											  @"joyent"                      : @"#FF6600",
											  @"keeeb"                       : @"#00A9C0",
											  @"kfc"                         : @"#A00A0E",
											  @"kfc2"                        : @"#090909",
											  @"kfc3"                        : @"#F8E9D8",
											  @"khanacademy"                 : @"#9CB443",
											  @"khanacademy2"                : @"#242F3A",
											  @"kia"                         : @"#C21A30",
											  @"kickstarter"                 : @"#2BDE73",
											  @"kickstarter2"                : @"#0F2105",
											  @"kingsoopers"                 : @"#ED1C24",
											  @"kingsoopers2"                : @"#FFF200",
											  @"kinkos"                      : @"#00008C",
											  @"kinkos2"                     : @"#ED2838",
											  @"kippt"                       : @"#D51007",
											  @"kitkat"                      : @"#D70021",
											  @"kiwipay"                     : @"#00B0DF",
											  @"kmart"                       : @"#E31937",
											  @"kohls"                       : @"#87233D",
											  @"krispykreme"                 : @"#00744F",
											  @"krispykreme2"                : @"#CC1241",
											  @"kroger"                      : @"#2460A6",
											  @"kroger2"                     : @"#D82226",
											  @"laravel"                     : @"#F55247",
											  @"lastfm"                      : @"#D51007",
											  @"lasvegas"                    : @"#191919",
											  @"lasvegas2"                   : @"#3000FD",
											  @"linkedin"                    : @"#0077B5",
											  @"linkedin2"                   : @"#000000",
											  @"linkedin3"                   : @"#313335",
											  @"linkedin4"                   : @"#86888A",
											  @"linkedin5"                   : @"#CACCCE",
											  @"linkedin6"                   : @"#00A0DC",
											  @"linkedin7"                   : @"#8D6CAB",
											  @"linkedin8"                   : @"#DD5143",
											  @"linkedin9"                   : @"#E68523",
											  @"littlecaesars"               : @"#F5790D",
											  @"littlecaesars2"              : @"#12110E",
											  @"livestream"                  : @"#CF202E",
											  @"livestream2"                 : @"#232121",
											  @"livestream3"                 : @"#F78822",
											  @"livestream4"                 : @"#F6DB35",
											  @"livestream5"                 : @"#6DC067",
											  @"livestream6"                 : @"#4185BE",
											  @"livestream7"                 : @"#8F499C",
											  @"llbean"                      : @"#4D6E3B",
											  @"lloyds"                      : @"#D81F2A",
											  @"lloyds2"                     : @"#FF9900",
											  @"lloyds3"                     : @"#E0D86E",
											  @"lloyds4"                     : @"#9EA900",
											  @"lloyds5"                     : @"#6EC9E0",
											  @"lloyds6"                     : @"#007EA3",
											  @"lloyds7"                     : @"#9E4770",
											  @"lloyds8"                     : @"#631D76",
											  @"lloyds9"                     : @"#1E1E1E",
											  @"lomo"                        : @"#EB0028",
											  @"lomo2"                       : @"#00A0DF",
											  @"longjohnsilvers"             : @"#1C4289",
											  @"longjohnsilvers2"            : @"#30A99C",
											  @"longjohnsilvers3"            : @"#D7867A",
											  @"losangeles"                  : @"#12007F",
											  @"losangeles2"                 : @"#FADA1F",
											  @"louisiana"                   : @"#3000FD",
											  @"louisiana2"                  : @"#FFFFFF",
											  @"louisiana3"                  : @"#FADA1F",
											  @"lowes"                       : @"#009001",
											  @"lucky"                       : @"#123156",
											  @"luckybrand"                  : @"#123156",
											  @"lumo"                        : @"#576396",
											  @"lyft"                        : @"#D71472",
											  @"lyft2"                       : @"#333E48",
											  @"lyft3"                       : @"#C2BCB5",
											  @"lyft4"                       : @"#FCDCF0",
											  @"lyft5"                       : @"#85A6C7",
											  @"lyft6"                       : @"#00B2A9",
											  @"lyft7"                       : @"#9BD9D9",
											  @"macaronigrill"               : @"#6E2E3A",
											  @"macaronigrill2"              : @"#566E15",
											  @"macaronigrill3"              : @"#BD1524",
											  @"macys"                       : @"#E80101",
											  @"mailchimp"                   : @"#2C9AB7",
											  @"mailchimp2"                  : @"#449A88",
											  @"mailchimp3"                  : @"#FEBE12",
											  @"mailchimp4"                  : @"#DB3A1B",
											  @"mailchimp5"                  : @"#373737",
											  @"marketbasket"                : @"#CC0001",
											  @"marketbasket2"               : @"#0473CC",
											  @"marriott"                    : @"#9D102D",
											  @"marriott2"                   : @"#6C193F",
											  @"marriott3"                   : @"#D21034",
											  @"marriott4"                   : @"#D60077",
											  @"marriott5"                   : @"#FF5C00",
											  @"marriott6"                   : @"#767A7D",
											  @"marshalls"                   : @"#009901",
											  @"marykay"                     : @"#F81F69",
											  @"maryland"                    : @"#F70018",
											  @"maryland2"                   : @"#FFFFFF",
											  @"maryland3"                   : @"#000000",
											  @"maryland4"                   : @"#FADA1F",
											  @"massachusetts"               : @"#3000FD",
											  @"massachusetts2"              : @"#198B03",
											  @"massachusetts3"              : @"#BE083D",
											  @"massygroup"                  : @"#004A77",
											  @"massygroup2"                 : @"#00ADEE",
											  @"massygroup3"                 : @"#FF8100",
											  @"massygroup4"                 : @"#FFD200",
											  @"mastercard"                  : @"#CC0000",
											  @"mastercard2"                 : @"#FF9900",
											  @"mastercard3"                 : @"#000066",
											  @"mbta"                        : @"#000000",
											  @"mccafe"                      : @"#571205",
											  @"mccafe2"                     : @"#DFB89E",
											  @"mcdonalds"                   : @"#FCC910",
											  @"meetup"                      : @"#E0393E",
											  @"meh"                         : @"#FF6A00",
											  @"mehcom"                      : @"#FF6A00",
											  @"mercedes"                    : @"#000000",
											  @"mercedesbenz"                : @"#000000",
											  @"mercuryautoinsurance"        : @"#470507",
											  @"mercuryinsurance"            : @"#470507",
											  @"miami"                       : @"#F87E1A",
											  @"microsoft"                   : @"#F65314",
											  @"microsoft2"                  : @"#7CBB00",
											  @"microsoft3"                  : @"#00A1F1",
											  @"microsoft4"                  : @"#FFBB00",
											  @"microsoftoffice"             : @"#EA3E23",
											  @"mimiscafe"                   : @"#C23F38",
											  @"mixpanel"                    : @"#A086D3",
											  @"momofuku"                    : @"#F1B53C",
											  @"momofuku2"                   : @"#66AC4E",
											  @"motorola"                    : @"#5C92FA",
											  @"mrsfields"                   : @"#C41D34",
											  @"music"                       : @"#C9DF3A",
											  @"muut"                        : @"#1FADC5",
											  @"muut2"                       : @"#FF8000",
											  @"myspace"                     : @"#000000",
											  @"nandos"                      : @"#D71E30",
											  @"nandos2"                     : @"#000000",
											  @"nbc"                         : @"#E1AC26",
											  @"nbc2"                        : @"#DC380F",
											  @"nbc3"                        : @"#9F0812",
											  @"nbc4"                        : @"#6347B2",
											  @"nbc5"                        : @"#368DD5",
											  @"nbc6"                        : @"#70AF1E",
											  @"nbc7"                        : @"#7E887A",
											  @"nest"                        : @"#00AFD8",
											  @"nest2"                       : @"#7B858E",
											  @"netflix"                     : @"#E50914",
											  @"netflix2"                    : @"#221F1F",
											  @"netflix3"                    : @"#F5F5F1",
											  @"netvibes"                    : @"#39BD00",
											  @"nevada"                      : @"#191919",
											  @"nevada2"                     : @"#3000FD",
											  @"newbalance"                  : @"#CE2724",
											  @"newbalance2"                 : @"#F3EC19",
											  @"newbalance3"                 : @"#207C88",
											  @"newbalance4"                 : @"#AAC1BF",
											  @"newbalance5"                 : @"#E8E9D7",
											  @"newbalance6"                 : @"#4C4D4F",
											  @"newbalance7"                 : @"#231F20",
											  @"newjersey"                   : @"#EDDE84",
											  @"newjersey2"                  : @"#3000FD",
											  @"newmexico"                   : @"#F70018",
											  @"newmexico2"                  : @"#FCFF21",
											  @"newyork"                     : @"#12007F",
											  @"newyork2"                    : @"#FADA1F",
											  @"nextdoor"                    : @"#19975D",
											  @"nike"                        : @"#504847",
											  @"nikefootball"                : @"#504847",
											  @"nikefootball2"               : @"#27A770",
											  @"nikefuel"                    : @"#4BAD31",
											  @"nikefuel2"                   : @"#F5DC00",
											  @"nikefuel3"                   : @"#E95814",
											  @"nikefuel4"                   : @"#E2142D",
											  @"nokia"                       : @"#124191",
											  @"nordstrom"                   : @"#000000",
											  @"nordstrom2"                  : @"#BFBFBF",
											  @"northcarolina"               : @"#F70018",
											  @"northcarolina2"              : @"#3000FD",
											  @"novartis"                    : @"#765438",
											  @"novartis2"                   : @"#A13323",
											  @"novartis3"                   : @"#E65124",
											  @"novartis4"                   : @"#EC7F22",
											  @"novartis5"                   : @"#F8B22A",
											  @"novartis6"                   : @"#FFD430",
											  @"npm"                         : @"#CB3837",
											  @"nshipster"                   : @"#EE7F2B",
											  @"nvidia"                      : @"#76B900",
											  @"oculus"                      : @"#427AE9",
											  @"oculus2"                     : @"#3D3D3D",
											  @"office"                      : @"#F3153C",
											  @"officedepot"                 : @"#F3153C",
											  @"ohio"                        : @"#F70018",
											  @"ohio2"                       : @"#FFFFFF",
											  @"ohio3"                       : @"#3000FD",
											  @"oklahoma"                    : @"#178301",
											  @"oklahoma2"                   : @"#FFFFFF",
											  @"oldnavy"                     : @"#0C4474",
											  @"olivegarden"                 : @"#523119",
											  @"olivegarden2"                : @"#88872A",
											  @"olivegarden3"                : @"#D2C6BD",
											  @"olympus"                     : @"#08107B",
											  @"olympus2"                    : @"#DFB226",
											  @"olympus3"                    : @"#777777",
											  @"opera"                       : @"#CC0F16",
											  @"opera2"                      : @"#9C9E9F",
											  @"oracle"                      : @"#FF0000",
											  @"oracle2"                     : @"#000000",
											  @"oracle3"                     : @"#7F7F7F",
											  @"oregon"                      : @"#12007F",
											  @"oregon2"                     : @"#FADA1F",
											  @"oreilly"                     : @"#01AD6B",
											  @"outback"                     : @"#8B191D",
											  @"outback2"                    : @"#F5EFD0",
											  @"owens"                       : @"#FF0000",
											  @"oxford"                      : @"#002147",
											  @"oxforduniversity"            : @"#002147",
											  @"oxforduniversitypress"       : @"#002147",
											  @"oxforduniversitypress2"      : @"#000000",
											  @"oxforduniversitypress3"      : @"#666666",
											  @"pamperedchef"                : @"#312D5F",
											  @"panasonic"                   : @"#0F58A8",
											  @"panasonic2"                  : @"#000000",
											  @"pandaexpress"                : @"#CC1C41",
											  @"pandaexpress2"               : @"#000000",
											  @"pandaexpress3"               : @"#FFFFFF",
											  @"pandora"                     : @"#005483",
											  @"panera"                      : @"#728F33",
											  @"panera2"                     : @"#B4C985",
											  @"panera3"                     : @"#ECC56D",
											  @"panera4"                     : @"#64829B",
											  @"panera5"                     : @"#EBB479",
											  @"panerabread"                 : @"#728F33",
											  @"panerabread2"                : @"#B4C985",
											  @"panerabread3"                : @"#ECC56D",
											  @"panerabread4"                : @"#64829B",
											  @"panerabread5"                : @"#EBB479",
											  @"panerabreadco"               : @"#728F33",
											  @"panerabreadco2"              : @"#B4C985",
											  @"panerabreadco3"              : @"#ECC56D",
											  @"panerabreadco4"              : @"#64829B",
											  @"panerabreadco5"              : @"#EBB479",
											  @"panerabreadcompany"          : @"#728F33",
											  @"panerabreadcompany2"         : @"#B4C985",
											  @"panerabreadcompany3"         : @"#ECC56D",
											  @"panerabreadcompany4"         : @"#64829B",
											  @"panerabreadcompany5"         : @"#EBB479",
											  @"paris"                       : @"#1A1394",
											  @"paris2"                      : @"#E5153E",
											  @"partycity"                   : @"#6C76BE",
											  @"path"                        : @"#EE3423",
											  @"pavilions"                   : @"#E2373F",
											  @"payless"                     : @"#DF8C42",
											  @"payless2"                    : @"#89C5EC",
											  @"paylessshoesource"           : @"#DF8C42",
											  @"paylessshoesource2"          : @"#89C5EC",
											  @"paylesssupermarket"          : @"#FF0000",
											  @"paylesssupermarket2"         : @"#008832",
											  @"paylesssupermarkets"         : @"#FF0000",
											  @"paylesssupermarkets2"        : @"#008832",
											  @"paymill"                     : @"#F05000",
											  @"paypal"                      : @"#003087",
											  @"paypal2"                     : @"#009CDE",
											  @"paypal3"                     : @"#012169",
											  @"pearson"                     : @"#ED6B06",
											  @"pearson2"                    : @"#9D1348",
											  @"pearson3"                    : @"#008B5D",
											  @"pearson4"                    : @"#364395",
											  @"peets"                       : @"#BB9A6A",
											  @"peets2"                      : @"#080000",
											  @"peets3"                      : @"#F5F5E8",
											  @"peetscoffee"                 : @"#BB9A6A",
											  @"peetscoffee2"                : @"#080000",
											  @"peetscoffee3"                : @"#F5F5E8",
											  @"penguinbooks"                : @"#FF6900",
											  @"pennsylvania"                : @"#3E376D",
											  @"pennsylvania2"               : @"#FADA1F",
											  @"pepboys"                     : @"#CB0D27",
											  @"pepsi"                       : @"#E32934",
											  @"pepsi2"                      : @"#004883",
											  @"petsmart"                    : @"#0068B3",
											  @"petsmart2"                   : @"#E51837",
											  @"pfchangs"                    : @"#6A2717",
											  @"pfchangs2"                   : @"#9B6C50",
											  @"pfchangs3"                   : @"#000000",
											  @"pfizer"                      : @"#0093D0",
											  @"pfizer10"                    : @"#F8971D",
											  @"pfizer11"                    : @"#F7D417",
											  @"pfizer12"                    : @"#4A245E",
											  @"pfizer13"                    : @"#F26649",
											  @"pfizer2"                     : @"#000000",
											  @"pfizer3"                     : @"#616365",
											  @"pfizer4"                     : @"#00AEEF",
											  @"pfizer5"                     : @"#D6006E",
											  @"pfizer6"                     : @"#75D1E0",
											  @"pfizer7"                     : @"#7DBA00",
											  @"pfizer8"                     : @"#CC292B",
											  @"pfizer9"                     : @"#00A950",
											  @"philips"                     : @"#0E5FD8",
											  @"photobucket"                 : @"#0EA0DB",
											  @"photobucket2"                : @"#000000",
											  @"pickupstix"                  : @"#F9B717",
											  @"pickupstix2"                 : @"#000000",
											  @"pickupstix3"                 : @"#C3112F",
											  @"pier1"                       : @"#00BC01",
											  @"pier1imports"                : @"#00BC01",
											  @"pierone"                     : @"#00BC01",
											  @"pieroneimports"              : @"#00BC01",
											  @"pinboard"                    : @"#0000E6",
											  @"pinterest"                   : @"#CC2127",
											  @"pitapit"                     : @"#14984A",
											  @"pitapit2"                    : @"#C34833",
											  @"pizzahut"                    : @"#EE3124",
											  @"pizzahut2"                   : @"#00A160",
											  @"pizzahut3"                   : @"#FFC425",
											  @"planethollywood"             : @"#7E147F",
											  @"planethollywood2"            : @"#5899E3",
											  @"planethollywood3"            : @"#F40604",
											  @"plasso"                      : @"#6585ED",
											  @"plasso2"                     : @"#F5756C",
											  @"plasso3"                     : @"#98AFC0",
											  @"plasso4"                     : @"#2F3148",
											  @"plaxo"                       : @"#414F5A",
											  @"playstation"                 : @"#003087",
											  @"pocket"                      : @"#D3505A",
											  @"pocket2"                     : @"#478F8F",
											  @"popeyes"                     : @"#F48021",
											  @"portfolium"                  : @"#0099FF",
											  @"portfolium2"                 : @"#FB0A2A",
											  @"portfolium3"                 : @"#17AD49",
											  @"portfolium4"                 : @"#333333",
											  @"postmates"                   : @"#000000",
											  @"postmates2"                  : @"#36454F",
											  @"potbelly"                    : @"#F9A404",
											  @"potbelly2"                   : @"#000000",
											  @"prezi"                       : @"#318BFF",
											  @"priceline"                   : @"#1885BF",
											  @"priceright"                  : @"#245BAD",
											  @"priceright2"                 : @"#F62320",
											  @"pricerite"                   : @"#245BAD",
											  @"pricerite2"                  : @"#F62320",
											  @"producthunt"                 : @"#DA552F",
											  @"producthunt2"                : @"#534540",
											  @"producthunt3"                : @"#988F8C",
											  @"producthunt4"                : @"#00B27F",
											  @"publics"                     : @"#3E902D",
											  @"publix"                      : @"#3E902D",
											  @"pullmanBrownUPSBrown"        : @"#632217",
											  @"qdoba"                       : @"#E9DECB",
											  @"qdoba2"                      : @"#3F2415",
											  @"qfc"                         : @"#0070C0",
											  @"qfc2"                        : @"#FFEE00",
											  @"quiznos"                     : @"#52753B",
											  @"quiznos2"                    : @"#E11F26",
											  @"quiznos3"                    : @"#CFAD80",
											  @"quora"                       : @"#A82400",
											  @"quotefm"                     : @"#66CEFF",
											  @"raiz"                        : @"#000000",
											  @"raizlabs"                    : @"#000000",
											  @"ralphlauren"                 : @"#1C1C1C",
											  @"ralphs"                      : @"#F61B31",
											  @"randalls"                    : @"#23449A",
											  @"randalls2"                   : @"#E2373F",
											  @"razer"                       : @"#00FF00",
											  @"rdio"                        : @"#007DC3",
											  @"readability"                 : @"#990000",
											  @"recipe"                      : @"#004521",
											  @"redcross"                    : @"#ED1B2E",
											  @"reddit"                      : @"#FF4500",
											  @"reddit2"                     : @"#5F99CF",
											  @"reddit3"                     : @"#CEE3F8",
											  @"redfin"                      : @"#A02021",
											  @"redhat"                      : @"#CC0000",
											  @"redlobster"                  : @"#DF163C",
											  @"redlobster2"                 : @"#000000",
											  @"redrobin"                    : @"#F30605",
											  @"redrobin2"                   : @"#F9DA1F",
											  @"redrobin3"                   : @"#CB2E1B",
											  @"rei"                         : @"#4E5C38",
											  @"rei2"                        : @"#C5C120",
											  @"rentler"                     : @"#ED1C27",
											  @"reverbnation"                : @"#E43526",
											  @"riteaid"                     : @"#091190",
											  @"riteaid2"                    : @"#FF0103",
											  @"robeks"                      : @"#EC4122",
											  @"robeks2"                     : @"#71AE4D",
											  @"rockpack"                    : @"#0BA6AB",
											  @"roku"                        : @"#6F1AB1",
											  @"rollsroyce"                  : @"#680021",
											  @"rollsroyce2"                 : @"#FFFAEC",
											  @"rollsroyce3"                 : @"#939598",
											  @"rollsroyce4"                 : @"#000000",
											  @"rookids"                     : @"#E22027",
											  @"rookids2"                    : @"#A1CD3D",
											  @"rookids3"                    : @"#003E70",
											  @"roon"                        : @"#62B0D9",
											  @"ross"                        : @"#00B201",
											  @"rounds"                      : @"#FDD800",
											  @"royalahold"                  : @"#0662A8",
											  @"rss"                         : @"#F26522",
											  @"rss2"                        : @"#F26522",
											  @"rubytuesday"                 : @"#C91641",
											  @"rubytuesday2"                : @"#000000",
											  @"safari"                      : @"#329CCB",
											  @"safari2"                     : @"#E52D3C",
											  @"safari3"                     : @"#AEADAD",
											  @"safeway"                     : @"#E2373F",
											  @"sainsburys"                  : @"#EC8A00",
											  @"salesforce"                  : @"#1798C1",
											  @"salesforce2"                 : @"#FF1100",
											  @"samsclub"                    : @"#008D01",
											  @"samsclub2"                   : @"#5D9732",
											  @"samsung"                     : @"#1428A0",
											  @"samsung10"                   : @"#00A9E0",
											  @"samsung11"                   : @"#009CA6",
											  @"samsung12"                   : @"#00B140",
											  @"samsung2"                    : @"#75787B",
											  @"samsung3"                    : @"#0689D8",
											  @"samsung4"                    : @"#FFC600",
											  @"samsung5"                    : @"#FF6900",
											  @"samsung6"                    : @"#E4002B",
											  @"samsung7"                    : @"#C800A1",
											  @"samsung8"                    : @"#685BC7",
											  @"samsung9"                    : @"#0057B8",
											  @"sap"                         : @"#003366",
											  @"sap2"                        : @"#999999",
											  @"savealot"                    : @"#EC151B",
											  @"savealot2"                   : @"#004FA3",
											  @"sbarro"                      : @"#EB1C23",
											  @"sbarro2"                     : @"#338B48",
											  @"sbarro3"                     : @"#000000",
											  @"schlotzskys"                 : @"#D0242C",
											  @"schnucks"                    : @"#ED1C24",
											  @"schnuks"                     : @"#ED1C24",
											  @"scotts"                      : @"#EB0F1D",
											  @"scouts"                      : @"#CE1126",
											  @"scouts2"                     : @"#003F87",
											  @"scribd"                      : @"#1A7BBA",
											  @"sears"                       : @"#142591",
											  @"sears2"                      : @"#F22327",
											  @"seattlesbest"                : @"#B2B7C1",
											  @"seattlesbest2"               : @"#D61F2F",
											  @"seaworld"                    : @"#323F75",
											  @"serta"                       : @"#0E285B",
											  @"serta2"                      : @"#FCF622",
											  @"shakeshack"                  : @"#64B251",
											  @"shakeshack2"                 : @"#000000",
											  @"shaws"                       : @"#EC8D3D",
											  @"shaws2"                      : @"#79B959",
											  @"shell"                       : @"#FBD918",
											  @"sherwinwilliams"             : @"#0168B3",
											  @"sherwinwilliams2"            : @"#EE3E34",
											  @"shopify"                     : @"#96BF48",
											  @"shopify2"                    : @"#479CCF",
											  @"shopify3"                    : @"#2D3538",
											  @"shopify4"                    : @"#F5F5F5",
											  @"shopify5"                    : @"#F2F7FA",
											  @"shopify6"                    : @"#666666",
											  @"shopnsave"                   : @"#FF0000",
											  @"shoppers"                    : @"#E31836",
											  @"shoppers2"                   : @"#FFE40F",
											  @"shoppers3"                   : @"#000000",
											  @"shoprite"                    : @"#EF2D24",
											  @"shoprite2"                   : @"#FCB712",
											  @"sizzler"                     : @"#E60034",
											  @"sizzler2"                    : @"#FFFFFF",
											  @"sizzler3"                    : @"#000000",
											  @"skylinechili"                : @"#29549B",
											  @"skylinechili2"               : @"#E8E420",
											  @"skylinechili3"               : @"#EA192F",
											  @"skype"                       : @"#00AFF0",
											  @"slack"                       : @"#6ECADC",
											  @"slack2"                      : @"#E9A820",
											  @"slack3"                      : @"#E01563",
											  @"slack4"                      : @"#3EB991",
											  @"smashingmagazine"            : @"#E53B2C",
											  @"smashingmagazine2"           : @"#41B7D8",
											  @"smiths"                      : @"#E3303D",
											  @"snagajob"                    : @"#F47A20",
											  @"socialbro"                   : @"#29C4D0",
											  @"socialbro2"                  : @"#F29556",
											  @"socialbro3"                  : @"#84AFA2",
											  @"socialbro4"                  : @"#72C427",
											  @"socialbro5"                  : @"#F24C7C",
											  @"socialbro6"                  : @"#00AAF2",
											  @"softonic"                    : @"#008ACE",
											  @"songkick"                    : @"#F80046",
											  @"sonicbids"                   : @"#FF6600",
											  @"sonicbids2"                  : @"#0C88B1",
											  @"sonicdrivein"                : @"#F7DB31",
											  @"sonicdrivein2"               : @"#EC3124",
											  @"sonicdrivein3"               : @"#728EBB",
											  @"soundcloud"                  : @"#FF8800",
											  @"soundcloud2"                 : @"#FF3300",
											  @"southcarolina"               : @"#123F69",
											  @"southwest"                   : @"#260BAC",
											  @"southwest2"                  : @"#979393",
											  @"southwest3"                  : @"#F08B3E",
											  @"southwest4"                  : @"#E70000",
											  @"southwest5"                  : @"#000000",
											  @"southwestairlines"           : @"#260BAC",
											  @"southwestairlines2"          : @"#979393",
											  @"southwestairlines3"          : @"#F08B3E",
											  @"southwestairlines4"          : @"#E70000",
											  @"southwestairlines5"          : @"#000000",
											  @"specialized"                 : @"#A2132D",
											  @"specialized2"                : @"#000000",
											  @"spoken"                      : @"#FC00C1",
											  @"spoken2"                     : @"#000000",
											  @"spotify"                     : @"#1FD65F",
											  @"sprint"                      : @"#FFE100",
											  @"sprint2"                     : @"#000000",
											  @"squarecash"                  : @"#28C101",
											  @"squarespace"                 : @"#222222",
											  @"stackoverflow"               : @"#FE7A15",
											  @"staples"                     : @"#CC0000",
											  @"staples2"                    : @"#2C8AEC",
											  @"staples3"                    : @"#FFCC00",
											  @"starbucks"                   : @"#00704A",
											  @"starbucks2"                  : @"#000000",
											  @"starmarket"                  : @"#0084CA",
											  @"starmarket2"                 : @"#79B959",
											  @"staterbros"                  : @"#1644B3",
											  @"staterbrothers"              : @"#1644B3",
											  @"statuschart"                 : @"#D7584F",
											  @"steaknshake"                 : @"#E70300",
											  @"steaknshake2"                : @"#000000",
											  @"steaknshake3"                : @"#FFFFFF",
											  @"steinway"                    : @"#000000",
											  @"sterlinghotels"              : @"#3B5A6F",
											  @"sterlinghotels2"             : @"#828A87",
											  @"sterlinghotels3"             : @"#000000",
											  @"sterlinghotels4"             : @"#9DB7C4",
											  @"sterlinghotels5"             : @"#CCD7DD",
											  @"sterlinghotels6"             : @"#838F97",
											  @"sterlinghotels7"             : @"#002054",
											  @"stopandshop"                 : @"#791F80",
											  @"stopandshop2"                : @"#FCB618",
											  @"stopandshop3"                : @"#ED3221",
											  @"stopandshop4"                : @"#8BC344",
											  @"store"                       : @"#004521",
											  @"storyful"                    : @"#F97200",
											  @"storyful2"                   : @"#010101",
											  @"storyful3"                   : @"#8B8B64",
											  @"storyful4"                   : @"#BBBDC0",
											  @"strava"                      : @"#FC4C02",
											  @"stripe"                      : @"#00AFE1",
											  @"studyblue"                   : @"#00AFE1",
											  @"stumbleupon"                 : @"#EB4924",
											  @"subway"                      : @"#489E3B",
											  @"subway2"                     : @"#00543D",
											  @"subway3"                     : @"#FEF035",
											  @"subway4"                     : @"#FABD42",
											  @"subway5"                     : @"#CD0A20",
											  @"sugarcrm"                    : @"#E61718",
											  @"sugarcrm2"                   : @"#E8E9EA",
											  @"sugarcrm3"                   : @"#595A5C",
											  @"sugarcrm4"                   : @"#282828",
											  @"supercuts"                   : @"#26345A",
											  @"supervalu"                   : @"#DB251C",
											  @"supervalue"                  : @"#DB251C",
											  @"surlatable"                  : @"#5A2847",
											  @"swarm"                       : @"#F06D1F",
											  @"swarm2"                      : @"#FFA633",
											  @"swensens"                    : @"#E52B2B",
											  @"taco"                        : @"#3A167E",
											  @"taco2"                       : @"#FF007E",
											  @"taco3"                       : @"#FFFFFF",
											  @"tacobell"                    : @"#3A167E",
											  @"tacobell2"                   : @"#FF007E",
											  @"tacobell3"                   : @"#FFFFFF",
											  @"tagstr"                      : @"#E74635",
											  @"tagstr2"                     : @"#E74635",
											  @"target"                      : @"#E90022",
											  @"tcby"                        : @"#E5008C",
											  @"tdbank"                      : @"#34B233",
											  @"technorati"                  : @"#339900",
											  @"tennessee"                   : @"#F87E1A",
											  @"tesla"                       : @"#CC0000",
											  @"texas"                       : @"#F70018",
											  @"texas2"                      : @"#FFFFFF",
											  @"texas3"                      : @"#3000FD",
											  @"texasroadhouse"              : @"#000000",
											  @"texasroadhouse2"             : @"#D8451B",
											  @"texasroadhouse3"             : @"#ED9A28",
											  @"texasroadhouse4"             : @"#459537",
											  @"tgifridays"                  : @"#D20041",
											  @"tgifridays2"                 : @"#000000",
											  @"tgifridays3"                 : @"#FFFFFF",
											  @"theaudienceawards"           : @"#EE8421",
											  @"theaudienceawards2"          : @"#8C8A8A",
											  @"theaudienceawards3"          : @"#222222",
											  @"thecheesecakefactory"        : @"#C49E38",
											  @"thenextweb"                  : @"#FF3C1F",
											  @"thenextweb2"                 : @"#26313B",
											  @"thenextweb3"                 : @"#4E5860",
											  @"thenextweb4"                 : @"#A6ABAF",
											  @"thenextweb5"                 : @"#D9E0E2",
											  @"thenextweb6"                 : @"#FAFBFC",
											  @"thomsonreuters"              : @"#FF8000",
											  @"thomsonreuters2"             : @"#555555",
											  @"thomsonreuters3"             : @"#444444",
											  @"thomsonreuters4"             : @"#666666",
											  @"thomsonreuters5"             : @"#CCCCCC",
											  @"thomsonreuters6"             : @"#E9E9E9",
											  @"thomsonreuters7"             : @"#F7F7F7",
											  @"tiffanies"                   : @"#88CCCF",
											  @"tiffany"                     : @"#88CCCF",
											  @"tiffanyandco"                : @"#88CCCF",
											  @"tiffanyandcompany"           : @"#88CCCF",
											  @"tiffanys"                    : @"#88CCCF",
											  @"timhortons"                  : @"#93181F",
											  @"timhortons2"                 : @"#000000",
											  @"tivo"                        : @"#DA3D34",
											  @"tivo2"                       : @"#00A480",
											  @"tivo3"                       : @"#ED9F40",
											  @"tivo4"                       : @"#6A76AC",
											  @"tivo5"                       : @"#17170E",
											  @"tivo6"                       : @"#534B38",
											  @"tivo7"                       : @"#A6A480",
											  @"tjmax"                       : @"#AB192C",
											  @"tjmaxx"                      : @"#AB192C",
											  @"tmobile"                     : @"#E20074",
											  @"tomthumb"                    : @"#23449A",
											  @"tomthumb2"                   : @"#E2373F",
											  @"tonyromas"                   : @"#821819",
											  @"toyota"                      : @"#F70019",
											  @"toysrus"                     : @"#00A601",
											  @"tractorsupplyco"             : @"#FC1922",
											  @"tractorsupplycompany"        : @"#FC1922",
											  @"traderjoe"                   : @"#E31936",
											  @"traderjoes"                  : @"#E31936",
											  @"treehouse"                   : @"#6FBC6D",
											  @"treehouse2"                  : @"#47535B",
											  @"trello"                      : @"#0079BF",
											  @"trello10"                    : @"#C4C9CC",
											  @"trello2"                     : @"#70B500",
											  @"trello3"                     : @"#FF9F1A",
											  @"trello4"                     : @"#EB5A46",
											  @"trello5"                     : @"#F2D600",
											  @"trello6"                     : @"#C377E0",
											  @"trello7"                     : @"#FF78CB",
											  @"trello8"                     : @"#00C2E0",
											  @"trello9"                     : @"#51E898",
											  @"tripadvisor"                 : @"#589442",
											  @"trulia"                      : @"#5EAB1F",
											  @"tsc"                         : @"#FC1922",
											  @"tumblr"                      : @"#35465C",
											  @"tunngle"                     : @"#C30F24",
											  @"tvtag"                       : @"#F24E4E",
											  @"twitchtv"                    : @"#6441A5",
											  @"twitter"                     : @"#55ACEE",
											  @"typekit"                     : @"#98CE1E",
											  @"typepad"                     : @"#D2DE61",
											  @"typo3"                       : @"#FF8600",
											  @"uber"                        : @"#454351",
											  @"uber2"                       : @"#18111E",
											  @"uber3"                       : @"#9FA1A4",
											  @"ubuntu"                      : @"#DD4814",
											  @"ubuntu2"                     : @"#77216F",
											  @"ubuntu3"                     : @"#5E2750",
											  @"ubuntu4"                     : @"#2C001E",
											  @"ubuntu5"                     : @"#AEA79F",
											  @"ubuntu6"                     : @"#333333",
											  @"umami"                       : @"#F38627",
											  @"umami2"                      : @"#000000",
											  @"unitedsupermarket"           : @"#07458C",
											  @"unitedsupermarket2"          : @"#D60304",
											  @"unitedsupermarkets"          : @"#07458C",
											  @"unitedsupermarkets2"         : @"#D60304",
											  @"unitedway"                   : @"#10167F",
											  @"unitedway10"                 : @"#969696",
											  @"unitedway11"                 : @"#7C81B8",
											  @"unitedway12"                 : @"#FF967D",
											  @"unitedway13"                 : @"#FFC87D",
											  @"unitedway2"                  : @"#FE230A",
											  @"unitedway3"                  : @"#FF9600",
											  @"unitedway4"                  : @"#000064",
											  @"unitedway5"                  : @"#B41428",
											  @"unitedway6"                  : @"#F57814",
											  @"unitedway7"                  : @"#E6D7AA",
											  @"unitedway8"                  : @"#505050",
											  @"unitedway9"                  : @"#F0E6C8",
											  @"unity"                       : @"#222C37",
											  @"unity2"                      : @"#00CCCC",
											  @"unity3"                      : @"#FFF600",
											  @"unity4"                      : @"#FF0066",
											  @"unity5"                      : @"#19E3B1",
											  @"unity6"                      : @"#FF7F33",
											  @"unity7"                      : @"#B83C82",
											  @"universityoforegon"          : @"#FCE122",
											  @"universityoforegon2"         : @"#18453B",
											  @"univision"                   : @"#C822B0",
											  @"unos"                        : @"#053E5D",
											  @"ups"                         : @"#632217",
											  @"usps"                        : @"#194881",
											  @"usps2"                       : @"#D90000",
											  @"ustream"                     : @"#3388FF",
											  @"utah"                        : @"#000000",
											  @"utah2"                       : @"#FCFF21",
											  @"valero"                      : @"#016B8A",
											  @"valero2"                     : @"#FFB129",
											  @"verizon"                     : @"#FF0000",
											  @"verizon2"                    : @"#F2F2F2",
											  @"verizon3"                    : @"#070000",
											  @"verse"                       : @"#000000",
											  @"viadeo"                      : @"#F07355",
											  @"victoriassecret"             : @"#D01170",
											  @"viki"                        : @"#3C9CD7",
											  @"viki2"                       : @"#D24663",
											  @"vimeo"                       : @"#162221",
											  @"vimeo2"                      : @"#1AB7EA",
											  @"vine"                        : @"#00B488",
											  @"virb"                        : @"#1E91D0",
											  @"virginmedia"                 : @"#C3092D",
											  @"virginmedia2"                : @"#222221",
											  @"visa"                        : @"#1A1F71",
											  @"visa2"                       : @"#FFFFFF",
											  @"visa3"                       : @"#FDBB0A",
											  @"visa4"                       : @"#FAAA13",
											  @"visa5"                       : @"#75787B",
											  @"vkontakte"                   : @"#45668E",
											  @"volcano"                     : @"#1B3A8C",
											  @"volcanocorp"                 : @"#1B3A8C",
											  @"volvo"                       : @"#003057",
											  @"volvo2"                      : @"#115740",
											  @"volvo3"                      : @"#65665C",
											  @"volvo4"                      : @"#425563",
											  @"volvo5"                      : @"#517891",
											  @"volvo6"                      : @"#212721",
											  @"vons"                        : @"#E2373F",
											  @"wafflehouse"                 : @"#FDF102",
											  @"wafflehouse2"                : @"#000000",
											  @"wakefern"                    : @"#F93C30",
											  @"wakefern2"                   : @"#222021",
											  @"walgreens"                   : @"#E31837",
											  @"walgreens2"                  : @"#F37520",
											  @"walgreens3"                  : @"#489CD4",
											  @"walgreens4"                  : @"#2774A6",
											  @"walgreens5"                  : @"#35393D",
											  @"walmart"                     : @"#0E7BC3",
											  @"walmart2"                    : @"#05509B",
											  @"walmart3"                    : @"#6EADDF",
											  @"walmart4"                    : @"#F27922",
											  @"walmart5"                    : @"#FCBC32",
											  @"walmart6"                    : @"#3B7F2C",
											  @"walmart7"                    : @"#7EC544",
											  @"wayfair"                     : @"#864887",
											  @"wayfair2"                    : @"#864887",
											  @"wayfair3"                    : @"#864887",
											  @"wayfair4"                    : @"#864887",
											  @"wechat"                      : @"#7BB32E",
											  @"wegmans"                     : @"#3E963F",
											  @"wellsfargo"                  : @"#BA0924",
											  @"wellsfargo2"                 : @"#FDC819",
											  @"wellsfargo3"                 : @"#CB3A1E",
											  @"wellsfargo4"                 : @"#F4A525",
											  @"wendys"                      : @"#E2203D",
											  @"wendys2"                     : @"#199FDA",
											  @"westerndigital"              : @"#005195",
											  @"westerndigital2"             : @"#028948",
											  @"westerndigital3"             : @"#FFD400",
											  @"westerndigital4"             : @"#0067B3",
											  @"westerndigital5"             : @"#9D0A0E",
											  @"westerndigital6"             : @"#003369",
											  @"westvirginia"                : @"#CBB740",
											  @"westvirginia2"               : @"#3000FD",
											  @"wetzels"                     : @"#FEFE2D",
											  @"wetzels2"                    : @"#232071",
											  @"wetzels3"                    : @"#CE5F13",
											  @"whataburger"                 : @"#D5610C",
											  @"whatsapp"                    : @"#4DC247",
											  @"whitecastle"                 : @"#4E8ABB",
											  @"wholefoods"                  : @"#016D55",
											  @"whoosnapdesigner"            : @"#2FA5D6",
											  @"whoosnapdesigner2"           : @"#B52F2C",
											  @"wienerschnitzel"             : @"#E3002A",
											  @"wienerschnitzel2"            : @"#EA6736",
											  @"wienerschnitzel3"            : @"#F1B725",
											  @"wienerschnitzel4"            : @"#E30067",
											  @"williamsonoma"               : @"#001101",
											  @"williamssonoma"              : @"#001101",
											  @"windows"                     : @"#00BCF2",
											  @"windowsphone"                : @"#68217A",
											  @"wingstop"                    : @"#216D47",
											  @"wired"                       : @"#000000",
											  @"wired2"                      : @"#FFFFFF",
											  @"wooga"                       : @"#5B009C",
											  @"woot"                        : @"#61861E",
											  @"wootcom"                     : @"#61861E",
											  @"wordpress"                   : @"#21759B",
											  @"wordpress2"                  : @"#D54E21",
											  @"wordpress3"                  : @"#464646",
											  @"wordpresscom"                : @"#0087BE",
											  @"wordpresscom10"              : @"#668EAA",
											  @"wordpresscom11"              : @"#4F748E",
											  @"wordpresscom12"              : @"#3D596D",
											  @"wordpresscom13"              : @"#2E4453",
											  @"wordpresscom14"              : @"#D54E21",
											  @"wordpresscom15"              : @"#F0821E",
											  @"wordpresscom16"              : @"#4AB866",
											  @"wordpresscom17"              : @"#F0B849",
											  @"wordpresscom18"              : @"#D94F4F",
											  @"wordpresscom2"               : @"#78DCFA",
											  @"wordpresscom3"               : @"#00AADC",
											  @"wordpresscom4"               : @"#005082",
											  @"wordpresscom5"               : @"#87A6BC",
											  @"wordpresscom6"               : @"#F3F6F8",
											  @"wordpresscom7"               : @"#E9EFF3",
											  @"wordpresscom8"               : @"#E9EFF3",
											  @"wordpresscom9"               : @"#A8BECE",
											  @"worldline"                   : @"#0066A1",
											  @"worldmark"                   : @"#0E1160",
											  @"wunderlist"                  : @"#2B96F1",
											  @"xbox"                        : @"#52B043",
											  @"xing"                        : @"#026466",
											  @"xing2"                       : @"#CFDC00",
											  @"xkcd"                        : @"#000000",
											  @"yahoo"                       : @"#400191",
											  @"yandex"                      : @"#FFCC00",
											  @"yelp"                        : @"#AF0606",
											  @"yo"                          : @"#9B59B6",
											  @"yo10"                        : @"#1ABC9C",
											  @"yo2"                         : @"#E74C3C",
											  @"yo3"                         : @"#8E44AD",
											  @"yo4"                         : @"#2980B9",
											  @"yo5"                         : @"#F1C40F",
											  @"yo6"                         : @"#16A085",
											  @"yo7"                         : @"#34495E",
											  @"yo8"                         : @"#3498DB",
											  @"yo9"                         : @"#2ECC71",
											  @"youtube"                     : @"#CD201F",
											  @"zendesk"                     : @"#78A300",
											  @"zendesk2"                    : @"#F1F1F1",
											  @"zendesk3"                    : @"#444444",
											  @"zerply"                      : @"#9DBC7A",
											  @"zillow"                      : @"#1277E1",
											  @"zootool"                     : @"#5E8B1D",
											  @"zopim"                       : @"#FF9D3B"};
	
	return companyColorsDictionary;
}

#pragma mark - Company names

+ (NKFColor *)fourormat{
	return [NKFColor colorWithHexString:@"#fb0a2a"];
}


+ (NKFColor *)fivehundredpix {
	return [NKFColor fivehundredpx];
}


+ (NKFColor *)fivehundredpx{
	return [NKFColor colorWithHexString:@"#0099e5"];
}

+ (NKFColor *)fivehundredpx2{
	return [NKFColor colorWithHexString:@"#ff4c4c"];
}

+ (NKFColor *)fivehundredpx3{
	return [NKFColor colorWithHexString:@"#34bf49"];
}


+ (NKFColor *)aaa {
    return [NKFColor colorWithHexString:@"#da291c"];
}

+ (NKFColor *)aaa2 {
    return [NKFColor colorWithHexString:@"#0072ce"];
}


+ (NKFColor *)aandw {
	return [NKFColor colorWithHexString:@"#481d0c"];
}

+ (NKFColor *)aandw2 {
	return [NKFColor colorWithHexString:@"#8c4f1a"];
}

+ (NKFColor *)aandw3 {
	return [NKFColor colorWithHexString:@"#ce7b41"];
}

+ (NKFColor *)aandw4 {
	return [NKFColor colorWithHexString:@"#fdfaf9"];
}


+ (NKFColor *)aboutme{
	return [NKFColor colorWithHexString:@"#00405d"];
}

+ (NKFColor *)aboutme2{
	return [NKFColor colorWithHexString:@"#062f3c"];
}

+ (NKFColor *)aboutme3{
	return [NKFColor colorWithHexString:@"#2b82ad"];
}

+ (NKFColor *)aboutme4{
	return [NKFColor colorWithHexString:@"#cc7a00"];
}

+ (NKFColor *)aboutme5{
	return [NKFColor colorWithHexString:@"#ffcc33"];
}


+ (NKFColor *)ace {
	return [NKFColor colorWithRed:230.0f/255.0f green:25.0f/255.0f blue:56.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)acehardware {
	return [NKFColor ace];
}

+ (NKFColor *)acehardwear {
	return [NKFColor ace];
}


+ (NKFColor *)acme {
	return [NKFColor colorWithRed:239.0f/255.0f green:59.0f/255.0f blue:57.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)acmoore {
	return [NKFColor colorWithRed:227.0f/255.0f green:25.0f/255.0f blue:55.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)acmooreartsandcrafts {
	return [NKFColor acmoore];
}

+ (NKFColor *)artsandcrafts {
	return [NKFColor acmoore];
}


+ (NKFColor *)addvocate{
	return [NKFColor colorWithHexString:@"#ff3322"];
}


+ (NKFColor *)adidas {
	return [NKFColor black];
}


+ (NKFColor *)advancedautoparts {
	return [NKFColor colorWithRed:235.0f/255.0f green:27.0f/255.0f blue:42.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)adobe{
	return [NKFColor colorWithHexString:@"#ff0000"];
}

+ (NKFColor *)adobe2{
	return [NKFColor colorWithHexString:@"#fbb034"];
}

+ (NKFColor *)adobe3{
	return [NKFColor colorWithHexString:@"#ffdd00"];
}

+ (NKFColor *)adobe4{
	return [NKFColor colorWithHexString:@"#c1d82f"];
}

+ (NKFColor *)adobe5{
	return [NKFColor colorWithHexString:@"#00a4e4"];
}

+ (NKFColor *)adobe6{
	return [NKFColor colorWithHexString:@"#8a7967"];
}

+ (NKFColor *)adobe7{
	return [NKFColor colorWithHexString:@"#6a737b"];
}


+ (NKFColor *)aetna{
	return [NKFColor colorWithHexString:@"#d20962"];
}

+ (NKFColor *)aetna2{
	return [NKFColor colorWithHexString:@"#f47721"];
}

+ (NKFColor *)aetna3{
	return [NKFColor colorWithHexString:@"#7ac143"];
}

+ (NKFColor *)aetna4{
	return [NKFColor colorWithHexString:@"#00a78e"];
}

+ (NKFColor *)aetna5{
	return [NKFColor colorWithHexString:@"#00bce4"];
}

+ (NKFColor *)aetna6{
	return [NKFColor colorWithHexString:@"#7d3f98"];
}


+ (NKFColor *)afnetworking {
	return [NKFColor colorWithRed:233.0f/255.0f green:85.0f/255.0f blue:44.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)afnetworking2 {
	return [NKFColor black];
}


+ (NKFColor *)ahold {
	return [NKFColor colorWithRed:6.0f/255.0f green:98.0f/255.0f blue:168.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)aholdusa {
	return [NKFColor ahold];
}


+ (NKFColor *)aim{
	return [NKFColor colorWithHexString:@"#ffd900"];
}


+ (NKFColor *)airbnb{
	return [NKFColor colorWithHexString:@"#fd5c63"];
}


+ (NKFColor *)ajwright {
	return [NKFColor colorWithRed:235.0f/255.0f green:131.0f/255.0f blue:22.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)albertsons {
	return [NKFColor colorWithRed:20.0f/255.0f green:29.0f/255.0f blue:106.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)albertson {
	return [NKFColor albertsons];
}

+ (NKFColor *)albertsons2 {
	return [NKFColor colorWithRed:0.0f green:161.0f/255.0f blue:213.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)albertson2 {
	return [NKFColor albertsons2];
}


+ (NKFColor *)alcon{
	return [NKFColor colorWithHexString:@"#0079c1"];
}

+ (NKFColor *)alcon2{
	return [NKFColor colorWithHexString:@"#49176d"];
}

+ (NKFColor *)alcon3{
	return [NKFColor colorWithHexString:@"#00a0af"];
}

+ (NKFColor *)alcon4{
	return [NKFColor colorWithHexString:@"#49a942"];
}


+ (NKFColor *)aldi {
	return [NKFColor colorWithRed:0.0f/255.0f green:36.0f/255.0f blue:120.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)aldi2 {
	return [NKFColor colorWithRed:242.0f/255.0f green:54.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)aldi3 {
	return [NKFColor colorWithRed:250.0f/255.0f green:137.0f/255.0f blue:1.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)aldi4 {
	return [NKFColor colorWithRed:0.0f/255.0f green:148.0f/255.0f blue:219.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)alienware{
	return [NKFColor colorWithHexString:@"#020202"];
}

+ (NKFColor *)alienware2{
	return [NKFColor colorWithHexString:@"#2ad2c9"];
}

+ (NKFColor *)alienware3{
	return [NKFColor colorWithHexString:@"#d0e100"];
}

+ (NKFColor *)alienware4{
	return [NKFColor colorWithHexString:@"#00f0f0"];
}

+ (NKFColor *)alienware5{
	return [NKFColor colorWithHexString:@"#00f000"];
}

+ (NKFColor *)alienware6{
	return [NKFColor colorWithHexString:@"#f0e000"];
}

+ (NKFColor *)alienware7{
	return [NKFColor colorWithHexString:@"#00a0f0"];
}

+ (NKFColor *)alienware8{
	return [NKFColor colorWithHexString:@"#9000f0"];
}

+ (NKFColor *)alienware9{
	return [NKFColor colorWithHexString:@"#f00000"];
}


+ (NKFColor *)amazon{
	return [NKFColor colorWithHexString:@"#ff9900"];
}

+ (NKFColor *)amazon2{
	return [NKFColor colorWithHexString:@"#146eb4"];
}


+ (NKFColor *)americanairlines {
	return [NKFColor colorWithHexString:@"#da2026"];
}

+ (NKFColor *)americanairlines2 {
	return [NKFColor colorWithHexString:@"#1d81bd"];
}


+ (NKFColor *)americanredcross{
	return [NKFColor colorWithHexString:@"#ed1b2e"];
}

+ (NKFColor *)americanredcross2{
	return [NKFColor colorWithHexString:@"#6d6e70"];
}

+ (NKFColor *)americanredcross3{
	return [NKFColor colorWithHexString:@"#d7d7d8"];
}

+ (NKFColor *)americanredcross4{
	return [NKFColor colorWithHexString:@"#b4a996"];
}

+ (NKFColor *)americanredcross5{
	return [NKFColor colorWithHexString:@"#ecb731"];
}

+ (NKFColor *)americanredcross6{
	return [NKFColor colorWithHexString:@"#8ec06c"];
}

+ (NKFColor *)americanredcross7{
	return [NKFColor colorWithHexString:@"#537b35"];
}

+ (NKFColor *)americanredcross8{
	return [NKFColor colorWithHexString:@"#c4dff6"];
}

+ (NKFColor *)americanredcross9{
	return [NKFColor colorWithHexString:@"#56a0d3"];
}

+ (NKFColor *)americanredcross10{
	return [NKFColor colorWithHexString:@"#0091cd"];
}

+ (NKFColor *)americanredcross11{
	return [NKFColor colorWithHexString:@"#004b79"];
}

+ (NKFColor *)americanredcross12{
	return [NKFColor colorWithHexString:@"#7f181b"];
}

+ (NKFColor *)americanredcross13{
	return [NKFColor colorWithHexString:@"#d7d7d8"];
}

+ (NKFColor *)americanredcross14{
	return [NKFColor colorWithHexString:@"#9f9fa3"];
}

+ (NKFColor *)americanredcross15{
	return [NKFColor colorWithHexString:@"#000000"];
}


+ (NKFColor *)recipe {
	return [NKFColor groceries];
}


+ (NKFColor *)redcross {
	return [NKFColor americanredcross];
}


+ (NKFColor *)riteaid {
	return [NKFColor colorWithRed:9.0f/255.0f green:17.0f/255.0f blue:144.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)riteaid2 {
	return [NKFColor colorWithRed:255.0f/255.0f green:1.0f/255.0f blue:3.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)android{
	return [NKFColor colorWithHexString:@"#a4c639"];
}


+ (NKFColor *)angieslist{
	return [NKFColor colorWithHexString:@"#7fbb00"];
}


+ (NKFColor *)answers{
	return [NKFColor colorWithHexString:@"#136ad5"];
}

+ (NKFColor *)answers2{
	return [NKFColor colorWithHexString:@"#fb8a2e"];
}


+ (NKFColor *)aol{
	return [NKFColor colorWithHexString:@"#ff0b00"];
}

+ (NKFColor *)aol2{
	return [NKFColor colorWithHexString:@"#00c4ff"];
}


+ (NKFColor *)apple {
	return [NKFColor colorWithRed:145.0f/255.0f green:156.0f/255.0f blue:178.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)applebees {
	return [NKFColor colorWithRed:77.0f/255.0f green:112.0f/255.0f blue:23.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)applebees2 {
	return [NKFColor colorWithRed:230.0f/255.0f green:17.0f/255.0f blue:43.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)apu {
	return [NKFColor colorWithRed:128.0f/255.0f green:40.0f/255.0f blue:43.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)apu2 {
	return [NKFColor white];
}

+ (NKFColor *)apu3 {
	return [NKFColor black];
}


+ (NKFColor *)arbys {
	return [NKFColor colorWithHexString:@"#d11d2b"];
}


+ (NKFColor *)archlinux{
	return [NKFColor colorWithHexString:@"#1793d1"];
}

+ (NKFColor *)archlinux2{
	return [NKFColor colorWithHexString:@"#333333"];
}


+ (NKFColor *)asana{
	return [NKFColor colorWithHexString:@"#1f8dd6"];
}

+ (NKFColor *)asana2{
	return [NKFColor colorWithHexString:@"#34ad00"];
}


+ (NKFColor *)associatedpress{
	return [NKFColor colorWithHexString:@"#ff322e"];
}


+ (NKFColor *)astonmartin {
	return [NKFColor colorWithRed:40.0f/255.0f green:122.0f/255.0f blue:78.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)aubonpain {
	return [NKFColor colorWithHexString:@"#f2b53e"];
}


+ (NKFColor *)auntieannes {
	return [NKFColor colorWithHexString:@"#638499"];
}


+ (NKFColor *)att{
	return [NKFColor colorWithHexString:@"#ff7200"];
}

+ (NKFColor *)att2{
	return [NKFColor colorWithHexString:@"#fcb314"];
}

+ (NKFColor *)att3{
	return [NKFColor colorWithHexString:@"#067ab4"];
}

+ (NKFColor *)att4{
	return [NKFColor colorWithHexString:@"#3aa5dc"];
}

+ (NKFColor *)atandt {
    return [NKFColor att];
}

+ (NKFColor *)atandt2 {
    return [NKFColor att2];
}

+ (NKFColor *)atandt3 {
    return [NKFColor att3];
}

+ (NKFColor *)atandt4 {
    return [NKFColor att4];
}


+ (NKFColor *)atlanticcoast{
	return [NKFColor colorWithHexString:@"#013ca6"];
}

+ (NKFColor *)atlanticcoastconference{
	return [NKFColor colorWithHexString:@"#013ca6"];
}

+ (NKFColor *)atlanticcoastconferenceacc{
	return [NKFColor colorWithHexString:@"#013ca6"];
}

+ (NKFColor *)atlanticcoastconferenceacc2{
	return [NKFColor colorWithHexString:@"#a5a9ab"];
}


+ (NKFColor *)atlassian{
	return [NKFColor colorWithHexString:@"#003366"];
}


+ (NKFColor *)auth0{
	return [NKFColor colorWithHexString:@"#16214d"];
}

+ (NKFColor *)auth02{
	return [NKFColor colorWithHexString:@"#44c7f4"];
}

+ (NKFColor *)auth03{
	return [NKFColor colorWithHexString:@"#eb5424"];
}

+ (NKFColor *)auth04{
	return [NKFColor colorWithHexString:@"#d0d2d3"];
}


+ (NKFColor *)autozone {
	return [NKFColor colorWithRed:253.0f/255.0f green:2.0f/255.0f blue:27.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)autozone2 {
	return [NKFColor colorWithRed:255.0f/255.0f green:102.0f/255.0f blue:0.0f alpha:1.0f];
}


+ (NKFColor *)baidu{
	return [NKFColor colorWithHexString:@"#de0f17"];
}

+ (NKFColor *)baidu2{
	return [NKFColor colorWithHexString:@"#2529d8"];
}


+ (NKFColor *)bajafresh {
	return [NKFColor colorWithHexString:@"#e61110"];
}

+ (NKFColor *)bajafresh2 {
	return [NKFColor colorWithHexString:@"#11a67d"];
}

+ (NKFColor *)bajafresh3 {
	return [NKFColor black];
}


+ (NKFColor *)bakers {
	return [NKFColor colorWithRed:255.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)bananarepublic {
	return [NKFColor colorWithRed:119.0f/255.0f green:79.0f/255.0f blue:46.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)bandcamp{
	return [NKFColor colorWithHexString:@"#629aa9"];
}


+ (NKFColor *)bankofamerica {
	return [NKFColor colorWithRed:37.0f/255.0f green:99.0f/255.0f blue:176.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)bankofamerica2 {
	return [NKFColor colorWithRed:219.0f/255.0f green:0.0f/255.0f blue:59.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)bofa {
	return [NKFColor bankofamerica];
}

+ (NKFColor *)bofa2 {
	return [NKFColor bankofamerica2];
}


+ (NKFColor *)barnesnoble{
	return [NKFColor colorWithHexString:@"#2a5934"];
}


+ (NKFColor *)baskinrobbins {
	return [NKFColor colorWithHexString:@"#d24c96"];
}

+ (NKFColor *)baskinrobbins2 {
	return [NKFColor colorWithHexString:@"#244a87"];
}


+ (NKFColor *)bebo{
	return [NKFColor colorWithHexString:@"#e04646"];
}


+ (NKFColor *)bedbathandbeyond {
	return [NKFColor colorWithRed:57.0f/255.0f green:75.0f/255.0f blue:157.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)bedbathbeyond {
	return [NKFColor bedbathandbeyond];
}


+ (NKFColor *)behance{
	return [NKFColor colorWithHexString:@"#1769ff"];
}


+ (NKFColor *)belk {
	return [NKFColor colorWithRed:0.0f green:143.0f/255.0f blue:213.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)belk2 {
	return [NKFColor colorWithRed:36.0f/255.0f green:64.0f/255.0f blue:143.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)benandjerrys {
	return [NKFColor colorWithHexString:@"#67b0dd"];
}

+ (NKFColor *)benandjerrys2 {
	return [NKFColor colorWithHexString:@"#e1a82c"];
}

+ (NKFColor *)benandjerrys3 {
	return [NKFColor black];
}


+ (NKFColor *)benihana {
	return [NKFColor black];
}

+ (NKFColor *)benihana2 {
	return [NKFColor colorWithHexString:@"#ea1b22"];
}


+ (NKFColor *)bernieandphyls {
	return [NKFColor colorWithHexString:@"#986832"];
}

+ (NKFColor *)bernieandphyls2 {
	return [NKFColor colorWithHexString:@"#D0C9B9"];
}

+ (NKFColor *)bernieandphyls3 {
	return [NKFColor colorWithHexString:@"#000000"];
}


+ (NKFColor *)bertuccis {
	return [NKFColor colorWithHexString:@"#a81d30"];
}


+ (NKFColor *)bestbuy{
	return [NKFColor colorWithHexString:@"#003b64"];
}

+ (NKFColor *)bestbuy2{
	return [NKFColor colorWithHexString:@"#fff200"];
}


+ (NKFColor *)bevmo {
	return [NKFColor red];
}


+ (NKFColor *)biblegateway {
	return [NKFColor colorWithRed:0.7f green:0.2f blue:0.3f alpha:1.0f];
}

+ (NKFColor *)bible {
	return [NKFColor biblegateway];
}


+ (NKFColor *)big5{
	return [NKFColor colorWithRed:51.0f/255.0f green:57.0f/255.0f blue:145.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)big5sportinggoods {
	return [NKFColor big5];
}

+ (NKFColor *)big5sports {
	return [NKFColor big5];
}


+ (NKFColor *)bigboy {
	return [NKFColor colorWithHexString:@"#de3539"];
}

+ (NKFColor *)bigboy2 {
	return [NKFColor colorWithHexString:@"#473d38"];
}

+ (NKFColor *)bigboy3 {
	return [NKFColor colorWithHexString:@"#b74446"];
}


+ (NKFColor *)bigcartel{
	return [NKFColor colorWithHexString:@"#a0ac48"];
}

+ (NKFColor *)bigcartel2{
	return [NKFColor colorWithHexString:@"#70b29c"];
}


+ (NKFColor *)biglots {
	return [NKFColor colorWithRed:255.0f/255.0f green:121.0f/255.0f blue:0.0f alpha:1.0f];
}


+ (NKFColor *)bilo {
	return [NKFColor colorWithRed:254.0f/255.0f green:51.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)bilo2 {
	return [NKFColor colorWithRed:3.0f/255.0f green:151.0f/255.0f blue:63.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)bing2{
	return [NKFColor colorWithHexString:@"#ffb900"];
}

+ (NKFColor *)bing22{
	return [NKFColor colorWithHexString:@"#505050"];
}

+ (NKFColor *)bing23{
	return [NKFColor colorWithHexString:@"#a3a3a3"];
}


+ (NKFColor *)bitbucket{
	return [NKFColor colorWithHexString:@"#205081"];
}


+ (NKFColor *)bitly{
	return [NKFColor colorWithHexString:@"#ee6123"];
}

+ (NKFColor *)bitly2{
	return [NKFColor colorWithHexString:@"#61b3de"];
}


+ (NKFColor *)bjs {
	return [NKFColor colorWithRed:218.0f/255.0f green:38.0f/255.0f blue:29.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)bjsrestaurants {
	return [NKFColor colorWithHexString:@"#b11b0d"];
}


+ (NKFColor *)blackberry{
	return [NKFColor colorWithHexString:@"#005387"];
}

+ (NKFColor *)blackberry2{
	return [NKFColor colorWithHexString:@"#8cb811"];
}

+ (NKFColor *)blackberry3{
	return [NKFColor colorWithHexString:@"#fdb813"];
}

+ (NKFColor *)blackberry4{
	return [NKFColor colorWithHexString:@"#88aca1"];
}

+ (NKFColor *)blackberry5{
	return [NKFColor colorWithHexString:@"#000000"];
}

+ (NKFColor *)blackberry6{
	return [NKFColor colorWithHexString:@"#788cb6"];
}

+ (NKFColor *)blackberry7{
	return [NKFColor colorWithHexString:@"#a1a1a4"];
}

+ (NKFColor *)blackberry8{
	return [NKFColor colorWithHexString:@"#8f8f8c"];
}


+ (NKFColor *)blimpie {
	return [NKFColor colorWithHexString:@"#769a50"];
}

+ (NKFColor *)blimpie2 {
	return [NKFColor colorWithHexString:@"#f4d662"];
}


+ (NKFColor *)blogger{
	return [NKFColor colorWithHexString:@"#f57d00"];
}


+ (NKFColor *)bobevans {
	return [NKFColor colorWithHexString:@"#b01921"];
}


+ (NKFColor *)bostonmarket {
	return [NKFColor colorWithHexString:@"#d92132"];
}

+ (NKFColor *)bostonmarket2 {
	return [NKFColor black];
}


+ (NKFColor *)bmw {
	return [NKFColor colorWithRed:70.0f/255.0f green:149.0f/255.0f blue:199.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)bmw2 {
	return [NKFColor white];
}

+ (NKFColor *)bmw3 {
	return [NKFColor black];
}


+ (NKFColor *)boeing{
	return [NKFColor colorWithHexString:@"#0039a6"];
}


+ (NKFColor *)bookingcom{
	return [NKFColor colorWithHexString:@"#003580"];
}


+ (NKFColor *)scouts{
	return [NKFColor colorWithHexString:@"#ce1126"];
}

+ (NKFColor *)boyscouts{
	return [NKFColor colorWithHexString:@"#ce1126"];
}

+ (NKFColor *)boyscoutsofamerica{
	return [NKFColor colorWithHexString:@"#ce1126"];
}

+ (NKFColor *)boyscoutsofamerica2{
	return [NKFColor colorWithHexString:@"#003f87"];
}

+ (NKFColor *)scouts2{
	return [NKFColor colorWithHexString:@"#003f87"];
}

+ (NKFColor *)boyscouts2{
	return [NKFColor colorWithHexString:@"#003f87"];
}


+ (NKFColor *)britishairways{
	return [NKFColor colorWithHexString:@"#075aaa"];
}

+ (NKFColor *)britishairways2{
	return [NKFColor colorWithHexString:@"#eb2226"];
}

+ (NKFColor *)britishairways3{
	return [NKFColor colorWithHexString:@"#01295c"];
}

+ (NKFColor *)britishairways4{
	return [NKFColor colorWithHexString:@"#efe9e5"];
}

+ (NKFColor *)britishairways5{
	return [NKFColor colorWithHexString:@"#aca095"];
}

+ (NKFColor *)britishairways6{
	return [NKFColor colorWithHexString:@"#b9cfed"];
}

+ (NKFColor *)britishairways7{
	return [NKFColor colorWithHexString:@"#a7a9ac"];
}


+ (NKFColor *)bt{
	return [NKFColor colorWithHexString:@"#d52685"];
}

+ (NKFColor *)bt2{
	return [NKFColor colorWithHexString:@"#553a99"];
}

+ (NKFColor *)bt3{
	return [NKFColor colorWithHexString:@"#6cbc35"];
}

+ (NKFColor *)bt4{
	return [NKFColor colorWithHexString:@"#fd9f3e"];
}

+ (NKFColor *)bt5{
	return [NKFColor colorWithHexString:@"#08538c"];
}


+ (NKFColor *)bubbagump {
	return [NKFColor colorWithHexString:@"#11217d"];
}

+ (NKFColor *)bubbagump2 {
	return [NKFColor colorWithHexString:@"#ec0b0e"];
}


+ (NKFColor *)bucadibeppo {
	return [NKFColor colorWithHexString:@"#d4534b"];
}

+ (NKFColor *)bucadibeppo2 {
	return [NKFColor colorWithHexString:@"#7cb297"];
}


+ (NKFColor *)buffalowildwings {
    return [NKFColor colorWithHexString:@"#FFD200"];
}

+ (NKFColor *)buffalowildwings2 {
    return [NKFColor colorWithHexString:@"#000000"];
}

+ (NKFColor *)buffalowildwings3 {
    return [NKFColor colorWithHexString:@"#AAAAA9"];
}

+ (NKFColor *)buffalowildwings4 {
    return [NKFColor colorWithHexString:@"#FFFFFF"];
}



+ (NKFColor *)buffer{
	return [NKFColor colorWithHexString:@"#168eea"];
}

+ (NKFColor *)buffer2{
	return [NKFColor colorWithHexString:@"#ee4f4f"];
}

+ (NKFColor *)buffer3{
	return [NKFColor colorWithHexString:@"#fff9ea"];
}

+ (NKFColor *)buffer4{
	return [NKFColor colorWithHexString:@"#76b852"];
}

+ (NKFColor *)buffer5{
	return [NKFColor colorWithHexString:@"#323b43"];
}

+ (NKFColor *)buffer6{
	return [NKFColor colorWithHexString:@"#59626a"];
}

+ (NKFColor *)buffer7{
	return [NKFColor colorWithHexString:@"#ced7df"];
}

+ (NKFColor *)buffer8{
	return [NKFColor colorWithHexString:@"#eff3f6"];
}

+ (NKFColor *)buffer9{
	return [NKFColor colorWithHexString:@"#f4f7f9"];
}


+ (NKFColor *)bugatti {
	return [NKFColor colorWithRed:184.0f/255.0f green:0.0f/255.0f blue:52.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)bugatti2 {
	return [NKFColor black];
}

+ (NKFColor *)bugatti3 {
	return [NKFColor colorWithWhite:170.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)burgerking{
	return [NKFColor colorWithHexString:@"#ec1c24"];
}

+ (NKFColor *)burgerking2{
	return [NKFColor colorWithHexString:@"#fdbd10"];
}

+ (NKFColor *)burgerking3{
	return [NKFColor colorWithHexString:@"#0066b2"];
}

+ (NKFColor *)burgerking4{
	return [NKFColor colorWithHexString:@"#ed7902"];
}


+ (NKFColor *)burlington {
	return [NKFColor burlingtoncoatfactory];
}

+ (NKFColor *)burlingtoncoatfactory {
	return [NKFColor colorWithRed:171.0f/255.0f green:29.0f/255.0f blue:56.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)bynder{
	return [NKFColor colorWithHexString:@"#1ca0de"];
}

+ (NKFColor *)bynder2{
	return [NKFColor colorWithHexString:@"#343a4e"];
}


+ (NKFColor *)cabot {
	return [NKFColor colorWithRed:236.0f/255.0f green:28.0f/255.0f blue:45.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)cabot2 {
	return [NKFColor colorWithRed:6.0f/255.0f green:151.0f/255.0f blue:102.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)cadillac {
	return [NKFColor colorWithRed:191.0f/255.0f green:172.0f/255.0f blue:99.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)cadillac2 {
	return [NKFColor colorWithRed:165.0f/255.0f green:0.0f/255.0f blue:35.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)cadillac3 {
	return [NKFColor colorWithRed:29.0f/255.0f green:36.0f/255.0f blue:137.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)californiapizzakitchen {
	return [NKFColor colorWithHexString:@"#fee416"];
}

+ (NKFColor *)californiapizzakitchen2 {
	return [NKFColor black];
}

+ (NKFColor *)cpk {
	return [NKFColor californiapizzakitchen];
}

+ (NKFColor *)cpk2 {
	return [NKFColor californiapizzakitchen2];
}


+ (NKFColor *)canon{
	return [NKFColor colorWithHexString:@"#bc0024"];
}

+ (NKFColor *)canon2{
	return [NKFColor colorWithHexString:@"#000000"];
}


+ (NKFColor *)carbonmade{
	return [NKFColor colorWithHexString:@"#613854"];
}


+ (NKFColor *)carlsjr {
	return [NKFColor colorWithHexString:@"#ea1719"];
}

+ (NKFColor *)carlsjr2 {
	return [NKFColor colorWithHexString:@"#fbc011"];
}


+ (NKFColor *)carrefour{
	return [NKFColor colorWithHexString:@"#00387b"];
}

+ (NKFColor *)carrefour2{
	return [NKFColor colorWithHexString:@"#bb1e10"];
}

+ (NKFColor *)carrefour3{
	return [NKFColor colorWithHexString:@"#f67828"];
}

+ (NKFColor *)carrefour4{
	return [NKFColor colorWithHexString:@"#237f52"];
}


+ (NKFColor *)carrows {
	return [NKFColor colorWithHexString:@"#245eb3"];
}

+ (NKFColor *)carrows2 {
	return [NKFColor colorWithHexString:@"#f6e133"];
}

+ (NKFColor *)carrows3 {
	return [NKFColor colorWithHexString:@"#d33551"];
}


+ (NKFColor *)carrs {
	return [NKFColor safeway];
}

+ (NKFColor *)carrssafeway {
	return [NKFColor safeway];
}


+ (NKFColor *)carvel {
	return [NKFColor colorWithHexString:@"#af002a"];
}


+ (NKFColor *)casemate{
	return [NKFColor colorWithHexString:@"#84754e"];
}

+ (NKFColor *)casemate2{
	return [NKFColor colorWithHexString:@"#a6192e"];
}

+ (NKFColor *)casemate3{
	return [NKFColor colorWithHexString:@"#decba5"];
}

+ (NKFColor *)casemate4{
	return [NKFColor colorWithHexString:@"#000000"];
}


+ (NKFColor *)champs {
	return [NKFColor colorWithRed:0.0f green:58.0f/255.0f blue:128.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)champssports {
	return [NKFColor champs];
}


+ (NKFColor *)charitywater{
	return [NKFColor colorWithHexString:@"#ffc907"];
}

+ (NKFColor *)charitywater2{
	return [NKFColor colorWithHexString:@"#2e9df7"];
}

+ (NKFColor *)charitywater3{
	return [NKFColor colorWithHexString:@"#231f20"];
}



+ (NKFColor *)charterone {
    return [NKFColor citizensbank];
}

+ (NKFColor *)charterone2 {
    return [NKFColor citizensbank2];
}


+ (NKFColor *)chilis {
	return [NKFColor colorWithRed:14.0f/255.0f green:136.0f/255.0f blue:102.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)chilis2 {
	return [NKFColor colorWithRed:238.0f/255.0f green:54.0f/255.0f blue:37.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)checkers {
	return [NKFColor colorWithHexString:@"#ca211f"];
}


+ (NKFColor *)cheddar{
	return [NKFColor colorWithHexString:@"#ff7243"];
}


+ (NKFColor *)chevy {
	return [NKFColor colorWithRed:203.0f/255.0f green:171.0f/255.0f blue:91.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)chevys {
	return [NKFColor colorWithHexString:@"#de4144"];
}

+ (NKFColor *)chevrolet {
	return [NKFColor chevy];
}


+ (NKFColor *)chickfila {
	return [NKFColor colorWithRed:222.0f/255.0f green:0.0f/255.0f blue:59.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)chipotle {
	return [NKFColor colorWithRed:162.0f/255.0f green:6.0f/255.0f blue:25.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)chipotle2 {
	return [NKFColor colorWithRed:67.0f/255.0f green:19.0f/255.0f blue:2.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)chipotle3 {
	return [NKFColor white];
}


+ (NKFColor *)chrysler {
	return [NKFColor colorWithRed:101.0f/255.0f green:132.0f/255.0f blue:217.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)cinnabon {
	return [NKFColor colorWithHexString:@"#2a3572"];
}

+ (NKFColor *)cinnabon2 {
	return [NKFColor white];
}

+ (NKFColor *)cinnabon3 {
	return [NKFColor colorWithHexString:@"#d88f3f"];
}


+ (NKFColor *)citgo {
	return [NKFColor colorWithHexString:@"#197dc5"];
}

+ (NKFColor *)citgo2 {
	return [NKFColor colorWithHexString:@"#b52427"];
}

+ (NKFColor *)citgo3 {
	return [NKFColor colorWithHexString:@"#f17116"];
}

+ (NKFColor *)citgo4 {
	return [NKFColor colorWithHexString:@"#e21d22"];
}


+ (NKFColor *)citymarket {
	return [NKFColor colorWithRed:237.0f/255.0f green:28.0f/255.0f blue:36.0f/255.0f alpha:1.0f];
}



+ (NKFColor *)citizensbank {
    return [NKFColor colorWithHexString:@"#009966"];
}

+ (NKFColor *)citizensbank2 {
    return [NKFColor colorWithHexString:@"#014084"];
}


+ (NKFColor *)claimjumper {
	return [NKFColor colorWithHexString:@"#9c703c"];
}

+ (NKFColor *)claimjumper2 {
	return [NKFColor colorWithHexString:@"#aa172"];
}


+ (NKFColor *)cocacola{
	return [NKFColor colorWithHexString:@"#ed1c16"];
}


+ (NKFColor *)cocosbakery {
	return [NKFColor colorWithHexString:@"#fbbf24"];
}


+ (NKFColor *)codeschool{
	return [NKFColor colorWithHexString:@"#616f67"];
}

+ (NKFColor *)codeschool2{
	return [NKFColor colorWithHexString:@"#c68143"];
}


+ (NKFColor *)codecademy{
	return [NKFColor colorWithHexString:@"#f65a5b"];
}

+ (NKFColor *)codecademy2{
	return [NKFColor colorWithHexString:@"#204056"];
}


+ (NKFColor *)coldstone {
	return [NKFColor colorWithHexString:@"#a92718"];
}

+ (NKFColor *)coldstone2 {
	return [NKFColor colorWithHexString:@"#c69327"];
}

+ (NKFColor *)coldstonecreamery {
	return [NKFColor coldstone];
}

+ (NKFColor *)coldstonecreamery2 {
	return [NKFColor coldstone2];
}


+ (NKFColor *)costco {
	return [NKFColor colorWithRed:227.0f/255.0f green:24.0f/255.0f blue:55.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)costco2 {
	return [NKFColor colorWithRed:0.0f green:93.0f/255.0f blue:170.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)crackerbarrel {
	return [NKFColor colorWithHexString:@"#724316"];
}

+ (NKFColor *)crackerbarrel2 {
	return [NKFColor colorWithHexString:@"#eb9e2f"];
}


+ (NKFColor *)craftcms{
	return [NKFColor colorWithHexString:@"#da5a47"];
}


+ (NKFColor *)creativemarket{
	return [NKFColor colorWithHexString:@"#8ba753"];
}


+ (NKFColor *)crunchbase{
	return [NKFColor colorWithHexString:@"#2292a7"];
}


+ (NKFColor *)cub {
	return [NKFColor colorWithRed:255.0f/255.0f green:25.0f/255.0f blue:37.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)culvers {
	return [NKFColor colorWithHexString:@"#095694"];
}


+ (NKFColor *)cunard{
	return [NKFColor colorWithHexString:@"#1d1d1b"];
}

+ (NKFColor *)cunard2{
	return [NKFColor colorWithHexString:@"#ae9a64"];
}

+ (NKFColor *)cunard3{
	return [NKFColor colorWithHexString:@"#e42313"];
}

+ (NKFColor *)cunard4{
	return [NKFColor colorWithHexString:@"#8b8c8d"];
}


+ (NKFColor *)cvs {
	return [NKFColor colorWithRed:222.0f/255.0f green:0.0f blue:0.0f alpha:1.0f];
}


+ (NKFColor *)daimler{
	return [NKFColor colorWithHexString:@"#263f6a"];
}

+ (NKFColor *)daimler2{
	return [NKFColor colorWithHexString:@"#182b45"];
}

+ (NKFColor *)daimler3{
	return [NKFColor colorWithHexString:@"#6b0f24"];
}

+ (NKFColor *)daimler4{
	return [NKFColor colorWithHexString:@"#193725"];
}

+ (NKFColor *)daimler5{
	return [NKFColor colorWithHexString:@"#606061"];
}


+ (NKFColor *)dairyqueen {
	return [NKFColor colorWithRed:222.0f/255.0f green:60.0f/255.0f blue:73.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)dannon {
	return [NKFColor colorWithRed:38.0f/255.0f green:58.0f/255.0f blue:119.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)dannon2 {
	return [NKFColor colorWithRed:202.0f/255.0f green:30.0f/255.0f blue:42.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)dannon3 {
	return [NKFColor colorWithRed:66.0f/255.0f green:183.0f/255.0f blue:224.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)darntough {
	return [NKFColor colorWithRed:131.0f/255.0f green:26.0f/255.0f blue:11.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)darntough2 {
	return [NKFColor colorWithRed:49.0f/255.0f green:47.0f/255.0f blue:48.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)darntoughsocks {
	return [NKFColor darntough];
}

+ (NKFColor *)darntoughsocks2 {
	return [NKFColor darntough2];
}


+ (NKFColor *)daveandbusters {
	return [NKFColor colorWithHexString:@"#205e90"];
}

+ (NKFColor *)daveandbusters2 {
	return [NKFColor colorWithHexString:@"#f39c20"];
}


+ (NKFColor *)delectable{
	return [NKFColor colorWithHexString:@"#334858"];
}

+ (NKFColor *)delectable2{
	return [NKFColor colorWithHexString:@"#cd595a"];
}

+ (NKFColor *)delectable3{
	return [NKFColor colorWithHexString:@"#94938f"];
}

+ (NKFColor *)delectable4{
	return [NKFColor colorWithHexString:@"#a3a7a6"];
}

+ (NKFColor *)delectable5{
	return [NKFColor colorWithHexString:@"#dbc5b0"];
}

+ (NKFColor *)delectable6{
	return [NKFColor colorWithHexString:@"#f8dfc2"];
}

+ (NKFColor *)delectable7{
	return [NKFColor colorWithHexString:@"#f9ebdf"];
}


+ (NKFColor *)delhaize {
	return [NKFColor colorWithRed:244.0f/255.0f green:7.0f/255.0f blue:9.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)delhaze {
	return [NKFColor delhaize];
}


+ (NKFColor *)delicious{
	return [NKFColor colorWithHexString:@"#3399ff"];
}

+ (NKFColor *)delicious2{
	return [NKFColor colorWithHexString:@"#222222"];
}

+ (NKFColor *)delicious3{
	return [NKFColor colorWithHexString:@"#eeeeee"];
}


+ (NKFColor *)dell{
	return [NKFColor colorWithHexString:@"#0085c3"];
}

+ (NKFColor *)dell2{
	return [NKFColor colorWithHexString:@"#7ab800"];
}

+ (NKFColor *)dell3{
	return [NKFColor colorWithHexString:@"#f2af00"];
}

+ (NKFColor *)dell4{
	return [NKFColor colorWithHexString:@"#dc5034"];
}

+ (NKFColor *)dell5{
	return [NKFColor colorWithHexString:@"#ce1126"];
}

+ (NKFColor *)dell6{
	return [NKFColor colorWithHexString:@"#b7295a"];
}

+ (NKFColor *)dell7{
	return [NKFColor colorWithHexString:@"#6e2585"];
}

+ (NKFColor *)dell8{
	return [NKFColor colorWithHexString:@"#71c6c1"];
}

+ (NKFColor *)dell9{
	return [NKFColor colorWithHexString:@"#5482ab"];
}

+ (NKFColor *)dell10{
	return [NKFColor colorWithHexString:@"#009bbb"];
}

+ (NKFColor *)dell11{
	return [NKFColor colorWithHexString:@"#444444"];
}

+ (NKFColor *)dell12{
	return [NKFColor colorWithHexString:@"#eeeeee"];
}


+ (NKFColor *)deltaco {
	return [NKFColor colorWithHexString:@"#84be38"];
}

+ (NKFColor *)deltaco2 {
	return [NKFColor colorWithHexString:@"#e0211f"];
}

+ (NKFColor *)deltaco3 {
	return [NKFColor colorWithHexString:@"#fecf05"];
}


+ (NKFColor *)dennys {
	return [NKFColor colorWithHexString:@"#fddc25"];
}

+ (NKFColor *)dennys2 {
	return [NKFColor colorWithHexString:@"#e03335"];
}


+ (NKFColor *)dentalplans{
	return [NKFColor colorWithHexString:@"#f99104"];
}

+ (NKFColor *)dentalplans2{
	return [NKFColor colorWithHexString:@"#00b7c9"];
}


+ (NKFColor *)designernews{
	return [NKFColor colorWithHexString:@"#2d72d9"];
}


+ (NKFColor *)designmoo{
	return [NKFColor colorWithHexString:@"#e64b50"];
}

+ (NKFColor *)designmoo2{
	return [NKFColor colorWithHexString:@"#dbc65d"];
}


+ (NKFColor *)deviantart{
	return [NKFColor colorWithHexString:@"#05cc47"];
}

+ (NKFColor *)deviantart2{
	return [NKFColor colorWithHexString:@"#4dc47d"];
}

+ (NKFColor *)deviantart3{
	return [NKFColor colorWithHexString:@"#181a1b"];
}


+ (NKFColor *)devour{
	return [NKFColor colorWithHexString:@"#ff0000"];
}


+ (NKFColor *)dewalt{
	return [NKFColor colorWithHexString:@"#febd17"];
}


+ (NKFColor *)dhl{
	return [NKFColor colorWithHexString:@"#ba0c2f"];
}

+ (NKFColor *)dhl2{
	return [NKFColor colorWithHexString:@"#ffcd00"];
}

+ (NKFColor *)dhl3{
	return [NKFColor colorWithHexString:@"#c9c9c9"];
}


+ (NKFColor *)dicks {
	return [NKFColor colorWithRed:37.0f/255.0f green:120.0f/255.0f blue:100.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)dickssportinggoods {
	return [NKFColor dicks];
}


+ (NKFColor *)dierbergs {
	return [NKFColor colorWithRed:251.0f/255.0f green:1.0f/255.0f blue:21.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)dierbergs2 {
	return [NKFColor colorWithRed:193.0f/255.0f green:148.0f/255.0f blue:47.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)dierbergs3 {
	return [NKFColor black];
}

+ (NKFColor *)dierbersmarket {
	return [NKFColor dierbergs];
}


+ (NKFColor *)digg{
	return [NKFColor colorWithWhite:55.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)dillons {
	return [NKFColor colorWithRed:203.0f/255.0f green:22.0f/255.0f blue:38.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)directtv{
	return [NKFColor colorWithHexString:@"#00a6d6"];
}

+ (NKFColor *)directv{
	return [NKFColor colorWithHexString:@"#00a6d6"];
}

+ (NKFColor *)directv2{
	return [NKFColor colorWithHexString:@"#00629b"];
}

+ (NKFColor *)directv3{
	return [NKFColor colorWithHexString:@"#003865"];
}


+ (NKFColor *)disqus{
	return [NKFColor colorWithHexString:@"#2e9fff"];
}


+ (NKFColor *)disney {
	return [NKFColor colorWithHexString:@"#42CAC4"];
}


+ (NKFColor *)django{
	return [NKFColor colorWithHexString:@"#092e20"];
}


+ (NKFColor *)dollartree {
	return [NKFColor colorWithHexString:@"41aa51"];
}

+ (NKFColor *)dollarstore {
	return [NKFColor dollartree];
}


+ (NKFColor *)dollargeneral {
	return [NKFColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:1.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)dominos{
	return [NKFColor colorWithHexString:@"#0b648f"];
}

+ (NKFColor *)dominos2{
	return [NKFColor colorWithHexString:@"#e21737"];
}


+ (NKFColor *)dow{
	return [NKFColor colorWithHexString:@"#e80033"];
}

+ (NKFColor *)dow2{
	return [NKFColor colorWithHexString:@"#fdbb30"];
}

+ (NKFColor *)dow3{
	return [NKFColor colorWithHexString:@"#ed8b00"];
}

+ (NKFColor *)dow4{
	return [NKFColor colorWithHexString:@"#f15d22"];
}

+ (NKFColor *)dow5{
	return [NKFColor colorWithHexString:@"#bf0d3e"];
}

+ (NKFColor *)dow6{
	return [NKFColor colorWithHexString:@"#910048"];
}

+ (NKFColor *)dow7{
	return [NKFColor colorWithHexString:@"#d0006f"];
}


+ (NKFColor *)dribbble{
	return [NKFColor colorWithHexString:@"#444444"];
}

+ (NKFColor *)dribbble2{
	return [NKFColor colorWithHexString:@"#ea4c89"];
}

+ (NKFColor *)dribbble3{
	return [NKFColor colorWithHexString:@"#8aba56"];
}

+ (NKFColor *)dribbble4{
	return [NKFColor colorWithHexString:@"#ff8833"];
}

+ (NKFColor *)dribbble5{
	return [NKFColor colorWithHexString:@"#00b6e3"];
}

+ (NKFColor *)dribbble6{
	return [NKFColor colorWithHexString:@"#9ba5a8"];
}


+ (NKFColor *)dropbox{
	return [NKFColor colorWithHexString:@"#007ee5"];
}

+ (NKFColor *)dropbox2{
	return [NKFColor colorWithHexString:@"#7b8994"];
}

+ (NKFColor *)dropbox3{
	return [NKFColor colorWithHexString:@"#47525d"];
}

+ (NKFColor *)dropbox4{
	return [NKFColor colorWithHexString:@"#3d464d"];
}


+ (NKFColor *)droplr{
	return [NKFColor colorWithHexString:@"#5654a4"];
}


+ (NKFColor *)drupal{
	return [NKFColor colorWithHexString:@"#0077c0"];
}

+ (NKFColor *)drupal2{
	return [NKFColor colorWithHexString:@"#81ceff"];
}

+ (NKFColor *)drupal3{
	return [NKFColor colorWithHexString:@"#00598e"];
}


+ (NKFColor *)dunked{
	return [NKFColor colorWithHexString:@"#2da9d7"];
}

+ (NKFColor *)dunked2{
	return [NKFColor colorWithHexString:@"#212a3e"];
}


+ (NKFColor *)dunkindonuts {
	return [NKFColor colorWithHexString:@"#D81860"];
}

+ (NKFColor *)dunkindonuts2 {
	return [NKFColor colorWithHexString:@"#FC772A"];
}

+ (NKFColor *)dunkindonuts3 {
	return [NKFColor colorWithHexString:@"#8D6E51"];
}

+ (NKFColor *)dunkindonuts4 {
	return [NKFColor colorWithHexString:@"#483030"];
}

+ (NKFColor *)dunkingdonuts {
	return [NKFColor dunkindonuts];
}

+ (NKFColor *)donuts {
	return [NKFColor dunkindonuts];
}


+ (NKFColor *)etrade{
	return [NKFColor colorWithHexString:@"#6633cc"];
}

+ (NKFColor *)etrade2{
	return [NKFColor colorWithHexString:@"#99cc00"];
}


+ (NKFColor *)easyjet{
	return [NKFColor colorWithHexString:@"#ff6600"];
}

+ (NKFColor *)easyjet2{
	return [NKFColor colorWithHexString:@"#000000"];
}

+ (NKFColor *)easyjet3{
	return [NKFColor colorWithHexString:@"#58595b"];
}


+ (NKFColor *)ebay{
	return [NKFColor colorWithHexString:@"#e53238"];
}

+ (NKFColor *)ebay2{
	return [NKFColor colorWithHexString:@"#0064d2"];
}

+ (NKFColor *)ebay3{
	return [NKFColor colorWithHexString:@"#f5af02"];
}

+ (NKFColor *)ebay4{
	return [NKFColor colorWithHexString:@"#86b817"];
}


+ (NKFColor *)elance{
	return [NKFColor colorWithHexString:@"#0d69af"];
}


+ (NKFColor *)elephantbar {
	return [NKFColor colorWithHexString:@"#b40d18"];
}

+ (NKFColor *)elephantbar2 {
	return [NKFColor colorWithHexString:@"#ec9e31"];
}


+ (NKFColor *)ello{
	return [NKFColor colorWithHexString:@"#000000"];
}


+ (NKFColor *)elpolloloco {
	return [NKFColor colorWithHexString:@"#f8ec10"];
}

+ (NKFColor *)elpolloloco2 {
	return [NKFColor colorWithHexString:@"#d72226"];
}

+ (NKFColor *)elpolloloco3 {
	return [NKFColor colorWithHexString:@"#f3961b"];
}


+ (NKFColor *)eltorito {
	return [NKFColor colorWithHexString:@"#be2633"];
}

+ (NKFColor *)eltorito2 {
	return [NKFColor colorWithHexString:@"#e6b52c"];
}

+ (NKFColor *)eltorito3 {
	return [NKFColor colorWithHexString:@"#18573b"];
}


+ (NKFColor *)ember{
	return [NKFColor colorWithHexString:@"#f23819"];
}


+ (NKFColor *)engadget{
	return [NKFColor colorWithHexString:@"#40b3ff"];
}


+ (NKFColor *)envato{
	return [NKFColor colorWithHexString:@"#82b541"];
}


+ (NKFColor *)ericsson{
	return [NKFColor colorWithHexString:@"#002561"];
}


+ (NKFColor *)esl{
	return [NKFColor colorWithHexString:@"#0d9ddb"];
}

+ (NKFColor *)esl2{
	return [NKFColor colorWithHexString:@"#48b8e7"];
}

+ (NKFColor *)esl3{
	return [NKFColor colorWithHexString:@"#efecea"];
}

+ (NKFColor *)esl4{
	return [NKFColor colorWithHexString:@"#2c2b2b"];
}


+ (NKFColor *)espn{
	return [NKFColor colorWithHexString:@"#ff0033"];
}


+ (NKFColor *)etsy{
	return [NKFColor colorWithHexString:@"#d5641c"];
}


+ (NKFColor *)evernote{
	return [NKFColor colorWithHexString:@"#7ac142"];
}

+ (NKFColor *)evernote2{
	return [NKFColor colorWithHexString:@"#808084"];
}


+ (NKFColor *)fabcom{
	return [NKFColor colorWithHexString:@"#dd0017"];
}

+ (NKFColor *)fabcom2{
	return [NKFColor colorWithHexString:@"#000000"];
}


+ (NKFColor *)facebook{
	return [NKFColor colorWithHexString:@"#3b5998"];
}


+ (NKFColor *)fairfieldinn {
    return [NKFColor colorWithRed:108.0f/255.0f green:173.0f/255.0f blue:223.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)fairfieldinn2 {
    return [NKFColor colorWithRed:176.0f/255.0f green:96.0f/255.0f blue:16.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)fairfieldinn3 {
    return [NKFColor colorWithRed:0.0f/255.0f green:73.0f/255.0f blue:144.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)fairfieldinn4 {
    return [NKFColor colorWithRed:181.0f/255.0f green:9.0f/255.0f blue:156.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)fairfieldinn5 {
    return [NKFColor colorWithRed:213.0f/255.0f green:224.0f/255.0f blue:77.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)fairfieldinn6 {
    return [NKFColor colorWithRed:207.0f/255.0f green:212.0f/255.0f blue:216.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)fairfieldinn7 {
    return [NKFColor colorWithRed:147.0f/255.0f green:79.0f/255.0f blue:70.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)fairfieldinn8 {
    return [NKFColor colorWithRed:5.0f/255.0f green:108.0f/255.0f blue:182.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)familydollar {
	return [NKFColor colorWithRed:253.0f/255.0f green:72.0f/255.0f blue:55.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)familydollar2 {
	return [NKFColor colorWithRed:255.0f/255.0f green:173.0f/255.0f blue:63.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)familyfare {
	return [NKFColor colorWithRed:242.0f/255.0f green:45.0f/255.0f blue:8.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)famous{
	return [NKFColor colorWithHexString:@"#fa5c4f"];
}

+ (NKFColor *)famous2{
	return [NKFColor colorWithHexString:@"#333333"];
}


+ (NKFColor *)fancy{
	return [NKFColor colorWithHexString:@"#3098dc"];
}

+ (NKFColor *)fancy2{
	return [NKFColor colorWithHexString:@"#494e58"];
}


+ (NKFColor *)farmerboys {
	return [NKFColor colorWithHexString:@"#145559"];
}

+ (NKFColor *)farmerboys2 {
	return [NKFColor colorWithHexString:@"#f4dfa8"];
}

+ (NKFColor *)farmerboys3 {
	return [NKFColor colorWithHexString:@"#de6037"];
}


+ (NKFColor *)farmfresh {
	return [NKFColor colorWithRed:2.0f/255.0f green:100.0f/255.0f blue:47.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)farmfresh2 {
	return [NKFColor colorWithRed:26.0f/255.0f green:187.0f/255.0f blue:83.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)farmfresh3 {
	return [NKFColor colorWithRed:245.0f/255.0f green:237.0f/255.0f blue:14.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)farmfresh4 {
	return [NKFColor colorWithRed:241.0f/255.0f green:25.0f/255.0f blue:38.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)fatburger {
	return [NKFColor colorWithHexString:@"#f7ef93"];
}

+ (NKFColor *)fatburger2 {
	return [NKFColor colorWithHexString:@"#d23839"];
}


+ (NKFColor *)fedex{
	return [NKFColor colorWithHexString:@"#660099"];
}

+ (NKFColor *)fedex2{
	return [NKFColor colorWithHexString:@"#ff6600"];
}

+ (NKFColor *)fedex3{
	return [NKFColor colorWithHexString:@"#00cc00"];
}

+ (NKFColor *)fedex4{
	return [NKFColor colorWithHexString:@"#0099cc"];
}

+ (NKFColor *)fedex5{
	return [NKFColor colorWithHexString:@"#ff0033"];
}

+ (NKFColor *)fedex6{
	return [NKFColor colorWithHexString:@"#ffcc00"];
}

+ (NKFColor *)fedex7{
	return [NKFColor colorWithHexString:@"#999999"];
}

+ (NKFColor *)federalexpress {
	return [NKFColor fedex];
}


+ (NKFColor *)ferrari {
	return [NKFColor ferrariRed];
}


+ (NKFColor *)fiat{
	return [NKFColor colorWithHexString:@"#96172e"];
}

+ (NKFColor *)fiat2{
	return [NKFColor colorWithHexString:@"#6d2d41"];
}


+ (NKFColor *)firefox{
	return [NKFColor colorWithHexString:@"#e66000"];
}

+ (NKFColor *)firefox2{
	return [NKFColor colorWithHexString:@"#ff9500"];
}

+ (NKFColor *)firefox3{
	return [NKFColor colorWithHexString:@"#ffcb00"];
}

+ (NKFColor *)firefox4{
	return [NKFColor colorWithHexString:@"#00539f"];
}

+ (NKFColor *)firefox5{
	return [NKFColor colorWithHexString:@"#0095dd"];
}

+ (NKFColor *)firefox6{
	return [NKFColor colorWithHexString:@"#331e54"];
}

+ (NKFColor *)firefox7{
	return [NKFColor colorWithHexString:@"#002147"];
}


+ (NKFColor *)fitbit{
	return [NKFColor colorWithHexString:@"#4cc2c4"];
}

+ (NKFColor *)fitbit2{
	return [NKFColor colorWithHexString:@"#f54785"];
}

+ (NKFColor *)fitbit3{
	return [NKFColor colorWithHexString:@"#343434"];
}


+ (NKFColor *)fiveguys{
	return [NKFColor colorWithHexString:@"#ed174f"];
}

+ (NKFColor *)fiveguys2{
	return [NKFColor colorWithHexString:@"#fbb040"];
}

+ (NKFColor *)fiveguys3{
	return [NKFColor colorWithHexString:@"#efc402"];
}

+ (NKFColor *)fiveguys4{
	return [NKFColor colorWithHexString:@"#d4891c"];
}


+ (NKFColor *)flattr{
	return [NKFColor colorWithHexString:@"#f67c1a"];
}

+ (NKFColor *)flattr2{
	return [NKFColor colorWithHexString:@"#338d11"];
}


+ (NKFColor *)flavorsme{
	return [NKFColor colorWithHexString:@"#f10087"];
}

+ (NKFColor *)flavorsme2{
	return [NKFColor colorWithHexString:@"#009ae7"];
}


+ (NKFColor *)flickr{
	return [NKFColor colorWithHexString:@"#0063dc"];
}

+ (NKFColor *)flickr2{
	return [NKFColor colorWithHexString:@"#ff0084"];
}


+ (NKFColor *)flipboard{
	return [NKFColor colorWithHexString:@"#e12828"];
}


+ (NKFColor *)flixster{
	return [NKFColor colorWithHexString:@"#2971b2"];
}


+ (NKFColor *)follr{
	return [NKFColor colorWithHexString:@"#4dc9f6"];
}

+ (NKFColor *)follr2{
	return [NKFColor colorWithHexString:@"#f67019"];
}

+ (NKFColor *)follr3{
	return [NKFColor colorWithHexString:@"#f53794"];
}

+ (NKFColor *)follr4{
	return [NKFColor colorWithHexString:@"#537bc4"];
}

+ (NKFColor *)follr5{
	return [NKFColor colorWithHexString:@"#acc236"];
}


+ (NKFColor *)food4less {
	return [NKFColor black];
}

+ (NKFColor *)food4less2 {
	return [NKFColor colorWithRed:249.0f/255.0f green:232.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)foodsco {
	return [NKFColor colorWithRed:0.0f/255.0f green:160.0f/255.0f blue:62.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)foodlion {
	return [NKFColor colorWithRed:0.0f/255.0f green:75.0f/255.0f blue:130.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)foodlion2 {
	return [NKFColor black];
}


+ (NKFColor *)footlocker {
	return [NKFColor colorWithRed:204.0f/255.0f green:37.0f/255.0f blue:39.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)ford {
	return [NKFColor colorWithRed:49.0f/255.0f green:122.0f/255.0f blue:180.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)fordmotorcompany {
	return [NKFColor ford];
}


+ (NKFColor *)forever21 {
	return [NKFColor colorWithRed:255.0f/255.0f green:233.0f/255.0f blue:26.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)forrst{
	return [NKFColor colorWithHexString:@"#5b9a68"];
}


+ (NKFColor *)foursquare{
	return [NKFColor colorWithHexString:@"#f94877"];
}

+ (NKFColor *)foursquare2{
	return [NKFColor colorWithHexString:@"#0732a2"];
}

+ (NKFColor *)foursquare3{
	return [NKFColor colorWithHexString:@"#2d5be3"];
}


+ (NKFColor *)fredmeyers {
	return [NKFColor colorWithRed:237.0f/255.0f green:28.0f/255.0f blue:36.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)fredmeyer {
	return [NKFColor fredmeyers];
}


+ (NKFColor *)friendlys {
	return [NKFColor colorWithHexString:@"#fd0b02"];
}


+ (NKFColor *)frys {
	return [NKFColor colorWithRed:236.0f/255.0f green:28.0f/255.0f blue:44.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)frys2 {
	return [NKFColor black];
}


+ (NKFColor *)gap {
	return [NKFColor colorWithRed:0.0f green:42.0f/255.0f blue:95.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)garmin{
	return [NKFColor colorWithHexString:@"#007cc3"];
}


+ (NKFColor *)geico {
    return [NKFColor royalBlue];
}


+ (NKFColor *)generalmotors {
	return [NKFColor colorWithRed:19.0f/255.0f green:0.0f/255.0f blue:127.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)geocaching{
	return [NKFColor colorWithHexString:@"#4a742c"];
}


+ (NKFColor *)gerbes {
	return [NKFColor dillons];
}


+ (NKFColor *)ghost{
	return [NKFColor colorWithHexString:@"#212425"];
}

+ (NKFColor *)ghost2{
	return [NKFColor colorWithHexString:@"#718087"];
}

+ (NKFColor *)ghost3{
	return [NKFColor colorWithHexString:@"#5ba4e5"];
}

+ (NKFColor *)ghost4{
	return [NKFColor colorWithHexString:@"#9fbb58"];
}

+ (NKFColor *)ghost5{
	return [NKFColor colorWithHexString:@"#e9e8dd"];
}


+ (NKFColor *)gibson{
	return [NKFColor colorWithHexString:@"#000000"];
}

+ (NKFColor *)gibson2{
	return [NKFColor colorWithHexString:@"#436f8e"];
}

+ (NKFColor *)gibson3{
	return [NKFColor colorWithHexString:@"#887d59"];
}

+ (NKFColor *)gibson4{
	return [NKFColor colorWithHexString:@"#8f9696"];
}


+ (NKFColor *)gimmebar{
	return [NKFColor colorWithHexString:@"#d6156c"];
}


+ (NKFColor *)github{
	return [NKFColor colorWithHexString:@"#4183c4"];
}

+ (NKFColor *)github2{
	return [NKFColor colorWithHexString:@"#999999"];
}

+ (NKFColor *)github3{
	return [NKFColor colorWithHexString:@"#666666"];
}

+ (NKFColor *)github4{
	return [NKFColor colorWithHexString:@"#333333"];
}

+ (NKFColor *)github5{
	return [NKFColor colorWithHexString:@"#6cc644"];
}

+ (NKFColor *)github6{
	return [NKFColor colorWithHexString:@"#bd2c00"];
}

+ (NKFColor *)github7{
	return [NKFColor colorWithHexString:@"#ff9933"];
}


+ (NKFColor *)gittip{
	return [NKFColor colorWithHexString:@"#663300"];
}

+ (NKFColor *)gittip2{
	return [NKFColor colorWithHexString:@"#339966"];
}


+ (NKFColor *)godaddy{
	return [NKFColor colorWithHexString:@"#7db701"];
}

+ (NKFColor *)godaddy2{
	return [NKFColor colorWithHexString:@"#ff8a00"];
}


+ (NKFColor *)goldencorral {
	return [NKFColor colorWithHexString:@"#a12720"];
}

+ (NKFColor *)goldencorral2 {
	return [NKFColor colorWithHexString:@"#f9ca76"];
}

+ (NKFColor *)goldencorral3 {
	return [NKFColor colorWithHexString:@"#f7e3ab"];
}


+ (NKFColor *)goodreads{
	return [NKFColor colorWithHexString:@"#553b08"];
}


+ (NKFColor *)google{
	return [NKFColor colorWithHexString:@"#4285f4"];
}

+ (NKFColor *)google2{
	return [NKFColor colorWithHexString:@"#db4437"];
}

+ (NKFColor *)google3{
	return [NKFColor colorWithHexString:@"#f4b400"];
}

+ (NKFColor *)google4{
	return [NKFColor colorWithHexString:@"#0f9d58"];
}

+ (NKFColor *)google5{
	return [NKFColor colorWithHexString:@"#e7e6dd"];
}


+ (NKFColor *)googleplus{
	return [NKFColor colorWithHexString:@"#dd4b39"];
}


+ (NKFColor *)guitarcenter {
	return [NKFColor colorWithRed:245.0f/255.0f green:33.0f/255.0f blue:50.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)gravatar{
	return [NKFColor colorWithHexString:@"#1e8cbe"];
}


+ (NKFColor *)greatclips {
	return [NKFColor black];
}


+ (NKFColor *)grocery{
	return [NKFColor forestGreenTraditional];
}

+ (NKFColor *)groceries {
	return [NKFColor grocery];
}

+ (NKFColor *)grocerystore {
	return [NKFColor grocery];
}

+ (NKFColor *)store {
	return [NKFColor grocery];
}


+ (NKFColor *)groupon{
	return [NKFColor colorWithHexString:@"#82b548"];
}


+ (NKFColor *)hackernews{
	return [NKFColor colorWithHexString:@"#ff6600"];
}


+ (NKFColor *)handm {
	return [NKFColor colorWithRed:254.0f/255.0f green:0.0f blue:2.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)hannaford {
	return [NKFColor colorWithRed:236.0f/255.0f green:27.0f/255.0f blue:46.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)hannaford2 {
	return [NKFColor colorWithRed:47.0f/255.0f green:180.0f/255.0f blue:86.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)hannaford3 {
	return [NKFColor colorWithRed:145.0f/255.0f green:109.0f/255.0f blue:175.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)hannaford4 {
	return [NKFColor colorWithRed:254.0f/255.0f green:225.0f/255.0f blue:152.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)hardees {
	return [NKFColor carlsjr];
}

+ (NKFColor *)hardees2 {
	return [NKFColor carlsjr2];
}


+ (NKFColor *)hardrock {
	return [NKFColor colorWithHexString:@"#f5b103"];
}

+ (NKFColor *)hardrock2 {
	return [NKFColor colorWithHexString:@"#993520"];
}


+ (NKFColor *)harristeeter {
	return [NKFColor colorWithRed:219.0f/255.0f green:2.0f/255.0f blue:5.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)harristeeter2 {
	return [NKFColor colorWithRed:1.0f/255.0f green:173.0f/255.0f blue:95.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)harristeeter3 {
	return [NKFColor colorWithRed:37.0f/255.0f green:109.0f/255.0f blue:159.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)harristeeter4 {
	return [NKFColor colorWithRed:248.0f/255.0f green:179.0f/255.0f blue:102.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)harristeeter5 {
	return [NKFColor colorWithRed:246.0f/255.0f green:67.0f/255.0f blue:78.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)harristeeter6 {
	return [NKFColor colorWithRed:1.0f/255.0f green:164.0f/255.0f blue:117.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)heb {
	return [NKFColor colorWithRed:254.0f/255.0f green:0.0f/255.0f blue:2.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)hebplus {
	return [NKFColor colorWithRed:2.0f/255.0f green:146.0f/255.0f blue:208.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)heineken{
	return [NKFColor colorWithHexString:@"#00a100"];
}

+ (NKFColor *)heineken2{
	return [NKFColor colorWithHexString:@"#ff2b00"];
}

+ (NKFColor *)heineken3{
	return [NKFColor colorWithHexString:@"#999999"];
}


+ (NKFColor *)hellowallet{
	return [NKFColor colorWithHexString:@"#0093d0"];
}


+ (NKFColor *)heroku{
	return [NKFColor colorWithHexString:@"#c9c3e6"];
}

+ (NKFColor *)heroku2{
	return [NKFColor colorWithHexString:@"#6762a6"];
}


+ (NKFColor *)hertz {
	return [NKFColor colorWithHexString:@"#FFD60D"];
}


+ (NKFColor *)hesburger {
	return [NKFColor colorWithHexString:@"#eb343a"];
}

+ (NKFColor *)hesburger2 {
	return [NKFColor colorWithHexString:@"#0c6fac"];
}


+ (NKFColor *)hi5{
	return [NKFColor colorWithHexString:@"#fd9827"];
}


+ (NKFColor *)hilander {
	return [NKFColor colorWithRed:0.0f/255.0f green:128.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)hilton {
    return [NKFColor colorWithHexString:@"#003150"];
}

+ (NKFColor *)hilton2 {
    return [NKFColor black];
}

+ (NKFColor *)hilton3 {
    return [NKFColor white];
}


+ (NKFColor *)hobbylobby {
	return [NKFColor colorWithRed:222.0f/255.0f green:104.0f/255.0f blue:32.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)hotdogonastick {
	return [NKFColor colorWithRed:232.0f/255.0f green:0.0f/255.0f blue:47.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)hotdogonastick2 {
	return [NKFColor colorWithRed:252.0f/255.0f green:255.0f/255.0f blue:34.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)hotdogonastick3 {
	return [NKFColor colorWithRed:48.0f/255.0f green:73.0f/255.0f blue:238.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)homedepot{
	return [NKFColor colorWithHexString:@"#f96305"];
}

+ (NKFColor *)homeimprovement {
	return [NKFColor homedepot];
}


+ (NKFColor *)homegoods {
	return [NKFColor colorWithRed:211.0f/255.0f green:18.0f/255.0f blue:65.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)hooters {
	return [NKFColor colorWithHexString:@"#f94e04"];
}


+ (NKFColor *)hootsuite{
	return [NKFColor colorWithHexString:@"#003265"];
}

+ (NKFColor *)hootsuite2{
	return [NKFColor colorWithHexString:@"#f7e8d5"];
}

+ (NKFColor *)hootsuite3{
	return [NKFColor colorWithHexString:@"#ffbd0a"];
}

+ (NKFColor *)hootsuite4{
	return [NKFColor colorWithHexString:@"#c6af92"];
}

+ (NKFColor *)hootsuite5{
	return [NKFColor colorWithHexString:@"#71685f"];
}

+ (NKFColor *)hootsuite6{
	return [NKFColor colorWithHexString:@"#54493f"];
}

+ (NKFColor *)hootsuite7{
	return [NKFColor colorWithHexString:@"#38322d"];
}


+ (NKFColor *)hornbachers {
	return [NKFColor colorWithRed:239.0f/255.0f green:60.0f/255.0f blue:70.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)houzz{
	return [NKFColor colorWithHexString:@"#7ac142"];
}

+ (NKFColor *)houzz2{
	return [NKFColor colorWithHexString:@"#000000"];
}


+ (NKFColor *)hp{
	return [NKFColor colorWithHexString:@"#0096d6"];
}

+ (NKFColor *)hp2{
	return [NKFColor colorWithHexString:@"#d7410b"];
}

+ (NKFColor *)hewlettpackard {
	return [NKFColor hp];
}

+ (NKFColor *)hewlettpackard2 {
	return [NKFColor hp2];
}


+ (NKFColor *)hsbc{
	return [NKFColor colorWithHexString:@"#db0011"];
}


+ (NKFColor *)html5{
	return [NKFColor colorWithHexString:@"#e34f26"];
}


+ (NKFColor *)huddlehouse {
	return [NKFColor colorWithHexString:@"#9d2e2f"];
}

+ (NKFColor *)huddlehouse2 {
	return [NKFColor colorWithHexString:@"#662d37"];
}

+ (NKFColor *)huddlehouse3 {
	return [NKFColor colorWithHexString:@"#e79d54"];
}


+ (NKFColor *)hulu{
	return [NKFColor colorWithHexString:@"#a5cd39"];
}

+ (NKFColor *)hulu2{
	return [NKFColor colorWithHexString:@"#6bb03e"];
}


+ (NKFColor *)hungryjacks {
	return [NKFColor burgerking];
}

+ (NKFColor *)hungryjacks2 {
	return [NKFColor burgerking2];
}

+ (NKFColor *)hungryjacks3 {
	return [NKFColor burgerking3];
}

+ (NKFColor *)hungryjacks4 {
	return [NKFColor burgerking4];
}


+ (NKFColor *)hyundai {
	return [NKFColor colorWithRed:32.0f/255.0f green:72.0f/255.0f blue:161.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)hyundai2 {
	return [NKFColor colorWithRed:37.0f/255.0f green:170.0f/255.0f blue:81.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)hyundai3 {
	return [NKFColor colorWithRed:248.0f/255.0f green:187.0f/255.0f blue:37.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)ibm{
	return [NKFColor colorWithHexString:@"#006699"];
}


+ (NKFColor *)identica{
	return [NKFColor colorWithHexString:@"#789240"];
}

+ (NKFColor *)identica2{
	return [NKFColor colorWithHexString:@"#7d0100"];
}

+ (NKFColor *)identica3{
	return [NKFColor colorWithHexString:@"#8baaff"];
}


+ (NKFColor *)ifttt{
	return [NKFColor colorWithHexString:@"#33ccff"];
}

+ (NKFColor *)ifttt2{
	return [NKFColor colorWithHexString:@"#ff4400"];
}

+ (NKFColor *)ifttt3{
	return [NKFColor colorWithHexString:@"#000000"];
}


+ (NKFColor *)iheartradio{
	return [NKFColor colorWithHexString:@"#c6002b"];
}


+ (NKFColor *)ihop {
	return [NKFColor colorWithHexString:@"#178bcd"];
}

+ (NKFColor *)ihop2 {
	return [NKFColor colorWithHexString:@"#ec4135"];
}


+ (NKFColor *)ikea{
	return [NKFColor colorWithHexString:@"#ffcc00"];
}

+ (NKFColor *)ikea2{
	return [NKFColor colorWithHexString:@"#003399"];
}


+ (NKFColor *)imdb{
	return [NKFColor colorWithHexString:@"#f5de50"];
}


+ (NKFColor *)imgur{
	return [NKFColor colorWithHexString:@"#85bf25"];
}


+ (NKFColor *)indiegogo{
	return [NKFColor colorWithHexString:@"#eb1478"];
}


+ (NKFColor *)innout {
    return [NKFColor colorWithHexString:@"#D00825"];
}

+ (NKFColor *)innout2 {
    return [NKFColor colorWithHexString:@"#FCF65A"];
}

+ (NKFColor *)innout3 {
    return [NKFColor colorWithHexString:@"#000000"];
}



+ (NKFColor *)instacart{
	return [NKFColor colorWithHexString:@"#60ab59"];
}


+ (NKFColor *)instagram{
	return [NKFColor colorWithHexString:@"#3f729b"];
}


+ (NKFColor *)instapaper{
	return [NKFColor colorWithHexString:@"#000000"];
}

+ (NKFColor *)instapaper2{
	return [NKFColor colorWithHexString:@"#428bca"];
}


+ (NKFColor *)intel{
	return [NKFColor colorWithHexString:@"#0f7dc2"];
}


+ (NKFColor *)intuit{
	return [NKFColor colorWithHexString:@"#365ebf"];
}


+ (NKFColor *)ios{
	return [NKFColor colorWithHexString:@"#5fc9f8"];
}

+ (NKFColor *)ios2{
	return [NKFColor colorWithHexString:@"#fecb2e"];
}

+ (NKFColor *)ios3{
	return [NKFColor colorWithHexString:@"#fd9426"];
}

+ (NKFColor *)ios4{
	return [NKFColor colorWithHexString:@"#fc3158"];
}

+ (NKFColor *)ios5{
	return [NKFColor colorWithHexString:@"#147efb"];
}

+ (NKFColor *)ios6{
	return [NKFColor colorWithHexString:@"#53d769"];
}

+ (NKFColor *)ios7{
	return [NKFColor colorWithHexString:@"#fc3d39"];
}

+ (NKFColor *)ios8{
	return [NKFColor colorWithHexString:@"#8e8e93"];
}


+ (NKFColor *)jackinthebox {
	return [NKFColor red];
}

+ (NKFColor *)jacknthebox {
	return [NKFColor jackinthebox];
}


+ (NKFColor *)jambajuice {
	return [NKFColor colorWithRed:96.0f/255.0f green:44.0f/255.0f blue:6.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)jawbone{
	return [NKFColor colorWithHexString:@"#000000"];
}


+ (NKFColor *)jayc {
	return [NKFColor colorWithRed:196.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)jcpenney {
	return [NKFColor colorWithRed:237.0f/255.0f green:29.0f/255.0f blue:37.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)jcpenny {
	return [NKFColor jcpenney];
}

+ (NKFColor *)jcpenneys {
	return [NKFColor colorWithRed:46.0f/255.0f green:48.0f/255.0f blue:148.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)jeep {
	return [NKFColor colorWithRed:73.0f/255.0f green:97.0f/255.0f blue:44.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)jerseymikes {
	return [NKFColor colorWithHexString:@"#1f4873"];
}

+ (NKFColor *)jerseymikes2 {
	return [NKFColor colorWithHexString:@"#ce3a33"];
}


+ (NKFColor *)jimmyjohns {
	return [NKFColor colorWithHexString:@"#df3740"];
}

+ (NKFColor *)jimmyjohns2 {
	return [NKFColor black];
}

+ (NKFColor *)jimmyjohns3 {
	return [NKFColor white];
}


+ (NKFColor *)joann {
	return [NKFColor colorWithRed:11.0f/255.0f green:59.0f/255.0f blue:49.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)joannfabric {
	return [NKFColor joann];
}

+ (NKFColor *)joannfabrics {
	return [NKFColor joann];
}


+ (NKFColor *)joescrabshack {
	return [NKFColor colorWithHexString:@"#5695f7"];
}

+ (NKFColor *)joescrabshack2 {
	return [NKFColor colorWithHexString:@"#fd1900"];
}


+ (NKFColor *)johnnyrockets {
    NSLog(@"REally?!?!?!");
	return [NKFColor colorWithHexString:@"#c62034"];
}

+ (NKFColor *)johnnyrockets2 {
    return [NKFColor colorWithHexString:@"#f9c652"];
}

+ (NKFColor *)johnnyrockets3 {
    return [NKFColor colorWithHexString:@"#c5453b"];
}

+ (NKFColor *)johnnyrockets4 {
    return [NKFColor colorWithHexString:@"#397ca4"];
}


+ (NKFColor *)jordans {
	return [NKFColor colorWithRed:49.0f/255.0f green:49.0f/255.0f blue:47.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)jordansfurniture {
	return [NKFColor jordans];
}


+ (NKFColor *)joyent{
	return [NKFColor colorWithHexString:@"#ff6600"];
}


+ (NKFColor *)keeeb{
	return [NKFColor colorWithHexString:@"#00a9c0"];
}


+ (NKFColor *)kfc {
	return [NKFColor colorWithHexString:@"#a00a0e"];
}

+ (NKFColor *)kfc2 {
	return [NKFColor colorWithHexString:@"#090909"];
}

+ (NKFColor *)kfc3 {
	return [NKFColor colorWithHexString:@"#f8e9d8"];
}


+ (NKFColor *)kohls {
	return [NKFColor colorWithRed:135.0f/255.0f green:35.0f/255.0f blue:61.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)khanacademy{
	return [NKFColor colorWithHexString:@"#9cb443"];
}

+ (NKFColor *)khanacademy2{
	return [NKFColor colorWithHexString:@"#242f3a"];
}


+ (NKFColor *)kia{
	return [NKFColor colorWithHexString:@"#c21a30"];
}


+ (NKFColor *)kickstarter{
	return [NKFColor colorWithHexString:@"#2bde73"];
}

+ (NKFColor *)kickstarter2{
	return [NKFColor colorWithHexString:@"#0f2105"];
}


+ (NKFColor *)kingsoopers {
	return [NKFColor colorWithRed:237.0f/255.0f green:28.0f/255.0f blue:36.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)kingsoopers2 {
	return [NKFColor colorWithRed:255.0f/255.0f green:242.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)kinkos {
	return [NKFColor darkBlue];
}

+ (NKFColor *)kinkos2 {
	return [NKFColor redPantone];
}


+ (NKFColor *)kippt{
	return [NKFColor colorWithHexString:@"#d51007"];
}


+ (NKFColor *)kitkat{
	return [NKFColor colorWithHexString:@"#d70021"];
}


+ (NKFColor *)kiwipay{
	return [NKFColor colorWithHexString:@"#00b0df"];
}


+ (NKFColor *)kmart {
	return [NKFColor colorWithRed:227.0f/255.0f green:25.0f/255.0f blue:55.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)krispykreme {
	return [NKFColor colorWithHexString:@"#00744f"];
}

+ (NKFColor *)krispykreme2 {
	return [NKFColor colorWithHexString:@"#cc1241"];
}


+ (NKFColor *)kroger {
	return [NKFColor colorWithRed:36.0f/255.0f green:96.0f/255.0f blue:166.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)kroger2 {
	return [NKFColor colorWithRed:216.0f/255.0f green:34.0f/255.0f blue:38.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)laravel{
	return [NKFColor colorWithHexString:@"#f55247"];
}


+ (NKFColor *)lastfm{
	return [NKFColor colorWithHexString:@"#d51007"];
}


+ (NKFColor *)lasvegas {
	return [NKFColor nevada];
}

+ (NKFColor *)lasvegas2 {
	return [NKFColor nevada2];
}


+ (NKFColor *)linkedin{
	return [NKFColor colorWithHexString:@"#0077b5"];
}

+ (NKFColor *)linkedin2{
	return [NKFColor colorWithHexString:@"#000000"];
}

+ (NKFColor *)linkedin3{
	return [NKFColor colorWithHexString:@"#313335"];
}

+ (NKFColor *)linkedin4{
	return [NKFColor colorWithHexString:@"#86888a"];
}

+ (NKFColor *)linkedin5{
	return [NKFColor colorWithHexString:@"#caccce"];
}

+ (NKFColor *)linkedin6{
	return [NKFColor colorWithHexString:@"#00a0dc"];
}

+ (NKFColor *)linkedin7{
	return [NKFColor colorWithHexString:@"#8d6cab"];
}

+ (NKFColor *)linkedin8{
	return [NKFColor colorWithHexString:@"#dd5143"];
}

+ (NKFColor *)linkedin9{
	return [NKFColor colorWithHexString:@"#e68523"];
}


+ (NKFColor *)littlecaesars {
	return [NKFColor colorWithHexString:@"#f5790d"];
}

+ (NKFColor *)littlecaesars2 {
	return [NKFColor colorWithHexString:@"#12110e"];
}


+ (NKFColor *)livestream{
	return [NKFColor colorWithHexString:@"#cf202e"];
}

+ (NKFColor *)livestream2{
	return [NKFColor colorWithHexString:@"#232121"];
}

+ (NKFColor *)livestream3{
	return [NKFColor colorWithHexString:@"#f78822"];
}

+ (NKFColor *)livestream4{
	return [NKFColor colorWithHexString:@"#f6db35"];
}

+ (NKFColor *)livestream5{
	return [NKFColor colorWithHexString:@"#6dc067"];
}

+ (NKFColor *)livestream6{
	return [NKFColor colorWithHexString:@"#4185be"];
}

+ (NKFColor *)livestream7{
	return [NKFColor colorWithHexString:@"#8f499c"];
}


+ (NKFColor *)llbean {
	return [NKFColor colorWithRed:77.0f/255.0f green:110.0f/255.0f blue:59.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)lloyds{
	return [NKFColor colorWithHexString:@"#d81f2a"];
}

+ (NKFColor *)lloyds2{
	return [NKFColor colorWithHexString:@"#ff9900"];
}

+ (NKFColor *)lloyds3{
	return [NKFColor colorWithHexString:@"#e0d86e"];
}

+ (NKFColor *)lloyds4{
	return [NKFColor colorWithHexString:@"#9ea900"];
}

+ (NKFColor *)lloyds5{
	return [NKFColor colorWithHexString:@"#6ec9e0"];
}

+ (NKFColor *)lloyds6{
	return [NKFColor colorWithHexString:@"#007ea3"];
}

+ (NKFColor *)lloyds7{
	return [NKFColor colorWithHexString:@"#9e4770"];
}

+ (NKFColor *)lloyds8{
	return [NKFColor colorWithHexString:@"#631d76"];
}

+ (NKFColor *)lloyds9{
	return [NKFColor colorWithHexString:@"#1e1e1e"];
}


+ (NKFColor *)lomo{
	return [NKFColor colorWithHexString:@"#eb0028"];
}

+ (NKFColor *)lomo2{
	return [NKFColor colorWithHexString:@"#00a0df"];
}


+ (NKFColor *)longjohnsilvers {
	return [NKFColor colorWithHexString:@"#1c4289"];
}

+ (NKFColor *)longjohnsilvers2 {
	return [NKFColor colorWithHexString:@"#30a99c"];
}

+ (NKFColor *)longjohnsilvers3 {
	return [NKFColor colorWithHexString:@"#d7867a"];
}


+ (NKFColor *)losangeles {
	return [NKFColor california];
}

+ (NKFColor *)losangeles2 {
	return [NKFColor california2];
}


+ (NKFColor *)lowes {
	return [NKFColor colorWithRed:0.0f green:72.0f/255.0f blue:144.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)lucky {
	return [NKFColor colorWithRed:18.0f/255.0f green:49.0f/255.0f blue:86.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)luckybrand {
	return [NKFColor lucky];
}


+ (NKFColor *)lumo{
	return [NKFColor colorWithHexString:@"#576396"];
}


+ (NKFColor *)lyft{
	return [NKFColor colorWithHexString:@"#d71472"];
}

+ (NKFColor *)lyft2{
	return [NKFColor colorWithHexString:@"#333e48"];
}

+ (NKFColor *)lyft3{
	return [NKFColor colorWithHexString:@"#c2bcb5"];
}

+ (NKFColor *)lyft4{
	return [NKFColor colorWithHexString:@"#fcdcf0"];
}

+ (NKFColor *)lyft5{
	return [NKFColor colorWithHexString:@"#85a6c7"];
}

+ (NKFColor *)lyft6{
	return [NKFColor colorWithHexString:@"#00b2a9"];
}

+ (NKFColor *)lyft7{
	return [NKFColor colorWithHexString:@"#9bd9d9"];
}


+ (NKFColor *)macaronigrill {
	return [NKFColor colorWithHexString:@"#6e2e3a"];
}

+ (NKFColor *)macaronigrill2 {
	return [NKFColor colorWithHexString:@"#566e15"];
}

+ (NKFColor *)macaronigrill3 {
	return [NKFColor colorWithHexString:@"#bd1524"];
}


+ (NKFColor *)macys {
	return [NKFColor colorWithRed:232.0f/255.0f green:1.0f/255.0f blue:1.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)mailchimp{
	return [NKFColor colorWithHexString:@"#2c9ab7"];
}

+ (NKFColor *)mailchimp2{
	return [NKFColor colorWithHexString:@"#449a88"];
}

+ (NKFColor *)mailchimp3{
	return [NKFColor colorWithHexString:@"#febe12"];
}

+ (NKFColor *)mailchimp4{
	return [NKFColor colorWithHexString:@"#db3a1b"];
}

+ (NKFColor *)mailchimp5{
	return [NKFColor colorWithHexString:@"#373737"];
}


+ (NKFColor *)marriott {
	return [NKFColor colorWithHexString:@"#9d102d"];
}

+ (NKFColor *)marriott2 {
	return [NKFColor colorWithHexString:@"#6c193f"];
}

+ (NKFColor *)marriott3 {
	return [NKFColor colorWithHexString:@"#d21034"];
}

+ (NKFColor *)marriott4 {
	return [NKFColor colorWithHexString:@"#d60077"];
}

+ (NKFColor *)marriott5 {
	return [NKFColor colorWithHexString:@"#ff5c00"];
}

+ (NKFColor *)marriott6 {
	return [NKFColor colorWithHexString:@"#767a7d"];
}


+ (NKFColor *)marketbasket {
	return [NKFColor colorWithRed:204.0f/255.0f green:0.0f blue:27.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)marketbasket2 {
	return [NKFColor colorWithRed:4.0f/255.0f green:115.0f/255.0f blue:204.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)marshalls {
	return [NKFColor colorWithRed:0.0f green:48.0f/255.0f blue:153.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)marykay {
	return [NKFColor colorWithRed:248.0f/255.0f green:31.0f/255.0f blue:105.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)massygroup{
	return [NKFColor colorWithHexString:@"#004a77"];
}

+ (NKFColor *)massygroup2{
	return [NKFColor colorWithHexString:@"#00adee"];
}

+ (NKFColor *)massygroup3{
	return [NKFColor colorWithHexString:@"#ff8100"];
}

+ (NKFColor *)massygroup4{
	return [NKFColor colorWithHexString:@"#ffd200"];
}


+ (NKFColor *)mastercard{
	return [NKFColor colorWithHexString:@"#cc0000"];
}

+ (NKFColor *)mastercard2{
	return [NKFColor colorWithHexString:@"#ff9900"];
}

+ (NKFColor *)mastercard3{
	return [NKFColor colorWithHexString:@"#000066"];
}


+ (NKFColor *)mccafe {
	return [NKFColor colorWithHexString:@"#571205"];
}

+ (NKFColor *)mccafe2 {
	return [NKFColor colorWithHexString:@"#dfb89e"];
}


+ (NKFColor *)mcdonalds {
	return [NKFColor colorWithHexString:@"#FCC910"];
}


+ (NKFColor *)meetup{
	return [NKFColor colorWithHexString:@"#e0393e"];
}


+ (NKFColor *)meh {
	return [NKFColor colorWithRed:255.0f/255.0f green:106.0f/255.0f blue:0.0f alpha:1.0f];
}

+ (NKFColor *)mehcom {
	return [NKFColor meh];
}


+ (NKFColor *)mercedes {
	return [NKFColor black];
}

+ (NKFColor *)mercedesbenz {
	return [NKFColor mercedes];
}


+ (NKFColor *)mercuryinsurance {
    return [NKFColor bulgarianRose];
}

+ (NKFColor *)mercuryautoinsurance {
    return [NKFColor bulgarianRose];
}


+ (NKFColor *)miami {
	return [NKFColor florida];
}


+ (NKFColor *)microsoft{
	return [NKFColor colorWithHexString:@"#f65314"];
}

+ (NKFColor *)microsoft2{
	return [NKFColor colorWithHexString:@"#7cbb00"];
}

+ (NKFColor *)microsoft3{
	return [NKFColor colorWithHexString:@"#00a1f1"];
}

+ (NKFColor *)microsoft4{
	return [NKFColor colorWithHexString:@"#ffbb00"];
}


+ (NKFColor *)microsoftoffice{
	return [NKFColor colorWithHexString:@"#ea3e23"];
}


+ (NKFColor *)mimiscafe {
	return [NKFColor colorWithHexString:@"#c23f38"];
}


+ (NKFColor *)mixpanel{
	return [NKFColor colorWithHexString:@"#a086d3"];
}


+ (NKFColor *)momofuku {
	return [NKFColor colorWithRed:241.0f/255.0f green:181.0f/255.0f blue:60.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)momofuku2 {
	return [NKFColor colorWithRed:102.0f/255.0f green:172.0f/255.0f blue:78.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)motorola{
	return [NKFColor colorWithHexString:@"#5c92fa"];
}


+ (NKFColor *)mrsfields {
	return [NKFColor colorWithHexString:@"#c41d34"];
}


+ (NKFColor *)music {
	return [NKFColor colorWithRed:201.0f/255.0f green:223.0f/255.0f blue:58.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)muut{
	return [NKFColor colorWithHexString:@"#1fadc5"];
}

+ (NKFColor *)muut2{
	return [NKFColor colorWithHexString:@"#ff8000"];
}


+ (NKFColor *)myspace{
	return [NKFColor black];
}


+ (NKFColor *)nandos {
	return [NKFColor colorWithHexString:@"#d71e30"];
}

+ (NKFColor *)nandos2 {
	return [NKFColor black];
}


+ (NKFColor *)nbc{
	return [NKFColor colorWithHexString:@"#e1ac26"];
}

+ (NKFColor *)nbc2{
	return [NKFColor colorWithHexString:@"#dc380f"];
}

+ (NKFColor *)nbc3{
	return [NKFColor colorWithHexString:@"#9f0812"];
}

+ (NKFColor *)nbc4{
	return [NKFColor colorWithHexString:@"#6347b2"];
}

+ (NKFColor *)nbc5{
	return [NKFColor colorWithHexString:@"#368dd5"];
}

+ (NKFColor *)nbc6{
	return [NKFColor colorWithHexString:@"#70af1e"];
}

+ (NKFColor *)nbc7{
	return [NKFColor colorWithHexString:@"#7e887a"];
}


+ (NKFColor *)nest{
	return [NKFColor colorWithHexString:@"#00afd8"];
}

+ (NKFColor *)nest2{
	return [NKFColor colorWithHexString:@"#7b858e"];
}


+ (NKFColor *)netflix{
	return [NKFColor colorWithHexString:@"#e50914"];
}

+ (NKFColor *)netflix2{
	return [NKFColor colorWithHexString:@"#221f1f"];
}

+ (NKFColor *)netflix3{
	return [NKFColor colorWithHexString:@"#f5f5f1"];
}


+ (NKFColor *)netvibes{
	return [NKFColor colorWithHexString:@"#39bd00"];
}


+ (NKFColor *)newbalance{
	return [NKFColor colorWithHexString:@"#ce2724"];
}

+ (NKFColor *)newbalance2{
	return [NKFColor colorWithHexString:@"#f3ec19"];
}

+ (NKFColor *)newbalance3{
	return [NKFColor colorWithHexString:@"#207c88"];
}

+ (NKFColor *)newbalance4{
	return [NKFColor colorWithHexString:@"#aac1bf"];
}

+ (NKFColor *)newbalance5{
	return [NKFColor colorWithHexString:@"#e8e9d7"];
}

+ (NKFColor *)newbalance6{
	return [NKFColor colorWithHexString:@"#4c4d4f"];
}

+ (NKFColor *)newbalance7{
	return [NKFColor colorWithHexString:@"#231f20"];
}


+ (NKFColor *)nextdoor{
	return [NKFColor colorWithHexString:@"#19975d"];
}


+ (NKFColor *)nike {
	return [NKFColor nikefootball];
}


+ (NKFColor *)nikefootball{
	return [NKFColor colorWithHexString:@"#504847"];
}

+ (NKFColor *)nikefootball2{
	return [NKFColor colorWithHexString:@"#27a770"];
}


+ (NKFColor *)nikefuel{
	return [NKFColor colorWithHexString:@"#4bad31"];
}

+ (NKFColor *)nikefuel2{
	return [NKFColor colorWithHexString:@"#f5dc00"];
}

+ (NKFColor *)nikefuel3{
	return [NKFColor colorWithHexString:@"#e95814"];
}

+ (NKFColor *)nikefuel4{
	return [NKFColor colorWithHexString:@"#e2142d"];
}


+ (NKFColor *)nokia{
	return [NKFColor colorWithHexString:@"#124191"];
}


+ (NKFColor *)novartis{
	return [NKFColor colorWithHexString:@"#765438"];
}

+ (NKFColor *)novartis2{
	return [NKFColor colorWithHexString:@"#a13323"];
}

+ (NKFColor *)novartis3{
	return [NKFColor colorWithHexString:@"#e65124"];
}

+ (NKFColor *)novartis4{
	return [NKFColor colorWithHexString:@"#ec7f22"];
}

+ (NKFColor *)novartis5{
	return [NKFColor colorWithHexString:@"#f8b22a"];
}

+ (NKFColor *)novartis6{
	return [NKFColor colorWithHexString:@"#ffd430"];
}


+ (NKFColor *)npm{
	return [NKFColor colorWithHexString:@"#cb3837"];
}


+ (NKFColor *)nshipster {
	return [NKFColor colorWithRed:238.0f/255.0f green:127.0f/255.0f blue:43.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)nvidia{
	return [NKFColor colorWithHexString:@"#76b900"];
}


+ (NKFColor *)oculus {
	return [NKFColor colorWithHexString:@"#427ae9"];
}

+ (NKFColor *)oculus2 {
	return [NKFColor colorWithHexString:@"#3d3d3d"];
}


+ (NKFColor *)office {
	return [NKFColor officedepot];
}

+ (NKFColor *)officedepot{
	return [NKFColor colorWithRed:243.0f/255.0f green:21.0f/255.0f blue:60.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)oldnavy {
	return [NKFColor colorWithRed:12.0f/255.0f green:68.0f/255.0f blue:116.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)olivegarden {
	return [NKFColor colorWithHexString:@"#523119"];
}

+ (NKFColor *)olivegarden2 {
	return [NKFColor colorWithHexString:@"#88872a"];
}

+ (NKFColor *)olivegarden3 {
	return [NKFColor colorWithHexString:@"#d2c6bd"];
}


+ (NKFColor *)olympus{
	return [NKFColor colorWithHexString:@"#08107b"];
}

+ (NKFColor *)olympus2{
	return [NKFColor colorWithHexString:@"#dfb226"];
}

+ (NKFColor *)olympus3{
	return [NKFColor colorWithHexString:@"#777777"];
}


+ (NKFColor *)opera{
	return [NKFColor colorWithHexString:@"#cc0f16"];
}

+ (NKFColor *)opera2{
	return [NKFColor colorWithHexString:@"#9c9e9f"];
}


+ (NKFColor *)oracle{
	return [NKFColor colorWithHexString:@"#ff0000"];
}

+ (NKFColor *)oracle2{
	return [NKFColor colorWithHexString:@"#000000"];
}

+ (NKFColor *)oracle3{
	return [NKFColor colorWithHexString:@"#7f7f7f"];
}


+ (NKFColor *)orangejulius {
    return [NKFColor tangerine];
}


+ (NKFColor *)oreilly {
	return [NKFColor colorWithRed:1.0f/255.0f green:173.0f/255.0f blue:107.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)outback {
	return [NKFColor colorWithHexString:@"#8b191d"];
}

+ (NKFColor *)outback2 {
	return [NKFColor colorWithHexString:@"#f5efd0"];
}


+ (NKFColor *)owens {
	return [NKFColor colorWithRed:255.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)oxford {
	return [NKFColor oxforduniversitypress];
}


+ (NKFColor *)oxforduniversity {
	return [NKFColor oxford];
}


+ (NKFColor *)oxforduniversitypress{
	return [NKFColor colorWithHexString:@"#002147"];
}

+ (NKFColor *)oxforduniversitypress2{
	return [NKFColor colorWithHexString:@"#000000"];
}

+ (NKFColor *)oxforduniversitypress3{
	return [NKFColor colorWithHexString:@"#666666"];
}


+ (NKFColor *)pamperedchef {
	return [NKFColor colorWithRed:49.0f/255.0f green:45.0f/255.0f blue:95.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)panasonic{
	return [NKFColor colorWithHexString:@"#0f58a8"];
}

+ (NKFColor *)panasonic2{
	return [NKFColor colorWithHexString:@"#000000"];
}


+ (NKFColor *)pandaexpress {
	return [NKFColor colorWithHexString:@"#cc1c41"];
}

+ (NKFColor *)pandaexpress2 {
	return [NKFColor black];
}

+ (NKFColor *)pandaexpress3 {
	return [NKFColor white];
}


+ (NKFColor *)pandora{
	return [NKFColor colorWithHexString:@"#005483"];
}


+ (NKFColor *)panera {
	return [NKFColor colorWithHexString:@"#728F33"];
}

+ (NKFColor *)panerabread {
	return [NKFColor panera];
}

+ (NKFColor *)panerabreadco {
	return [NKFColor panerabread];
}

+ (NKFColor *)panerabreadcompany {
	return [NKFColor panerabreadco];
}

+ (NKFColor *)panera2 {
	return [NKFColor colorWithHexString:@"#B4C985"];
}

+ (NKFColor *)panerabread2 {
	return [NKFColor panera2];
}

+ (NKFColor *)panerabreadco2 {
	return [NKFColor panerabread2];
}

+ (NKFColor *)panerabreadcompany2 {
	return [NKFColor panerabreadco2];
}

+ (NKFColor *)panera3 {
	return [NKFColor colorWithHexString:@"#ECC56D"];
}

+ (NKFColor *)panerabread3 {
	return [NKFColor panera3];
}

+ (NKFColor *)panerabreadco3 {
	return [NKFColor panerabread3];
}

+ (NKFColor *)panerabreadcompany3 {
	return [NKFColor panerabreadco3];
}

+ (NKFColor *)panera4 {
	return [NKFColor colorWithHexString:@"#64829B"];
}

+ (NKFColor *)panerabread4 {
	return [NKFColor panera4];
}

+ (NKFColor *)panerabreadco4 {
	return [NKFColor panerabread4];
}

+ (NKFColor *)panerabreadcompany4 {
	return [NKFColor panerabreadco4];
}

+ (NKFColor *)panera5 {
	return [NKFColor colorWithHexString:@"#EBB479"];
}

+ (NKFColor *)panerabread5 {
	return [NKFColor panera5];
}

+ (NKFColor *)panerabreadco5 {
	return [NKFColor panerabread5];
}

+ (NKFColor *)panerabreadcompany5 {
	return [NKFColor panerabreadco5];
}


+ (NKFColor *)paris {
	return [NKFColor colorWithRed:26.0f/255.0f green:19.0f/255.0f blue:148.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)paris2 {
	return [NKFColor colorWithRed:229.0f/255.0f green:21.0f/255.0f blue:62.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)partycity {
	return [NKFColor colorWithHexString:@"6c76be"];
}

+ (NKFColor *)path{
	return [NKFColor colorWithHexString:@"#ee3423"];
}


+ (NKFColor *)pavilions {
	return [NKFColor safeway];
}


+ (NKFColor *)paylesssupermarket {
	return [NKFColor colorWithRed:255.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)paylesssupermarket2 {
	return [NKFColor colorWithRed:0.0f/255.0f green:136.0f/255.0f blue:50.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)paylesssupermarkets {
	return [NKFColor paylesssupermarket];
}

+ (NKFColor *)paylesssupermarkets2 {
	return [NKFColor paylesssupermarket2];
}


+ (NKFColor *)payless {
	return [NKFColor colorWithRed:223.0f/255.0f green:140.0f/255.0f blue:66.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)payless2 {
	return [NKFColor colorWithRed:137.0f/255.0f green:197.0f/255.0f blue:236.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)paylessshoesource {
	return [NKFColor payless];
}

+ (NKFColor *)paylessshoesource2 {
	return [NKFColor payless2];
}


+ (NKFColor *)paymill{
	return [NKFColor colorWithHexString:@"#f05000"];
}


+ (NKFColor *)paypal{
	return [NKFColor colorWithHexString:@"#003087"];
}

+ (NKFColor *)paypal2{
	return [NKFColor colorWithHexString:@"#009cde"];
}

+ (NKFColor *)paypal3{
	return [NKFColor colorWithHexString:@"#012169"];
}


+ (NKFColor *)pearson{
	return [NKFColor colorWithHexString:@"#ed6b06"];
}

+ (NKFColor *)pearson2{
	return [NKFColor colorWithHexString:@"#9d1348"];
}

+ (NKFColor *)pearson3{
	return [NKFColor colorWithHexString:@"#008b5d"];
}

+ (NKFColor *)pearson4{
	return [NKFColor colorWithHexString:@"#364395"];
}


+ (NKFColor *)peets {
	return [NKFColor colorWithHexString:@"#BB9A6A"];
}

+ (NKFColor *)peets2 {
	return [NKFColor colorWithHexString:@"#080000"];
}

+ (NKFColor *)peets3 {
	return [NKFColor colorWithHexString:@"#F5F5E8"];
}

+ (NKFColor *)peetscoffee {
	return [NKFColor peets];
}

+ (NKFColor *)peetscoffee2 {
	return [NKFColor peets2];
}

+ (NKFColor *)peetscoffee3 {
	return [NKFColor peets3];
}




+ (NKFColor *)penguinbooks{
	return [NKFColor colorWithHexString:@"#ff6900"];
}


+ (NKFColor *)pepboys {
	return [NKFColor colorWithRed:203.0f/255.0f green:13.0f/255.0f blue:39.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)pepsi{
	return [NKFColor colorWithHexString:@"#e32934"];
}

+ (NKFColor *)pepsi2{
	return [NKFColor colorWithHexString:@"#004883"];
}


+ (NKFColor *)petsmart {
    return [NKFColor colorWithHexString:@"#0068B3"];
}

+ (NKFColor *)petsmart2 {
	return [NKFColor colorWithHexString:@"#E51837"];
}


+ (NKFColor *)pfchangs {
    return [NKFColor colorWithHexString:@"#6A2717"];
}

+ (NKFColor *)pfchangs2 {
    return [NKFColor colorWithHexString:@"#9B6C50"];
}

+ (NKFColor *)pfchangs3 {
    return [NKFColor colorWithHexString:@"#000000"];
}


+ (NKFColor *)pfizer{
	return [NKFColor colorWithHexString:@"#0093d0"];
}

+ (NKFColor *)pfizer2{
	return [NKFColor colorWithHexString:@"#000000"];
}

+ (NKFColor *)pfizer3{
	return [NKFColor colorWithHexString:@"#616365"];
}

+ (NKFColor *)pfizer4{
	return [NKFColor colorWithHexString:@"#00aeef"];
}

+ (NKFColor *)pfizer5{
	return [NKFColor colorWithHexString:@"#d6006e"];
}

+ (NKFColor *)pfizer6{
	return [NKFColor colorWithHexString:@"#75d1e0"];
}

+ (NKFColor *)pfizer7{
	return [NKFColor colorWithHexString:@"#7dba00"];
}

+ (NKFColor *)pfizer8{
	return [NKFColor colorWithHexString:@"#cc292b"];
}

+ (NKFColor *)pfizer9{
	return [NKFColor colorWithHexString:@"#00a950"];
}

+ (NKFColor *)pfizer10{
	return [NKFColor colorWithHexString:@"#f8971d"];
}

+ (NKFColor *)pfizer11{
	return [NKFColor colorWithHexString:@"#f7d417"];
}

+ (NKFColor *)pfizer12{
	return [NKFColor colorWithHexString:@"#4a245e"];
}

+ (NKFColor *)pfizer13{
	return [NKFColor colorWithHexString:@"#f26649"];
}


+ (NKFColor *)philips{
	return [NKFColor colorWithHexString:@"#0e5fd8"];
}


+ (NKFColor *)photobucket{
	return [NKFColor colorWithHexString:@"#0ea0db"];
}

+ (NKFColor *)photobucket2{
	return [NKFColor colorWithHexString:@"#000000"];
}


+ (NKFColor *)pickupstix {
	return [NKFColor colorWithHexString:@"#f9b717"];
}

+ (NKFColor *)pickupstix2 {
	return [NKFColor black];
}

+ (NKFColor *)pickupstix3 {
	return [NKFColor colorWithHexString:@"#c3112f"];
}


+ (NKFColor *)pier1 {
	return [NKFColor colorWithRed:0.0f green:114.0f/255.0f blue:188.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)pierone {
	return [NKFColor pier1];
}

+ (NKFColor *)pier1imports {
	return [NKFColor pier1];
}

+ (NKFColor *)pieroneimports {
	return [NKFColor pier1];
}


+ (NKFColor *)pinboard{
	return [NKFColor colorWithHexString:@"#0000e6"];
}


+ (NKFColor *)pinterest{
	return [NKFColor colorWithHexString:@"#cc2127"];
}


+ (NKFColor *)pitapit {
	return [NKFColor colorWithHexString:@"#14984a"];
}

+ (NKFColor *)pitapit2 {
	return [NKFColor colorWithHexString:@"#c34833"];
}


+ (NKFColor *)pizzahut{
	return [NKFColor colorWithHexString:@"#ee3124"];
}

+ (NKFColor *)pizzahut2{
	return [NKFColor colorWithHexString:@"#00a160"];
}

+ (NKFColor *)pizzahut3{
	return [NKFColor colorWithHexString:@"#ffc425"];
}


+ (NKFColor *)planethollywood {
	return [NKFColor colorWithHexString:@"#7e147f"];
}

+ (NKFColor *)planethollywood2 {
	return [NKFColor colorWithHexString:@"#5899e3"];
}

+ (NKFColor *)planethollywood3 {
	return [NKFColor colorWithHexString:@"#f40604"];
}


+ (NKFColor *)plasso{
	return [NKFColor colorWithHexString:@"#6585ed"];
}

+ (NKFColor *)plasso2{
	return [NKFColor colorWithHexString:@"#f5756c"];
}

+ (NKFColor *)plasso3{
	return [NKFColor colorWithHexString:@"#98afc0"];
}

+ (NKFColor *)plasso4{
	return [NKFColor colorWithHexString:@"#2f3148"];
}


+ (NKFColor *)plaxo{
	return [NKFColor colorWithHexString:@"#414f5a"];
}


+ (NKFColor *)playstation{
	return [NKFColor colorWithHexString:@"#003087"];
}


+ (NKFColor *)pocket{
	return [NKFColor colorWithHexString:@"#d3505a"];
}

+ (NKFColor *)pocket2{
	return [NKFColor colorWithHexString:@"#478f8f"];
}


+ (NKFColor *)popeyes {
	return [NKFColor colorWithHexString:@"#f48021"];
}


+ (NKFColor *)portfolium{
	return [NKFColor colorWithHexString:@"#0099ff"];
}

+ (NKFColor *)portfolium2{
	return [NKFColor colorWithHexString:@"#fb0a2a"];
}

+ (NKFColor *)portfolium3{
	return [NKFColor colorWithHexString:@"#17ad49"];
}

+ (NKFColor *)portfolium4{
	return [NKFColor colorWithHexString:@"#333333"];
}


+ (NKFColor *)postmates{
	return [NKFColor colorWithHexString:@"#000000"];
}

+ (NKFColor *)postmates2{
	return [NKFColor colorWithHexString:@"#36454f"];
}


+ (NKFColor *)potbelly {
	return [NKFColor colorWithHexString:@"#f9a404"];
}

+ (NKFColor *)potbelly2 {
	return [NKFColor black];
}


+ (NKFColor *)prezi{
	return [NKFColor colorWithHexString:@"#318bff"];
}


+ (NKFColor *)priceline{
	return [NKFColor colorWithHexString:@"#1885bf"];
}


+ (NKFColor *)pricerite {
	return [NKFColor colorWithRed:36.0f/255.0f green:91.0f/255.0f blue:173.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)priceright {
	return [NKFColor pricerite];
}

+ (NKFColor *)pricerite2 {
	return [NKFColor colorWithRed:246.0f/255.0f green:35.0f/255.0f blue:32.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)priceright2 {
	return [NKFColor pricerite2];
}


+ (NKFColor *)producthunt{
	return [NKFColor colorWithHexString:@"#da552f"];
}

+ (NKFColor *)producthunt2{
	return [NKFColor colorWithHexString:@"#534540"];
}

+ (NKFColor *)producthunt3{
	return [NKFColor colorWithHexString:@"#988f8c"];
}

+ (NKFColor *)producthunt4{
	return [NKFColor colorWithHexString:@"#00b27f"];
}


+ (NKFColor *)publix {
	return [NKFColor colorWithRed:62.0f/255.0f green:144.0f/255.0f blue:45.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)publics {
	return [NKFColor publix];
}


+ (NKFColor *)qdoba {
	return [NKFColor colorWithHexString:@"#e9decb"];
}

+ (NKFColor *)qdoba2 {
	return [NKFColor colorWithHexString:@"#3f2415"];
}


+ (NKFColor *)qfc {
	return [NKFColor colorWithRed:0.0f/255.0f green:112.0f/255.0f blue:192.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)qfc2 {
	return [NKFColor colorWithRed:255.0f/255.0f green:238.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)quiznos {
	return [NKFColor colorWithHexString:@"#52753b"];
}

+ (NKFColor *)quiznos2 {
	return [NKFColor colorWithHexString:@"#e11f26"];
}

+ (NKFColor *)quiznos3 {
	return [NKFColor colorWithHexString:@"#cfad80"];
}


+ (NKFColor *)quora{
	return [NKFColor colorWithHexString:@"#a82400"];
}


+ (NKFColor *)quotefm{
	return [NKFColor colorWithHexString:@"#66ceff"];
}


+ (NKFColor *)raiz {
	return [NKFColor raizlabs];
}

+ (NKFColor *)raizlabs {
	return [NKFColor colorWithRed:0.927f green:0.352f blue:0.303f alpha:1.0f];
}


+ (NKFColor *)ralphlauren {
	return [NKFColor colorWithRed:28.0f/255.0f green:28.0f/255.0f blue:28.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)ralphs {
	return [NKFColor colorWithRed:246.0f/255.0f green:27.0f/255.0f blue:49.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)randalls {
	return [NKFColor colorWithRed:35.0f/255.0f green:68.0f/255.0f blue:154.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)randalls2 {
	return [NKFColor safeway];
}


+ (NKFColor *)razer{
	return [NKFColor colorWithHexString:@"#00ff00"];
}


+ (NKFColor *)rdio{
	return [NKFColor colorWithHexString:@"#007dc3"];
}


+ (NKFColor *)readability{
	return [NKFColor colorWithHexString:@"#990000"];
}


+ (NKFColor *)redhat{
	return [NKFColor colorWithHexString:@"#cc0000"];
}


+ (NKFColor *)reddit{
	return [NKFColor colorWithHexString:@"#ff4500"];
}

+ (NKFColor *)reddit2{
	return [NKFColor colorWithHexString:@"#5f99cf"];
}

+ (NKFColor *)reddit3{
	return [NKFColor colorWithHexString:@"#cee3f8"];
}


+ (NKFColor *)redfin{
	return [NKFColor colorWithHexString:@"#a02021"];
}


+ (NKFColor *)redlobster {
	return [NKFColor colorWithHexString:@"#df163c"];
}

+ (NKFColor *)redlobster2 {
	return [NKFColor black];
}


+ (NKFColor *)redrobin {
	return [NKFColor colorWithHexString:@"#f30605"];
}

+ (NKFColor *)redrobin2 {
	return [NKFColor colorWithHexString:@"#f9da1f"];
}

+ (NKFColor *)redrobin3 {
	return [NKFColor colorWithHexString:@"#cb2e1b"];
}


+ (NKFColor *)rei {
	return [NKFColor colorWithRed:78.0f/255.0f green:92.0f/255.0f blue:56.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)rei2 {
	return [NKFColor colorWithRed:197.0f/255.0f green:193.0f/255.0f blue:32.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)rentler{
	return [NKFColor colorWithHexString:@"#ed1c27"];
}


+ (NKFColor *)reverbnation{
	return [NKFColor colorWithHexString:@"#e43526"];
}


+ (NKFColor *)robeks {
	return [NKFColor colorWithHexString:@"#ec4122"];
}

+ (NKFColor *)robeks2 {
	return [NKFColor colorWithHexString:@"#71ae4d"];
}


+ (NKFColor *)rockpack{
	return [NKFColor colorWithHexString:@"#0ba6ab"];
}


+ (NKFColor *)roku{
	return [NKFColor colorWithHexString:@"#6f1ab1"];
}


+ (NKFColor *)rollsroyce{
	return [NKFColor colorWithHexString:@"#680021"];
}

+ (NKFColor *)rollsroyce2{
	return [NKFColor colorWithHexString:@"#fffaec"];
}

+ (NKFColor *)rollsroyce3{
	return [NKFColor colorWithHexString:@"#939598"];
}

+ (NKFColor *)rollsroyce4{
	return [NKFColor colorWithHexString:@"#000000"];
}


+ (NKFColor *)ross {
	return [NKFColor colorWithRed:0.0f green:102.0f/255.0f blue:178.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)rookids{
	return [NKFColor colorWithHexString:@"#e22027"];
}

+ (NKFColor *)rookids2{
	return [NKFColor colorWithHexString:@"#a1cd3d"];
}

+ (NKFColor *)rookids3{
	return [NKFColor colorWithHexString:@"#003e70"];
}


+ (NKFColor *)roon{
	return [NKFColor colorWithHexString:@"#62b0d9"];
}


+ (NKFColor *)rounds{
	return [NKFColor colorWithHexString:@"#fdd800"];
}


+ (NKFColor *)royalahold {
	return [NKFColor ahold];
}


+ (NKFColor *)rubytuesday {
	return [NKFColor colorWithHexString:@"#c91641"];
}

+ (NKFColor *)rubytuesday2 {
	return [NKFColor black];
}


+ (NKFColor *)rss{
	return [NKFColor colorWithHexString:@"#f26522"];
}

+ (NKFColor *)rss2{
	return [NKFColor colorWithHexString:@"#f26522"];
}


+ (NKFColor *)safari {
	return [NKFColor colorWithRed:50.0f/255.0f green:156.0f/255.0f blue:203.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)safari2 {
	return [NKFColor colorWithRed:229.0f/255.0f green:45.0f/255.0f blue:60.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)safari3 {
	return [NKFColor colorWithRed:174.0f/255.0f green:173.0f/255.0f blue:173.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)safeway{
	return [NKFColor colorWithRed:226.0f/255.0f green:55.0f/255.0f blue:63.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)sainsburys{
	return [NKFColor colorWithHexString:@"#ec8a00"];
}


+ (NKFColor *)salesforce{
	return [NKFColor colorWithHexString:@"#1798c1"];
}

+ (NKFColor *)salesforce2{
	return [NKFColor colorWithHexString:@"#ff1100"];
}


+ (NKFColor *)samsclub {
	return [NKFColor colorWithRed:0.0f green:75.0f/255.0f blue:141.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)samsclub2 {
	return [NKFColor colorWithRed:93.0f/255.0f green:151.0f/255.0f blue:50.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)samsung{
	return [NKFColor colorWithHexString:@"#1428a0"];
}

+ (NKFColor *)samsung2{
	return [NKFColor colorWithHexString:@"#75787b"];
}

+ (NKFColor *)samsung3{
	return [NKFColor colorWithHexString:@"#0689d8"];
}

+ (NKFColor *)samsung4{
	return [NKFColor colorWithHexString:@"#ffc600"];
}

+ (NKFColor *)samsung5{
	return [NKFColor colorWithHexString:@"#ff6900"];
}

+ (NKFColor *)samsung6{
	return [NKFColor colorWithHexString:@"#e4002b"];
}

+ (NKFColor *)samsung7{
	return [NKFColor colorWithHexString:@"#c800a1"];
}

+ (NKFColor *)samsung8{
	return [NKFColor colorWithHexString:@"#685bc7"];
}

+ (NKFColor *)samsung9{
	return [NKFColor colorWithHexString:@"#0057b8"];
}

+ (NKFColor *)samsung10{
	return [NKFColor colorWithHexString:@"#00a9e0"];
}

+ (NKFColor *)samsung11{
	return [NKFColor colorWithHexString:@"#009ca6"];
}

+ (NKFColor *)samsung12{
	return [NKFColor colorWithHexString:@"#00b140"];
}


+ (NKFColor *)sap{
	return [NKFColor colorWithHexString:@"#003366"];
}

+ (NKFColor *)sap2{
	return [NKFColor colorWithHexString:@"#999999"];
}


+ (NKFColor *)savealot {
	return [NKFColor colorWithRed:236.0f/255.0f green:21.0f/255.0f blue:27.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)savealot2 {
	return [NKFColor colorWithRed:0.0f/255.0f green:79.0f/255.0f blue:163.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)sbarro {
	return [NKFColor colorWithHexString:@"#eb1c23"];
}

+ (NKFColor *)sbarro2 {
	return [NKFColor colorWithHexString:@"#338b48"];
}

+ (NKFColor *)sbarro3 {
	return [NKFColor black];
}


+ (NKFColor *)scotts {
	return [NKFColor colorWithRed:235.0f/255.0f green:15.0f/255.0f blue:29.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)scribd{
	return [NKFColor colorWithHexString:@"#1a7bba"];
}


+ (NKFColor *)sears {
	return [NKFColor colorWithRed:20.0f/255.0f green:37.0f/255.0f blue:145.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)sears2 {
	return [NKFColor colorWithRed:242.0f/255.0f green:35.0f/255.0f blue:39.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)seattlesbest {
	return [NKFColor colorWithHexString:@"#b2b7c1"];
}

+ (NKFColor *)seattlesbest2 {
	return [NKFColor colorWithHexString:@"#d61f2f"];
}


+ (NKFColor *)seaworld {
	return [NKFColor colorWithHexString:@"#323f75"];
}


+ (NKFColor *)serta {
	return [NKFColor colorWithRed:14.0f/255.0f green:40.0f/255.0f blue:91.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)serta2 {
	return [NKFColor colorWithRed:252.0f/255.0f green:246.0f/255.0f blue:34.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)shakeshack {
    return [NKFColor colorWithHexString:@"#64B251"];
}

+ (NKFColor *)shakeshack2 {
    return [NKFColor black];
}


+ (NKFColor *)shaws {
	return [NKFColor colorWithRed:236.0f/255.0f green:141.0f/255.0f blue:61.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)shaws2 {
	return [NKFColor colorWithRed:121.0f/255.0f green:185.0f/255.0f blue:89.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)shell {
	return [NKFColor colorWithRed:251.0f/255.0f green:217.0f/255.0f blue:24.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)sherwinwilliams{
	return [NKFColor colorWithHexString:@"#0168b3"];
}

+ (NKFColor *)sherwinwilliams2{
	return [NKFColor colorWithHexString:@"#ee3e34"];
}


+ (NKFColor *)schnucks {
	return [NKFColor colorWithRed:237.0f/255.0f green:28.0f/255.0f blue:36.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)schnuks {
	return [NKFColor schnucks];
}


+ (NKFColor *)schlotzskys {
	return [NKFColor colorWithHexString:@"#d0242c"];
}


+ (NKFColor *)shopify{
	return [NKFColor colorWithHexString:@"#96bf48"];
}

+ (NKFColor *)shopify2{
	return [NKFColor colorWithHexString:@"#479ccf"];
}

+ (NKFColor *)shopify3{
	return [NKFColor colorWithHexString:@"#2d3538"];
}

+ (NKFColor *)shopify4{
	return [NKFColor colorWithHexString:@"#f5f5f5"];
}

+ (NKFColor *)shopify5{
	return [NKFColor colorWithHexString:@"#f2f7fa"];
}

+ (NKFColor *)shopify6{
	return [NKFColor colorWithHexString:@"#666666"];
}


+ (NKFColor *)shoppers {
	return [NKFColor colorWithRed:227.0f/255.0f green:24.0f/255.0f blue:54.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)shoppers2 {
	return [NKFColor colorWithRed:255.0f/255.0f green:228.0f/255.0f blue:15.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)shoppers3 {
	return [NKFColor black];
}


+ (NKFColor *)shopnsave {
	return [NKFColor colorWithRed:255.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1.0];
}


+ (NKFColor *)shoprite {
	return [NKFColor colorWithRed:239.0f/255.0f green:45.0f/255.0f blue:36.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)shoprite2 {
	return [NKFColor colorWithRed:252.0f/255.0f green:183.0f/255.0f blue:18.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)sizzler {
	return [NKFColor colorWithRed:230.0f/255.0f green:0.0f/255.0f blue:52.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)sizzler2 {
	return [NKFColor white];
}

+ (NKFColor *)sizzler3 {
	return [NKFColor black];
}


+ (NKFColor *)skylinechili {
	return [NKFColor colorWithHexString:@"#29549b"];
}

+ (NKFColor *)skylinechili2 {
	return [NKFColor colorWithHexString:@"#e8e420"];
}

+ (NKFColor *)skylinechili3 {
	return [NKFColor colorWithHexString:@"#ea192f"];
}


+ (NKFColor *)skype{
	return [NKFColor colorWithHexString:@"#00aff0"];
}


+ (NKFColor *)slack{
	return [NKFColor colorWithHexString:@"#6ecadc"];
}

+ (NKFColor *)slack2{
	return [NKFColor colorWithHexString:@"#e9a820"];
}

+ (NKFColor *)slack3{
	return [NKFColor colorWithHexString:@"#e01563"];
}

+ (NKFColor *)slack4{
	return [NKFColor colorWithHexString:@"#3eb991"];
}


+ (NKFColor *)smashingmagazine{
	return [NKFColor colorWithHexString:@"#e53b2c"];
}

+ (NKFColor *)smashingmagazine2{
	return [NKFColor colorWithHexString:@"#41b7d8"];
}


+ (NKFColor *)smiths {
	return [NKFColor colorWithRed:227.0f/255.0f green:48.0f/255.0f blue:61.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)snagajob{
	return [NKFColor colorWithHexString:@"#f47a20"];
}


+ (NKFColor *)socialbro{
	return [NKFColor colorWithHexString:@"#29c4d0"];
}

+ (NKFColor *)socialbro2{
	return [NKFColor colorWithHexString:@"#f29556"];
}

+ (NKFColor *)socialbro3{
	return [NKFColor colorWithHexString:@"#84afa2"];
}

+ (NKFColor *)socialbro4{
	return [NKFColor colorWithHexString:@"#72c427"];
}

+ (NKFColor *)socialbro5{
	return [NKFColor colorWithHexString:@"#f24c7c"];
}

+ (NKFColor *)socialbro6{
	return [NKFColor colorWithHexString:@"#00aaf2"];
}


+ (NKFColor *)softonic{
	return [NKFColor colorWithHexString:@"#008ace"];
}


+ (NKFColor *)songkick{
	return [NKFColor colorWithHexString:@"#f80046"];
}


+ (NKFColor *)sonicbids{
	return [NKFColor colorWithHexString:@"#ff6600"];
}

+ (NKFColor *)sonicbids2{
	return [NKFColor colorWithHexString:@"#0c88b1"];
}


+ (NKFColor *)sonicdrivein {
	return [NKFColor colorWithHexString:@"#f7db31"];
}

+ (NKFColor *)sonicdrivein2 {
	return [NKFColor colorWithHexString:@"#ec3124"];
}

+ (NKFColor *)sonicdrivein3 {
	return [NKFColor colorWithHexString:@"#728ebb"];
}


+ (NKFColor *)soundcloud{
	return [NKFColor colorWithHexString:@"#ff8800"];
}

+ (NKFColor *)soundcloud2{
	return [NKFColor colorWithHexString:@"#ff3300"];
}


+ (NKFColor *)southwest {
	return [NKFColor colorWithHexString:@"#260BAC"];
}

+ (NKFColor *)southwest2 {
	return [NKFColor colorWithHexString:@"#979393"];
}

+ (NKFColor *)southwest3 {
	return [NKFColor colorWithHexString:@"#F08B3E"];
}

+ (NKFColor *)southwest4 {
	return [NKFColor colorWithHexString:@"#E70000"];
}

+ (NKFColor *)southwest5 {
	return [NKFColor colorWithHexString:@"#000000"];
}

+ (NKFColor *)southwestairlines {
	return [NKFColor southwest];
}

+ (NKFColor *)southwestairlines2 {
	return [NKFColor southwest2];
}

+ (NKFColor *)southwestairlines3 {
	return [NKFColor southwest3];
}

+ (NKFColor *)southwestairlines4 {
	return [NKFColor southwest4];
}

+ (NKFColor *)southwestairlines5 {
	return [NKFColor southwest5];
}


+ (NKFColor *)specialized {
	return [NKFColor colorWithRed:162.0f/255.0f green:19.0f/255.0f blue:45.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)specialized2 {
	return [NKFColor black];
}


+ (NKFColor *)spoken{
	return [NKFColor colorWithHexString:@"#fc00c1"];
}

+ (NKFColor *)spoken2{
	return [NKFColor colorWithHexString:@"#000000"];
}


+ (NKFColor *)spotify{
	return [NKFColor colorWithHexString:@"#1fd65f"];
}


+ (NKFColor *)sprint{
	return [NKFColor colorWithHexString:@"#ffe100"];
}

+ (NKFColor *)sprint2 {
    return [NKFColor black];
}


+ (NKFColor *)squarecash{
	return [NKFColor colorWithHexString:@"#28c101"];
}


+ (NKFColor *)squarespace{
	return [NKFColor colorWithHexString:@"#222222"];
}


+ (NKFColor *)stackoverflow{
	return [NKFColor colorWithHexString:@"#fe7a15"];
}


+ (NKFColor *)staples{
	return [NKFColor colorWithHexString:@"#cc0000"];
}

+ (NKFColor *)staples2{
	return [NKFColor colorWithHexString:@"#2c8aec"];
}

+ (NKFColor *)staples3{
	return [NKFColor colorWithHexString:@"#ffcc00"];
}


+ (NKFColor *)starbucks{
	return [NKFColor colorWithHexString:@"#00704a"];
}

+ (NKFColor *)starbucks2{
	return [NKFColor colorWithHexString:@"#000000"];
}


+ (NKFColor *)starmarket {
	return [NKFColor colorWithRed:0.0f/255.0f green:132.0f/255.0f blue:202.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)starmarket2 {
	return [NKFColor colorWithRed:121.0f/255.0f green:185.0f/255.0f blue:89.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)staterbrothers {
	return [NKFColor colorWithHexString:@"1644b3"];
}

+ (NKFColor *)staterbros {
	return [NKFColor staterbrothers];
}


+ (NKFColor *)statuschart{
	return [NKFColor colorWithHexString:@"#d7584f"];
}


+ (NKFColor *)steaknshake {
	return [NKFColor colorWithHexString:@"#e70300"];
}

+ (NKFColor *)steaknshake2 {
	return [NKFColor black];
}

+ (NKFColor *)steaknshake3 {
	return [NKFColor white];
}


+ (NKFColor *)steinway {
	return [NKFColor black];
}


+ (NKFColor *)sterlinghotels{
	return [NKFColor colorWithHexString:@"#3b5a6f"];
}

+ (NKFColor *)sterlinghotels2{
	return [NKFColor colorWithHexString:@"#828a87"];
}

+ (NKFColor *)sterlinghotels3{
	return [NKFColor colorWithHexString:@"#000000"];
}

+ (NKFColor *)sterlinghotels4{
	return [NKFColor colorWithHexString:@"#9db7c4"];
}

+ (NKFColor *)sterlinghotels5{
	return [NKFColor colorWithHexString:@"#ccd7dd"];
}

+ (NKFColor *)sterlinghotels6{
	return [NKFColor colorWithHexString:@"#838f97"];
}

+ (NKFColor *)sterlinghotels7{
	return [NKFColor colorWithHexString:@"#002054"];
}


+ (NKFColor *)stopandshop {
	return [NKFColor colorWithRed:121.0f/255.0f green:31.0f/255.0f blue:128.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)stopandshop2 {
	return [NKFColor colorWithRed:252.0f/255.0f green:182.0f/255.0f blue:24.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)stopandshop3 {
	return [NKFColor colorWithRed:237.0f/255.0f green:50.0f/255.0f blue:33.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)stopandshop4 {
	return [NKFColor colorWithRed:139.0f/255.0f green:195.0f/255.0f blue:68.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)storyful{
	return [NKFColor colorWithHexString:@"#f97200"];
}

+ (NKFColor *)storyful2{
	return [NKFColor colorWithHexString:@"#010101"];
}

+ (NKFColor *)storyful3{
	return [NKFColor colorWithHexString:@"#8b8b64"];
}

+ (NKFColor *)storyful4{
	return [NKFColor colorWithHexString:@"#bbbdc0"];
}


+ (NKFColor *)strava{
	return [NKFColor colorWithHexString:@"#fc4c02"];
}


+ (NKFColor *)stripe{
	return [NKFColor colorWithHexString:@"#00afe1"];
}


+ (NKFColor *)studyblue{
	return [NKFColor colorWithHexString:@"#00afe1"];
}


+ (NKFColor *)stumbleupon{
	return [NKFColor colorWithHexString:@"#eb4924"];
}


+ (NKFColor *)subway2{
	return [NKFColor colorWithHexString:@"#00543d"];
}

+ (NKFColor *)subway3{
	return [NKFColor colorWithHexString:@"#fef035"];
}

+ (NKFColor *)subway{
	return [NKFColor colorWithHexString:@"#489e3b"];
}

+ (NKFColor *)subway4{
	return [NKFColor colorWithHexString:@"#fabd42"];
}

+ (NKFColor *)subway5{
	return [NKFColor colorWithHexString:@"#cd0a20"];
}


+ (NKFColor *)sugarcrm{
	return [NKFColor colorWithHexString:@"#e61718"];
}

+ (NKFColor *)sugarcrm2{
	return [NKFColor colorWithHexString:@"#e8e9ea"];
}

+ (NKFColor *)sugarcrm3{
	return [NKFColor colorWithHexString:@"#595a5c"];
}

+ (NKFColor *)sugarcrm4{
	return [NKFColor colorWithHexString:@"#282828"];
}


+ (NKFColor *)supercuts {
	return [NKFColor colorWithRed:38.0f/255.0f green:52.0f/255.0f blue:90.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)supervalu {
	return [NKFColor colorWithRed:219.0f/255.0f green:37.0f/255.0f blue:28.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)supervalue {
	return [NKFColor supervalu];
}


+ (NKFColor *)surlatable {
	return [NKFColor colorWithRed:90.0f/255.0f green:40.0f/255.0f blue:71.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)swarm{
	return [NKFColor colorWithHexString:@"#f06d1f"];
}

+ (NKFColor *)swarm2{
	return [NKFColor colorWithHexString:@"#ffa633"];
}


+ (NKFColor *)swensens {
	return [NKFColor colorWithHexString:@"#e52b2b"];
}


+ (NKFColor *)tcby {
	return [NKFColor colorWithRed:229.0f/255.0f green:0.0f/255.0f blue:140.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)tdbank {
    return [NKFColor colorWithHexString:@"#34B233"];
}


+ (NKFColor *)tgifridays {
	return [NKFColor colorWithRed:210.0f/255.0f green:0.0f/255.0f blue:65.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)tgifridays2 {
	return [NKFColor black];
}

+ (NKFColor *)tgifridays3 {
	return [NKFColor white];
}


+ (NKFColor *)tjmaxx {
	return [NKFColor colorWithRed:171.0f/255.0f green:25.0f/255.0f blue:44.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)tjmax {
	return [NKFColor tjmaxx];
}


+ (NKFColor *)tmobile{
	return [NKFColor colorWithHexString:@"#e20074"];
}


+ (NKFColor *)tomthumb {
	return [NKFColor randalls];
}

+ (NKFColor *)tomthumb2 {
	return [NKFColor randalls2];
}


+ (NKFColor *)tonyromas {
	return [NKFColor colorWithHexString:@"#821819"];
}


+ (NKFColor *)toyota {
	return [NKFColor colorWithRed:247.0f/255.0f green:0.0f/255.0f blue:25.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)toysrus {
	return [NKFColor colorWithRed:0.0f green:84.0f/255.0f blue:166.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)taco {
	return [NKFColor tacobell];
}

+ (NKFColor *)taco2 {
	return [NKFColor tacobell2];
}

+ (NKFColor *)taco3 {
	return [NKFColor tacobell3];
}

+ (NKFColor *)tacobell {
	return [NKFColor colorWithRed:58.0f/255.0f green:22.0f/255.0f blue:126.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)tacobell2 {
	return [NKFColor colorWithRed:255.0f/255.0f green:0.0f/255.0f blue:126.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)tacobell3 {
	return [NKFColor colorWithRed:1.0f green:1.0f blue:1.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)tagstr{
	return [NKFColor colorWithHexString:@"#e74635"];
}


+ (NKFColor *)tagstr2{
	return [NKFColor colorWithHexString:@"#e74635"];
}

+ (NKFColor *)target {
	return [NKFColor colorWithHexString:@"#e90022"];
}


+ (NKFColor *)technorati{
	return [NKFColor colorWithHexString:@"#339900"];
}


+ (NKFColor *)tesla{
	return [NKFColor colorWithHexString:@"#cc0000"];
}


+ (NKFColor *)texasroadhouse {
	return [NKFColor black];
}

+ (NKFColor *)texasroadhouse2 {
	return [NKFColor colorWithHexString:@"#d8451b"];
}

+ (NKFColor *)texasroadhouse3 {
	return [NKFColor colorWithHexString:@"#ed9a28"];
}

+ (NKFColor *)texasroadhouse4 {
	return [NKFColor colorWithHexString:@"#459537"];
}


+ (NKFColor *)theaudienceawards{
	return [NKFColor colorWithHexString:@"#ee8421"];
}

+ (NKFColor *)theaudienceawards2{
	return [NKFColor colorWithHexString:@"#8c8a8a"];
}

+ (NKFColor *)theaudienceawards3{
	return [NKFColor colorWithHexString:@"#222222"];
}


+ (NKFColor *)thecheesecakefactory {
	return [NKFColor colorWithHexString:@"#c49e38"];
}


+ (NKFColor *)thenextweb{
	return [NKFColor colorWithHexString:@"#ff3c1f"];
}

+ (NKFColor *)thenextweb2{
	return [NKFColor colorWithHexString:@"#26313b"];
}

+ (NKFColor *)thenextweb3{
	return [NKFColor colorWithHexString:@"#4e5860"];
}

+ (NKFColor *)thenextweb4{
	return [NKFColor colorWithHexString:@"#a6abaf"];
}

+ (NKFColor *)thenextweb5{
	return [NKFColor colorWithHexString:@"#d9e0e2"];
}

+ (NKFColor *)thenextweb6{
	return [NKFColor colorWithHexString:@"#fafbfc"];
}


+ (NKFColor *)thomsonreuters{
	return [NKFColor colorWithHexString:@"#ff8000"];
}

+ (NKFColor *)thomsonreuters2{
	return [NKFColor colorWithHexString:@"#555555"];
}

+ (NKFColor *)thomsonreuters3{
	return [NKFColor colorWithHexString:@"#444444"];
}

+ (NKFColor *)thomsonreuters4{
	return [NKFColor colorWithHexString:@"#666666"];
}

+ (NKFColor *)thomsonreuters5{
	return [NKFColor colorWithHexString:@"#cccccc"];
}

+ (NKFColor *)thomsonreuters6{
	return [NKFColor colorWithHexString:@"#e9e9e9"];
}

+ (NKFColor *)thomsonreuters7{
	return [NKFColor colorWithHexString:@"#f7f7f7"];
}


+ (NKFColor *)tiffany {
	return [NKFColor colorWithRed:136.0f/255.0f green:204.0f/255.0f blue:207.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)tiffanys {
	return [NKFColor tiffany];
}

+ (NKFColor *)tiffanies {
	return [NKFColor tiffany];
}

+ (NKFColor *)tiffanyandco {
	return [NKFColor tiffany];
}

+ (NKFColor *)tiffanyandcompany {
	return [NKFColor tiffany];
}


+ (NKFColor *)timhortons {
	return [NKFColor colorWithHexString:@"#93181f"];
}

+ (NKFColor *)timhortons2 {
	return [NKFColor black];
}


+ (NKFColor *)tivo{
	return [NKFColor colorWithHexString:@"#da3d34"];
}

+ (NKFColor *)tivo2{
	return [NKFColor colorWithHexString:@"#00a480"];
}

+ (NKFColor *)tivo3{
	return [NKFColor colorWithHexString:@"#ed9f40"];
}

+ (NKFColor *)tivo4{
	return [NKFColor colorWithHexString:@"#6a76ac"];
}

+ (NKFColor *)tivo5{
	return [NKFColor colorWithHexString:@"#17170e"];
}

+ (NKFColor *)tivo6{
	return [NKFColor colorWithHexString:@"#534b38"];
}

+ (NKFColor *)tivo7{
	return [NKFColor colorWithHexString:@"#a6a480"];
}


+ (NKFColor *)traderjoes {
	return [NKFColor colorWithRed:227.0f/255.0f green:25.0f/255.0f blue:54.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)traderjoe {
	return [NKFColor traderjoes];
}


+ (NKFColor *)treehouse{
	return [NKFColor colorWithHexString:@"#6fbc6d"];
}

+ (NKFColor *)treehouse2{
	return [NKFColor colorWithHexString:@"#47535b"];
}


+ (NKFColor *)trello{
	return [NKFColor colorWithHexString:@"#0079bf"];
}

+ (NKFColor *)trello2{
	return [NKFColor colorWithHexString:@"#70b500"];
}

+ (NKFColor *)trello3{
	return [NKFColor colorWithHexString:@"#ff9f1a"];
}

+ (NKFColor *)trello4{
	return [NKFColor colorWithHexString:@"#eb5a46"];
}

+ (NKFColor *)trello5{
	return [NKFColor colorWithHexString:@"#f2d600"];
}

+ (NKFColor *)trello6{
	return [NKFColor colorWithHexString:@"#c377e0"];
}

+ (NKFColor *)trello7{
	return [NKFColor colorWithHexString:@"#ff78cb"];
}

+ (NKFColor *)trello8{
	return [NKFColor colorWithHexString:@"#00c2e0"];
}

+ (NKFColor *)trello9{
	return [NKFColor colorWithHexString:@"#51e898"];
}

+ (NKFColor *)trello10{
	return [NKFColor colorWithHexString:@"#c4c9cc"];
}


+ (NKFColor *)tripadvisor{
	return [NKFColor colorWithHexString:@"#589442"];
}


+ (NKFColor *)trulia{
	return [NKFColor colorWithHexString:@"#5eab1f"];
}


+ (NKFColor *)tsc {
	return [NKFColor colorWithRed:252.0f/255.0f green:25.0f/255.0f blue:34.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)tractorsupplyco {
	return [NKFColor tsc];
}

+ (NKFColor *)tractorsupplycompany {
	return [NKFColor tsc];
}


+ (NKFColor *)tumblr{
	return [NKFColor colorWithHexString:@"#35465c"];
}


+ (NKFColor *)tunngle{
	return [NKFColor colorWithHexString:@"#c30f24"];
}


+ (NKFColor *)tvtag{
	return [NKFColor colorWithHexString:@"#f24e4e"];
}


+ (NKFColor *)twitchtv{
	return [NKFColor colorWithHexString:@"#6441a5"];
}


+ (NKFColor *)twitter{
	return [NKFColor colorWithHexString:@"#55acee"];
}


+ (NKFColor *)typekit{
	return [NKFColor colorWithHexString:@"#98ce1e"];
}


+ (NKFColor *)typepad{
	return [NKFColor colorWithHexString:@"#d2de61"];
}


+ (NKFColor *)typo3{
	return [NKFColor colorWithHexString:@"#ff8600"];
}


+ (NKFColor *)uber {
	return [NKFColor colorWithHexString:@"#454351"];
}

+ (NKFColor *)uber2 {
	return [NKFColor colorWithHexString:@"#18111E"];
}

+ (NKFColor *)uber3 {
	return [NKFColor colorWithHexString:@"#9FA1A4"];
}


+ (NKFColor *)ubuntu{
	return [NKFColor colorWithHexString:@"#dd4814"];
}

+ (NKFColor *)ubuntu2{
	return [NKFColor colorWithHexString:@"#77216f"];
}

+ (NKFColor *)ubuntu3{
	return [NKFColor colorWithHexString:@"#5e2750"];
}

+ (NKFColor *)ubuntu4{
	return [NKFColor colorWithHexString:@"#2c001e"];
}

+ (NKFColor *)ubuntu5{
	return [NKFColor colorWithHexString:@"#aea79f"];
}

+ (NKFColor *)ubuntu6{
	return [NKFColor colorWithHexString:@"#333333"];
}


+ (NKFColor *)umami {
	return [NKFColor colorWithHexString:@"#f38627"];
}

+ (NKFColor *)umami2 {
	return [NKFColor black];
}


+ (NKFColor *)unitedsupermarkets {
	return [NKFColor colorWithRed:7.0f/255.0f green:69.0f/255.0f blue:140.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)unitedsupermarket {
	return [NKFColor unitedsupermarkets];
}

+ (NKFColor *)unitedsupermarkets2 {
	return [NKFColor colorWithRed:214.0f/255.0f green:3.0f/255.0f blue:4.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)unitedsupermarket2 {
	return [NKFColor unitedsupermarkets2];
}


+ (NKFColor *)unitedway{
	return [NKFColor colorWithHexString:@"#10167f"];
}

+ (NKFColor *)unitedway2{
	return [NKFColor colorWithHexString:@"#fe230a"];
}

+ (NKFColor *)unitedway3{
	return [NKFColor colorWithHexString:@"#ff9600"];
}

+ (NKFColor *)unitedway4{
	return [NKFColor colorWithHexString:@"#000064"];
}

+ (NKFColor *)unitedway5{
	return [NKFColor colorWithHexString:@"#b41428"];
}

+ (NKFColor *)unitedway6{
	return [NKFColor colorWithHexString:@"#f57814"];
}

+ (NKFColor *)unitedway7{
	return [NKFColor colorWithHexString:@"#e6d7aa"];
}

+ (NKFColor *)unitedway8{
	return [NKFColor colorWithHexString:@"#505050"];
}

+ (NKFColor *)unitedway9{
	return [NKFColor colorWithHexString:@"#f0e6c8"];
}

+ (NKFColor *)unitedway10{
	return [NKFColor colorWithHexString:@"#969696"];
}

+ (NKFColor *)unitedway11{
	return [NKFColor colorWithHexString:@"#7c81b8"];
}

+ (NKFColor *)unitedway12{
	return [NKFColor colorWithHexString:@"#ff967d"];
}

+ (NKFColor *)unitedway13{
	return [NKFColor colorWithHexString:@"#ffc87d"];
}


+ (NKFColor *)unity{
	return [NKFColor colorWithHexString:@"#222c37"];
}

+ (NKFColor *)unity2{
	return [NKFColor colorWithHexString:@"#00cccc"];
}

+ (NKFColor *)unity3{
	return [NKFColor colorWithHexString:@"#fff600"];
}

+ (NKFColor *)unity4{
	return [NKFColor colorWithHexString:@"#ff0066"];
}

+ (NKFColor *)unity5{
	return [NKFColor colorWithHexString:@"#19e3b1"];
}

+ (NKFColor *)unity6{
	return [NKFColor colorWithHexString:@"#ff7f33"];
}

+ (NKFColor *)unity7{
	return [NKFColor colorWithHexString:@"#b83c82"];
}


+ (NKFColor *)universityoforegon{
	return [NKFColor colorWithHexString:@"#fce122"];
}

+ (NKFColor *)universityoforegon2{
	return [NKFColor colorWithHexString:@"#18453b"];
}


+ (NKFColor *)univision{
	return [NKFColor colorWithHexString:@"#c822b0"];
}


+ (NKFColor *)unos {
	return [NKFColor colorWithHexString:@"#053e5d"];
}


+ (NKFColor *)ups {
	return [NKFColor pullmanBrownUPSBrown];
}


+ (NKFColor *)usps {
	return [NKFColor colorWithHexString:@"#194881"];
}

+ (NKFColor *)usps2 {
	return [NKFColor colorWithHexString:@"#D90000"];
}


+ (NKFColor *)ustream{
	return [NKFColor colorWithHexString:@"#3388ff"];
}


+ (NKFColor *)valero{
	return [NKFColor colorWithRed:1.0f/255.0f green:107.0f/255.0f blue:138.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)valero2{
	return [NKFColor colorWithRed:255.0f/255.0f green:177.0f/255.0f blue:41.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)vons {
	return [NKFColor safeway];
}


+ (NKFColor *)verizon{
	return [NKFColor colorWithHexString:@"#ff0000"];
}

+ (NKFColor *)verizon2{
	return [NKFColor colorWithHexString:@"#f2f2f2"];
}

+ (NKFColor *)verizon3{
	return [NKFColor colorWithHexString:@"#070000"];
}


+ (NKFColor *)verse {
	return [NKFColor bible];
}


+ (NKFColor *)viadeo{
	return [NKFColor colorWithHexString:@"#f07355"];
}


+ (NKFColor *)victoriassecret {
	return [NKFColor colorWithRed:208.0f/255.0f green:17.0f/255.0f blue:112.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)viki{
	return [NKFColor colorWithHexString:@"#3c9cd7"];
}

+ (NKFColor *)viki2{
	return [NKFColor colorWithHexString:@"#d24663"];
}


+ (NKFColor *)vimeo{
	return [NKFColor colorWithHexString:@"#162221"];
}

+ (NKFColor *)vimeo2{
	return [NKFColor colorWithHexString:@"#1ab7ea"];
}


+ (NKFColor *)vine{
	return [NKFColor colorWithHexString:@"#00b488"];
}


+ (NKFColor *)virb{
	return [NKFColor colorWithHexString:@"#1e91d0"];
}


+ (NKFColor *)virginmedia{
	return [NKFColor colorWithHexString:@"#c3092d"];
}

+ (NKFColor *)virginmedia2{
	return [NKFColor colorWithHexString:@"#222221"];
}


+ (NKFColor *)visa {
	return [NKFColor colorWithHexString:@"#1a1f71"];
}

+ (NKFColor *)visa2 {
	return [NKFColor colorWithHexString:@"#ffffff"];
}

+ (NKFColor *)visa3 {
	return [NKFColor colorWithHexString:@"#fdbb0a"];
}

+ (NKFColor *)visa4 {
	return [NKFColor colorWithHexString:@"#faaa13"];
}

+ (NKFColor *)visa5 {
	return [NKFColor colorWithHexString:@"#75787b"];
}


+ (NKFColor *)vkontakte{
	return [NKFColor colorWithHexString:@"#45668e"];
}

+ (NKFColor *)volcano {
	return [NKFColor colorWithRed:27.0f/255.0f green:58.0f/255.0f blue:140.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)volcanocorp {
	return [NKFColor volcano];
}


+ (NKFColor *)volvo{
	return [NKFColor colorWithHexString:@"#003057"];
}

+ (NKFColor *)volvo2{
	return [NKFColor colorWithHexString:@"#115740"];
}

+ (NKFColor *)volvo3{
	return [NKFColor colorWithHexString:@"#65665c"];
}

+ (NKFColor *)volvo4{
	return [NKFColor colorWithHexString:@"#425563"];
}

+ (NKFColor *)volvo5{
	return [NKFColor colorWithHexString:@"#517891"];
}

+ (NKFColor *)volvo6{
	return [NKFColor colorWithHexString:@"#212721"];
}


+ (NKFColor *)wafflehouse {
	return [NKFColor colorWithHexString:@"#fdf102"];
}

+ (NKFColor *)wafflehouse2 {
	return [NKFColor black];
}


+ (NKFColor *)wakefern {
	return [NKFColor colorWithRed:249.0f/255.0f green:60.0f/255.0f blue:48.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)wakefern2 {
	return [NKFColor colorWithRed:34.0f/255.0f green:32.0f/255.0f blue:33.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)walgreens{
	return [NKFColor colorWithHexString:@"#e31837"];
}

+ (NKFColor *)walgreens2{
	return [NKFColor colorWithHexString:@"#f37520"];
}

+ (NKFColor *)walgreens3{
	return [NKFColor colorWithHexString:@"#489cd4"];
}

+ (NKFColor *)walgreens4{
	return [NKFColor colorWithHexString:@"#2774a6"];
}

+ (NKFColor *)walgreens5{
	return [NKFColor colorWithHexString:@"#35393d"];
}


+ (NKFColor *)walmart{
	return [NKFColor colorWithHexString:@"#0e7bc3"];
}

+ (NKFColor *)walmart2{
	return [NKFColor colorWithHexString:@"#05509b"];
}

+ (NKFColor *)walmart3{
	return [NKFColor colorWithHexString:@"#6eaddf"];
}

+ (NKFColor *)walmart4{
	return [NKFColor colorWithHexString:@"#f27922"];
}

+ (NKFColor *)walmart5{
	return [NKFColor colorWithHexString:@"#fcbc32"];
}

+ (NKFColor *)walmart6{
	return [NKFColor colorWithHexString:@"#3b7f2c"];
}

+ (NKFColor *)walmart7{
	return [NKFColor colorWithHexString:@"#7ec544"];
}


+ (NKFColor *)wayfair {
    return [NKFColor colorWithHexString:@"#864887"];
}

+ (NKFColor *)wayfair2 {
    return [NKFColor colorWithHexString:@"#864887"];
}

+ (NKFColor *)wayfair3 {
    return [NKFColor colorWithHexString:@"#864887"];
}

+ (NKFColor *)wayfair4 {
    return [NKFColor colorWithHexString:@"#864887"];
}




+ (NKFColor *)wechat{
	return [NKFColor colorWithHexString:@"#7bb32e"];
}


+ (NKFColor *)wegmans {
	return [NKFColor colorWithRed:62.0f/255.0f green:150.0f/255.0f blue:63.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)wellsfargo {
    return [NKFColor colorWithHexString:@"#ba0924"];
}

+ (NKFColor *)wellsfargo2 {
    return [NKFColor colorWithHexString:@"#fdc819"];
}

+ (NKFColor *)wellsfargo3 {
    return [NKFColor colorWithHexString:@"#cb3a1e"];
}

+ (NKFColor *)wellsfargo4 {
    return [NKFColor colorWithHexString:@"#f4a525"];
}


+ (NKFColor *)wendys{
	return [NKFColor colorWithHexString:@"#e2203d"];
}

+ (NKFColor *)wendys2{
	return [NKFColor colorWithHexString:@"#199fda"];
}


+ (NKFColor *)wetzels {
	return [NKFColor colorWithHexString:@"#fefe2d"];
}

+ (NKFColor *)wetzels2 {
	return [NKFColor colorWithHexString:@"#232071"];
}

+ (NKFColor *)wetzels3 {
	return [NKFColor colorWithHexString:@"#ce5f13"];
}


+ (NKFColor *)westerndigital{
	return [NKFColor colorWithHexString:@"#005195"];
}

+ (NKFColor *)westerndigital2{
	return [NKFColor colorWithHexString:@"#028948"];
}

+ (NKFColor *)westerndigital3{
	return [NKFColor colorWithHexString:@"#ffd400"];
}

+ (NKFColor *)westerndigital4{
	return [NKFColor colorWithHexString:@"#0067b3"];
}

+ (NKFColor *)westerndigital5{
	return [NKFColor colorWithHexString:@"#9d0a0e"];
}

+ (NKFColor *)westerndigital6{
	return [NKFColor colorWithHexString:@"#003369"];
}


+ (NKFColor *)whataburger {
	return [NKFColor colorWithHexString:@"#d5610c"];
}


+ (NKFColor *)whatsapp{
	return [NKFColor colorWithHexString:@"#4dc247"];
}


+ (NKFColor *)whitecastle {
	return [NKFColor colorWithHexString:@"#4e8abb"];
}


+ (NKFColor *)wholefoods {
	return [NKFColor colorWithHexString:@"#016D55"];
}


+ (NKFColor *)whoosnapdesigner{
	return [NKFColor colorWithHexString:@"#2fa5d6"];
}

+ (NKFColor *)whoosnapdesigner2{
	return [NKFColor colorWithHexString:@"#b52f2c"];
}


+ (NKFColor *)wienerschnitzel {
	return [NKFColor colorWithRed:227.0f/255.0f green:0.0f/255.0f blue:42.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)wienerschnitzel2 {
	return [NKFColor colorWithRed:234.0f/255.0f green:103.0f/255.0f blue:54.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)wienerschnitzel3 {
	return [NKFColor colorWithRed:241.0f/255.0f green:183.0f/255.0f blue:37.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)wienerschnitzel4 {
	return [NKFColor colorWithRed:227.0f/255.0f green:0.0f/255.0f blue:103.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)williamssonoma {
	return [NKFColor colorWithRed:0.0f green:72.0f/255.0f blue:17.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)williamsonoma {
	return [NKFColor williamssonoma];
}


+ (NKFColor *)windows{
	return [NKFColor colorWithHexString:@"#00bcf2"];
}


+ (NKFColor *)windowsphone{
	return [NKFColor colorWithHexString:@"#68217a"];
}


+ (NKFColor *)wingstop {
	return [NKFColor colorWithHexString:@"#216d47"];
}


+ (NKFColor *)wired {
	return [NKFColor black];
}

+ (NKFColor *)wired2 {
	return [NKFColor white];
}


+ (NKFColor *)wooga{
	return [NKFColor colorWithHexString:@"#5b009c"];
}


+ (NKFColor *)woot {
	return [NKFColor colorWithRed:97.0f/255.0f green:134.0f/255.0f blue:30.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)wootcom {
	return [NKFColor woot];
}


+ (NKFColor *)wordpress{
	return [NKFColor colorWithHexString:@"#21759b"];
}

+ (NKFColor *)wordpress2{
	return [NKFColor colorWithHexString:@"#d54e21"];
}

+ (NKFColor *)wordpress3{
	return [NKFColor colorWithHexString:@"#464646"];
}


+ (NKFColor *)wordpresscom{
	return [NKFColor colorWithHexString:@"#0087be"];
}

+ (NKFColor *)wordpresscom2{
	return [NKFColor colorWithHexString:@"#78dcfa"];
}

+ (NKFColor *)wordpresscom3{
	return [NKFColor colorWithHexString:@"#00aadc"];
}

+ (NKFColor *)wordpresscom4{
	return [NKFColor colorWithHexString:@"#005082"];
}

+ (NKFColor *)wordpresscom5{
	return [NKFColor colorWithHexString:@"#87a6bc"];
}

+ (NKFColor *)wordpresscom6{
	return [NKFColor colorWithHexString:@"#f3f6f8"];
}

+ (NKFColor *)wordpresscom7{
	return [NKFColor colorWithHexString:@"#e9eff3"];
}

+ (NKFColor *)wordpresscom8{
	return [NKFColor colorWithHexString:@"#e9eff3"];
}

+ (NKFColor *)wordpresscom9{
	return [NKFColor colorWithHexString:@"#a8bece"];
}

+ (NKFColor *)wordpresscom10{
	return [NKFColor colorWithHexString:@"#668eaa"];
}

+ (NKFColor *)wordpresscom11{
	return [NKFColor colorWithHexString:@"#4f748e"];
}

+ (NKFColor *)wordpresscom12{
	return [NKFColor colorWithHexString:@"#3d596d"];
}

+ (NKFColor *)wordpresscom13{
	return [NKFColor colorWithHexString:@"#2e4453"];
}

+ (NKFColor *)wordpresscom14{
	return [NKFColor colorWithHexString:@"#d54e21"];
}

+ (NKFColor *)wordpresscom15{
	return [NKFColor colorWithHexString:@"#f0821e"];
}

+ (NKFColor *)wordpresscom16{
	return [NKFColor colorWithHexString:@"#4ab866"];
}

+ (NKFColor *)wordpresscom17{
	return [NKFColor colorWithHexString:@"#f0b849"];
}

+ (NKFColor *)wordpresscom18{
	return [NKFColor colorWithHexString:@"#d94f4f"];
}


+ (NKFColor *)worldline{
	return [NKFColor colorWithHexString:@"#0066a1"];
}


+ (NKFColor *)worldmark {
	return [NKFColor colorWithHexString:@"#0E1160"];
}


+ (NKFColor *)wunderlist{
	return [NKFColor colorWithHexString:@"#2b96f1"];
}


+ (NKFColor *)xbox{
	return [NKFColor colorWithHexString:@"#52b043"];
}


+ (NKFColor *)xing{
	return [NKFColor colorWithHexString:@"#026466"];
}

+ (NKFColor *)xing2{
	return [NKFColor colorWithHexString:@"#cfdc00"];
}


+ (NKFColor *)xkcd {
	return [NKFColor black];
}


+ (NKFColor *)yahoo{
	return [NKFColor colorWithHexString:@"#400191"];
}


+ (NKFColor *)yandex{
	return [NKFColor colorWithHexString:@"#ffcc00"];
}


+ (NKFColor *)yelp{
	return [NKFColor colorWithHexString:@"#af0606"];
}


+ (NKFColor *)yo{
	return [NKFColor colorWithHexString:@"#9b59b6"];
}

+ (NKFColor *)yo2{
	return [NKFColor colorWithHexString:@"#e74c3c"];
}

+ (NKFColor *)yo3{
	return [NKFColor colorWithHexString:@"#8e44ad"];
}

+ (NKFColor *)yo4{
	return [NKFColor colorWithHexString:@"#2980b9"];
}

+ (NKFColor *)yo5{
	return [NKFColor colorWithHexString:@"#f1c40f"];
}

+ (NKFColor *)yo6{
	return [NKFColor colorWithHexString:@"#16a085"];
}

+ (NKFColor *)yo7{
	return [NKFColor colorWithHexString:@"#34495e"];
}

+ (NKFColor *)yo8{
	return [NKFColor colorWithHexString:@"#3498db"];
}

+ (NKFColor *)yo9{
	return [NKFColor colorWithHexString:@"#2ecc71"];
}

+ (NKFColor *)yo10{
	return [NKFColor colorWithHexString:@"#1abc9c"];
}


+ (NKFColor *)youtube{
	return [NKFColor colorWithHexString:@"#cd201f"];
}


+ (NKFColor *)zendesk{
	return [NKFColor colorWithHexString:@"#78a300"];
}

+ (NKFColor *)zendesk2{
	return [NKFColor colorWithHexString:@"#f1f1f1"];
}

+ (NKFColor *)zendesk3{
	return [NKFColor colorWithHexString:@"#444444"];
}


+ (NKFColor *)zerply{
	return [NKFColor colorWithHexString:@"#9dbc7a"];
}


+ (NKFColor *)zillow{
	return [NKFColor colorWithHexString:@"#1277e1"];
}


+ (NKFColor *)zootool {
	return [NKFColor colorWithHexString:@"5e8b1d"];
}


+ (NKFColor *)zopim{
	return [NKFColor colorWithHexString:@"#ff9d3b"];
}

#pragma mark - State colors

+ (NKFColor *)alabama {
	return [NKFColor colorWithRed:247.0f/255.0f green:0.0f/255.0f blue:24.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)alabama2 {
	return [NKFColor white];
}

+ (NKFColor *)arizona {
	return [NKFColor federalBlue];
}

+ (NKFColor *)arizona2 {
	return [NKFColor oldGold];
}

+ (NKFColor *)californiaBlue {
	return [NKFColor colorWithRed:18.0f/255.0f green:0.0f/255.0f blue:127.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)californiaGold {
	return [NKFColor colorWithRed:250.0f/255.0f green:218.0f/255.0f blue:31.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)california {
	return [NKFColor californiaBlue];
}

+ (NKFColor *)california2 {
	return [NKFColor californiaGold];
}

+ (NKFColor *)colonialBlue {
	return [NKFColor colorWithRed:38.0f/255.0f green:122.0f/255.0f blue:166.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)delaware {
	return [NKFColor colonialBlue];
}

+ (NKFColor *)delaware2 {
	return [NKFColor buff];
}

+ (NKFColor *)floridaOrange {
	return [NKFColor colorWithRed:248.0f/255.0f green:126.0f/255.0f blue:26.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)florida {
	return [NKFColor floridaOrange];
}

+ (NKFColor *)florida2 {
	return [NKFColor alabama];
}

+ (NKFColor *)florida3 {
	return [NKFColor alabama2];
}

+ (NKFColor *)idaho {
	return [NKFColor alabama];
}

+ (NKFColor *)idaho2 {
	return [NKFColor colorWithRed:23.0f/255.0f green:131.0f/255.0f blue:3.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)idaho3 {
	return [NKFColor californiaGold];
}

+ (NKFColor *)indiana {
	return [NKFColor colorWithRed:48.0f/255.0f green:0.0f/255.0f blue:253.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)indiana2 {
	return [NKFColor californiaGold];
}

+ (NKFColor *)louisiana {
	return [NKFColor indiana];
}

+ (NKFColor *)louisiana2 {
	return [NKFColor white];
}

+ (NKFColor *)louisiana3 {
	return [NKFColor californiaGold];
}

+ (NKFColor *)maryland {
	return [NKFColor alabama];
}

+ (NKFColor *)maryland2 {
	return [NKFColor white];
}

+ (NKFColor *)maryland3 {
	return [NKFColor black];
}

+ (NKFColor *)maryland4 {
	return [NKFColor californiaGold];
}

+ (NKFColor *)massachusetts {
	return [NKFColor indiana];
}

+ (NKFColor *)massachusetts2 {
	return [NKFColor colorWithRed:25.0f/255.0f green:139.0f/255.0f blue:3.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)massachusetts3 {
	return [NKFColor cranberry];
}


+ (NKFColor *)mbta {
    return [NKFColor colorWithHexString:@"#000000"];
}



+ (NKFColor *)nevada {
	return [NKFColor colorWithWhite:192.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)nevada2 {
	return [NKFColor indiana];
}

+ (NKFColor *)newjersey {
	return [NKFColor colorWithRed:237.0f/255.0f green:222.0f/255.0f blue:132.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)newjersey2 {
	return [NKFColor indiana];
}

+ (NKFColor *)newmexico {
	return [NKFColor alabama];
}

+ (NKFColor *)newmexico2 {
	return [NKFColor colorWithRed:252.0f/255.0f green:255.0f/255.0f blue:33.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)newyork {
	return [NKFColor colorWithRed:18.0f/255.0f green:0.0f/255.0f blue:127.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)newyork2 {
	return [NKFColor colorWithRed:250.0f/255.0f green:218.0f/255.0f blue:31.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)nordstrom {
    return [NKFColor black];
}

+ (NKFColor *)nordstrom2 {
    return [NKFColor silver];
}


+ (NKFColor *)northcarolina {
	return [NKFColor alabama];
}

+ (NKFColor *)northcarolina2 {
	return [NKFColor indiana];
}

+ (NKFColor *)ohio {
	return [NKFColor alabama];
}

+ (NKFColor *)ohio2 {
	return [NKFColor white];
}

+ (NKFColor *)ohio3 {
	return [NKFColor indiana];
}

+ (NKFColor *)oklahoma {
	return [NKFColor colorWithRed:23.0f/255.0f green:131.0f/255.0f blue:1.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)oklahoma2 {
	return [NKFColor white];
}

+ (NKFColor *)oregon {
	return [NKFColor newyork];
}

+ (NKFColor *)oregon2 {
	return [NKFColor newyork2];
}

+ (NKFColor *)pennsylvania {
	return [NKFColor colorWithRed:62.0f/255.0f green:55.0f/255.0f blue:109.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)pennsylvania2 {
	return [NKFColor newyork2];
}

+ (NKFColor *)southcarolina {
	return [NKFColor colorWithRed:18.0f/255.0f green:63.0f/255.0f blue:105.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)tennessee {
	return [NKFColor colorWithRed:248.0f/255.0f green:126.0f/255.0f blue:26.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)texas {
	return [NKFColor alabama];
}

+ (NKFColor *)texas2 {
	return [NKFColor white];
}

+ (NKFColor *)texas3 {
	return [NKFColor indiana];
}

+ (NKFColor *)utah {
	return [NKFColor black];
}

+ (NKFColor *)utah2 {
	return [NKFColor newmexico2];
}

+ (NKFColor *)westvirginia {
	return [NKFColor colorWithRed:203.0f/255.0f green:183.0f/255.0f blue:64.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)westvirginia2 {
	return [NKFColor indiana];
}


@end
