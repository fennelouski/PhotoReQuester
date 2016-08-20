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

@interface ViewController () <PQRMainFooterToolbarDelegate>

@property (nonatomic, strong) PQRMainFooterToolbar *footerToolbar;

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

#pragma mark - PQRMainFooterToolbarDelegate

- (void)updateChildren {
    UIViewController *childVC = [self currentChildViewController];
    if (childVC && ![self.childViewControllers containsObject:childVC]) {
        [self pushViewController:childVC
                        animated:YES];
    }
}

- (UIViewController *)currentChildViewController {
    if (PQRUserManager.isBuyer) {

    } else if (PQRUserManager.isSeller) {
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
