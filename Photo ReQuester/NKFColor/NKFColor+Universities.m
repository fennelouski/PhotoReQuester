//
//  NKFColor+Universities.m
//  Alphabetical List Utility
//
//  Created by Developer Nathan on 7/30/15.
//  Copyright (c) 2015 HAI. All rights reserved.
//

#import "NKFColor+Universities.h"
#import "NSString+AppFunctions.h"

@implementation NKFColor (Universities)

+ (NKFColor *)strictUniversityColorForSchoolName:(NSString *)schoolName {
    NKFColor *firstRoundColor = [self colorWithoutModifyingSchoolName:schoolName];
    if (firstRoundColor) {
        return firstRoundColor;
    }
    
    NSString *lowerCaseSchoolName = [schoolName lowercaseString];
    NSString *formattedSchoolName = [[lowerCaseSchoolName componentsSeparatedByCharactersInSet:[[NSCharacterSet alphanumericCharacterSet] invertedSet]] componentsJoinedByString:@""];
    formattedSchoolName = [[formattedSchoolName componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] componentsJoinedByString:@""];
    
    
    NSArray *prefixes = @[@"universityof", @"college"];
    
    for (NSString *prefix in prefixes) {
        if ([formattedSchoolName containsString:prefix]) {
            break;
        }
        
        NSString *universityName = [NSString stringWithFormat:@"%@%@", prefix, formattedSchoolName];
        NKFColor *lastDitchColor = [NKFColor colorWithoutModifyingSchoolName:universityName];
        
        if (lastDitchColor) {
            return lastDitchColor;
        }
    }
    
    NSArray *suffixes = @[@"university", @"college"];
    
    for (NSString *suffix in suffixes) {
        if ([formattedSchoolName containsString:suffix]) {
            break;
        }
        
        NSString *universityName = [NSString stringWithFormat:@"%@%@", formattedSchoolName, suffix];
        NKFColor *lastDitchColor = [NKFColor colorWithoutModifyingSchoolName:universityName];
        
        
        if (lastDitchColor) {
            return lastDitchColor;
        }
    }
    
    for (NSString *prefix in prefixes) {
        if ([formattedSchoolName hasPrefix:prefix] && formattedSchoolName.length > prefix.length) {
            NSString *universityName = [formattedSchoolName substringFromIndex:prefix.length];
            NKFColor *lastDitchColor = [NKFColor colorWithoutModifyingSchoolName:universityName];
            if (lastDitchColor) {
                return lastDitchColor;
            }
        }
    }

    for (NSString *suffix in suffixes) {
        if ([formattedSchoolName hasSuffix:suffix] && formattedSchoolName.length > suffix.length) {
            NSString *universityName = [formattedSchoolName substringToIndex:formattedSchoolName.length - suffix.length];
            NKFColor *lastDitchColor = [NKFColor colorWithoutModifyingSchoolName:universityName];
            if (lastDitchColor) {
                return lastDitchColor;
            }
        }
    }
    
    return nil;
}


+ (NKFColor *)colorWithoutModifyingSchoolName:(NSString *)schoolName {
    if (!schoolName || schoolName.length == 0) {
        NSLog(@"Company Name must exist to generate color.");
        return [NKFColor randomDarkColor];
    }
    
    NSString *lowerCaseSchoolName = [schoolName lowercaseString];
    NSString *formattedSchoolName = [[lowerCaseSchoolName componentsSeparatedByCharactersInSet:[[NSCharacterSet alphanumericCharacterSet] invertedSet]] componentsJoinedByString:@""];
    formattedSchoolName = [[formattedSchoolName componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] componentsJoinedByString:@""];
    
    NSArray *bannedWords = [self bannedWords];
    for (NSString *bannedWord in bannedWords) {
        if ([formattedSchoolName rangeOfString:bannedWord].location != NSNotFound) {
            return [NKFColor blackColor];
        }
    }
    
    if ([self respondsToSelector:NSSelectorFromString(formattedSchoolName)]) {
        return [NKFColor performSelector:NSSelectorFromString(formattedSchoolName) withObject:nil];
    } else if ([lowerCaseSchoolName firstAlphabeticalCharacterIndex]) {
        return [NKFColor strictUniversityColorForSchoolName:[lowerCaseSchoolName stringWithoutNumbersInTheBeginning]];
    } else {
        NSArray *words = [lowerCaseSchoolName componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        for (NSInteger i = words.count - 1; i >= 0; i--) {
            NSString *word = [words objectAtIndex:i];
            
            for (NSString *bannedWord in bannedWords) {
                if ([word rangeOfString:bannedWord].location != NSNotFound) {
                    return [NKFColor blackColor];
                }
            }
            
            if ([self respondsToSelector:NSSelectorFromString(word)]) {
                return [NKFColor performSelector:NSSelectorFromString(word) withObject:nil];
            }
        }
        
        // try with a camel case
        // e.g. Cal Poly -> calPoly
        NSMutableString *camelCaseschoolName = [[NSMutableString alloc] initWithString:words.firstObject];
        for (int i = 1; i < words.count; i++) {
            NSString *nextWord = [[words objectAtIndex:i] capitalizedString];
            [camelCaseschoolName appendString:nextWord];
        }
        
        if ([self respondsToSelector:NSSelectorFromString(camelCaseschoolName)]) {
            return [NKFColor performSelector:NSSelectorFromString(camelCaseschoolName) withObject:nil];
        }
        
        if ([schoolName rangeOfString:@"&"].location != NSNotFound) {
            return [NKFColor strictUniversityColorForSchoolName:[lowerCaseSchoolName stringByReplacingOccurrencesOfString:@"&" withString:@"and"]];
        }
        
        for (NSString *word in words) {
            if ([word hasSuffix:@"s"] && word.length > 1 && ![word hasSuffix:@"ss"]) {
                NSString *singularWord = [word substringToIndex:word.length - 1];
                NKFColor *singularWordColor = [NKFColor strictUniversityColorForSchoolName:singularWord];
                if (singularWordColor) {
                    return singularWordColor;
                }
            }
        }
    }

    return nil;
}

+ (NKFColor *)airforce {
    return [NKFColor colorWithHexString:@"#1f399a"];
}

+ (NKFColor *)airforce2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}

+ (NKFColor *)airforce3 {
    return [NKFColor colorWithHexString:@"#bfc5c5"];
}



+ (NKFColor *)alabama {
    return [NKFColor colorWithHexString:@"#8f282b"];
}


+ (NKFColor *)alabama2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)arizona {
    return [NKFColor colorWithHexString:@"#0c1653"];
}


+ (NKFColor *)arizona2 {
    return [NKFColor colorWithHexString:@"#be1d1e"];
}


+ (NKFColor *)arizonastate {
    return [NKFColor colorWithHexString:@"#93292b"];
}

+ (NKFColor *)arizonastate2 {
    return [NKFColor colorWithHexString:@"#f2c538"];
}


+ (NKFColor *)arkansas {
    return [NKFColor colorWithHexString:@"#bf1e1f"];
}

+ (NKFColor *)arkansas2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)army {
    return [NKFColor colorWithHexString:@"#2a2b27"];
}

+ (NKFColor *)army2 {
    return [NKFColor colorWithHexString:@"#a78524"];
}


+ (NKFColor *)auburn {
    return [NKFColor colorWithHexString:@"#151a2e"];
}

+ (NKFColor *)auburn2 {
    return [NKFColor colorWithHexString:@"#f08057"];
}


+ (NKFColor *)azusapacific {
    return [NKFColor colorWithRed:128.0f/255.0f green:40.0f/255.0f blue:43.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)azusapacific2 {
    return [NKFColor whiteColor];
}

+ (NKFColor *)azusapacific3 {
    return [NKFColor blackColor];
}


+ (NKFColor *)baylor {
    return [NKFColor colorWithHexString:@"#4e655d"];
}

+ (NKFColor *)baylor2 {
    return [NKFColor colorWithHexString:@"#e7a155"];
}


+ (NKFColor *)boisestate {
    return [NKFColor colorWithHexString:@"#1d2e80"];
}

+ (NKFColor *)boisestate2 {
    return [NKFColor colorWithHexString:@"#d05c34"];
}


+ (NKFColor *)bostoncollege {
    return [NKFColor colorWithHexString:@"#8a5861"];
}

+ (NKFColor *)bostoncollege2 {
    return [NKFColor colorWithHexString:@"#a5832d"];
}


+ (NKFColor *)boston {
    return [NKFColor colorWithHexString:@"#c23944"];
}

+ (NKFColor *)boston2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)byu {
    return [NKFColor colorWithHexString:@"#4f7ac4"];
}

+ (NKFColor *)byu2 {
    return [NKFColor colorWithHexString:@"#7e898b"];
}

+ (NKFColor *)byu3 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)californiastate {
    return [NKFColor colorWithHexString:@"#445a96"];
}

+ (NKFColor *)californiastate2 {
    return [NKFColor colorWithHexString:@"#eba550"];
}



+ (NKFColor *)cincinnati {
    return [NKFColor colorWithHexString:@"#e23a30"];
}

+ (NKFColor *)cincinnati2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)clemson {
    return [NKFColor colorWithHexString:@"#f07f57"];
}

+ (NKFColor *)clemson2 {
    return [NKFColor colorWithHexString:@"#68568a"];
}


+ (NKFColor *)colorado {
    return [NKFColor colorWithHexString:@"#7c8789"];
}

+ (NKFColor *)colorado2 {
    return [NKFColor colorWithHexString:@"#f0c336"];
}


+ (NKFColor *)coloradostate {
    return [NKFColor colorWithHexString:@"#457d58"];
}

+ (NKFColor *)coloradostate2 {
    return [NKFColor colorWithHexString:@"#a7852f"];
}


+ (NKFColor *)connecticut {
    return [NKFColor colorWithHexString:@"#141a2d"];
}

+ (NKFColor *)connecticut2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)depaul {
    return [NKFColor colorWithHexString:@"#203a9b"];
}

+ (NKFColor *)depaul2 {
    return [NKFColor colorWithHexString:@"#cd4b4d"];
}


+ (NKFColor *)duke {
    return [NKFColor colorWithHexString:@"#1f3082"];
}

+ (NKFColor *)duke2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)florida {
    return [NKFColor colorWithHexString:@"#1f399a"];
}

+ (NKFColor *)florida2 {
    return [NKFColor colorWithHexString:@"#d35f2e"];
}


+ (NKFColor *)floridastate {
    return [NKFColor colorWithHexString:@"#90292c"];
}

+ (NKFColor *)floridastate2 {
    return [NKFColor colorWithHexString:@"#a78524"];
}


+ (NKFColor *)fresnostate {
    return [NKFColor colorWithHexString:@"#c83c45"];
}

+ (NKFColor *)fresnostate2 {
    return [NKFColor colorWithHexString:@"#1f3082"];
}

+ (NKFColor *)fresnostate3 {
    return [NKFColor colorWithHexString:@"#639c5f"];
}


+ (NKFColor *)georgetown {
    return [NKFColor colorWithHexString:@"#1e2f81"];
}

+ (NKFColor *)georgetown2 {
    return [NKFColor colorWithHexString:@"#6d645b"];
}


+ (NKFColor *)georgia {
    return [NKFColor colorWithHexString:@"#912729"];
}

+ (NKFColor *)georgia2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)georgiatech {
    return [NKFColor colorWithHexString:@"#a78524"];
}

+ (NKFColor *)georgiatech2 {
    return [NKFColor colorWithHexString:@"#181c2c"];
}


+ (NKFColor *)harvard {
    return [NKFColor colorWithHexString:@"#c13840"];
}

+ (NKFColor *)harvard2 {
    return [NKFColor colorWithHexString:@"#22231e"];
}

+ (NKFColor *)harvard3 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)idaho {
    return [NKFColor colorWithHexString:@"#a78524"];
}

+ (NKFColor *)idaho2 {
    return [NKFColor colorWithHexString:@"#262722"];
}

+ (NKFColor *)idaho3 {
    return [NKFColor colorWithHexString:@"#bec4c4"];
}


+ (NKFColor *)idahostate {
    return [NKFColor colorWithHexString:@"#d27f33"];
}

+ (NKFColor *)idahostate2 {
    return [NKFColor colorWithHexString:@"#20211c"];
}


+ (NKFColor *)illinois {
    return [NKFColor colorWithHexString:@"#ee7f5c"];
}

+ (NKFColor *)illinois2 {
    return [NKFColor colorWithHexString:@"#0c1653"];
}


+ (NKFColor *)indiana {
    return [NKFColor colorWithHexString:@"#aa1b15"];
}

+ (NKFColor *)indiana2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)iowa {
    return [NKFColor colorWithHexString:@"#f0c336"];
}

+ (NKFColor *)iowa2 {
    return [NKFColor colorWithHexString:@"#23241f"];
}


+ (NKFColor *)iowastate {
    return [NKFColor colorWithHexString:@"#c01b15"];
}

+ (NKFColor *)iowastate2 {
    return [NKFColor colorWithHexString:@"#e19b46"];
}


+ (NKFColor *)kansas {
    return [NKFColor colorWithHexString:@"#1d369d"];
}

+ (NKFColor *)kansas2 {
    return [NKFColor colorWithHexString:@"#c13840"];
}

+ (NKFColor *)kansas3 {
    return [NKFColor colorWithHexString:@"#6c737b"];
}


+ (NKFColor *)kansasstate {
    return [NKFColor colorWithHexString:@"#66538a"];
}

+ (NKFColor *)kansasstate2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)kentucky {
    return [NKFColor colorWithHexString:@"#4f6384"];
}

+ (NKFColor *)kentucky2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)louisville {
    return [NKFColor colorWithHexString:@"#ce4c4e"];
}

+ (NKFColor *)louisville2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)lsu {
    return [NKFColor colorWithHexString:@"#6a558e"];
}

+ (NKFColor *)lsu2 {
    return [NKFColor colorWithHexString:@"#e6a04b"];
}


+ (NKFColor *)marquette {
    return [NKFColor colorWithHexString:@"#0c1653"];
}

+ (NKFColor *)marquette2 {
    return [NKFColor colorWithHexString:@"#eda752"];
}


+ (NKFColor *)maryland {
    return [NKFColor colorWithHexString:@"#e43928"];
}

+ (NKFColor *)maryland2 {
    return [NKFColor colorWithHexString:@"#f0c336"];
}

+ (NKFColor *)maryland3 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)massachusetts {
    return [NKFColor colorWithHexString:@"#873a40"];
}

+ (NKFColor *)massachusetts2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)miami {
    return [NKFColor colorWithHexString:@"#d56130"];
}

+ (NKFColor *)miami2 {
    return [NKFColor colorWithHexString:@"#1e402f"];
}


+ (NKFColor *)michigan {
    return [NKFColor colorWithHexString:@"#ffcb05"];
}

+ (NKFColor *)michigan2 {
    return [NKFColor colorWithHexString:@"#00274c"];
}


+ (NKFColor *)michiganstate {
    return [NKFColor colorWithHexString:@"#4a7f5c"];
}

+ (NKFColor *)michiganstate2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)minnesota {
    return [NKFColor colorWithHexString:@"#902628"];
}

+ (NKFColor *)minnesota2 {
    return [NKFColor colorWithHexString:@"#f0c345"];
}


+ (NKFColor *)mississippi {
    return [NKFColor colorWithHexString:@"#c94048"];
}

+ (NKFColor *)mississippi2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)mississippistate {
    return [NKFColor colorWithHexString:@"#88555e"];
}

+ (NKFColor *)mississippistate2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)missouri {
    return [NKFColor colorWithHexString:@"#e9a34e"];
}

+ (NKFColor *)missouri2 {
    return [NKFColor colorWithHexString:@"#23241f"];
}


+ (NKFColor *)mit {
    return [NKFColor colorWithHexString:@"#c53942"];
}

+ (NKFColor *)mit2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)navy {
    return [NKFColor colorWithHexString:@"#1a1d2e"];
}

+ (NKFColor *)navy2 {
    return [NKFColor colorWithHexString:@"#a98726"];
}


+ (NKFColor *)ncstate {
    return [NKFColor colorWithHexString:@"#e43928"];
}

+ (NKFColor *)ncstate2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)nebraska {
    return [NKFColor colorWithHexString:@"#e43928"];
}

+ (NKFColor *)nebraska2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)newyorkuniversity {
    return [NKFColor colorWithHexString:@"#4a417b"];
}

+ (NKFColor *)newyorkuniversity2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)northcarolina {
    return [NKFColor colorWithHexString:@"#a8c5e1"];
}

+ (NKFColor *)northcarolina2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)northeastern {
	return [NKFColor colorWithHexString:@"#CC0000"];
}

+ (NKFColor *)northeastern2 {
	return [NKFColor colorWithHexString:@"#615445"];
}

+ (NKFColor *)northeastern3 {
	return [NKFColor blackColor];
}


+ (NKFColor *)northernillinois {
    return [NKFColor colorWithHexString:@"#c33a42"];
}

+ (NKFColor *)northernillinois2 {
    return [NKFColor colorWithHexString:@"#252621"];
}


+ (NKFColor *)northwestern {
    return [NKFColor colorWithHexString:@"#520063"];
}

+ (NKFColor *)northwestern2 {
    return [NKFColor colorWithHexString:@"#242520"];
}

+ (NKFColor *)northwestern3 {
	return [NKFColor colorWithHexString:@"#FFFFFF"];
}

+ (NKFColor *)northwestern4 {
	return [NKFColor colorWithHexString:@"#000000"];
}


+ (NKFColor *)notredame {
    return [NKFColor colorWithHexString:@"#506485"];
}

+ (NKFColor *)notredame2 {
    return [NKFColor colorWithHexString:@"#cfbe64"];
}

+ (NKFColor *)notredame3 {
    return [NKFColor colorWithHexString:@"#a88625"];
}


+ (NKFColor *)ohiostate {
    return [NKFColor colorWithHexString:@"#ac201f"];
}

+ (NKFColor *)ohiostate2 {
    return [NKFColor colorWithHexString:@"#7f8a8c"];
}


+ (NKFColor *)oklahoma {
    return [NKFColor colorWithHexString:@"#a91d1d"];
}

+ (NKFColor *)oklahoma2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)oklahomastate {
    return [NKFColor colorWithHexString:@"#cf5929"];
}

+ (NKFColor *)oklahomastate2 {
    return [NKFColor colorWithHexString:@"#20211c"];
}


+ (NKFColor *)oregon {
    return [NKFColor colorWithHexString:@"#1e402f"];
}

+ (NKFColor *)oregon2 {
    return [NKFColor colorWithHexString:@"#fad763"];
}


+ (NKFColor *)beavers {
    return [NKFColor colorWithHexString:@"#f18057"];
}

+ (NKFColor *)beavers2 {
    return [NKFColor colorWithHexString:@"#252621"];
}


+ (NKFColor *)pennstate {
    return [NKFColor colorWithHexString:@"#1f3082"];
}

+ (NKFColor *)pennstate2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)pittsburg {
    return [NKFColor colorWithHexString:@"#141a2d"];
}

+ (NKFColor *)pittsburg2 {
    return [NKFColor colorWithHexString:@"#80745a"];
}


+ (NKFColor *)providence {
    return [NKFColor colorWithHexString:@"#2a2b26"];
}

+ (NKFColor *)providence2 {
    return [NKFColor colorWithHexString:@"#b7bdbd"];
}


+ (NKFColor *)purdue {
    return [NKFColor colorWithHexString:@"#a88625"];
}

+ (NKFColor *)purdue2 {
    return [NKFColor colorWithHexString:@"#252622"];
}


+ (NKFColor *)rutgers {
    return [NKFColor colorWithHexString:@"#e23a30"];
}

+ (NKFColor *)rutgers2 {
    return [NKFColor colorWithHexString:@"#9c9f98"];
}


+ (NKFColor *)setonhall {
    return [NKFColor colorWithHexString:@"#203280"];
}

+ (NKFColor *)setonhall2 {
    return [NKFColor colorWithHexString:@"#bdc3c3"];
}


+ (NKFColor *)southcarolina {
    return [NKFColor colorWithHexString:@"#ac1d17"];
}

+ (NKFColor *)southcarolina2 {
    return [NKFColor colorWithHexString:@"#252621"];
}


+ (NKFColor *)southflorida {
    return [NKFColor colorWithHexString:@"#1e402f"];
}

+ (NKFColor *)southflorida2 {
    return [NKFColor colorWithHexString:@"#a78524"];
}


+ (NKFColor *)stjohns {
    return [NKFColor colorWithHexString:@"#e43928"];
}

+ (NKFColor *)stjohns2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)stanford {
    return [NKFColor colorWithHexString:@"#8f2527"];
}

+ (NKFColor *)stanford2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)syracuse {
    return [NKFColor colorWithHexString:@"#d4602f"];
}

+ (NKFColor *)syracuse2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)tennessee {
    return [NKFColor colorWithHexString:@"#d88539"];
}

+ (NKFColor *)tennessee2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)texas {
    return [NKFColor colorWithHexString:@"#c96450"];
}

+ (NKFColor *)texas2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)texasaandm {
    return [NKFColor colorWithHexString:@"#6c4645"];
}

+ (NKFColor *)texasaandm2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)texastech {
    return [NKFColor colorWithHexString:@"#ce4c4e"];
}

+ (NKFColor *)texastech2 {
    return [NKFColor colorWithHexString:@"#000000"];
}


+ (NKFColor *)ucla {
    return [NKFColor colorWithHexString:@"#4873c1"];
}

+ (NKFColor *)ucla2 {
    return [NKFColor colorWithHexString:@"#f1c437"];
}

+ (NKFColor *)universityofcalifornialosangeles {
    return [NKFColor ucla];
}

+ (NKFColor *)universityofcalifornialosangeles2 {
    return [NKFColor ucla2];
}




+ (NKFColor *)usc {
    return [NKFColor colorWithHexString:@"#8e272a"];
}

+ (NKFColor *)usc2 {
    return [NKFColor colorWithHexString:@"#f1aa59"];
}

+ (NKFColor *)universityofsoutherncalifornia {
    return [NKFColor usc];
}

+ (NKFColor *)universityofsoutherncalifornia2 {
    return [NKFColor usc2];
}


+ (NKFColor *)utah {
    return [NKFColor colorWithHexString:@"#b5373a"];
}

+ (NKFColor *)utah2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}

+ (NKFColor *)utah3 {
    return [NKFColor colorWithHexString:@"#000000"];
}


+ (NKFColor *)utahstate {
    return [NKFColor colorWithHexString:@"#071753"];
}

+ (NKFColor *)utahstate2 {
    return [NKFColor colorWithHexString:@"#22231e"];
}


+ (NKFColor *)vanderbilt {
    return [NKFColor colorWithHexString:@"#a7852f"];
}

+ (NKFColor *)vanderbilt2 {
    return [NKFColor colorWithHexString:@"#000000"];
}


+ (NKFColor *)villanova {
    return [NKFColor colorWithHexString:@"#0b1751"];
}

+ (NKFColor *)villanova2 {
    return [NKFColor colorWithHexString:@"#a88625"];
}


+ (NKFColor *)virginia {
    return [NKFColor colorWithHexString:@"#1f3d78"];
}

+ (NKFColor *)virginia2 {
    return [NKFColor colorWithHexString:@"#ef7e54"];
}


+ (NKFColor *)virginiatech {
    return [NKFColor colorWithHexString:@"#ef7f57"];
}

+ (NKFColor *)virginiatech2 {
    return [NKFColor colorWithHexString:@"#782831"];
}


+ (NKFColor *)wakeforest {
    return [NKFColor colorWithHexString:@"#a5832d"];
}

+ (NKFColor *)wakeforest2 {
    return [NKFColor colorWithHexString:@"#000000"];
}


+ (NKFColor *)washington {
    return [NKFColor colorWithHexString:@"#68558c"];
}

+ (NKFColor *)washington2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)washingtonstate {
    return [NKFColor colorWithHexString:@"#8f2527"];
}

+ (NKFColor *)washingtonstate2 {
    return [NKFColor colorWithHexString:@"#6c737b"];
}


+ (NKFColor *)weberstate {
    return [NKFColor colorWithHexString:@"#463d77"];
}

+ (NKFColor *)weberstate2 {
    return [NKFColor colorWithHexString:@"#ffffff"];
}


+ (NKFColor *)westvirginia {
    return [NKFColor colorWithHexString:@"#1e2f81"];
}

+ (NKFColor *)westvirginia2 {
    return [NKFColor colorWithHexString:@"#dd9946"];
}


+ (NKFColor *)wisconsin {
    return [NKFColor colorWithHexString:@"#912729"];
}

+ (NKFColor *)wisconsin2 {
    return [NKFColor colorWithHexString:@"#252621"];
}


+ (NKFColor *)wyoming {
    return [NKFColor colorWithHexString:@"#533437"];
}

+ (NKFColor *)wyoming2 {
    return [NKFColor colorWithHexString:@"#f0c336"];
}


@end
