//
//  UIFont+Custom.m
//  iPresent4
//
//  Created by HAI on 5/6/14.
//  Copyright (c) 2014 HAI. All rights reserved.
//

#import "UIFont+Custom.h"
#import <CoreText/CoreText.h>

#define CUSTOM_FONTS @"Custom_Fonts"

@implementation UIFont (Custom)

static NSMutableDictionary *_fonts = nil;

+ (instancetype)fontFromCacheWithFontName:(NSString *)fontName size:(CGFloat)size;
{
  if ( !_fonts ) {
	_fonts = [[NSMutableDictionary alloc] init];
  }
  
  NSString *key = [fontName stringByAppendingFormat:@" | size %f",size];
  
  UIFont *font = _fonts[key];
  
  if ( !font ) {
	font = [self fontWithName:fontName size:size];
	_fonts[key] = font;
  }
  
  return font;
}

+ (instancetype)typeDepotCentraleSansFontWithSize:(CGFloat)size fontType:(FontType)fontType;
{
  NSString *fontName = nil;
  
  switch (fontType) {
	case FontTypeBold:
	  fontName = @"CentraleSans-Bold";
	  break;
	case FontTypeLight:
	  fontName = @"CentraleSans-Light";
	  break;
	  
	default:
	  fontName = @"CentraleSans-Regular";
	  break;
  }
  
  return [self fontFromCacheWithFontName:fontName size:size];
}

+ (instancetype)helveticaNeueFontWithSize:(CGFloat)size fontType:(FontType)fontType;
{
  NSString *fontName = @"HelveticaNeueLTStd-Th";
  
  return [self fontFromCacheWithFontName:fontName size:size];
}

@end
