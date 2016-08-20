//
//  ALUSettingsView.h
//  Alphabetical List Utility
//
//  Created by Nathan Fennel on 7/24/15.
//  Copyright (c) 2015 Nathan Fennel. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ALUSettingsViewDelegate <NSObject>

@optional
- (void)settingsViewWillHide;
- (void)settingsViewDidHide;
- (void)settingsViewWillShow;
- (void)settingsViewDidShow;
- (void)setNeedsStatusBarAppearanceUpdate;

@end

@interface ALUSettingsView : UIToolbar

@property (nonatomic, strong) UIViewController *presentingViewController;

@property (nonatomic, assign) id <ALUSettingsViewDelegate> settingsViewDelegate;

@property BOOL statusBarNeedsHidden;


- (void)hide;
- (void)show;
- (BOOL)isShowing;

@end
