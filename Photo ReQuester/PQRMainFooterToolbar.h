//
//  PQRMainFooterToolbar.h
//  Photo ReQuester
//
//  Created by Nathan Fennel on 8/19/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PQRMainFooterToolbarDelegate <NSObject>

@required
- (void)updateChildren;

@end

@interface PQRMainFooterToolbar : UIToolbar

@property (nonatomic, strong) NSArray *leftItems;

@property (weak) id <PQRMainFooterToolbarDelegate> footerToolbarDelegate;

@end
