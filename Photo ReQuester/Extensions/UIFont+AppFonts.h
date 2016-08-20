//
//  UIFont+AppFonts.h
//  Philips Questionaire
//
//  Created by HAI on 5/8/15.
//  Copyright (c) 2015 HAI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (AppFonts)

+ (CGFloat)appFontSize;

+ (UIFont *)appFont;

+ (UIFont *)appFontOfSize:(float)fontSize;

+ (UIFont *)boldAppFont;

+ (UIFont *)boldAppFontOfSize:(float)fontSize;

+ (UIFont *)italicAppFont;

+ (UIFont *)italicAppFontOfSize:(float)fontSize;

+ (UIFont *)boldItalicAppFont;

+ (UIFont *)italicBoldAppFont;

+ (UIFont *)italicBoldAppFontOfSize:(float)fontSize;

+ (UIFont *)boldItalicAppFontOfSize:(float)fontSize;

@end
