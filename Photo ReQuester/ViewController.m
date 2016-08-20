//
//  ViewController.m
//  Photo ReQuester
//
//  Created by Nathan Fennel on 8/19/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import "ViewController.h"

#import "PQRUserManager.h"
#import "PQRSellerDataManager.h"

#import "PQRMainFooterToolbar.h"

#import "PQRSellerMapViewController.h"
#import "PQRSellerListViewController.h"

#import "NKFColor.h"
#import "NKFColor+AppColors.h"

@interface ViewController () <PQRMainFooterToolbarDelegate>

@property (nonatomic, strong) PQRMainFooterToolbar *footerToolbar;

@property (nonatomic, strong) UIBarButtonItem *rightBarButtonItem;
@property (nonatomic, strong) UIButton *vcButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self.view addSubview:self.footerToolbar];
}

- (PQRMainFooterToolbar *)footerToolbar {
    if (!_footerToolbar) {
        _footerToolbar = [[PQRMainFooterToolbar alloc] init];
        _footerToolbar.footerToolbarDelegate = self;
    }

    return _footerToolbar;
}

- (UIBarButtonItem *)rightBarButtonItem {
    if (!_rightBarButtonItem) {
        _rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.vcButton];
    }

    return _rightBarButtonItem;
}

- (UIButton *)vcButton {
    if (!_vcButton) {
        _vcButton = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 44.0f)];
        [_vcButton setTitle:@"List"
                   forState:UIControlStateNormal];
        [_vcButton setTitleColor:[NKFColor appColor]
                        forState:UIControlStateNormal];
        [_vcButton addTarget:self
                      action:@selector(vcButtonTouched:)
            forControlEvents:UIControlEventTouchUpInside];
    }

    return _vcButton;
}

#pragma mark - PQRMainFooterToolbarDelegate

- (void)updateChildren {
    UIViewController *childVC = [self currentChildViewController];
    if (childVC && ![self.childViewControllers containsObject:childVC]) {
        if (([self.topViewController isEqual:PQRSellerMapViewController.sharedMapController] &&
            [childVC isEqual:PQRSellerListViewController.sharedListController]) ||
            ([childVC isEqual:PQRSellerMapViewController.sharedMapController] &&
             [self.topViewController isEqual:PQRSellerListViewController.sharedListController])) {
                [self setViewControllers:@[childVC]];
            } else {
                [self pushViewController:childVC
                                animated:YES];
            }
    }
}

- (UIViewController *)currentChildViewController {
    if (PQRUserManager.isBuyer) {

    } else if (PQRUserManager.isSeller) {
        self.footerToolbar.leftItems = @[self.rightBarButtonItem];
        switch (PQRSellerDataManager.currentVCType) {
            case PQRSellerVCMap:
                return PQRSellerMapViewController.sharedMapController;
                break;

            case PQRSellerVCList:
                return PQRSellerListViewController.sharedListController;
                break;

            case PQRSellerVCPhoto:
                return [UIViewController new];
                break;
                
            default:
                break;
        }
    }

    return nil;
}



#pragma mark - Button Actions

- (void)vcButtonTouched:(id)sender {
    if (PQRUserManager.isBuyer) {

    } else if (PQRUserManager.isSeller) {
        switch (PQRSellerDataManager.currentVCType) {
            case PQRSellerVCMap:
                PQRSellerDataManager.currentVCType = PQRSellerVCList;
                [self.vcButton setTitle:@"Map"
                               forState:UIControlStateNormal];
                break;

            case PQRSellerVCList:
                PQRSellerDataManager.currentVCType = PQRSellerVCMap;
                [self.vcButton setTitle:@"List"
                               forState:UIControlStateNormal];
                break;

            case PQRSellerVCPhoto:

                break;

            default:
                break;
        }
    }

    [self updateChildren];
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
