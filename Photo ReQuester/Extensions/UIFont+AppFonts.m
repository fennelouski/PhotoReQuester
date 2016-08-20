//
//  UIFont+AppFonts.m
//  Philips Questionaire
//
//  Created by HAI on 5/8/15.
//  Copyright (c) 2015 HAI. All rights reserved.
//

#import "UIFont+AppFonts.h"
#import "UIFont+Custom.h"

@implementation UIFont (AppFonts)

+ (CGFloat)appFontSize {
    return 18.0f;
}

+ (UIFont *)appFont {
	return [self appFontOfSize:UIFont.appFontSize];
}

+ (UIFont *)appFontOfSize:(float)fontSize {
	return [UIFont systemFontOfSize:fontSize];
}

+ (UIFont *)boldAppFont {
	return [self boldAppFontOfSize:UIFont.appFontSize];
}

+ (UIFont *)boldAppFontOfSize:(float)fontSize {
	return [UIFont boldSystemFontOfSize:fontSize];
}

+ (UIFont *)italicAppFont {
	return [self italicAppFontOfSize:UIFont.appFontSize];
}

+ (UIFont *)italicAppFontOfSize:(float)fontSize {
	return [UIFont italicSystemFontOfSize:fontSize];
}

+ (UIFont *)boldItalicAppFont {
	return [UIFont boldItalicAppFontOfSize:UIFont.appFontSize];
}

+ (UIFont *)italicBoldAppFont {
	return [self boldItalicAppFont];
}

+ (UIFont *)italicBoldAppFontOfSize:(float)fontSize {
	return [self boldItalicAppFontOfSize:fontSize];
}

+ (UIFont *)boldItalicAppFontOfSize:(float)fontSize {
	UIFontDescriptor *fontDescriptor = [[self appFontOfSize:fontSize].fontDescriptor fontDescriptorWithSymbolicTraits:	UIFontDescriptorTraitBold | UIFontDescriptorTraitItalic];
	return [UIFont fontWithDescriptor:fontDescriptor size:fontSize];
}

@end
