//
//  PQRLocalRequestDetailView.h
//  Photo ReQuester
//
//  Created by Nathan Fennel on 8/20/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import "ALUSettingsView.h"

#import "PQRLocalRequestModel.h"

@interface PQRLocalRequestDetailView : ALUSettingsView

- (PQRLocalRequestModel *)localRequest;
- (void)setLocalRequest:(PQRLocalRequestModel *)localRequest;

@end
