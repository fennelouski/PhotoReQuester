//
//  PQRSellerListTableViewCell.m
//  Photo ReQuester
//
//  Created by Nathan Fennel on 8/20/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import "PQRSellerListTableViewCell.h"

#import "NKFColor.h"
#import "NKFColor+AppColors.h"

@implementation PQRSellerListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)layoutSubviews {
    [super layoutSubviews];


    if (self.titleLabel.text.length) {
        [self addSubview:self.titleLabel];
        self.titleLabel.frame = self.titleLabelFrame;
    } else {
        [self.titleLabel removeFromSuperview];
    }

    if (self.distanceLabel.text.length) {
        [self addSubview:self.subtitleLabel];
        self.subtitleLabel.frame = self.subtitleLabelFrame;
    } else {
        [self.subtitleLabel removeFromSuperview];
    }

    if (self.bountyLabel.text.length) {
        [self addSubview:self.bountyLabel];
        self.bountyLabel.frame = self.bountyLabelFrame;
    } else {
        [self.bountyLabel removeFromSuperview];
    }

    if (self.distanceLabel.text.length) {
        [self addSubview:self.distanceLabel];
        self.distanceLabel.frame = self.distanceLabelFrame;
    } else {
        [self.distanceLabel removeFromSuperview];
    }
}

#pragma mark - Subviews

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:self.titleLabelFrame];
        [_titleLabel setTextColor:[NKFColor appColor]];
    }

    return _titleLabel;
}

- (CGRect)titleLabelFrame {
    CGRect frame = self.bounds;

    frame.origin.x = 20.0f;
    frame.size.height = self.bounds.size.height * 0.5f;

    return frame;
}

- (UILabel *)subtitleLabel {
    if (!_subtitleLabel) {
        _subtitleLabel = [[UILabel alloc] initWithFrame:self.subtitleLabelFrame];
        [_subtitleLabel setTextColor:[NKFColor appColor]];
    }

    return _subtitleLabel;
}

- (CGRect)subtitleLabelFrame {
    CGRect frame = self.bounds;

    frame.origin.x = 30.0f;
    frame.origin.y = self.bounds.size.height * 0.5f;
    frame.size.height = frame.origin.y;

    return frame;
}

- (UILabel *)bountyLabel {
    if (!_bountyLabel) {
        _bountyLabel = [[UILabel alloc] initWithFrame:self.bountyLabelFrame];
        [_bountyLabel setTextColor:[NKFColor appColor]];
    }

    return _bountyLabel;
}

- (CGRect)bountyLabelFrame {
    CGRect frame = self.bounds;

    frame.origin.x = 30.0f;
    frame.origin.y = self.bounds.size.height * 0.5f;
    frame.size.height = frame.origin.y;

    return frame;
}

- (UILabel *)distanceLabel {
    if (!_distanceLabel) {
        _distanceLabel = [[UILabel alloc] initWithFrame:self.distanceLabelFrame];
        [_distanceLabel setTextColor:[NKFColor appColor]];
    }

    return _distanceLabel;
}

- (CGRect)distanceLabelFrame {
    CGRect frame = self.bounds;

    frame.origin.x = 30.0f;
    frame.origin.y = self.bounds.size.height * 0.5f;
    frame.size.height = frame.origin.y;

    return frame;
}







- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
