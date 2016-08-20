//
//  PQRSellerListTableView.m
//  Photo ReQuester
//
//  Created by Nathan Fennel on 8/20/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import "PQRSellerListTableView.h"
#import "PQRSellerDataManager.h"
#import "PQRLocalRequestModel.h"
#import "PQRSellerListTableViewCell.h"
#import "PQRLocationManager.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

typedef NS_ENUM(NSUInteger, PQRSellerListTableSection) {
    PQRSellerListTableSectionRequests,
    PQRSellerListTableSectionFilter,
    PQRSellerListTableSectionCount
};

@implementation PQRSellerListTableView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        [self registerClass:PQRSellerListTableViewCell.class
     forCellReuseIdentifier:@"PQRSellerListTableView"];
        
        self.delegate = self;
        self.dataSource = self;
    }

    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame
                          style:style];

    if (self) {
        [self registerClass:PQRSellerListTableViewCell.class
     forCellReuseIdentifier:@"PQRSellerListTableView"];

        self.delegate = self;
        self.dataSource = self;
    }

    return self;
}

- (NSInteger)numberOfSections {
    return PQRSellerListTableSectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRows = 0;

    switch (section) {
        case PQRSellerListTableSectionRequests:
            numberOfRows = PQRSellerDataManager.currentRequests.count;
            break;

        case PQRSellerListTableSectionFilter:
            numberOfRows = 1;
            break;

        default:
            break;
    }

    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PQRSellerListTableViewCell *cell = [self dequeueReusableCellWithIdentifier:@"PQRSellerListTableView"
                                                                  forIndexPath:indexPath];

    if (!cell) {
        cell = [[PQRSellerListTableViewCell alloc] initWithStyle:UITableViewCellStyleValue2
                                                 reuseIdentifier:@"PQRSellerListTableView"];
    }

    switch (indexPath.section) {
        case PQRSellerListTableSectionRequests:
            [self layoutCell:cell
                forIndexPath:indexPath];
            break;

        case PQRSellerListTableSectionFilter:
            cell.titleLabel.text = @"Filter";
            cell.subtitleLabel.text = @"";
            break;

        default:
            break;
    }

    return cell;
}

- (CGRect)rectForHeaderInSection:(NSInteger)section {
    return CGRectZero;
}

- (CGRect)tableView:(UITableView *)tableView rectForHeaderInSection:(NSInteger)section {
    return [self rectForHeaderInSection:section];
}

- (void)layoutCell:(PQRSellerListTableViewCell *)cell forIndexPath:(NSIndexPath*)indexPath {
    PQRLocalRequestModel *localRequest = PQRSellerDataManager.currentRequests[indexPath.row];

    cell.titleLabel.text = localRequest.title;
    cell.subtitleLabel.text = localRequest.requestDescription;
    cell.bountyLabel.text = localRequest.bounty.stringExpression;

    MKMapPoint point1 = MKMapPointForCoordinate(PQRLocationManager.currentCoordinate);
    MKMapPoint point2 = MKMapPointForCoordinate(localRequest.coordinate);
    CLLocationDistance distance = MKMetersBetweenMapPoints(point1, point2);
    cell.distanceLabel.text = [NSString stringWithFormat:@"%gkm", distance/1000];
}


@end
