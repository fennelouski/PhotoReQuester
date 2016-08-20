//
//  NSString+AppFunctions.h
//  Color Viewer
//
//  Created by Developer Nathan on 1/22/15.
//  Copyright (c) 2015 Nathan Fennel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (AppFunctions)

- (NSString *)portmonteau;
+ (NSString *)portmonteau:(NSString *)input;
- (NSString *)areOrIs;
+ (NSString *)areOrIs:(NSString *)input;
- (NSString *)piIfy;
+ (NSString *)piIfy:(NSString *)input;
+ (NSString *)stringWithoutNumbersInTheBeginning:(NSString *)originalString;
- (NSString *)stringWithoutNumbersInTheBeginning;
+ (int)firstAlphabeticalCharacterIndex:(NSString *)originalString;
- (int)firstAlphabeticalCharacterIndex;

@end
