//
//  ViewController.m
//  Photo ReQuester
//
//  Created by Nathan Fennel on 8/19/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIToolbar *footerToolbar;
@property (nonatomic, strong) UIBarButtonItem *flexibleSpace, *buyerButton, *sellerButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self.view addSubview:self.footerToolbar];
}





- (UIToolbar *)footerToolbar {
    if (!_footerToolbar) {
        _footerToolbar = [[UIToolbar alloc] initWithFrame:self.footerToolbarFrame];
        [_footerToolbar setItems:@[self.flexibleSpace, self.buyerButton]
                        animated:YES];
    }

    return _footerToolbar;
}

- (CGRect)footerToolbarFrame {
    CGRect frame = self.view.bounds;

    frame.size.height = 44.0f;
    frame.origin.y = self.view.bounds.size.height - frame.size.height;
    frame.size.width = self.view.bounds.size.width;

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
    [self.footerToolbar setItems:@[self.flexibleSpace, self.sellerButton]
                        animated:YES];
}

- (void)sellerButtonTouched:(id)sender {
    [self.footerToolbar setItems:@[self.flexibleSpace, self.buyerButton]
                        animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
