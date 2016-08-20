//
//  PQRSellerListViewController.m
//  Photo ReQuester
//
//  Created by Nathan Fennel on 8/20/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import "PQRSellerListViewController.h"

#import "PQRSellerListTableView.h"
#import "PQRLocalRequestDetailView.h"

#import "PQRSellerDataManager.h"
#import "PQRLocalRequestModel.h"

@interface PQRSellerListViewController () <UITableViewDelegate, ALUSettingsViewDelegate>

@property (nonatomic, strong) PQRSellerListTableView *tableView;

@property (nonatomic, strong) PQRLocalRequestDetailView *detailView;

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
        _tableView.delegate = self;
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

- (PQRLocalRequestDetailView *)detailView {
    if (!_detailView) {
        _detailView = [[PQRLocalRequestDetailView alloc] initWithFrame:self.detailViewFrame];
        _detailView.presentingViewController = self.navigationController;
        _detailView.settingsViewDelegate = self;
    }

    return _detailView;
}

- (CGRect)detailViewFrame {
    CGRect frame = self.view.bounds;

    frame = CGRectInset(frame, 20.0f, 100.0f);

    return frame;
}



#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == PQRSellerListTableSectionRequests) {
        PQRLocalRequestModel *localRequest = [[PQRSellerDataManager currentRequests] objectAtIndex:indexPath.row];

        self.detailView.localRequest = localRequest;
        [self.detailView show];
    }
}


#pragma mark - Memory Warning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
