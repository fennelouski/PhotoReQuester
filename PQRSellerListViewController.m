//
//  PQRSellerListViewController.m
//  Photo ReQuester
//
//  Created by Nathan Fennel on 8/20/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import "PQRSellerListViewController.h"

#import "PQRSellerListTableView.h"

@interface PQRSellerListViewController ()

@property (nonatomic, strong) PQRSellerListTableView *tableView;

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

    [self.view addSubview:self.tableView];
}





#pragma mark - Subviews

- (PQRSellerListTableView *)tableView {
    if (!_tableView) {
        _tableView = [[PQRSellerListTableView alloc] initWithFrame:self.tableViewFrame style:UITableViewStylePlain];
        _tableView.contentInset = self.tableViewInsets;
        _tableView.scrollIndicatorInsets = _tableView.contentInset;
    }

    return _tableView;
}

- (CGRect)tableViewFrame {
    CGRect frame = self.parentViewController.view.bounds;

    return frame;
}

- (UIEdgeInsets)tableViewInsets {
    UIEdgeInsets insets = UIEdgeInsetsZero;

    insets.bottom = 44.0f;

    return insets;
}


#pragma mark - Memory Warning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
