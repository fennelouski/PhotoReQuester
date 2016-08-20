//
//  NSString+AppFunctions.m
//  Color Viewer
//
//  Created by Developer Nathan on 1/22/15.
//  Copyright (c) 2015 Nathan Fennel. All rights reserved.
//

#import "NSString+AppFunctions.h"

@implementation NSString (AppFunctions)

- (NSString *)portmonteau {
    NSArray *words = [self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    // if there's only one word then there's nothing that can be done with it
    if (words.count < 2) {
        return self;
    }
    
    // randomly selects if the overlap should be 2 characters or three
    NSInteger possibleOverlap = (arc4random() % 5 == 2) ? 3 : 2;
    
    // the snippet is the part of the first word to find in the second
    NSString *snippet = @"";
    NSMutableString *finalWord = [[NSMutableString alloc] init];
    
    // iterate through each word in the string up until the second to last word so there's one to compare with
    for (int i = 0; i + 1 < words.count; i++) {
        NSString *firstWord = [words objectAtIndex:i];
        NSString *secondWord = [[words objectAtIndex:i + 1] lowercaseString];
        BOOL isPortmonteau = NO;
        
        // start half way through the first word so it's still recognizable
        for (int startingCharacter = firstWord.length/2.0f; firstWord.length > possibleOverlap + 1 && startingCharacter < firstWord.length - possibleOverlap; startingCharacter++) {
            
            snippet = [firstWord substringWithRange:NSMakeRange(startingCharacter, possibleOverlap)];
            
            if ([secondWord rangeOfString:snippet].location != NSNotFound && [secondWord rangeOfString:snippet].location < [secondWord length]*2.0f/3.0f) {
                isPortmonteau = YES;
                
                [finalWord appendFormat:@"%@%@", [firstWord substringToIndex:startingCharacter], [secondWord substringFromIndex:[secondWord rangeOfString:snippet].location]];
                
//                NSLog(@"Found one! %@ -> %@", self, finalWord);
                
                break;
            }
        }
        
        if (!isPortmonteau) {
            [finalWord appendFormat:@"%@ ", firstWord];
        }
        
        else {
            for (int j = i + 2; j < words.count; j++) {
                [finalWord appendFormat:@" %@", [words objectAtIndex:j]];
            }
            
            NSLog(@"Portmonteau Word: %@", finalWord);
            
            return finalWord;
        }
    }
    
    [finalWord appendString:[words lastObject]];
    
    return finalWord;
}

+ (NSString *)portmonteau:(NSString *)input {
    return [input portmonteau];
}

- (NSString *)areOrIs {
    NSArray *areWords = @[@"women",
                          @"men",
                          @"boys",
                          @"guys",
                          @"girls",
                          @"kids",
                          @"adults",
                          @"people",
                          @"animals",
                          @"they",
                          @"dads",
                          @"moms",
                          @"grandparents",
                          @"grandkids"];
    NSString *lowerCaseInput = [self lowercaseString];
    
    for (NSString *comparisonWord in areWords) {
        if ([lowerCaseInput isEqualToString:comparisonWord]) {
            return @"are";
        }
    }
    
    return @"is";
}

+ (NSString *)areOrIs:(NSString *)input {
    return [input areOrIs];
}

- (NSString *)piIfy {
    return [[self stringByReplacingOccurrencesOfString:@"P" withString:@"π"] stringByReplacingOccurrencesOfString:@"p" withString:@"π"];
}

+ (NSString *)piIfy:(NSString *)input {
    return [input piIfy];
}


+ (NSString *)stringWithoutNumbersInTheBeginning:(NSString *)originalString {
	return [originalString stringWithoutNumbersInTheBeginning];
}

- (NSString *)stringWithoutNumbersInTheBeginning {
	int firstNonNumericCharacterIndex = [self firstAlphabeticalCharacterIndex];
	NSString *numberString = [self substringToIndex:firstNonNumericCharacterIndex];
	
	if (firstNonNumericCharacterIndex < 1) {
		return self;
	}
	
	NSString *wordString = [self substringFromIndex:firstNonNumericCharacterIndex-1];
	
	NSNumber *numberValue = [NSNumber numberWithInteger:[numberString integerValue]];
	NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
	[numberFormatter setNumberStyle:NSNumberFormatterSpellOutStyle];
	NSString *wordNumberString = [numberFormatter stringFromNumber:numberValue];
	return [NSString stringWithFormat:@"%@%@", wordNumberString, wordString];
}

+ (int)firstAlphabeticalCharacterIndex:(NSString *)originalString {
	return [originalString firstAlphabeticalCharacterIndex];
}

- (int)firstAlphabeticalCharacterIndex {
	NSCharacterSet *charactersInBrandNames = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyz"];
	char c = [self characterAtIndex:0];
	int firstNonNumericCharacterIndex = 0;
	for (; ![charactersInBrandNames characterIsMember:c] && firstNonNumericCharacterIndex < self.length; firstNonNumericCharacterIndex++) {
		c = [self characterAtIndex:firstNonNumericCharacterIndex];
	}
	
	return firstNonNumericCharacterIndex;
}

@end
