//
//  UIFont+Custom.h
//  iPresent4
//
//  Created by HAI on 5/6/14.
//  Copyright (c) 2014 HAI. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, FontType) {
  FontTypeRegular = 1,
  FontTypeBold,
  FontTypeItalic,
  FontTypeLight,
} ;

@interface UIFont (Custom)

+ (instancetype)typeDepotCentraleSansFontWithSize:(CGFloat)size fontType:(FontType)fontType;

+ (instancetype)helveticaNeueFontWithSize:(CGFloat)size fontType:(FontType)fontType;

@end
