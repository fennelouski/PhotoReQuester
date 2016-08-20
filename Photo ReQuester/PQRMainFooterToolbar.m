//
//  PQRMainFooterToolbar.m
//  Photo ReQuester
//
//  Created by Nathan Fennel on 8/19/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import "PQRMainFooterToolbar.h"
#import "PQRUserManager.h"

@interface PQRMainFooterToolbar ()

@property (nonatomic, strong) UIBarButtonItem *flexibleSpace, *buyerButton, *sellerButton;

@end

@implementation PQRMainFooterToolbar

- (instancetype)init {
    self = [super initWithFrame:PQRMainFooterToolbar.footerToolbarFrame];

    if (self) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.frame = PQRMainFooterToolbar.footerToolbarFrame;
            [self updateToolbar];
        });
    }

    return self;
}

+ (CGRect)footerToolbarFrame {
    CGRect frame = UIApplication.sharedApplication.keyWindow.bounds;

    frame.size.height = 44.0f;
    frame.origin.y = UIApplication.sharedApplication.keyWindow.bounds.size.height - frame.size.height;
    frame.size.width = UIApplication.sharedApplication.keyWindow.bounds.size.width;

    NSLog(@"%g\t%g\t%g\t%g", frame.size.height, frame.size.width, frame.origin.x, frame.origin.y);

    return frame;
}

- (UIBarButtonItem *)flexibleSpace {
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                         target:self
                                                         action:nil];
}

- (UIBarButtonItem *)buyerButton {
    if (!_buyerButton) {
        _buyerButton = [[UIBarButtonItem alloc] initWithTitle:@"Switch to buyer"
                                                        style:UIBarButtonItemStylePlain
                                                       target:self
                                                       action:@selector(buyerButtonTouched:)];
    }

    return _buyerButton;
}

- (UIBarButtonItem *)sellerButton {
    if (!_sellerButton) {
        _sellerButton = [[UIBarButtonItem alloc] initWithTitle:@"Switch to seller"
                                                         style:UIBarButtonItemStylePlain
                                                        target:self
                                                        action:@selector(sellerButtonTouched:)];
    }

    return _sellerButton;
}


#pragma mark - Button Actions

- (void)buyerButtonTouched:(id)sender {
    PQRUserManager.userType = PQRUserTypeSeller;

    [self updateToolbar];
}

- (void)sellerButtonTouched:(id)sender {
    PQRUserManager.userType = PQRUserTypeBuyer;

    [self updateToolbar];
}

- (void)updateToolbar {
    NSMutableArray *items = NSMutableArray.new;

    [items addObjectsFromArray:self.leftItems];

    [items addObjectsFromArray:@[self.flexibleSpace, self.currentSwitchButton]];

    [self setItems:items
          animated:YES];

    if ([self.footerToolbarDelegate respondsToSelector:@selector(updateChildren)]) {
        [self.footerToolbarDelegate updateChildren];
    }
}

- (UIBarButtonItem *)currentSwitchButton {
    if (PQRUserManager.isBuyer) {
        return self.buyerButton;
    }

    return self.sellerButton;
}


@end
