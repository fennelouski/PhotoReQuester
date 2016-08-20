//
//  ALUSettingsView.m
//  Alphabetical List Utility
//
//  Created by Nathan Fennel on 7/24/15.
//  Copyright (c) 2015 Nathan Fennel. All rights reserved.
//

#import "ALUSettingsView.h"
#import "UIImage+ImageEffects.h"
#import "UIColor+AppColors.h"
#import "NGAParallaxMotion.h"
#import <SafariServices/SafariServices.h>

#define kScreenWidth (([UIScreen mainScreen].bounds.size.width > [UIScreen mainScreen].bounds.size.height) ? [UIScreen mainScreen].bounds.size.width : [UIScreen mainScreen].bounds.size.height)
#define kStatusBarHeight (([[UIApplication sharedApplication] statusBarFrame].size.height == 20.0f) ? 20.0f : (([[UIApplication sharedApplication] statusBarFrame].size.height == 40.0f) ? 20.0f : 0.0f))
#define kScreenHeight (([UIScreen mainScreen].bounds.size.width < [UIScreen mainScreen].bounds.size.height) ? [UIScreen mainScreen].bounds.size.width : [UIScreen mainScreen].bounds.size.height)

@interface ALUSettingsView ()

@property CGFloat keyboardHeight;

@end

@implementation ALUSettingsView {
	NSDictionary *_settingsTitles;
	BOOL _isShowing;
	UIImageView *_blurredImageView;
	NSMutableArray *_blurredImageViews;
	UIView *_coverUpView;
}

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	
	if (self) {
		_blurredImageViews = [[NSMutableArray alloc] init];
		self.layer.cornerRadius = 5.0f;
		self.clipsToBounds = YES;
		_coverUpView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
		_coverUpView.backgroundColor = [[UIColor white] colorWithAlphaComponent:0.01f];
		self.parallaxIntensity = (kScreenWidth + kScreenHeight) / 80.0f;
        
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(keyboardDidShow:)
                   name:UIKeyboardWillShowNotification
                 object:nil];
        [nc addObserver:self
               selector:@selector(keyboardDidHide:)
                   name:UIKeyboardWillHideNotification
                 object:nil];
	}
	
	return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	for (UIView *subview in _blurredImageViews) {
		subview.frame = subview.superview.bounds;
	}
    
    if (_isShowing) {
        [self recenter];
    }
}


#pragma mark - Subviews


- (UIBarButtonItem *)flexibleSpace {
	return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                         target:self
                                                         action:nil];
}

#pragma mark - Hide / Show

- (void)hide {
    if ([self.settingsViewDelegate respondsToSelector:@selector(settingsViewWillHide)]) {
        [self.settingsViewDelegate settingsViewWillHide];
    }
    
	_isShowing = NO;
	[self removeBlurredViews:animationDuration];
	[UIView animateWithDuration:animationDuration
						  delay:0.0f
						options:UIViewAnimationOptionCurveEaseIn
					 animations:^{
						 _blurredImageView.alpha = 0.0f;
						 self.center = CGPointMake(self.center.x,
												   kScreenHeight + self.bounds.size.height * 2.0f);
                         
                         if ([self.settingsViewDelegate respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
                             [self.settingsViewDelegate setNeedsStatusBarAppearanceUpdate];
                         }

					 } completion:^(BOOL finished) {
						 self.hidden = YES;
                         
                         if ([self.settingsViewDelegate respondsToSelector:@selector(settingsViewDidHide)]) {
                             [self.settingsViewDelegate settingsViewDidHide];
                         }
					 }];
	_coverUpView.alpha = 0.0f;
}

static NSTimeInterval const animationDuration = 0.35f;

- (void)show {
    if ([self.settingsViewDelegate respondsToSelector:@selector(settingsViewWillShow)]) {
        [self.settingsViewDelegate settingsViewWillShow];
    }
    
	self.hidden = NO;
	[self staggeredBlurDuration:animationDuration];
	
	if (_isShowing) {
		return;
	} else {
		_isShowing = YES;
	}
	
	
	while (self.frame.size.height > 600.0f) {
		self.frame = CGRectInset(self.frame, 0.0f, kScreenHeight * 0.01f);
	}
	while (self.frame.size.width > 450.0f) {
		self.frame = CGRectInset(self.frame, kScreenWidth * 0.01f, 0.0f);
	}
	
	
	if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeRight ||
		[[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft) {
		self.center = CGPointMake(kScreenWidth * 0.5f,
								  kScreenHeight + self.bounds.size.height * 2.0f);
	} else {
		self.center = CGPointMake(kScreenHeight * 0.5f,
								  kScreenHeight + self.bounds.size.height * 2.0f);
	}
	
	[self.superview bringSubviewToFront:self];
	[self becomeFirstResponder];
	
	CGPoint center = self.center;
	CGRect frame = self.frame;
	while (frame.size.height > self.superview.frame.size.height) {
		frame.size.height *= 0.9f;
		frame.size.width *= 1.1f;
	}
	while (frame.size.width > self.superview.frame.size.width) {
		frame.size.width *= 0.9f;
		frame.size.height *= 1.1f;
	}
	self.frame = frame;
	center.x = self.superview.center.x;
	self.center = center;
	
	// moves view down proportionate to the status bar to accomodate for in-call status bar
	CGPoint finalCenter = self.superview.center;
	finalCenter.y += kStatusBarHeight * 0.5f;
	
	[UIView animateWithDuration:animationDuration
						  delay:0.0f
						options:UIViewAnimationOptionCurveEaseOut
					 animations:^{
						 self.center = finalCenter;
                         
                         if ([self.settingsViewDelegate respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
                             [self.settingsViewDelegate setNeedsStatusBarAppearanceUpdate];
                         }
                         
                         [self recenter];
                         
                     } completion:^(BOOL finished) {
						 _coverUpView.alpha = 1.0f;
                         
                         if ([self.settingsViewDelegate respondsToSelector:@selector(settingsViewDidShow)]) {
                             [self.settingsViewDelegate settingsViewDidShow];
                         }
					 }];
}

- (BOOL)isShowing {
	return _isShowing;
}

- (void)staggeredBlurDuration:(NSTimeInterval)duration {
	float maxBlur = 7.5f;
	float iterations = 50.0f;
	float maxIterationsPerSecond = 60.0f;
	
	NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
	float maxIterationsTotal = [defaults floatForKey:@"maxIterationsTotalKey"];
	if (maxIterationsTotal == 0) {
		maxIterationsTotal = 1.0f;
	}
	
	float minIterations = 1.0f;
	if (duration * maxIterationsPerSecond < iterations) {
		iterations = duration * maxIterationsPerSecond;
	}
	
	if (iterations > maxIterationsTotal) {
		iterations = maxIterationsTotal;
	}
	
	if (iterations < minIterations) {
		iterations = minIterations;
	}
	
	NSDate *beforeDate = [NSDate date];
	for (float i = 1.0f; i <= iterations; i++) {
		CGRect screenCaptureRect = self.presentingViewController.view.bounds;
		UIView *viewWhereYouWantToScreenCapture = [[UIApplication sharedApplication] keyWindow];
		
		//screen capture code
		UIGraphicsBeginImageContextWithOptions(screenCaptureRect.size, NO, [UIScreen mainScreen].scale);
		[viewWhereYouWantToScreenCapture drawViewHierarchyInRect:screenCaptureRect afterScreenUpdates:NO];
		UIImage *capturedImage = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		
		//blur code
		UIColor *tintColor = [[self.tintColor darkenColorBy:0.72f] colorWithAlphaComponent:0.5f * (i / iterations)];
		UIImage *blurredImage = [capturedImage applyBlurWithRadius:(maxBlur * i / iterations)
														 tintColor:tintColor
											 saturationDeltaFactor:1.2f
														 maskImage:nil];
		//or use [capturedImage applyLightAffect] but I thought that was too much for me
		
		UIImageView *blurredImageView = [[UIImageView alloc] initWithImage:blurredImage];
        blurredImageView.frame = self.presentingViewController.view.bounds;
		
		[_blurredImageViews addObject:blurredImageView];
		blurredImageView.alpha = 0.0f;
	}
	
	for (float i = 1.0f; i <= iterations && i - 1 < _blurredImageViews.count; i++) {
		__weak UIImageView *blurredImageView = [_blurredImageViews objectAtIndex:i - 1];
		[UIView animateWithDuration:(duration / iterations)
							  delay:(duration / iterations * (i - 1))
							options:UIViewAnimationOptionCurveLinear
						 animations:^{
							 [[[UIApplication sharedApplication] keyWindow] addSubview:self];
							 [self.superview insertSubview:blurredImageView
											  belowSubview:self];
							 blurredImageView.alpha = 1.0f;
						 } completion:^(BOOL finished) {
							 
						 }];
	}
	
	NSDate *afterDate = [NSDate date];
	
	NSTimeInterval totalTimeTranspired = [afterDate timeIntervalSinceDate:beforeDate];
	
	NSTimeInterval tooLongToWaitTime = 0.22f;
	NSTimeInterval maxTimeToWaitForSingleBlur = 0.4f;
	NSTimeInterval reasonableTimeToWait = 0.18f;
	
	if (totalTimeTranspired > tooLongToWaitTime) {
		if (totalTimeTranspired < maxTimeToWaitForSingleBlur && iterations > minIterations) {
			[defaults setFloat:(iterations - 1) forKey:@"maxIterationsTotalKey"];
//			NSLog(@"Decreasing the number of blur transitions to improve transition time when showing the settings view %f \t\t%d", totalTimeTranspired, (int)maxIterationsTotal);
		} else {
//			NSLog(@"We're a little behind now and there's not much that can be done...unfortunately %f", totalTimeTranspired);
		}
	} else if (totalTimeTranspired < reasonableTimeToWait) {
		[defaults setFloat:(iterations + 1) forKey:@"maxIterationsTotalKey"];
//		NSLog(@"Increasing the number of blur transitions to improve the appearance of the settings view %f \t\t%f", totalTimeTranspired, maxIterationsTotal);
	} else {
		//        NSLog(@"We're good %f \t\t%f", totalTimeTranspired, maxIterationsTotal);
	}
	
	[self performSelector:@selector(addCoverUpView) withObject:self afterDelay:duration];
}

- (void)addCoverUpView {
	_coverUpView.hidden = NO;
	
	if (_coverUpView.gestureRecognizers.count == 0) {
		UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped)];
		[_coverUpView addGestureRecognizer:tap];
	}
	
	[self.presentingViewController.view addSubview:_coverUpView];
}


- (void)tapped {
	if (self.isShowing && !self.isHidden) {
		[self hide];
	}
}

- (void)removeBlurredViews:(NSTimeInterval)duration {
	_coverUpView.hidden = YES;
	float iterations = (float)_blurredImageViews.count;
	for (float i = iterations - 1; i >= 0 && i < _blurredImageViews.count; i--) {
		__weak UIImageView *blurredImageView = [_blurredImageViews objectAtIndex:i];
		[UIView animateWithDuration:(duration / iterations)
							  delay:(duration / iterations * (iterations - i - 1))
							options:UIViewAnimationOptionCurveLinear
						 animations:^{
							 [[[UIApplication sharedApplication] keyWindow] addSubview:self];
							 blurredImageView.alpha = 0.0f;
						 } completion:^(BOOL finished) {
							 
						 }];
	}
	
	[self performSelector:@selector(resetBlurredViews) withObject:self afterDelay:duration];
}

- (void)resetBlurredViews {
	_blurredImageView = [_blurredImageViews lastObject];
	[_blurredImageViews removeObject:_blurredImageView];
	
	for (UIImageView *blurredImageView in _blurredImageViews) {
		[blurredImageView removeFromSuperview];
	}
	
	[_blurredImageViews removeAllObjects];
}

#pragma mark - Keyboard Notifications

- (void)keyboardDidShow:(NSNotification *)notification {
    self.keyboardHeight = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    
    [UIView animateWithDuration:0.35f
                     animations:^{
                         [self recenter];
                     }];
}

- (void)keyboardDidHide:(NSNotification *)notification {
    self.keyboardHeight = 0.0f;
    
    [UIView animateWithDuration:0.35f
                     animations:^{
                         [self recenter];
                     }];
}

- (void)recenter {
    if (self.isShowing) {
        CGPoint center = self.center;
        center.y = self.superview.bounds.size.height - self.keyboardHeight;
        center.y *= 0.5f;
        
        if (self.bounds.size.height < self.superview.bounds.size.height + 20.0f && self.bounds.size.height * 0.5f > center.y) {
            while (self.bounds.size.height * 0.5f > center.y) {
                center.y += 1.0f;
            }
            
            center.y += 20.0f;
        }
        
        if (self.bounds.size.width * 0.5f + center.x) {
            center.x = self.superview.bounds.size.width * 0.5f;
        }
        
        if (self.bounds.size.height < self.superview.bounds.size.height - self.keyboardHeight) {
            self.center = center;
            
            [self updateStatusBar];
        }
    }
}

- (void)updateStatusBar {
    self.statusBarNeedsHidden = self.bounds.size.height > self.superview.bounds.size.height - self.keyboardHeight - 20.0f;
    
    if ([self.settingsViewDelegate respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        [self.settingsViewDelegate setNeedsStatusBarAppearanceUpdate];
    }
}


@end
