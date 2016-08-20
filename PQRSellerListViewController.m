//
//  PQRSellerListViewController.m
//  Photo ReQuester
//
//  Created by Nathan Fennel on 8/20/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import "PQRSellerListViewController.h"

@interface PQRSellerListViewController ()

@end

@implementation PQRSellerListViewController

+ (instancetype)sharedListController {
    static PQRSellerListViewController *sharedListController;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedListController = [[PQRSellerListViewController alloc] init];
    });

    return sharedListController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
