//
//  NKFColor+AppColors.h
//  Alphabetical List Utility
//
//  Created by HAI on 7/22/15.
//  Copyright (c) 2015 HAI. All rights reserved.
//

#import "NKFColor.h"

@interface NKFColor (AppColors)

// lists of primary colors to use for the app that can be easily referenced across the entire app
+ (NKFColor *)appColor;
+ (NKFColor *)appColor1;
+ (NKFColor *)appColor2;
+ (NKFColor *)appColor3;
+ (NKFColor *)appColor4;
+ (NSArray *)appColors;

+ (NKFColor *)redAppColor;
+ (NKFColor *)greenAppColor;
+ (NKFColor *)blueAppColor;
+ (NKFColor *)yellowAppColor;
+ (NKFColor *)magentaAppColor;
+ (NKFColor *)cyanAppColor;
+ (NKFColor *)blackAppColor;
+ (NKFColor *)whiteAppColor;

// user colors
- (void)saveColorNamed:(NSString *)name;
+ (void)saveColor:(NKFColor *)color named:(NSString *)name;
+ (void)deleteColorWithName:(NSString *)name;
+ (NSDictionary *)userColors;

@end
