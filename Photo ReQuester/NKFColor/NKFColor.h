//
//  NKFColor.h
//  Alphabetical List Utility
//
//  Created by HAI on 7/16/15.
//  Copyright (c) 2015 HAI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NKFColor : UIColor

// forwarded methods
+ (NKFColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
+ (NKFColor *)colorWithWhite:(CGFloat)white alpha:(CGFloat)alpha;
+ (NKFColor *)blackColor;      // 0.0 white
+ (NKFColor *)darkGrayColor;   // 0.333 white
+ (NKFColor *)lightGrayColor;  // 0.667 white
+ (NKFColor *)whiteColor;      // 1.0 white
+ (NKFColor *)grayColor;       // 0.5 white
+ (NKFColor *)redColor;        // 1.0, 0.0, 0.0 RGB
+ (NKFColor *)greenColor;      // 0.0, 1.0, 0.0 RGB
+ (NKFColor *)blueColor;       // 0.0, 0.0, 1.0 RGB
+ (NKFColor *)cyanColor;       // 0.0, 1.0, 1.0 RGB
+ (NKFColor *)yellowColor;     // 1.0, 1.0, 0.0 RGB
+ (NKFColor *)magentaColor;    // 1.0, 0.0, 1.0 RGB
+ (NKFColor *)orangeColor;     // 1.0, 0.5, 0.0 RGB
+ (NKFColor *)purpleColor;     // 0.5, 0.0, 0.5 RGB
+ (NKFColor *)brownColor;      // 0.6, 0.4, 0.2 RGB
+ (NKFColor *)clearColor;      // 0.0 white, 0.0 alpha
- (NKFColor *)colorWithAlphaComponent:(CGFloat)alpha;

// modify colors
- (NKFColor *)lightenColor;
- (NKFColor *)lightenColorBy:(float)lightenAmount;
- (NKFColor *)darkenColor;
- (NKFColor *)darkenColorBy:(float)darkenAmount;
- (NKFColor *)setBrightness:(float)brightness;

// random colors
+ (NKFColor *)randomPastelColor;
+ (NKFColor *)randomDarkColor;
+ (NKFColor *)randomColor;
+ (NSString *)randomColorName;
- (NSString *)randomColorName;
+ (NSString *)randomColorNameWithColor:(NKFColor *)color;
+ (NKFColor *)randomDarkColorFromString:(NSString *)string;

// iOS Colors

+ (NKFColor *)uiSwitchGreen;

// hex value
- (NSString *)hexValue;
+ (NSString *)hexValue:(NKFColor *)color;

// opposite color
- (NKFColor *)oppositeTextColor;
+ (NKFColor *)oppositeTextColor:(NKFColor *)color;
- (NKFColor *)oppositeBlackOrWhite;
+ (NKFColor *)oppositeBlackOrWhite:(NKFColor *)color;
- (NKFColor *)oppositeBlackOrWhite:(float)weighting;
+ (NKFColor *)oppositeBlackOrWhite:(NKFColor *)color weighting:(float)weighting;
- (BOOL)isDark;
+ (BOOL)colorIsDark:(NKFColor *)color;
- (BOOL)isLight;
+ (BOOL)colorIsLight:(NKFColor *)color;
- (BOOL)isLighterThan:(float)threshold;
+ (BOOL)color:(NKFColor *)color isLighterThan:(float)threshold;

+ (NKFColor *)colorWithHexString:(NSString *)hexString;

+ (NSArray *)bannedWords;

@end
