//
//  PQRSellerListTableView.h
//  Photo ReQuester
//
//  Created by Nathan Fennel on 8/20/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PQRSellerListTableSection) {
    PQRSellerListTableSectionRequests,
    PQRSellerListTableSectionFilter,
    PQRSellerListTableSectionCount
};

@interface PQRSellerListTableView : UITableView

@end
